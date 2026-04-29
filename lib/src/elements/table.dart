import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

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
  }) : super(children: [head, body]);

  @override
  String build({BuildOptions? buildOptions}) {
    final thisCaption = caption;
    return "<table$modifiers>\n"
        "${thisCaption == null ? "" : "${thisCaption.build(buildOptions: buildOptions)}\n"}"
        "${head.build(buildOptions: buildOptions)}\n"
        "${body.build(buildOptions: buildOptions)}\n"
        "</table>";
  }
}

class TableCaption extends Element {
  TableCaption({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<caption$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</caption>";
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
  String build({BuildOptions? buildOptions}) {
    return "<thead$modifiers>\n"
        '${rows.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
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
  String build({BuildOptions? buildOptions}) {
    return "<tbody$modifiers>\n"
        '${rows.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
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
  String build({BuildOptions? buildOptions}) {
    return "<tr$modifiers>\n"
        '${cells.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
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
  String build({BuildOptions? buildOptions}) {
    return "<th$modifiers>"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
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
  String build({BuildOptions? buildOptions}) {
    return "<td$modifiers>"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
        "</td>";
  }
}
