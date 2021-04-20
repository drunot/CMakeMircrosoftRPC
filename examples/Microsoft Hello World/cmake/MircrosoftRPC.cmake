function(CreateIDLHeaders)
foreach(X IN LISTS ARGN)
    get_filename_component(name ${X} NAME_WLE)
    get_filename_component(abs ${X} ABSOLUTE)
    get_filename_component(abs_dir ${abs} PATH)
    get_filename_component(dir ${X} PATH)
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${dir})
    string(TOLOWER ${CMAKE_VS_PLATFORM_NAME} PLT_FLAG)
    if(EXISTS "${abs_dir}/${name}.acf")
        set(acf_flag "-acf")
        set(acf_path "${abs_dir}/${name}.acf")
        execute_process(COMMAND "midl" "${X}" "-${PLT_FLAG}" "${acf_flag}" "${acf_path}" "-out" "${CMAKE_BINARY_DIR}/${dir}" RESULTS_VARIABLE test_var WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

    else()
        message("NOT FOUND: ${abs_dir}/${name}.acf")
        execute_process(COMMAND "midl" "${X}" "-${PLT_FLAG}" "-out" "${CMAKE_BINARY_DIR}/${dir}" RESULTS_VARIABLE test_var WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

    endif()
endforeach()
endfunction()

function(GetIDLHeaderNames)
# Last arg is variable name. save and remove from list.
list(LENGTH ARGN FUNC_ARGC)
math(EXPR LAST_IDX "${FUNC_ARGC} - 1")
list(GET ARGN ${LAST_IDX} VAR_NAME)
list(REMOVE_AT ARGN ${LAST_IDX})
# Get the rest of the args and return correct names.
foreach(X IN LISTS ARGN)
    get_filename_component(dir ${X} PATH)
    get_filename_component(name ${X} NAME_WLE)
    set(VAR_VALUE "${VAR_VALUE}${CMAKE_BINARY_DIR}/${dir}/${name}.h;")
endforeach()
set(${VAR_NAME} "${VAR_VALUE}" PARENT_SCOPE)
endfunction()

function(GetIDLClientNames)
# Last arg is variable name. save and remove from list.
list(LENGTH ARGN FUNC_ARGC)
math(EXPR LAST_IDX "${FUNC_ARGC} - 1")
list(GET ARGN ${LAST_IDX} VAR_NAME)
list(REMOVE_AT ARGN ${LAST_IDX})
# Get the rest of the args and return correct names.
foreach(X IN LISTS ARGN)
    get_filename_component(dir ${X} PATH)
    get_filename_component(name ${X} NAME_WLE)
    set(VAR_VALUE "${VAR_VALUE}${CMAKE_BINARY_DIR}/${dir}/${name}_c.c;")
endforeach()
set(${VAR_NAME} "${VAR_VALUE}" PARENT_SCOPE)
endfunction()

function(GetIDLServerNames)
# Last arg is variable name. save and remove from list.
list(LENGTH ARGN FUNC_ARGC)
math(EXPR LAST_IDX "${FUNC_ARGC} - 1")
list(GET ARGN ${LAST_IDX} VAR_NAME)
list(REMOVE_AT ARGN ${LAST_IDX})
# Get the rest of the args and return correct names.
foreach(X IN LISTS ARGN)
    get_filename_component(dir ${X} PATH)
    get_filename_component(name ${X} NAME_WLE)
    set(VAR_VALUE "${VAR_VALUE}${CMAKE_BINARY_DIR}/${dir}/${name}_s.c;")
endforeach()
set(${VAR_NAME} "${VAR_VALUE}" PARENT_SCOPE)
endfunction()

function(GetIDLIncludeDirs)
# Last arg is variable name. save and remove from list.
list(LENGTH ARGN FUNC_ARGC)
math(EXPR LAST_IDX "${FUNC_ARGC} - 1")
list(GET ARGN ${LAST_IDX} VAR_NAME)
list(REMOVE_AT ARGN ${LAST_IDX})
# Get the rest of the args and return correct names.
foreach(X IN LISTS ARGN)
    get_filename_component(dir ${X} PATH)
    set(VAR_VALUE "${VAR_VALUE}${CMAKE_BINARY_DIR}/${dir}")
endforeach()
set(${VAR_NAME} "${VAR_VALUE}" PARENT_SCOPE)
endfunction()