import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:portfolio/app/values/utility.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends GetView<HomeController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.selectedHeaderBar.value;
        return SizedBox(
          height: 44,
          child: ResponsiveBuilder(builder: (context, sizeInfo) {
            return Row(
              children: [
                _headerItem(
                    title: "asfaque_ahmed",
                    width: sizeInfo.isTablet ? 220 : 280,
                    selectable: false),
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
                //_headerItem(title: "_contract-me", disableRightBorder: true),
              ],
            );
          }),
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

    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return GestureDetector(
        onTap:
            !selectable ? null : () => controller.changeSelectedHeader(title),
        child: Container(
          width: width,
          padding:  EdgeInsets.symmetric(
              horizontal: sizeInfo.isTablet ? 26 : 32),
          alignment: Alignment.centerLeft,
          decoration: border,
          child: Text(
            title,
            style: headerTextStyle,
          ),
        ),
      );
    });
  }
}
