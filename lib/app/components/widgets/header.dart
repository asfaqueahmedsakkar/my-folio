import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:portfolio/app/values/utility.dart';

class Header extends GetView<HomeController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.selectedHeaderBar.value;
        return SizedBox(
          height: 44,
          child: Row(
            children: [
              _headerItem(
                  title: "asfaque_ahmed", width: 280, selectable: false),
              _headerItem(
                title: "_hello",
              ),
              _headerItem(
                title: "_about-me",
              ),
              _headerItem(
                title: "_projects",
              ),
              Expanded(
                  child: _headerItem(
                title: "",
              )),
              _headerItem(title: "_contract-me", disableRightBorder: true),
            ],
          ),
        );
      },
    );
  }

  _headerItem({
    required String title,
    double? width,
    bool selectable = true,
    bool disableRightBorder = false,
  }) {
    var headerTextStyle = headerFooterTextStyle;
    if (controller.selectedHeaderBar.value == title) {
      headerTextStyle = headerTextStyle.copyWith(color: activeHeaderTitleColor);
    }

    var border = BoxDecoration(
      border: Border(
        right: disableRightBorder ? BorderSide.none : borderSide,
        bottom: controller.selectedHeaderBar.value == title
            ? activeBorderSide
            : borderSide,
      ),
    );

    return GestureDetector(
      onTap: !selectable ? null : () => controller.selectedHeaderBar(title),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        alignment: Alignment.centerLeft,
        decoration: border,
        child: Text(
          title,
          style: headerTextStyle,
        ),
      ),
    );
  }
}
