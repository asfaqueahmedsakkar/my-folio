import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedHeaderBar = "_hello".obs;

  String bio =
      '''Whether it's Flutter's fast development cycle or native's platform-specific optimizations, I am driven by the art of crafting mobile experiences that leave a lasting impact. Let's collaborate and transform your vision into an extraordinary app.
\nHarnessing the power of Flutter for more than half a decade, I've brought countless ideas to life with its rich widget library and expressive design. My proficiency extends from creating responsive layouts to integrating APIs and third-party plugins, delivering apps that excel in both aesthetics and functionality.
\nI thrive in collaborative environments, seamlessly integrating with cross-functional teams of designers, product managers, and fellow developers. My effective communication and adaptability contribute to a harmonious development process, resulting in top-notch apps that exceed expectations.
\nI thrive in collaborative environments, seamlessly integrating with cross-functional teams of designers, product managers, and fellow developers. My effective communication and adaptability contribute to a harmonious development process, resulting in top-notch apps that exceed expectations.''';

  int getLineCount(String text, double width, TextStyle textStyle) {
    final TextSpan textContent = TextSpan(text: text, style: textStyle);
    final TextPainter textPent = TextPainter(
      text: textContent,
      textDirection: TextDirection.ltr,
    );
    textPent.layout(maxWidth: width);

    int lineCount = textPent.height ~/ textPent.preferredLineHeight;
    return lineCount;
  }

  double getTextWidth(String text, TextStyle textStyle) {
    final TextSpan textContent = TextSpan(text: text, style: textStyle);
    final TextPainter textPent = TextPainter(
      text: textContent,
      textDirection: TextDirection.ltr,
    );
    textPent.layout(
        minWidth: (textStyle.fontSize ?? 14) * (textStyle.height ?? 1.5));
    return textPent.width;
  }
}
