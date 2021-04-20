# CMake for Mircrosoft RPC

Include the cmake file with

```cmake
include(MircrosoftRPC.cmake)
```

After inclusion 5 new cmake functions is available. They will be descirbed bellow.

To create the header file and the `*_c.c` and `*_s.c` files call the function bellow. They will be created in the build directory. If multiple interfaces is made you can provide a list of files. This is applies to all 5 functions. The last argument for the later functions will be the variable name.

```cmake
CreateIDLHeaders("path/to.idl.idl")
```

The following function will give the header file paths to include in the client and server executebles. They will be saved in `idl_header_var_name`.

```cmake
GetIDLHeaderNames("path/to.idl" idl_header_var_name)
```

The following function will give the source file paths to include in the client executeble. They will be saved in `idl_client_var_name`.

```cmake

GetIDLClientNames("path/to.idl" idl_client_var_name)
```

The following function will give the source file paths to include in the server executeble. They will be saved in `idl_server_var_name`.

```cmake
GetIDLServerNames("path/to.idl" idl_server_var_name)
```

The following function will give the include paths to make it possible to just include the name of the header without having to find it's path. (In the example bellow the header will be called `to.h`) All the paths will be saved in `idl_inc_dir_var_name`.

```cmake
GetIDLIncludeDirs("path/to.idl" idl_inc_dir_var_name)
```

An example of how it could be used is availbe in the examples folder.

For the file to work both the `midl` and the `cl` compillers needs to be available, by just calling their names.
