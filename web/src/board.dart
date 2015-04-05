library app.src.ui.component.board;

import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'env.dart';
import 'store.dart' as s;
import 'action.dart';

$Cell() => new Cell();
class Cell extends Component<s.Cell> {
  final tag = 'td';

  init() {
    element
      ..onClick.listen(_handleClick)
      ..onContextMenu.listen(_handleContextMenu);
  }

  void _handleClick(html.MouseEvent e) {
    e.preventDefault();
    Action.openCell(data.x, data.y);
  }

  void _handleContextMenu(html.Event e) {
    e.preventDefault();
    Action.markCell(data.x, data.y);
  }

  updateState() {
    addTransientSubscription(data.onChange.listen(invalidate));
    return true;
  }

  updateView() {
    var classes;
    var children;

    if (data.isOpen) {
      if (data.isMine) {
        classes = const ['open', 'mine'];
      } else if (data.type == 0) {
        classes = const ['open'];
      } else {
        classes = const ['open'];
        children = [vText(data.type.toString())];
      }
    } else if (data.isMarked) {
      classes = const ['flag', 'closed'];
    } else {
      classes = const ['closed'];
    }

    updateRoot(vRoot(type: 'Cell', classes: classes, children: children));
  }
}

class Board extends Component {
  final tag = 'table';

  updateView() {
    final board = store.board;

    final children = [];
    for (var row = 0; row < board.rows; row++) {
      final rowChildren = [];
      for (var col = 0; col < board.cols; col++) {
        rowChildren.add(vComponent($Cell, data: board.get(row, col)));
      }
      children.add(vElement('tr', children: rowChildren));
    }

    updateRoot(vRoot(type: 'Board', children: children));
  }
}
