project "BindingsGen"
    kind "Utility"

    targetdir ("%{wks.location}/bin/%{prj.name}")
    objdir ("%{wks.location}/bin-int/%{prj.name}" .. outsuffix)

    files {
        "vendor/godot-cpp/SConstruct"
    }

    prebuildmessage "Generating godot-cpp bindings"
    prebuildcommands {
        "scons -C \"vendor/godot-cpp\" build_library=no"
    }

    postbuildmessage "Regenerating project files"
    postbuildcommands {
        "\"%{wks.location}/vendor/premake/bin/premake5\" %{_ACTION} --file=\"%{wks.location}premake5.lua\""
    }

project "GodotCpp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetprefix ("lib")
    targetname ("godot-cpp")
    targetsuffix (outsuffix)
    targetdir ("%{wks.location}/bin/%{prj.name}")
    objdir ("%{wks.location}/bin-int/%{prj.name}" .. outsuffix)

    files {
        "vendor/godot-cpp/src/**.cpp",
        "vendor/godot-cpp/gen/**.cpp"
    }

    includedirs {
        "vendor/godot-cpp/include",
        "vendor/godot-cpp/gen/include",
        "vendor/godot-cpp/gdextension"
    }

    dependson {
        "BindingsGen"
    }

    warnings "Off"

    filter "system:windows"
        systemversion "latest"

        defines {
            "TYPED_METHOD_BIND",
            "NOMINMAX"
        }

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "on"

        defines {
            "DEBUG_ENABLED",
            "DEBUG_METHODS_ENABLED"
        }

    filter { "configurations:Release" }
        runtime "Release"
        optimize "on"