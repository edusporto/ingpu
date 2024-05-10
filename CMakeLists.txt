cmake_minimum_required(VERSION 3.18)  # Minimum version supporting CUDA as a first-class language
project(InteractionStep CUDA CXX)  # Your project name

add_definitions(-w)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Enable CUDA
enable_language(CUDA)

# Find the Boost library (adjust version as needed)
# find_package(Boost 1.47 REQUIRED)
set(BOOST_ROOT "${CMAKE_SOURCE_DIR}/boost_1_55_0")
set(Boost_NO_SYSTEM_PATHS ON)  # Do not search for Boost in the default directory
find_package(Boost 1.55 EXACT REQUIRED)

# Include directories for header files
include_directories(
    ${Boost_INCLUDE_DIRS}
)

find_package(Thrust REQUIRED CONFIG)

# list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
# include(FindThrust)'

# include_directories(/opt/cuda/include/thrust)
# include_directories(/opt/cuda/include/thrust/detail)

# Add executable
add_executable(${PROJECT_NAME}
    main.cpp
    agent.cu
    agent_struct.cpp
    communication.cpp
    config_manager.cpp
    parse_net.cpp
    result_info.cpp
    kernel.cu
)

# Specify CUDA architecture (optional, depending on your needs)
set_target_properties(${PROJECT_NAME} PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
)

# Link Boost libraries or other libraries
target_link_libraries(${PROJECT_NAME}
    ${Boost_LIBRARIES}
)

thrust_create_target(Thrust)
target_link_libraries(${PROJECT_NAME} Thrust)
