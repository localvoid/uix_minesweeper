import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'src/env.dart';
import 'src/board.dart';

main() {
  initUix();
  initEnv();

  scheduler.nextFrame.write().then((_) {
    injectComponent(createBoard(), html.querySelector('.MineSweeper'));
  });
}
