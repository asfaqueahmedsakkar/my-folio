import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/components/widgets/editor.dart';
import 'package:portfolio/app/components/widgets/sidebar.dart';
import 'package:portfolio/app/modules/home/views/pages/about_me/controller.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:portfolio/app/values/utility.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMe extends GetView<Controller> {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, sizeInformation) {
      return Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border(bottom: borderSide),
                  ),
                  child: _fileList(),
                ),
                Expanded(
                  child: Obx(
                    () {
                      return Editor(
                        contentTitle: controller.selectedFile.value,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  _fileList() {
    return Stack(
      children: [
        Obx(
              () => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.openedFileList.value.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var title = controller.openedFileList.value[index];
              return Obx(
                () {
                  var isSelected = controller.selectedFile.value == title;
                  return GestureDetector(
                    onTap: () => controller.openFile(title),
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border(
                          right: borderSide.copyWith(width: 1),
                          bottom: isSelected
                              ? borderSide.copyWith(color: selectedBorderColor)
                              : BorderSide.none,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.fileCode,
                            size: 14,
                            color: isSelected
                                ? activeHeaderTitleColor
                                : disableHeaderTitleColor,
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              "$title.dart",
                              style: commentTextStyle.copyWith(
                                color: isSelected
                                    ? activeHeaderTitleColor
                                    : disableHeaderTitleColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () => controller.remove(title),
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.close,
                                size: 12,
                                color: disableHeaderTitleColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        IgnorePointer(
          child: Row(
            children: [
              Container(
                width: 36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      mainBgColor.withOpacity(0.8),
                      mainBgColor.withOpacity(0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      mainBgColor.withOpacity(0.8),
                      mainBgColor.withOpacity(0),
                    ],
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
