#!/bin/bash

# Comprueba si se han proporcionado los argumentos necesarios
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 module <ModuleName> <VariableName>"
    exit 1
fi

# Asigna los argumentos a variables
COMMAND1=$1
MODULE_NAME="$2 $3"

# Comprueba que el primer comando sea correcto
if [ "$COMMAND1" != "module" ]; then
    echo "Comando inválido. Uso: $0 module <ModuleName> <VariableName>"
    exit 1
fi


# Crea las carpetas y archivos necesarios
mkdir -p "./models"
mkdir -p "./i18n"
mkdir -p "./views"
mkdir -p "./static/description"
touch "./__init__.py"
echo "from . import models" > "./__init__.py"
touch "./models/__init__.py"


# Contenido específico para el archivo __manifest__.py
cat <<EOL > "./__manifest__.py"
{
    'name': '$MODULE_NAME',
    'summary': "",
    'description': "",
    'author': "Jenrax",
    'website': "https://www.jenrax.com",
    'category': 'Uncategorized',
    'version': '16.0.1.0.0',
    'license': 'Other proprietary',
    'depends': [
        'base',

    ],
    'data': [

    ],
}
EOL

# Contenido específico para el archivo index.html
cat <<EOL > "./static/description/index.html"
<section class="oe_container oe_dark">
    <div class="oe_row oe_spaced">
        <h1 class="oe_slogan" style="color:#03296B;">$MODULE_NAME</h1>
        <h2 class="oe_slogan">

        </h2>
    </div>
</section>

<section class="oe_container oe_dark">
    <div class="oe_row oe_spaced">
        <h3 class="oe_slogan" style="color:#03296B;">How to use</h3>
        <div class="oe_span6">
            <p class='oe_mt32 text-justify'>

            </p>
        </div>
        <div class="oe_span6">
            <img class="oe_picture oe_screenshot" src="">
        </div>
    </div>
</section>
EOL

# Copia la imagen icon.png en la carpeta description
if [ -f /Users/raulovalle/odoo/odoo16/odoo_module_template/icon.png ]; then
    cp "/Users/raulovalle/odoo/odoo16/odoo_module_template/icon.png" "./static/description/icon.png"
else
    echo "Advertencia: No se encontró el archivo icon.png"
fi

echo "Módulo $MODULE_NAME creado."