library app.src.action;

import 'env.dart';

class Action {
  static void markCell(int x, int y) {
    store.board.markCell(x, y);
  }

  static void openCell(int x, int y) {
    store.board.openCell(x, y);
  }
}
