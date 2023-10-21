cmake_minimum_required(VERSION 3.17)
project(sheetmusic)

file(GLOB LY_FILES
  "*.ly")

set(PDF_FILES)
set(LI)

foreach(LY_FILE ${LY_FILES})
  get_filename_component(NAME ${LY_FILE} NAME_WE)
  add_custom_command(
    OUTPUT "${NAME}.pdf"
    COMMAND lilypond -I "${CMAKE_SOURCE_DIR}" "${LY_FILE}"
    DEPENDS "${LY_FILE}"
    VERBATIM)
  list(APPEND PDF_FILES "${NAME}.pdf")
  list(APPEND LI "<li><a href=\"./${NAME}.pdf\">${NAME}.pdf</a> (<a href=\"./${NAME}.midi\">midi</a>)</li>")
endforeach()

list(JOIN LI "    " LI)

add_custom_command(
  OUTPUT "index.html"
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/www/head.html ${CMAKE_CURRENT_BINARY_DIR}/index.html
  COMMAND ${CMAKE_COMMAND} -E echo "${LI}" >> ${CMAKE_CURRENT_BINARY_DIR}/index.html
  COMMAND ${CMAKE_COMMAND} -E echo "</ul></body></html>" >> ${CMAKE_CURRENT_BINARY_DIR}/index.html
  DEPENDS "www/head.html"
  VERBATIM)

add_custom_command(
  OUTPUT "game.html" "game.js"
  COMMAND tsc ${CMAKE_CURRENT_SOURCE_DIR}/www/game.ts --outDir ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/www/game.html ${CMAKE_CURRENT_BINARY_DIR}/
  DEPENDS "www/game.html" "www/game.ts"
  VERBATIM)

add_custom_target(lilypond ALL DEPENDS ${PDF_FILES})
add_custom_target(index ALL DEPENDS "index.html")
add_custom_target(game ALL DEPENDS "game.html" "game.js")
