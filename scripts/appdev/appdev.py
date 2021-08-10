#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import os


def createNewWidget(widget_name, path, design=False):
    folder_path = os.path.join(path, widget_name)
    file_name = widget_name + ".dart"
    design_file_name = widget_name + "_design.dart"
    file_path = os.path.join(folder_path, file_name)

    print("Writing " + file_path)

    camelCaseName = "".join([element[0].upper() + element[1:]
                             for element in widget_name.split('_')])

    _imports = [
        "// flutter\n",
        "import 'package:flutter/material.dart';\n",
        "// project\n"
        "// packages\n",
        "// design\n",
        "import 'design/"+design_file_name+"';\n" if design else '',
        "// children\n",
    ]
    _class = "class "+camelCaseName+" extends StatelessWidget {\n"
    _finals = [
        "   final Abstract"+camelCaseName+"Design design;\n" if design else "",
    ]
    _construct = [
        "       const "+camelCaseName+"({\n"
        "           Key key,\n",
        "           @required this.design,\n" if design else "",
        "       }) : super(key: key);\n",
    ]
    _body = [
        "    @override\n",
        "    Widget build(BuildContext context) {\n",
        "        return Container(\n",
        "            height: 30,\n",
        "            color: Colors.red,\n",
        "            child: Center(\n",
        "               child: Text(\""+camelCaseName+"\"),\n",
        "            ),\n",
        "        );\n",
        "    }\n",
    ]
    file_content = [
        *_imports,
        "\n",
        _class,
        "\n",
        *_finals,
        "\n",
        *_construct,
        "\n",
        *_body,
        "}\n",
    ]

    os.mkdir(folder_path)
    with open(file_path, 'w') as _file:
        _file.writelines(file_content)

    if not design:
        return

    _imports_design = [
        "// flutter\n",
        "import 'package:flutter/material.dart';\n",
        "// project\n"
        "import 'package:dreamsign/common/widget_design.dart';\n",
        "// packages\n",
        "// children\n",
    ]
    design_file_content = [
        *_imports_design,
        "\n",
        "abstract class Abstract"+camelCaseName +
        "Design extends AbstractWidgetDesign {\n",
        "    // ==================================== INTERFACE for different theme implementations\n",
        "    // Color get pageBackgroundColor;\n",
        "\n",
        "    // ==================================== POINTER to design files for all children\n",
        "    // AbstractChildWidgetDesign get childWidgetDesign;\n",
        "}\n",
        "\n",
        "class "+camelCaseName+"DesignDarkMode implements Abstract" +
        camelCaseName+"Design {\n",
        "    // ==================================== STATIC implementation for DESIGN INHERITANCE by children\n",
        "    // static Color sBackgroundColor = <RootValue> used by child : ParentWidgetDesignDarkMode.sBackgroundColor;\n",
        "\n",
        "    // ==================================== IMPLEMENTATION of abstract INTERFACE thorugh static fields\n",
        "    //@override\n",
        "    //Color get pageBackgroundColor => sBackgroundColor;\n",
        "\n",
        "    // ==================================== IMPLEMENTATION of abstract POINTERS to instance of child in same theme\n",
        "    // @override\n",
        "    // AbstractChildWidgetDesign\n",
        "    //     get childWidgetDesign =>\n",
        "    //         ChildWidgetDesignDarkMode();\n",
        "}\n",
    ]
    design_folder_path = os.path.join(folder_path, "design")
    os.mkdir(design_folder_path)
    design_file_path = os.path.join(design_folder_path, widget_name + "_design.dart")
    with open(design_file_path, 'w') as _file:
        _file.writelines(design_file_content)

# =============================================== ENTRY


def help():
    print('usage: ')
    print("widget <widget_name>        creates a new widget in working directory")
    print("                           (<widget_name>/<widget_name>.dart:WidgetName (with sceleton))")
    print("widget+design <widge_name>")
    sys.exit(1)


if __name__ == '__main__':

    args = sys.argv[1:]
    if not args:
        help()

    if str(args[0]).lower() == "widget":
        if len(args) != 2:
            help()
        widgetName = str(args[1])
        path = os.getcwd()

        print("Creating new widget ...")
        createNewWidget(widgetName, path)

    if str(args[0]).lower() == "widget+design":
        if len(args) != 2:
            help()
        widgetName = str(args[1])
        path = os.getcwd()

        print("Creating new widget ...")
        createNewWidget(widgetName, path, design=True)
    else:
        help()
