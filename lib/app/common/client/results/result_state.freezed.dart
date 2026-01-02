// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState<$T>()';
}


}

/// @nodoc
class $ResultStateCopyWith<T,$Res>  {
$ResultStateCopyWith(ResultState<T> _, $Res Function(ResultState<T>) __);
}


/// Adds pattern-matching-related methods to [ResultState].
extension ResultStatePatterns<T> on ResultState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle<T> value)?  initial,TResult Function( Loading<T> value)?  loading,TResult Function( Completed<T> value)?  completed,TResult Function( Failed<T> value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Completed() when completed != null:
return completed(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle<T> value)  initial,required TResult Function( Loading<T> value)  loading,required TResult Function( Completed<T> value)  completed,required TResult Function( Failed<T> value)  failed,}){
final _that = this;
switch (_that) {
case Idle():
return initial(_that);case Loading():
return loading(_that);case Completed():
return completed(_that);case Failed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle<T> value)?  initial,TResult? Function( Loading<T> value)?  loading,TResult? Function( Completed<T> value)?  completed,TResult? Function( Failed<T> value)?  failed,}){
final _that = this;
switch (_that) {
case Idle() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Completed() when completed != null:
return completed(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  completed,TResult Function( BaseErrorsModel error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Completed() when completed != null:
return completed(_that.data);case Failed() when failed != null:
return failed(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  completed,required TResult Function( BaseErrorsModel error)  failed,}) {final _that = this;
switch (_that) {
case Idle():
return initial();case Loading():
return loading();case Completed():
return completed(_that.data);case Failed():
return failed(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  completed,TResult? Function( BaseErrorsModel error)?  failed,}) {final _that = this;
switch (_that) {
case Idle() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Completed() when completed != null:
return completed(_that.data);case Failed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Idle<T> implements ResultState<T> {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState<$T>.initial()';
}


}




/// @nodoc


class Loading<T> implements ResultState<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState<$T>.loading()';
}


}




/// @nodoc


class Completed<T> implements ResultState<T> {
  const Completed(this.data);
  

 final  T data;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedCopyWith<T, Completed<T>> get copyWith => _$CompletedCopyWithImpl<T, Completed<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Completed<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResultState<$T>.completed(data: $data)';
}


}

/// @nodoc
abstract mixin class $CompletedCopyWith<T,$Res> implements $ResultStateCopyWith<T, $Res> {
  factory $CompletedCopyWith(Completed<T> value, $Res Function(Completed<T>) _then) = _$CompletedCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$CompletedCopyWithImpl<T,$Res>
    implements $CompletedCopyWith<T, $Res> {
  _$CompletedCopyWithImpl(this._self, this._then);

  final Completed<T> _self;
  final $Res Function(Completed<T>) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Completed<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Failed<T> implements ResultState<T> {
  const Failed(this.error);
  

 final  BaseErrorsModel error;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<T, Failed<T>> get copyWith => _$FailedCopyWithImpl<T, Failed<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ResultState<$T>.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<T,$Res> implements $ResultStateCopyWith<T, $Res> {
  factory $FailedCopyWith(Failed<T> value, $Res Function(Failed<T>) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 BaseErrorsModel error
});




}
/// @nodoc
class _$FailedCopyWithImpl<T,$Res>
    implements $FailedCopyWith<T, $Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed<T> _self;
  final $Res Function(Failed<T>) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Failed<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as BaseErrorsModel,
  ));
}


}

// dart format on
