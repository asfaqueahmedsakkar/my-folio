import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/components/widgets/editor.dart';
import 'package:portfolio/app/modules/home/views/pages/about_me/controller.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:portfolio/app/values/utility.dart';
import 'package:share_plus/share_plus.dart';


class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  Controller controller = Get.put<Controller>(Controller());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: double.infinity,
          width: 280,
          decoration: BoxDecoration(
            border: Border(
              right: borderSide,
            ),
          ),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 60,
                decoration: BoxDecoration(
                    border: Border(
                  right: borderSide,
                )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          FontAwesomeIcons.folder,
                          size: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: ()=>Share.share("https://asfaqueahmedsakkar.com"),
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            FontAwesomeIcons.shareNodes,
                            color: disableHeaderTitleColor,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          FontAwesomeIcons.git,
                          size: 18,
                          color: disableHeaderTitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: controller.expandPersonalInfo.toggle,
                      child: Container(
                        height: 36,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(bottom: borderSide),
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                                turns: controller.expandPersonalInfo.value
                                    ? 0
                                    : -0.25,
                                duration: const Duration(milliseconds: 300),
                                child: const Icon(Icons.arrow_drop_down_sharp)),
                            const SizedBox(width: 4),
                            Text(
                              "personal-information",
                              style: headerFooterTextStyle.copyWith(
                                color: activeHeaderTitleColor,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => ClipRect(
                      child: AnimatedAlign(
                        alignment: Alignment.topCenter,
                        heightFactor:
                            controller.expandPersonalInfo.value ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration:
                              BoxDecoration(border: Border(bottom: borderSide)),
                          child: Column(
                            children: [
                              _buildFolder(
                                title: "bio",
                                color: const Color(0xae3c7568),
                                files: ['bio'],
                              ),
                              _buildFolder(
                                title: "education",
                                color: const Color(0xff00e1a3),
                                files: ['higher_secondary', 'under_graduation'],
                              ),
                              _buildFolder(
                                title: "experience",
                                color: const Color(0xff29a4d9),
                                files: ['debugBD', 'codersbucket'],
                              ),
                              _buildFolder(
                                title: "expertise",
                                color: const Color(0xff2961d9),
                                files: [
                                  'cross_platform_app_development',
                                  'game_development',
                                  'android_native',
                                  'backend_development'
                                ],
                              ),
                              _buildFolder(
                                title: "interest",
                                color: const Color(0xfff16309),
                                files: ['interest'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.expandContacts.toggle,
                    child: Container(
                      height: 36,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(bottom: borderSide),
                      ),
                      child: Obx(
                        () => Row(
                          children: [
                            AnimatedRotation(
                                turns:
                                    controller.expandContacts.value ? 0 : -0.25,
                                duration: const Duration(milliseconds: 300),
                                child: const Icon(Icons.arrow_drop_down_sharp)),
                            const SizedBox(width: 4),
                            Text(
                              "contacts",
                              style: headerFooterTextStyle.copyWith(
                                color: activeHeaderTitleColor,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => ClipRect(
                      child: AnimatedAlign(
                        alignment: Alignment.topCenter,
                        heightFactor: controller.expandContacts.value ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      size: 16,
                                      color: disableHeaderTitleColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        "asfaqueahmedsakkar@gmail.com",
                                        style: headerFooterTextStyle.copyWith(
                                            fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: disableHeaderTitleColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "+8801737-740010",
                                      style: headerFooterTextStyle.copyWith(
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
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
                child: Container(
                  color: folderSectionBgColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Obx(
                          () {
                            return controller.selectedFile.value.isEmpty
                                ? const SizedBox()
                                : Editor(
                                    contentTitle:
                                        controller.selectedFile.value ?? "",
                                  );
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFolder({
    Color? color,
    required String title,
    required List<String> files,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: controller.folderExpansionStatus[title]?.toggle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.transparent,
            child: Row(
              children: [
                AnimatedRotation(
                  turns: controller.folderExpansionStatus[title]?.value == true
                      ? 0.25
                      : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.folder,
                  size: 16,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: headerFooterTextStyle.copyWith(
                      color: activeHeaderTitleColor, fontSize: 12),
                )
              ],
            ),
          ),
        ),
        Obx(
          () => ClipRect(
            child: AnimatedAlign(
              alignment: Alignment.topCenter,
              heightFactor:
                  controller.folderExpansionStatus[title]?.value == true
                      ? 1
                      : 0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: files.map((e) => _file(e)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _file(String title) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.openFile(title),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 48, top: 6, bottom: 6),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.fileCode,
                color: controller.selectedFile.value == title
                    ? selectedBorderColor
                    : disableHeaderTitleColor,
                size: 14,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: headerFooterTextStyle.copyWith(
                      color: controller.selectedFile.value == title
                          ? selectedBorderColor
                          : disableHeaderTitleColor,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
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
