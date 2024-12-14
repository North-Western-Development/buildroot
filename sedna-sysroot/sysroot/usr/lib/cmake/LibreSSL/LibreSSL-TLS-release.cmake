#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LibreSSL::TLS" for configuration "Release"
set_property(TARGET LibreSSL::TLS APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LibreSSL::TLS PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtls.so.29.0.0"
  IMPORTED_SONAME_RELEASE "libtls.so.29"
  )

list(APPEND _cmake_import_check_targets LibreSSL::TLS )
list(APPEND _cmake_import_check_files_for_LibreSSL::TLS "${_IMPORT_PREFIX}/lib/libtls.so.29.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
