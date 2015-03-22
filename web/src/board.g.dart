// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T11:19:46.696Z

part of app.src.ui.component.board;

// **************************************************************************
// Generator: UixGenerator
// Target: class Cell
// **************************************************************************

Cell createCell([s.Cell data, Component parent]) {
  final r = new Cell()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vCell({s.Cell data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createCell,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);

// **************************************************************************
// Generator: UixGenerator
// Target: class Board
// **************************************************************************

Board createBoard([dynamic data, Component parent]) {
  final r = new Board()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vBoard({dynamic data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createBoard,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
