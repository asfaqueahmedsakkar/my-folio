import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:portfolio/app/values/utility.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          _footerItem(title: "find me in:"),
          _footerItem(
              child: _footerIcon(FontAwesomeIcons.facebookF), width: 42),
          _footerItem(
              child: _footerIcon(FontAwesomeIcons.linkedinIn), width: 42),
          Expanded(child: _footerItem()),
          _footerItem(
              child: Row(
                children: [
                  Text(
                    "@ asfaqueahmedsakkar  ",
                    style: headerFooterTextStyle,
                  ),
                  _footerIcon(FontAwesomeIcons.github),
                ],
              ),
              disableRightBorder: true),
        ],
      ),
    );
  }

  Icon _footerIcon(IconData icon) {
    return Icon(
      icon,
      color: disableHeaderTitleColor,
      size: 14,
    );
  }

  Container _footerItem({
    String? title,
    Widget? child,
    double? width,
    bool disableRightBorder = false,
  }) {
    var headerTextStyle = headerFooterTextStyle;

    var border = BoxDecoration(
      border: Border(
        right: disableRightBorder ? BorderSide.none : borderSide,
        top: borderSide,
      ),
    );

    return Container(
      width: width,
      padding:
          width == null ? const EdgeInsets.symmetric(horizontal: 32) : null,
      alignment: Alignment.center,
      decoration: border,
      child: child ??
          Text(
            title ?? "",
            style: headerTextStyle,
          ),
    );
  }
}
