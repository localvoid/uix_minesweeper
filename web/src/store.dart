library app.store;

import 'dart:async';
import 'dart:math' as math;

final math.Random rand = new math.Random();

abstract class ObservableNode {
  bool _notifying = false;
  StreamController _onChangeController;
  Stream get onChange {
    if (_onChangeController == null) {
      _onChangeController = new StreamController.broadcast();
    }
    return _onChangeController.stream;
  }

  void notify() {
    if (_onChangeController != null && _onChangeController.hasListener) {
      if (!_notifying) {
        _notifying = true;
        scheduleMicrotask(_notifyFinish);
      }
    }
  }

  void _notifyFinish() {
    _notifying = false;
    _onChangeController.add(null);
  }
}

class Cell extends ObservableNode {
  final int x;
  final int y;
  bool isOpen = false;
  bool isMarked = false;
  int type;

  bool get isMine => type == -1;

  Cell(this.x, this.y, this.type, [this.isOpen, this.isMarked]);
  Cell.mine(this.x, this.y, double r) : type = (rand.nextDouble() <= r) ? -1 : 0;
}

class Board {
  int rows;
  int cols;
  List<Cell> _cells;

  Board({this.rows: 10, this.cols: 10}) {
    reset();
  }

  void markCell(int x, int y) {
    final cell = get(x, y);
    if (!cell.isOpen) {
      cell.isMarked = !cell.isMarked;
      cell.notify();
    }
  }

  void openCell(int x, int y) {
    final cell = get(x, y);
    if (!cell.isOpen && !cell.isMarked) {
      cell.isOpen = true;
      cell.notify();

      if (cell.type == 0) {
        _eachAround(x, y, openCell);
      }
    }
  }

  void reset() {
    final cellCount = rows * cols;
    _cells = new List<Cell>(cellCount);

    for (var y = 0; y < rows; y++) {
      for (var x = 0; x < cols; x++) {
        _cells[y * rows + x] = new Cell.mine(x, y, 0.2);
      }
    }

    for (var y = 0; y < rows; y++) {
      for (var x = 0; x < cols; x++) {
        final cell = get(x, y);
        if (cell.isMine) {
          continue;
        }

        int mines = 0;
        _eachAround(x, y, (x, y) {
          mines += get(x, y).isMine ? 1 : 0;
        });
        cell.type = mines;
      }
    }
  }

  void _eachAround(int x, int y, fn) {
    if ((y - 1) >= 0) {
      if ((x - 1) >= 0) {
        fn(x - 1, y - 1);
      }
      fn(x, y - 1);
      if ((x + 1) < cols) {
        fn(x + 1, y - 1);
      }
    }
    if ((x - 1) >= 0) {
      fn(x - 1, y);
    }
    if ((x + 1) < cols) {
      fn(x + 1, y);
    }
    if ((y + 1) < rows) {
      if ((x - 1) >= 0) {
        fn(x - 1, y + 1);
      }
      fn(x, y + 1);
      if ((x + 1) < cols) {
        fn(x + 1, y + 1);
      }
    }
  }

  Cell get(int x, int y) => _cells[y * cols + x];
}

class AppStore extends ObservableNode {
  Board _board = new Board();

  Board get board => _board;
}
