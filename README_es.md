# GDExtensionVStudioTemplate
Plantilla para crear extensiones de godot en Microsoft Visual Studio. (Solo Windows)


## Inicio
Antes de empezar se recomienda tener la versión más reciente hasta el momento de VS2022, [Python 3.6+](https://www.python.org/downloads/windows/) y [SCons 3.0+](https://pypi.org/project/SCons/).

Para más información utilice la documentación oficial de [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html) y [Como compilar para Windows](https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_for_windows.html)

<ins>**Crear solución**</ins>

1. Clona el repositorio actual con `git clone --recursive https://github.com/JustinGdnz/GDExtensionVStudioTemplate`
2. En caso de cambiar el nombre de la extensión, modifique el archivo [addonsettings.json](https://github.com/JustinGdnz/GDExtensionVStudioTemplate/blob/master/addonsettings.json). puedes consultarlo en [Información Adicional](#información-adicional).
3. Ejecuta el archivo [Win-Generate.bat](https://github.com/JustinGdnz/GDExtensionVStudioTemplate/blob/master/scripts/Win-Genenerate.bat) encontrado en la carpeta `scripts`.
4. Listo.

**NOTA**: No es recomendable clonar el repositorio, en su lugar crea uno nuevo dando clic en el botón **`Use this template`**.

***

## Información Adicional
### **Modificación de la plantilla**
Para modificar la plantilla, como el nombre de la extensión, necesitamos tener en cuenta lo siguiente.

**`addonsettings.json`**:
En este archivo se encuentra la información de nuestra extensión, basta con modificar el `addon_name` para cambiar el nombre a nuestra extensión. **Es importante recordar que toda la plantilla se basa en este archivo**.

Al cambiar el nombre de la extensión debemos actualizar los siguientes datos:
1. **`/<addon_name>/`**: Esta carpeta contiene el código de nuestra extensión.
2. **`/addons/<addon_name>/`**: Esta es la carpeta donde se ubica nuestra extensión (`*.gdextension`) y en donde será compilada (`/bin`).
3. **`<addon_name>.gdextension`**: Este archivo contiene la información que Godot usara para cargar la extensión.

```ini
[configuration]

entry_symbol = "gdextension_init"
compatibility_minimum = 4.1

[libraries]

windows.debug.x86_32 = "bin/lib<addon_name>.windows.template_debug.x86_32.dll"
windows.release.x86_32 = "bin/lib<addon_name>.windows.template_release.x86_32.dll"
windows.debug.x86_64 = "bin/lib<addon_name>.windows.template_debug.x86_64.dll"
windows.release.x86_64 = "bin/lib<addon_name>.windows.template_release.x86_64.dll"
```

Todo lo demás será generado automáticamente.

### **Generar los bindings**
Los bindings son generados en la primera compilación, pero si requiere generar los bindings manualmente puede dirigirse a la carpeta `GodotCpp/vendor/godot-cpp` y ejecutar el siguiente comando desde la terminal `scons generate_bindings=yes build_library=no`.

Otra manera de generar los bindings es hacerlo directamente desde VS, compilando únicamente el proyecto `Dependencies/BindingsGen`.