cmake_minimum_required(VERSION 3.0)


include_directories(${LIBS_DIR}/catch/single_include/catch2/)
link_directories(${LIBS_DIR}/dummylib/lib)


MACRO(ADD_UNIT_TEST NAME PKGS)
    add_executable(${NAME}_test ../test_main.cpp test_${NAME}.cpp)
    FOREACH(PKG ${PKGS})
        TARGET_LINK_LIBRARIES(${NAME}_test PUBLIC ${PKG})
    ENDFOREACH(PKG)
ENDMACRO(ADD_UNIT_TEST)


ADD_UNIT_TEST(modB1 modB1 )
ADD_UNIT_TEST(modB2 "modB2;dummylib" )
