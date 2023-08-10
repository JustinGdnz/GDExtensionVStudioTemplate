#pragma once
#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/variant/string.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

class GDExample : public godot::Node
{
    GDCLASS(GDExample, godot::Node);

public:
    GDExample() = default;
    ~GDExample() = default;

private:
    godot::String dialog = "Hello Godot from Visual Studio!";
public:
    void set_dialog(const godot::String p_dialog) { dialog = p_dialog; }
    godot::String get_dialog() { return dialog; }

    void speak() const { godot::UtilityFunctions::print(dialog); }
protected:
    static void _bind_methods();
};