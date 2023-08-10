project (settings.addon_name)
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetprefix ("lib")
    targetsuffix (outsuffix)
    targetdir ("%{wks.location}/" .. addon_path .. "/bin")
    objdir ("%{wks.location}/bin-int/%{prj.name}" .. outsuffix)

    files {
        "src/**.cpp",
        "src/**.h"
    }

    includedirs {
        "src",
        "%{wks.location}/GodotCpp/vendor/godot-cpp/include",
        "%{wks.location}/GodotCpp/vendor/godot-cpp/gen/include",
        "%{wks.location}/GodotCpp/vendor/godot-cpp/gdextension"
    }

    links {
        "GodotCpp"
    }

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