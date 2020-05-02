#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import os


def createNewWidget(widgetName, path, design=False):
    folder_path = os.path.join(path, widgetName)
    file_path = os.path.join(folder_path, widgetName + ".dart")

    print("Writing " + file_path)

    camel_case_name = "".join([element[0].upper() + element[1:]
                               for element in widgetName.split('_')])
    file_content = [
        "import 'package:flutter/material.dart';\n",
        "\n",
        "class "+camel_case_name+" extends StatelessWidget {\n",
        "    const "+camel_case_name+"({Key key}) : super(key: key);\n",
        "\n",
        "    // TODO [DESGIN] create design file and receive here\n",
        "\n",
        "    @override\n",
        "    Widget build(BuildContext context) {\n",
        "        return Container(\n",
        "            height: 30,\n",
        "            color: Colors.red,\n",
        "            child: Center(\n",
        "               child: Text(\""+camel_case_name+"\"),\n",
        "            ),\n",
        "        );\n",
        "    }\n",
        "}\n",
    ]

    os.mkdir(folder_path)
    with open(file_path, 'w') as _file:
        _file.writelines(file_content)

    if not design:
        return

    design_file_content = [
        "import 'package:dreamspace/design/widget_design.dart';\n",
        "\n",
        "abstract class Abstract"+camel_case_name +
        "Design extends AbstractWidgetDesign {\n",
        "    // ==================================== INTERFACE for different theme implementations\n",
        "    // Color get pageBackgroundColor;\n",
        "\n",
        "    // ==================================== POINTER to design files for all children\n",
        "    // AbstractChildWidgetDesign get childWidgetDesign;\n",
        "}\n",
        "\n",
        "class "+camel_case_name+"DesignDarkMode implements Abstract" +
        camel_case_name+"Design {\n",
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
    design_file_path = os.path.join(folder_path, widgetName + "_design.dart")
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
