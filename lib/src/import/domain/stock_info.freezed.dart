// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockImportInfo {
  String get productCode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productSerial => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Create a copy of StockImportInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockImportInfoCopyWith<StockImportInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockImportInfoCopyWith<$Res> {
  factory $StockImportInfoCopyWith(
          StockImportInfo value, $Res Function(StockImportInfo) then) =
      _$StockImportInfoCopyWithImpl<$Res, StockImportInfo>;
  @useResult
  $Res call(
      {String productCode,
      String productName,
      String productSerial,
      int price,
      int quantity});
}

/// @nodoc
class _$StockImportInfoCopyWithImpl<$Res, $Val extends StockImportInfo>
    implements $StockImportInfoCopyWith<$Res> {
  _$StockImportInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockImportInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCode = null,
    Object? productName = null,
    Object? productSerial = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSerial: null == productSerial
          ? _value.productSerial
          : productSerial // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockInfoImplCopyWith<$Res>
    implements $StockImportInfoCopyWith<$Res> {
  factory _$$StockInfoImplCopyWith(
          _$StockInfoImpl value, $Res Function(_$StockInfoImpl) then) =
      __$$StockInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productCode,
      String productName,
      String productSerial,
      int price,
      int quantity});
}

/// @nodoc
class __$$StockInfoImplCopyWithImpl<$Res>
    extends _$StockImportInfoCopyWithImpl<$Res, _$StockInfoImpl>
    implements _$$StockInfoImplCopyWith<$Res> {
  __$$StockInfoImplCopyWithImpl(
      _$StockInfoImpl _value, $Res Function(_$StockInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockImportInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCode = null,
    Object? productName = null,
    Object? productSerial = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_$StockInfoImpl(
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSerial: null == productSerial
          ? _value.productSerial
          : productSerial // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockInfoImpl implements _StockInfo {
  const _$StockInfoImpl(
      {required this.productCode,
      required this.productName,
      required this.productSerial,
      required this.price,
      required this.quantity});

  @override
  final String productCode;
  @override
  final String productName;
  @override
  final String productSerial;
  @override
  final int price;
  @override
  final int quantity;

  @override
  String toString() {
    return 'StockImportInfo(productCode: $productCode, productName: $productName, productSerial: $productSerial, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockInfoImpl &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productSerial, productSerial) ||
                other.productSerial == productSerial) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productCode, productName, productSerial, price, quantity);

  /// Create a copy of StockImportInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      __$$StockInfoImplCopyWithImpl<_$StockInfoImpl>(this, _$identity);
}

abstract class _StockInfo implements StockImportInfo {
  const factory _StockInfo(
      {required final String productCode,
      required final String productName,
      required final String productSerial,
      required final int price,
      required final int quantity}) = _$StockInfoImpl;

  @override
  String get productCode;
  @override
  String get productName;
  @override
  String get productSerial;
  @override
  int get price;
  @override
  int get quantity;

  /// Create a copy of StockImportInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
