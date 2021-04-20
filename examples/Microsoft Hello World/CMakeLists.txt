cmake_minimum_required(VERSION 3.18)

project(rpc_hello_world)
include(cmake/MircrosoftRPC.cmake)
CreateIDLHeaders("rpc/hello.idl")
GetIDLHeaderNames("rpc/hello.idl" idl_header)
GetIDLClientNames("rpc/hello.idl" idl_client)
GetIDLServerNames("rpc/hello.idl" idl_server)
GetIDLIncludeDirs("rpc/hello.idl" idl_incDir)


message("WIN32: " ${CMAKE_VS_PLATFORM_NAME})

file(GLOB_RECURSE client_sources Client/*.cpp Client/*.c)
file(GLOB_RECURSE clinet_headers Client/*.hpp Client/*.h)
file(GLOB_RECURSE server_sources Server/*.cpp Server/*.c)
file(GLOB_RECURSE server_headers Server/*.hpp Server/*.h)

message("clinet_sources: " ${client_sources})
message("server_sources: " ${server_sources})
message("idl_server: " ${idl_server})
message("idl_client: " ${idl_client})

add_executable(hello_server ${server_sources} ${server_headers} ${idl_server} ${idl_header})
add_executable(hello_client ${client_sources} ${client_headers} ${idl_client} ${idl_header})
target_include_directories(hello_server PUBLIC ${idl_incDir})
target_include_directories(hello_client PUBLIC ${idl_incDir})
target_link_libraries(hello_server "rpcrt4.lib" "oldnames.lib" "wsock32.lib")
target_link_libraries(hello_client "rpcrt4.lib" "oldnames.lib" "wsock32.lib")