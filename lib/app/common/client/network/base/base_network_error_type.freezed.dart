// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_network_error_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseNetworkErrorType {

 Object? get error;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseNetworkErrorType&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BaseNetworkErrorType(error: $error)';
}


}

/// @nodoc
class $BaseNetworkErrorTypeCopyWith<$Res>  {
$BaseNetworkErrorTypeCopyWith(BaseNetworkErrorType _, $Res Function(BaseNetworkErrorType) __);
}


/// Adds pattern-matching-related methods to [BaseNetworkErrorType].
extension BaseNetworkErrorTypePatterns on BaseNetworkErrorType {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestError value)?  request,TResult Function( _TypeError value)?  type,TResult Function( _Connectivity value)?  connectivity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestError() when request != null:
return request(_that);case _TypeError() when type != null:
return type(_that);case _Connectivity() when connectivity != null:
return connectivity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestError value)  request,required TResult Function( _TypeError value)  type,required TResult Function( _Connectivity value)  connectivity,}){
final _that = this;
switch (_that) {
case _RequestError():
return request(_that);case _TypeError():
return type(_that);case _Connectivity():
return connectivity(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestError value)?  request,TResult? Function( _TypeError value)?  type,TResult? Function( _Connectivity value)?  connectivity,}){
final _that = this;
switch (_that) {
case _RequestError() when request != null:
return request(_that);case _TypeError() when type != null:
return type(_that);case _Connectivity() when connectivity != null:
return connectivity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DioException error)?  request,TResult Function( String? error)?  type,TResult Function( String? error)?  connectivity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestError() when request != null:
return request(_that.error);case _TypeError() when type != null:
return type(_that.error);case _Connectivity() when connectivity != null:
return connectivity(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DioException error)  request,required TResult Function( String? error)  type,required TResult Function( String? error)  connectivity,}) {final _that = this;
switch (_that) {
case _RequestError():
return request(_that.error);case _TypeError():
return type(_that.error);case _Connectivity():
return connectivity(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DioException error)?  request,TResult? Function( String? error)?  type,TResult? Function( String? error)?  connectivity,}) {final _that = this;
switch (_that) {
case _RequestError() when request != null:
return request(_that.error);case _TypeError() when type != null:
return type(_that.error);case _Connectivity() when connectivity != null:
return connectivity(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RequestError extends BaseNetworkErrorType {
  const _RequestError({required this.error}): super._();
  

@override final  DioException error;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestErrorCopyWith<_RequestError> get copyWith => __$RequestErrorCopyWithImpl<_RequestError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseNetworkErrorType.request(error: $error)';
}


}

/// @nodoc
abstract mixin class _$RequestErrorCopyWith<$Res> implements $BaseNetworkErrorTypeCopyWith<$Res> {
  factory _$RequestErrorCopyWith(_RequestError value, $Res Function(_RequestError) _then) = __$RequestErrorCopyWithImpl;
@useResult
$Res call({
 DioException error
});




}
/// @nodoc
class __$RequestErrorCopyWithImpl<$Res>
    implements _$RequestErrorCopyWith<$Res> {
  __$RequestErrorCopyWithImpl(this._self, this._then);

  final _RequestError _self;
  final $Res Function(_RequestError) _then;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_RequestError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DioException,
  ));
}


}

/// @nodoc


class _TypeError extends BaseNetworkErrorType {
  const _TypeError({required this.error}): super._();
  

@override final  String? error;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeErrorCopyWith<_TypeError> get copyWith => __$TypeErrorCopyWithImpl<_TypeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseNetworkErrorType.type(error: $error)';
}


}

/// @nodoc
abstract mixin class _$TypeErrorCopyWith<$Res> implements $BaseNetworkErrorTypeCopyWith<$Res> {
  factory _$TypeErrorCopyWith(_TypeError value, $Res Function(_TypeError) _then) = __$TypeErrorCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$TypeErrorCopyWithImpl<$Res>
    implements _$TypeErrorCopyWith<$Res> {
  __$TypeErrorCopyWithImpl(this._self, this._then);

  final _TypeError _self;
  final $Res Function(_TypeError) _then;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_TypeError(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Connectivity extends BaseNetworkErrorType {
  const _Connectivity({required this.error}): super._();
  

@override final  String? error;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectivityCopyWith<_Connectivity> get copyWith => __$ConnectivityCopyWithImpl<_Connectivity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connectivity&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseNetworkErrorType.connectivity(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ConnectivityCopyWith<$Res> implements $BaseNetworkErrorTypeCopyWith<$Res> {
  factory _$ConnectivityCopyWith(_Connectivity value, $Res Function(_Connectivity) _then) = __$ConnectivityCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$ConnectivityCopyWithImpl<$Res>
    implements _$ConnectivityCopyWith<$Res> {
  __$ConnectivityCopyWithImpl(this._self, this._then);

  final _Connectivity _self;
  final $Res Function(_Connectivity) _then;

/// Create a copy of BaseNetworkErrorType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_Connectivity(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
