// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../table.dart";

const Object _sentinel = Object();

abstract interface class _TableCopyWith {
  @useResult
  Table call({
    TableHead head,
    TableBody body,
    TableCaption? caption,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableCopyWithImpl implements _TableCopyWith {
  final Table _value;

  const _TableCopyWithImpl(this._value);

  @override
  Table call({
    Object? head,
    Object? body,
    Object? caption = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Table(
    head: head == null ? _value.head : head as TableHead,
    body: body == null ? _value.body : body as TableBody,
    caption: identical(caption, _sentinel) ? _value.caption : caption as TableCaption?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableCopyWith on Table {
  _TableCopyWith get copyWith => _TableCopyWithImpl(this);
}

abstract interface class _TableCaptionCopyWith {
  @useResult
  TableCaption call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableCaptionCopyWithImpl implements _TableCaptionCopyWith {
  final TableCaption _value;

  const _TableCaptionCopyWithImpl(this._value);

  @override
  TableCaption call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableCaption(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableCaptionCopyWith on TableCaption {
  _TableCaptionCopyWith get copyWith => _TableCaptionCopyWithImpl(this);
}

abstract interface class _TableHeadCopyWith {
  @useResult
  TableHead call({
    Iterable<TableRow> rows,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableHeadCopyWithImpl implements _TableHeadCopyWith {
  final TableHead _value;

  const _TableHeadCopyWithImpl(this._value);

  @override
  TableHead call({
    Object? rows,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableHead(
    rows: rows == null ? _value.rows : rows as Iterable<TableRow>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableHeadCopyWith on TableHead {
  _TableHeadCopyWith get copyWith => _TableHeadCopyWithImpl(this);
}

abstract interface class _TableBodyCopyWith {
  @useResult
  TableBody call({
    Iterable<TableRow> rows,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableBodyCopyWithImpl implements _TableBodyCopyWith {
  final TableBody _value;

  const _TableBodyCopyWithImpl(this._value);

  @override
  TableBody call({
    Object? rows,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableBody(
    rows: rows == null ? _value.rows : rows as Iterable<TableRow>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableBodyCopyWith on TableBody {
  _TableBodyCopyWith get copyWith => _TableBodyCopyWithImpl(this);
}

abstract interface class _TableRowCopyWith {
  @useResult
  TableRow call({
    Iterable<TableCell> cells,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableRowCopyWithImpl implements _TableRowCopyWith {
  final TableRow _value;

  const _TableRowCopyWithImpl(this._value);

  @override
  TableRow call({
    Object? cells,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableRow(
    cells: cells == null ? _value.cells : cells as Iterable<TableCell>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableRowCopyWith on TableRow {
  _TableRowCopyWith get copyWith => _TableRowCopyWithImpl(this);
}

abstract interface class _TableHeaderCopyWith {
  @useResult
  TableHeader call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableHeaderCopyWithImpl implements _TableHeaderCopyWith {
  final TableHeader _value;

  const _TableHeaderCopyWithImpl(this._value);

  @override
  TableHeader call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableHeader(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableHeaderCopyWith on TableHeader {
  _TableHeaderCopyWith get copyWith => _TableHeaderCopyWithImpl(this);
}

abstract interface class _TableDataCopyWith {
  @useResult
  TableData call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TableDataCopyWithImpl implements _TableDataCopyWith {
  final TableData _value;

  const _TableDataCopyWithImpl(this._value);

  @override
  TableData call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => TableData(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TableDataCopyWith on TableData {
  _TableDataCopyWith get copyWith => _TableDataCopyWithImpl(this);
}
