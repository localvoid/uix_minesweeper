// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-28T10:51:52.321Z

part of app.src.ui.component.board;

// **************************************************************************
// Generator: UixGenerator
// Target: class Cell
// **************************************************************************

Cell createCell([s.Cell data, List<VNode> children, Component parent]) {
  return new Cell()
    ..parent = parent
    ..data = data
    ..children = children;
}
VNode vCell({s.Cell data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createCell,
    flags: VNode.componentFlag,
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

Board createBoard([dynamic data, List<VNode> children, Component parent]) {
  return new Board()
    ..parent = parent
    ..data = data
    ..children = children;
}
VNode vBoard({dynamic data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createBoard,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
