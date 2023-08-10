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

## Additional Information
### **Modificacion de la plantilla**

**`addonsettings.json`**:
Este archivo contiene una pequeña cantidad de datos, como el nombre de la extensión. **Es importante recordar que toda la plantilla se basa en este archivo.**.
- `workspace`: El nombre de tu espacio local de trabajo. Cambiarlo no requiere hacer modificaciones adicionales.
- `addon_root`: El directorio donde se ubica la carpeta de la extensión.
- `addon_name`: El nombre de la extension.

Ya sea que cambies el `addon_root`, `addon_name` o ambos, requiere que hagas los siguientes cambios

1. **`/<addon_name>/`**: Esta carpeta contiene el código de la extensión y tiene que existir para generar los archivos de la solución.
   - Por defecto es `/GDExample/`.

2. **`/<addon_root>/<addon_name>/`**: Esta es la carpeta principal del addon, donde existe el archivo `*.gdextension` y en donde la extensión será compilada (`/bin`).
   - Por defecto es `/addons/GDExample/`.
  
3. **`<addon_name>.gdextension`**: Este es el archivo que contiene todos los datos necesarios para que Godot cargue correctamente la extensión.
   - Por defecto es `GDExample.gdextension`.

Por último solo hace falta modificar el contenido del archivo de la extensión para que coincida con el nombre de la extensión.
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
