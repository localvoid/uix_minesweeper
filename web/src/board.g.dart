// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T09:48:00.414Z

part of app.src.ui.component.board;

// **************************************************************************
// Generator: UixGenerator
// Target: class Cell
// **************************************************************************

Cell createCell([s.Cell data]) {
  final r = new Cell()..data = data;
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

Board createBoard([dynamic data]) {
  final r = new Board()..data = data;
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
