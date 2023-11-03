import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/values/text_style.dart';

class Controller extends GetxController {
  RxBool expandPersonalInfo = true.obs;
  RxBool expandContacts = true.obs;
  Rx<String> selectedFile = "bio".obs;

  Map<String, RxBool> folderExpansionStatus = {
    "bio": true.obs,
    "education": false.obs,
    "experience": false.obs,
    "expertise": false.obs,
    "interest": false.obs,
  };

  Rx<List<String>> openedFileList = Rx(["bio"]);
  List<double> widthFileList = [];
  HomeController homeController = Get.find<HomeController>();
  ScrollController scrollController = ScrollController();

  @override
  onReady() {
    widthFileList.add(_getWidth("bio"));
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  openFile(String title) {
    selectedFile.value = title;
    if (!openedFileList.value.contains(title)) {
      var value =
          _getWidth(title) + (widthFileList.isEmpty ? 0 : widthFileList.last);
      widthFileList.add(value);
      openedFileList.update((val) {
        val!.add(title);
        openedFileList.value = val;
      });
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      int index = openedFileList.value.indexOf(title);
      var scrollTo = 0.0;
      if (index != 0) {
        scrollTo = widthFileList[index - 1];
        if (scrollTo > scrollController.position.maxScrollExtent) {
          scrollTo = scrollController.position.maxScrollExtent;
        }
      }
      scrollToPoint(scrollTo);
    });
  }

  double _getWidth(String s) {
    return 82.0 +
        homeController.getTextWidth(
          "$s.dart",
          commentTextStyle.copyWith(),
        );
  }

  remove(String title) {
    if (openedFileList.value.contains(title)) {
      int index = openedFileList.value.indexOf(title);
      openedFileList.update((val) {
        val!.removeAt(index);
        widthFileList.removeAt(index);
        openedFileList.value = val;
        if (val.isNotEmpty) {
          selectedFile.value = openedFileList.value[(index-1).clamp(0, index)];
          scrollToPoint(0);
        } else {
          selectedFile("");
        }
      });
    }
  }

  void scrollToPoint(double scrollTo) {
    scrollController.animateTo(
      scrollTo,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
