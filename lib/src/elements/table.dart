import "package:techs_html_bindings/elements.dart";

class Table extends Element {
  TableHead head;
  TableBody body;

  Table({
    required this.head,
    required this.body,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [head, body]);

  @override
  String build() {
    return "<table$modifiers>\n"
        "${head.build()}\n"
        "${body.build()}\n"
        "</table>";
  }
}

class TableHead extends Element {
  Iterable<TableRow> rows;

  TableHead({
    required this.rows,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: rows);

  @override
  String build() {
    return "<thead$modifiers>\n"
        '${rows.map((el) => el.build()).join("\n")}\n'
        "</thead>";
  }
}

class TableBody extends Element {
  Iterable<TableRow> rows;

  TableBody({
    required this.rows,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: rows);

  @override
  String build() {
    return "<tbody$modifiers>\n"
        '${rows.map((el) => el.build()).join("\n")}\n'
        "</tbody>";
  }
}

class TableRow extends Element {
  Iterable<TableCell> cells;

  TableRow({
    required this.cells,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: cells);

  @override
  String build() {
    return "<tr$modifiers>\n"
        '${cells.map((el) => el.build()).join("\n")}\n'
        "</tr>";
  }
}

abstract class TableCell extends Element {
  TableCell({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });
}

class TableHeader extends TableCell {
  TableHeader({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<th$modifiers>"
        "${children.map((el) => el.build()).join()}"
        "</th>";
  }
}

class TableData extends TableCell {
  TableData({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<td$modifiers>"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</td>";
  }
}
