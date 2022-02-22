import 'dart:math';

import 'package:flutter/material.dart';
import 'package:warehouse_app/providers/category.dart';
import 'package:warehouse_app/providers/werehouse.dart';
import 'package:warehouse_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider({
    required this.categoryProvider,
    required this.warehouseProvider,
  }) {
    products.addAll([
      Product(
        code: 1,
        title: "Titolo A",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 2,
        title: "Titolo B",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 3,
        title: "Titolo C",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 4,
        title: "Titolo D",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 5,
        title: "Titolo E",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 6,
        title: "Titolo F",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
      Product(
        code: 7,
        title: "Titolo G",
        date: DateTime.now(),
        price: Random().nextInt(10000).toDouble(),
        quantity: Random().nextInt(1000),
        category: categoryProvider
            .categories[Random().nextInt(categoryProvider.categories.length)],
        warehouse: warehouseProvider
            .warehouses[Random().nextInt(warehouseProvider.warehouses.length)],
      ),
    ]);
  }

  final WarehouseProvider warehouseProvider;
  final CategoryProvider categoryProvider;

  List<Product> products = [];

  Future<void> create(ProductCreateDTO product) async {
    await Future.delayed(const Duration(seconds: 1), () {
      products.add(Product(
        code: products.length + 1,
        title: product.title,
        date: product.date,
        price: product.price,
        quantity: product.quantity,
        category: product.category,
        warehouse: product.warehouse,
      ));
    });
    notifyListeners();
  }

  Future<void> delete(int code) async {
    await Future.delayed(const Duration(seconds: 1), () {
      products.removeWhere((element) => element.code == code);
    });
    notifyListeners();
  }

  Future<void> update(ProductReadAndUpdateDTO product) async {
    await Future.delayed(const Duration(seconds: 1), () {
      final Product tempProduct =
          products.where((element) => element.code == product.code).first;

      tempProduct.category = product.category;
      tempProduct.warehouse = product.warehouse;
      tempProduct.title = product.title;
      tempProduct.quantity = product.quantity;
      tempProduct.price = product.price;
      tempProduct.date = product.date;
    });
    notifyListeners();
  }
}
