import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio/app/values/color.dart';

class GameController extends GetxController {
  Rx<List<int>> board = Rx([0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0]);
  Map<int, Color> boardColor = {
    0: mainBgColor,
    2: const Color(0xae3c7568),
    4: const Color(0xae67dec5),
    8: const Color(0xff34daaa),
    16: const Color(0xff00e1a3),
    32: const Color(0xff29cad9),
    64: const Color(0xff29a4d9),
    128: const Color(0xff297bd9),
    256: const Color(0xff2961d9),
    512: const Color(0xff3b29d9),
    1024: const Color(0xffeea443),
    2048: const Color(0xfff1c734),
    4096: const Color(0xfff16309),
  };

  var focusNode = FocusNode();

  RxInt heightScore = 0.obs;

  @override
  void onInit() {
    //generateNewField();
    //generateNewField();
    heightScore.value = GetStorage().read("high") ?? 0;
    super.onInit();
  }

  @override
  void onReady() {
    //FocusScope.of(Get.context!).requestFocus(focusNode);
    super.onReady();
  }

  void generateNewField() {
    Random random = Random();
    int nextPost;
    do {
      nextPost = random.nextInt(15);
    } while (board.value[nextPost] != 0);
    board.update((val) {
      val![nextPost] = 2;
      board.value = val;
    });
  }

  void onKeyPress(RawKeyEvent value) {
    bool needUpdate = false;
    if (value is RawKeyUpEvent) {
      if (value.logicalKey.keyLabel == "Arrow Up") {
        needUpdate = _sumUp();
      } else if (value.logicalKey.keyLabel == "Arrow Right") {
        needUpdate = _sumRight();
      } else if (value.logicalKey.keyLabel == "Arrow Down") {
        needUpdate = _sumDown();
      } else if (value.logicalKey.keyLabel == "Arrow Left") {
        needUpdate = _sumLeft();
      }
      if (needUpdate) {
        _calculateNewHighest();
        Future.delayed(const Duration(microseconds: 500), generateNewField);
      }
    }
  }

  bool _sumUp() {
    bool needUpdate = false;
    for (int col = 0; col < 4; col++) {
      for (int row = 0; row < 4; row++) {
        int sum = getBoardValue(row: row, col: col);

        for (int row2 = row + 1; row2 < 4; row2++) {
          var boardValue = getBoardValue(row: row2, col: col);
          if (boardValue != 0 && (sum == 0 || boardValue == sum)) {
            updateBoardValue(row: row, col: col, value: sum + boardValue);
            updateBoardValue(row: row2, col: col, value: 0);
            needUpdate = true;

            if (sum != 0) {
              break;
            } else {
              sum = boardValue;
              row2 = row;
            }
          } else if (boardValue != 0 && sum != boardValue) {
            break;
          }
        }
      }
    }
    board.value = board.value;
    return needUpdate;
  }

  bool _sumLeft() {
    bool needUpdate = false;
    for (int col = 0; col < 4; col++) {
      for (int row = 0; row < 4; row++) {
        int sum = getBoardValue(row: row, col: col);

        for (int col2 = col + 1; col2 < 4; col2++) {
          var boardValue = getBoardValue(row: row, col: col2);
          if (boardValue != 0 && (sum == 0 || boardValue == sum)) {
            updateBoardValue(row: row, col: col, value: sum + boardValue);
            updateBoardValue(row: row, col: col2, value: 0);
            needUpdate = true;
            if (sum != 0) {
              break;
            } else {
              sum = boardValue;
              col2 = col;
            }
          } else if (boardValue != 0 && sum != boardValue) {
            break;
          }
        }
      }
    }
    board.value = board.value;
    return needUpdate;
  }

  bool _sumDown() {
    bool needUpdate = false;
    for (int col = 0; col < 4; col++) {
      for (int row = 3; row >= 0; row--) {
        int sum = getBoardValue(row: row, col: col);

        for (int row2 = row - 1; row2 >= 0; row2--) {
          var boardValue = getBoardValue(row: row2, col: col);
          if (boardValue != 0 && (sum == 0 || boardValue == sum)) {
            updateBoardValue(row: row, col: col, value: sum + boardValue);
            updateBoardValue(row: row2, col: col, value: 0);
            needUpdate = true;

            if (sum != 0) {
              break;
            } else {
              sum = boardValue;
              row2 = row;
            }
          } else if (boardValue != 0 && sum != boardValue) {
            break;
          }
        }
      }
    }
    board.value = board.value;
    return needUpdate;
  }

  bool _sumRight() {
    bool needUpdate = false;
    for (int col = 3; col >= 0; col--) {
      for (int row = 0; row < 4; row++) {
        int sum = getBoardValue(row: row, col: col);

        for (int col2 = col - 1; col2 >= 0; col2--) {
          var boardValue = getBoardValue(row: row, col: col2);
          if (boardValue != 0) {
            if (sum == 0 || boardValue == sum) {
              updateBoardValue(row: row, col: col, value: sum + boardValue);
              updateBoardValue(row: row, col: col2, value: 0);
              needUpdate = true;

              if (sum != 0) {
                break;
              } else {
                sum = boardValue;
                col2 = col;
              }
            } else if (boardValue != sum) {
              break;
            }
          } else if (boardValue != 0 && sum != boardValue) {
            break;
          }
        }
      }
    }
    board.value = board.value;
    return needUpdate;
  }

  int getBoardValue({required int row, required int col}) {
    return board.value[(row * 4) + col];
  }

  updateBoardValue({required int row, required int col, required value}) {
    board.value[(row * 4) + col] = value;
  }

  void _calculateNewHighest() {
    int high = board.value[0];
    for (var element in board.value) {
      high = element > high ? element : high;
    }
    if (high > heightScore.value) {
      heightScore.value = high;
      GetStorage().write("high", high);
    }
  }
}
