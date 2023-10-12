cmake_minimum_required(VERSION 3.17)
project(sheetmusic)

file(GLOB_RECURSE LY_FILES
  "*.ly")

set(PDF_FILES)
set(LI)

foreach(LY_FILE ${LY_FILES})
  get_filename_component(NAME ${LY_FILE} NAME_WE)
  add_custom_command(
    OUTPUT "${NAME}.pdf" "${NAME}.midi"
    COMMAND lilypond -I "${CMAKE_SOURCE_DIR}" "${LY_FILE}"
    DEPENDS "${LY_FILE}"
    VERBATIM)
  list(APPEND PDF_FILES "${NAME}.pdf")
  list(APPEND LI "<li><a href=\"./${NAME}.pdf\">${NAME}.pdf</a> (<a href=\"./${NAME}.midi\">midi</a>)</li>")
endforeach()

list(JOIN LI "    " LI)

add_custom_command(
  OUTPUT "index.html"
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/html/head.html ${CMAKE_CURRENT_BINARY_DIR}/index.html
  COMMAND ${CMAKE_COMMAND} -E echo "${LI}" >> ${CMAKE_CURRENT_BINARY_DIR}/index.html
  COMMAND ${CMAKE_COMMAND} -E echo "</ul></body></html>" >> ${CMAKE_CURRENT_BINARY_DIR}/index.html
  DEPENDS "html/head.html"
  VERBATIM)

add_custom_target(lilypond ALL DEPENDS ${PDF_FILES})
add_custom_target(index ALL DEPENDS "index.html")
