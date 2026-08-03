cmake_minimum_required(VERSION 3.16)
project(LearnCPP VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(learn_cpp
    main.cpp
    phase1/variables.cpp
    phase1/operators.cpp
    phase1/conditions.cpp
    phase1/loops.cpp
    phase2/functions.cpp
    phase2/arrays.cpp
    phase3/classes.cpp
    phase3/inheritance.cpp
    phase3/polymorphism.cpp
    phase3/abstraction.cpp
    phase4/memory.cpp
    phase4/modern.cpp
)

target_include_directories(learn_cpp PRIVATE include)