{ xed }:

xed.overrideAttrs (finalAttrs: previousAttrs: {
  buildPhase = previousAttrs.buildPhase + ''
    mkdir -p $out/lib/cmake/xed/

    echo '
    set(XED_LIBRARY_DIR "''${CMAKE_CURRENT_LIST_DIR}/../../../lib")
    set(XED_LIBRARIES "''${XED_LIBRARY_DIR}/libxed''${CMAKE_STATIC_LIBRARY_SUFFIX}" "''${XED_LIBRARY_DIR}/libxed-ild''${CMAKE_STATIC_LIBRARY_SUFFIX}")
    set(XED_INCLUDE_DIRS "''${CMAKE_CURRENT_LIST_DIR}/../../../include")

    add_library(XED::Main STATIC IMPORTED)
    set_target_properties(XED::Main PROPERTIES
        IMPORTED_LOCATION "''${XED_LIBRARY_DIR}/libxed''${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )

    add_library(XED::ILD STATIC IMPORTED)
    set_target_properties(XED::ILD PROPERTIES
        IMPORTED_LOCATION "''${XED_LIBRARY_DIR}/libxed-ild''${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )

    add_library(XED::XED INTERFACE IMPORTED)
    set_target_properties(XED::XED PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "''${XED_INCLUDE_DIRS}"
        INTERFACE_LINK_LIBRARIES "XED::Main;XED::ILD"
    )
    ' >> $out/lib/cmake/xed/XEDConfig.cmake
  '';
})
