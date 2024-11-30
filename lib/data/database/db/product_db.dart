import 'package:drift/drift.dart';
import 'package:flutter_nusacodes_2/data/database/app_database.dart';
import 'package:flutter_nusacodes_2/models/product_model.dart';

class ProductDb {

  late final AppDatabase db;

  ProductDb(this.db);

  Future<void> addProduct(ProductModel data) async {
    final product = ProductCompanion(
      name: Value(data.name ?? ''),
      price: Value(data.harga ?? 0),
    );

    await db.into(db.product).insert(product);
  }

  Future<List<ProductModel>> getAllProducts() async {
    final data = await db.select(db.product).get();
    return data.map((e) => ProductModel(
      id: e.id,
      name: e.name,
      harga: e.price,
    )).toList();
  }

  Future<void> updateProduct(ProductModel data) async {
    final product = ProductCompanion(
      name: Value(data.name ?? ''),
      price: Value(data.harga ?? 0),
    );
    await (db.update(db.product)
          ..where((tbl) => tbl.id.equals(data.id!)))
          .write(product);
  }

  Future<void> deleteProduct(int id) async {
    await (db.delete(db.product)
          ..where((tbl) => tbl.id.equals(id)))
          .go();
  }
 
}