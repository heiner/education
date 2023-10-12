cmake_minimum_required(VERSION 3.17)
project(sheetmusic)

file(GLOB_RECURSE LY_FILES
  "*.ly")

set(PDF_FILES)

foreach(LY_FILE ${LY_FILES})
  get_filename_component(NAME ${LY_FILE} NAME_WE)
  add_custom_command(
    OUTPUT "${NAME}.pdf" "${NAME}.midi"
    COMMAND lilypond -I "${CMAKE_SOURCE_DIR}" "${LY_FILE}"
    DEPENDS "${LY_FILE}"
    VERBATIM)
  list(APPEND PDF_FILES "${NAME}.pdf")
endforeach()

add_custom_target(dat ALL DEPENDS ${PDF_FILES})
