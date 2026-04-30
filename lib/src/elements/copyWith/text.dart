// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../text.dart";

const Object _sentinel = Object();

abstract interface class _TCopyWith {
  @useResult
  T call({
    String text,
  });
}

class _TCopyWithImpl implements _TCopyWith {
  final T _value;

  const _TCopyWithImpl(this._value);

  @override
  T call({
    Object? text,
  }) => T(
    text == null ? _value.text : text as String,
  );
}

extension TCopyWith on T {
  _TCopyWith get copyWith => _TCopyWithImpl(this);
}

abstract interface class _PCopyWith {
  @useResult
  P call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _PCopyWithImpl implements _PCopyWith {
  final P _value;

  const _PCopyWithImpl(this._value);

  @override
  P call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => P(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension PCopyWith on P {
  _PCopyWith get copyWith => _PCopyWithImpl(this);
}

abstract interface class _ACopyWith {
  @useResult
  A call({
    String href,
    Iterable<Element> children,
    Target? target,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _ACopyWithImpl implements _ACopyWith {
  final A _value;

  const _ACopyWithImpl(this._value);

  @override
  A call({
    Object? href,
    Object? children,
    Object? target = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => A(
    href: href == null ? _value.href : href as String,
    children: children == null ? _value.children : children as Iterable<Element>,
    target: identical(target, _sentinel) ? _value.target : target as Target?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension ACopyWith on A {
  _ACopyWith get copyWith => _ACopyWithImpl(this);
}

abstract interface class _SpanCopyWith {
  @useResult
  Span call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _SpanCopyWithImpl implements _SpanCopyWith {
  final Span _value;

  const _SpanCopyWithImpl(this._value);

  @override
  Span call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Span(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension SpanCopyWith on Span {
  _SpanCopyWith get copyWith => _SpanCopyWithImpl(this);
}

abstract interface class _SummaryCopyWith {
  @useResult
  Summary call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _SummaryCopyWithImpl implements _SummaryCopyWith {
  final Summary _value;

  const _SummaryCopyWithImpl(this._value);

  @override
  Summary call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Summary(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension SummaryCopyWith on Summary {
  _SummaryCopyWith get copyWith => _SummaryCopyWithImpl(this);
}

abstract interface class _DetailsCopyWith {
  @useResult
  Details call({
    Summary summary,
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _DetailsCopyWithImpl implements _DetailsCopyWith {
  final Details _value;

  const _DetailsCopyWithImpl(this._value);

  @override
  Details call({
    Object? summary,
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Details(
    summary: summary == null ? _value.summary : summary as Summary,
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension DetailsCopyWith on Details {
  _DetailsCopyWith get copyWith => _DetailsCopyWithImpl(this);
}

abstract interface class _EmCopyWith {
  @useResult
  Em call({
    Iterable<Element> children,
  });
}

class _EmCopyWithImpl implements _EmCopyWith {
  final Em _value;

  const _EmCopyWithImpl(this._value);

  @override
  Em call({
    Object? children,
  }) => Em(
    children: children == null ? _value.children : children as Iterable<Element>,
  );
}

extension EmCopyWith on Em {
  _EmCopyWith get copyWith => _EmCopyWithImpl(this);
}

abstract interface class _StrongCopyWith {
  @useResult
  Strong call({
    Iterable<Element> children,
  });
}

class _StrongCopyWithImpl implements _StrongCopyWith {
  final Strong _value;

  const _StrongCopyWithImpl(this._value);

  @override
  Strong call({
    Object? children,
  }) => Strong(
    children: children == null ? _value.children : children as Iterable<Element>,
  );
}

extension StrongCopyWith on Strong {
  _StrongCopyWith get copyWith => _StrongCopyWithImpl(this);
}
