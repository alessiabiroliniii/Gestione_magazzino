import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_app/providers/product.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gestione magazzino"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.house)),
              Tab(icon: Icon(Icons.category)),
              Tab(icon: Icon(Icons.archive)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductAddView(),
            CategoryAddView(),
            WarehouseAddView(),
          ],
        ),
      ),
    );
  }
}

class ProductAddView extends StatefulWidget {
  const ProductAddView({Key? key}) : super(key: key);

  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titoloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                TextFormField(
                  controller: titoloController,
                  decoration: InputDecoration(
                    labelText: "Titolo",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Inserisci qualcosa";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CategoryAddView extends StatefulWidget {
  const CategoryAddView({Key? key}) : super(key: key);

  @override
  State<CategoryAddView> createState() => _CategoryAddViewState();
}

class _CategoryAddViewState extends State<CategoryAddView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WarehouseAddView extends StatefulWidget {
  const WarehouseAddView({Key? key}) : super(key: key);

  @override
  State<WarehouseAddView> createState() => _WarehouseAddViewState();
}

class _WarehouseAddViewState extends State<WarehouseAddView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
