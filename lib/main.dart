import 'package:act2/model/product.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Products(),
        child: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var codeCtrl = TextEditingController();
  var nameCtrl = TextEditingController();
  var priceCtrl = TextEditingController();
  // var config = Configuration.local([Product.schema]);
  // late RealmResults<Product> items;
  // late Realm realm;

  // void innitRealm() {
  //   realm = Realm(config);
  //   loadRealm();
  // }

  // void loadRealm() {
  //   items = realm.all<Product>();

  //   print(items);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   innitRealm();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, products, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('View Products'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
              IconButton(
                  onPressed: () => addDIalog(context), icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: ListView.builder(
              itemCount: products.items.length,
              itemBuilder: (context, index) {
                var item = products.items[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {},
                  direction: DismissDirection.startToEnd,
                  child: Card(
                    child: ListTile(
                      title: Text(item.name),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }

  void addDIalog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Products',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text('Item Code'),
                  TextField(
                    controller: codeCtrl,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Text('Item Name'),
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Text('Item Price'),
                  TextField(
                    controller: priceCtrl,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    codeCtrl.clear();
                    nameCtrl.clear();
                    priceCtrl.clear();
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    //loadRealm();
                    // realm.write(() {
                    //   var item = Product(codeCtrl.text, nameCtrl.text,
                    //       double.parse(priceCtrl.text));
                    //   Provider.of<Products>(context).update();
                    //   var result = realm.add(item);
                    // });
                    codeCtrl.clear();
                    nameCtrl.clear();
                    priceCtrl.clear();
                  },
                  child: Text('Add'))
            ],
          );
        });
  }
}
