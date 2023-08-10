#include "GDExample.h"
#include <godot_cpp/core/class_db.hpp>
using namespace godot;

void GDExample::_bind_methods()
{
	ClassDB::bind_method(D_METHOD("speak"), &GDExample::speak);
	ClassDB::bind_method(D_METHOD("get_dialog"), &GDExample::get_dialog);
	ClassDB::bind_method(D_METHOD("set_dialog", "p_dialog"), &GDExample::set_dialog);
	ClassDB::add_property("GDExample", PropertyInfo(Variant::STRING, "dialog"), "set_dialog", "get_dialog");
}
