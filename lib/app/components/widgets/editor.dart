import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:highlight/languages/dart.dart';
import 'package:portfolio/app/data/data.dart';

import '../../values/color.dart';

class Editor extends StatefulWidget {
  final String contentTitle;

  const Editor({super.key, required this.contentTitle});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late CodeController controller;

  @override
  void initState() {
    controller = CodeController(
      language: dart,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = data[widget.contentTitle] ?? "";
    return Container(
      color: folderSectionBgColor,
      alignment: Alignment.topLeft,
      child: controller.text.isEmpty
          ? const SizedBox()
          : SingleChildScrollView(
              child: CodeTheme(
                data: const CodeThemeData(
                  styles: vs2015Theme,
                ),
                child: CodeField(
                  enabled: false,
                  controller: controller,
                  background: Colors.transparent,
                  horizontalScroll: true,
                  textStyle: const TextStyle(
                    letterSpacing: 1.2,
                    height: 1.5,
                    fontSize: 13,
                  ),
                  lineNumberStyle: const LineNumberStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      letterSpacing: 1.2,
                      height: 1.5,
                      fontSize: 13,
                    ),
                    width: 48,
                  ),
                  lineNumbers: true,
                ),
              ),
            ),
    );
  }
}
