import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/internal_utils.dart";

part "copyWith/table.dart";

class Table extends Element {
  TableCaption? caption;
  TableHead head;
  TableBody body;

  Table({
    required this.head,
    required this.body,
    this.caption,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [?caption, head, body]);

  @override
  String build() {
    final thisCaption = caption;
    return "<table$modifiers>\n"
        "${thisCaption == null ? "" : "${thisCaption.build()}\n"}"
        "${head.build()}\n"
        "${body.build()}\n"
        "</table>";
  }

  @override
  Table clone() => Table(
    head: head.clone(),
    body: body.clone(),
    caption: caption?.clone(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class TableCaption extends Element {
  TableCaption({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<caption$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</caption>";
  }

  @override
  TableCaption clone() => TableCaption(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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

  @override
  TableHead clone() => TableHead(
    rows: rows.map((TableRow r) => r.clone()).toList(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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

  @override
  TableBody clone() => TableBody(
    rows: rows.map((TableRow r) => r.clone()).toList(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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

  @override
  TableRow clone() => TableRow(
    cells: cells.map((TableCell c) => c.clone()).toList(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

abstract class TableCell extends Element {
  TableCell({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  TableCell clone();
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

  @override
  TableHeader clone() => TableHeader(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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
        "${children.map((el) => el.build()).join()}"
        "</td>";
  }

  @override
  TableData clone() => TableData(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}
