// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../iframe.dart";

const Object _sentinel = Object();

abstract interface class _IFrameCopyWith {
  @useResult
  IFrame call({
    String src,
    String title,
    int? width,
    int? height,
    Loading? loading,
    String? allow,
    ReferrerPolicy? referrerPolicy,
    Set<Sandbox>? sandbox,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _IFrameCopyWithImpl implements _IFrameCopyWith {
  final IFrame _value;

  const _IFrameCopyWithImpl(this._value);

  @override
  IFrame call({
    Object? src,
    Object? title,
    Object? width = _sentinel,
    Object? height = _sentinel,
    Object? loading = _sentinel,
    Object? allow = _sentinel,
    Object? referrerPolicy = _sentinel,
    Object? sandbox = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => IFrame(
    src: src == null ? _value.src : src as String,
    title: title == null ? _value.title : title as String,
    width: identical(width, _sentinel) ? _value.width : width as int?,
    height: identical(height, _sentinel) ? _value.height : height as int?,
    loading: identical(loading, _sentinel) ? _value.loading : loading as Loading?,
    allow: identical(allow, _sentinel) ? _value.allow : allow as String?,
    referrerPolicy: identical(referrerPolicy, _sentinel) ? _value.referrerPolicy : referrerPolicy as ReferrerPolicy?,
    sandbox: identical(sandbox, _sentinel) ? _value.sandbox : sandbox as Set<Sandbox>?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension IFrameCopyWith on IFrame {
  _IFrameCopyWith get copyWith => _IFrameCopyWithImpl(this);
}
