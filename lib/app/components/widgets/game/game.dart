import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/components/widgets/game/controller.dart';
import 'package:portfolio/app/values/color.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    GameController gameController = Get.put<GameController>(GameController());
    return RawKeyboardListener(
      autofocus: true,
      focusNode: gameController.focusNode,
      onKey: gameController.onKeyPress,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: mainBgColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: bgColor, width: 0.5)),
          child: Obx(
            () {
              var board = gameController.board.value;
              return GridView.builder(
                padding: const EdgeInsets.all(4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: board.length,
                itemBuilder: (BuildContext context, int i) {
                  var value = board[i];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: gameController.boardColor[value],
                    ),
                    child: Center(
                      child: Text(
                        value == 0 ? "" : value.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
