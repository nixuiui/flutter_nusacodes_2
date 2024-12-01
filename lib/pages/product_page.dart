import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/data/database/db/product_db.dart';
import 'package:flutter_nusacodes_2/helpers/injector.dart';
import 'package:flutter_nusacodes_2/models/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final productDb = getIt.get<ProductDb>();

  final products = <Product>[];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final result = await productDb.getAllProducts();
    setState(() {
      products.clear();
      products.addAll(result);
    });
  }

  void addData() async {
    await productDb.addProduct(Product(
      name: "Product ${products.length+1}",
      price: 1000000,
    ));
    getData();
  }

  void deleteData(int id) async {
    await productDb.deleteProduct(id);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => const Divider(), 
        itemBuilder: (context, index) => ListTile(
          title: Text(products[index].name ?? ''),
          subtitle: Text(products[index].price?.toString() ?? ''),
          trailing: IconButton(
            onPressed: () => deleteData(products[index].id!), 
            icon: const Icon(Icons.delete)
          ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addData,
        child: const Icon(Icons.add),
      ),
    );
  }
}