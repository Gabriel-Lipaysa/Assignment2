// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Product(
    String prodCode,
    String name,
    double price, {
    bool isFav = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Product>({
        'isFav': false,
      });
    }
    RealmObjectBase.set(this, 'prodCode', prodCode);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'isFav', isFav);
  }

  Product._();

  @override
  String get prodCode =>
      RealmObjectBase.get<String>(this, 'prodCode') as String;
  @override
  set prodCode(String value) => RealmObjectBase.set(this, 'prodCode', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  bool get isFav => RealmObjectBase.get<bool>(this, 'isFav') as bool;
  @override
  set isFav(bool value) => RealmObjectBase.set(this, 'isFav', value);

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObjectBase.getChanges<Product>(this);

  @override
  Stream<RealmObjectChanges<Product>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Product>(this, keyPaths);

  @override
  Product freeze() => RealmObjectBase.freezeObject<Product>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'prodCode': prodCode.toEJson(),
      'name': name.toEJson(),
      'price': price.toEJson(),
      'isFav': isFav.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'prodCode': EJsonValue prodCode,
        'name': EJsonValue name,
        'price': EJsonValue price,
      } =>
        Product(
          fromEJson(prodCode),
          fromEJson(name),
          fromEJson(price),
          isFav: fromEJson(ejson['isFav'], defaultValue: false),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('prodCode', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('isFav', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
