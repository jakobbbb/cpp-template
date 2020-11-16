add_executable(helloworld
    helloworld.cpp
    )

target_link_libraries(helloworld ${LIBRARIES})

add_executable(tests
    tests.cpp
    )

# generate compile_commands.json
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
