﻿cmake_minimum_required(VERSION 3.10)

project(GrayCatQt LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS ${CMAKE_CURRENT_SOURCE_DIR})

#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Lib)
#add_definitions(-DWEBASSEMBLY)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../module/cmake")

include(GrayCatQt)

load_name_static(STATIC_NAME) 
message(STATUS ${STATIC_NAME})

find_package(Qt5 COMPONENTS Widgets REQUIRED)

find_android_gui()
#target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR})



add_subdirectory(Src/CatControl)
add_subdirectory(Src/CatGraphicsView)
add_subdirectory(Src/CatWidget)
add_subdirectory(Src/CatWidgetFrameless)


add_library(${STATIC_NAME} STATIC)

add_library(${PROJECT_NAME} SHARED)



SET_TARGET_PROPERTIES(${STATIC_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSION 1)
SET_TARGET_PROPERTIES(${STATIC_NAME} PROPERTIES CLEAN_DIRECT_OUTPUT 1)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} PUBLIC CatControl)
target_link_libraries(${PROJECT_NAME} PUBLIC CatGraphicsView)
target_link_libraries(${PROJECT_NAME} PUBLIC CatWidget)
target_link_libraries(${PROJECT_NAME} PUBLIC CatWidgetFrameless)

target_link_android_gui(${PROJECT_NAME})

target_link_libraries(${STATIC_NAME} PRIVATE Qt5::Widgets)
target_link_libraries(${STATIC_NAME} PUBLIC CatControl)
target_link_libraries(${STATIC_NAME} PUBLIC CatGraphicsView)
target_link_libraries(${STATIC_NAME} PUBLIC CatWidget)
target_link_libraries(${STATIC_NAME} PUBLIC CatWidgetFrameless)


target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR})
