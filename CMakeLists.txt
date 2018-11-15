cmake_minimum_required(VERSION 2.8.12)
project(pyplusplus11)

SET(CMAKE_CXX_STANDARD 11)

# ----------------------------------------------------
# --- ENV VARS -----------------------------------
# ----------------------------------------------------
SET(LIBS_DIR $ENV{PYPLUSPLUS11_EXTERNAL_LIBS_DIR})

# ----------------------------------------------------
# --- MACROS -----------------------------------------
# ----------------------------------------------------
MACRO(ADD_PYBIND_MODULE NAME SRC_DIR PKGS LINK_DIRS)
    SET(CPP_MODULE ${NAME})
    STRING(REGEX REPLACE "_" "-" CPP_MODULE ${CPP_MODULE})
    pybind11_add_module(expose_${NAME} ${SRC_DIR}/expose-${CPP_MODULE}.cpp)
    TARGET_LINK_LIBRARIES(expose_${NAME} PRIVATE ${CPP_MODULE})
    FOREACH(PKG ${PKGS})
        TARGET_LINK_LIBRARIES(expose_${NAME} PRIVATE ${PKG})
    ENDFOREACH(PKG)
    FOREACH(LDIR ${LINK_DIRS})
        TARGET_LINK_LIBRARIES(expose_${NAME} PRIVATE -L${LDIR})
    ENDFOREACH(LDIR)
ENDMACRO(ADD_PYBIND_MODULE)



include_directories("include/")


add_subdirectory(external_libraries/pybind11)

# --- MAIN LIBRARY -------------------------------------------------------------
add_subdirectory(src/${PROJECT_NAME})


# --- C++ MODULES EXPOSED ------------------------------------------------------
ADD_PYBIND_MODULE(modB1 src/${PROJECT_NAME}/packageA/subpackB/modB1 "" "")
ADD_PYBIND_MODULE(modB2 src/${PROJECT_NAME}/packageA/subpackB/modB2 "dummylib" "${LIBS_DIR}/dummylib/lib")


# --- UNIT TESTS ---------------------------------------------------------------
add_subdirectory(tests)