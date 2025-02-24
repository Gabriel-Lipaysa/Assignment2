import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
part 'product.realm.dart';

@RealmModel()
class _Product {
  late String prodCode;
  late String name;
  late double price;
  bool isFav = false;
}

class Products extends ChangeNotifier {
  var config = Configuration.local([Product.schema]);

  late Realm realm = Realm(config);

  RealmResults<Product> get items => realm.all<Product>();

  void add(Product prod) {
    realm.write(() {
      var results = realm.add(prod);
      print(results);
    });

    notifyListeners();
  }
}
