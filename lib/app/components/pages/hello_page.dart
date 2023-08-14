import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/components/widgets/game/controller.dart';
import 'package:portfolio/app/components/widgets/game/game.dart';
import 'package:portfolio/app/values/color.dart';
import 'package:portfolio/app/values/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi all, i am",
                  style: GoogleFonts.sourceCodePro(
                      color: Colors.white, letterSpacing: 1.2, height: 1),
                ),
                Text(
                  "Asfaque Ahmed",
                  style: GoogleFonts.sourceCodePro(
                      color: Colors.white, letterSpacing: 1.2, fontSize: 48),
                ),
                const SizedBox(height: 8),
                Text(
                  ">> Cross platform application developer",
                  style: GoogleFonts.sourceCodePro(
                      color: const Color(0xff4D5BCE),
                      letterSpacing: 1.2,
                      fontSize: 24),
                ),
                const SizedBox(height: 60),
                Text(
                  "// Feel free to play the game to overcome your boredom",
                  style: headerFooterTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  "// You can find the code for the game in github",
                  style: headerFooterTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 16),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://gist.github.com/AsfaqueAhmed/460afcc0ecffeea297c8b6390b68dee0"));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "const",
                          style: keyTextStyle,
                          children: [
                            TextSpan(
                              text: " String ",
                              style: varTextStyle,
                            ),
                            TextSpan(
                              text: "gitURL",
                              style: varNameTextStyle,
                            ),
                            TextSpan(
                              text: " = ",
                              style: operatorTextStyle,
                            ),
                            TextSpan(
                              text:
                                  "\"https://gist.github.com/AsfaqueAhmed/460afcc0ecffeea297c8b6390b68dee0\"",
                              style: stringTextStyle,
                            ),
                            TextSpan(
                              text: ";",
                              style: operatorTextStyle,
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
        _gameSection(),
      ],
    );
  }

  _gameSection() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(-100, -100),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: green, blurRadius: 200, offset: const Offset(0, 0)),
                BoxShadow(
                    color: green, blurRadius: 100, offset: const Offset(0, 50)),
                BoxShadow(
                    color: green, blurRadius: 100, offset: const Offset(50, 0)),
              ]),
            ),
          ),
          Transform.translate(
            offset: const Offset(50, 100),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: blue, blurRadius: 200, offset: const Offset(0, 0)),
                BoxShadow(
                    color: blue, blurRadius: 100, offset: const Offset(0, 50)),
                BoxShadow(
                    color: blue, blurRadius: 100, offset: const Offset(50, 0)),
              ]),
            ),
          ),
          _gameBoard(),
        ],
      ),
    );
  }

  _gameBoard() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 1, //0.6,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: bgColor, width: 0.5),
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xff175553).withOpacity(0.6),
                    const Color(0xff43D9AD).withOpacity(0.6),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Opacity(opacity: 0.7, child: Game()),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "// use keyboard\n// arrows to play",
                              style: headerFooterTextStyle.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: 8),
                            _key(turn: 2),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _key(turn: 1),
                                _key(turn: 0),
                                _key(turn: 3),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Highest",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Obx(
                                () => Text(
                                  Get.find<GameController>()
                                      .heightScore
                                      .value
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: _screw(),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: _screw(),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: _screw(),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: _screw(),
          ),
        ],
      ),
    );
  }

  Container _screw() {
    return Container(
      height: 12,
      width: 12,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff165e58),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
            ),
            BoxShadow(
                color: Colors.white10,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(-0.5, -0.5)),
          ]),
      child: const Center(
          child: Icon(
        Icons.close,
        color: Colors.black38,
        size: 10,
      )),
    );
  }

  Widget _key({int turn = 0}) {
    return RotatedBox(
      quarterTurns: turn,
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
      ),
    );
  }
}
