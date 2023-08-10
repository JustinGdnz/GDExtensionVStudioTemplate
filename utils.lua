--Edit this file for setting up your addon--
settings = json.decode(io.readfile("addonsettings.json"))
--Contains:
    --workspace
    --addon_root
    --addon_name

--Used by godot tags--
archsuffix = {
    x86    = "x86_32",
    x86_64 = "x86_64"
}

--These as well--
outsuffix = ".%{cfg.system}" .. 
         ".template_%{string.lower(cfg.buildcfg)}" ..
         ".%{archsuffix[cfg.architecture]}"

--Location of our addon directory (*.gdextension file)--
addon_path = (settings.addon_root .. "/" .. settings.addon_name)

--Addon validation--
ValidateAddon = function()
    if (not os.isdir(addon_path)) then
        term.pushColor(term.errorColor)
        printf("Addon path (\"%s\") doesn't exist or doesn't match your addon configuration", addon_path)
        term.pushColor(term.infoColor)
        printf("addonsettings.json:\n--workspace: %s\n--addon_root: %s\n--addon_name: %s\n", settings.workspace, settings.addon_root, settings.addon_name)
        term.popColor();
        term.popColor();
    end
end

--Clean project action--
newaction {
    trigger = "clean",
    description = "Remove all yunk files.",
    execute = function()
        print("Removing binaries")
        os.rmdir(addon_path .. "/bin")
        os.rmdir("./bin")
        print("Removing intermediate binaries")
        os.rmdir("./bin-int")
        os.rmdir("./obj")
        print("Removing project files")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        print("Done")
    end
}