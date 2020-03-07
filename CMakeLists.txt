PROJECT(rpc C)
CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

find_package(PkgConfig REQUIRED)
pkg_check_modules(PROTOBUF REQUIRED IMPORTED_TARGET libprotobuf-c>=1.0.0)

set(CMAKE_C_FLAGS "-g -Wall -Werror -O2")

ADD_SUBDIRECTORY(proto)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
link_directories(/usr/local/lib)

ADD_EXECUTABLE(amessage_serialize serialize.c)

target_link_libraries(amessage_serialize proto ${PROTOBUF_LIBRARIES})
target_include_directories(amessage_serialize PUBLIC ${PROTOBUF_INCLUDE_DIRS})
target_compile_options(amessage_serialize PUBLIC ${PROTOBUF_CFLAGS_OTHER})

ADD_EXECUTABLE(amessage_deserialize deserialize.c)

target_link_libraries(amessage_deserialize proto ${PROTOBUF_LIBRARIES})
target_include_directories(amessage_deserialize PUBLIC ${PROTOBUF_INCLUDE_DIRS})
target_compile_options(amessage_deserialize PUBLIC ${PROTOBUF_CFLAGS_OTHER})