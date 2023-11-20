import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/data/data.dart';
import 'package:portfolio/app/modules/home/views/pages/portfolio/portfolio_controller.dart';
import 'package:portfolio/app/values/color.dart';

class PortfolioView extends StatelessWidget {
  final PortfolioController controller = Get.put(PortfolioController());

  PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.66,
      ),
      padding: const EdgeInsets.all(20),
      children: projects
          .map((e) => Card(
                color: mainBgColor,
                child: ClipRect(
                  child: Row(
                    children: [
                      Center(
                        child: Transform.translate(
                          offset: const Offset(-40, 40),
                          child: Transform.rotate(
                            angle: 0.2,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/apps/${e['image']}.jpg",
                                    width: 104,
                                    height: 232,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Image.asset(
                                  "assets/frame.png",
                                  width: 120,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Text(
                                e['details'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                                style:  TextStyle(
                                  color: disableHeaderTitleColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
