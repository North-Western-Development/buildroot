#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LibreSSL::SSL" for configuration "Release"
set_property(TARGET LibreSSL::SSL APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LibreSSL::SSL PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libssl.so.56.0.0"
  IMPORTED_SONAME_RELEASE "libssl.so.56"
  )

list(APPEND _cmake_import_check_targets LibreSSL::SSL )
list(APPEND _cmake_import_check_files_for_LibreSSL::SSL "${_IMPORT_PREFIX}/lib/libssl.so.56.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
