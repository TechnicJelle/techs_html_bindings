// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../base.dart";

abstract interface class _HTMLCopyWith {
  @useResult
  HTML call({
    String lang,
    Head head,
    Body body,
  });
}

class _HTMLCopyWithImpl implements _HTMLCopyWith {
  final HTML _value;

  const _HTMLCopyWithImpl(this._value);

  @override
  HTML call({
    Object? lang,
    Object? head,
    Object? body,
  }) => HTML(
    lang: lang == null ? _value.lang : lang as String,
    head: head == null ? _value.head : head as Head,
    body: body == null ? _value.body : body as Body,
  );
}

extension HTMLCopyWith on HTML {
  _HTMLCopyWith get copyWith => _HTMLCopyWithImpl(this);
}
