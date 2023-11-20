import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/components/widgets/footer.dart';
import 'package:portfolio/app/components/widgets/header.dart';
import 'package:portfolio/app/modules/home/views/pages/about_me/about_me.dart';
import 'package:portfolio/app/modules/home/views/pages/hello_page.dart';
import 'package:portfolio/app/modules/home/views/pages/portfolio/portfolio_view.dart';
import 'package:portfolio/app/values/color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 900,
            maxWidth: 1500,
          ),
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: mainBgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: Column(
                children: [
                  const Header(),
                  Expanded(
                    child: Obx(
                      () => controller.selectedHeaderBar.value == "_hello"
                          ? const Hello()
                          : controller.selectedHeaderBar.value == "_about-me"
                              ? const AboutMe()
                              : PortfolioView(),
                    ),
                  ),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
