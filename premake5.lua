include "utils.lua"
ValidateAddon()

--Main--
workspace (settings.workspace)
    configurations { "Debug", "Release" }
    platforms { "x86", "x64" }
    startproject(settings.addon_name)

    flags "MultiProcessorCompile"

    filter "platforms:x86"
        architecture "x86"

    filter "platforms:x64"
        architecture "x64"

include (settings.addon_name)
group "Dependencies"
    include "GodotCpp"
group ""