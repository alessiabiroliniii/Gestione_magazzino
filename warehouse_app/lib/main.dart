import 'package:flutter/material.dart';
import 'package:warehouse_app/providers/category.dart';
import 'package:warehouse_app/providers/jwt.dart';
import 'package:warehouse_app/providers/product.dart';
import 'package:warehouse_app/providers/werehouse.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pcto",
      home: MultiProvider(
        providers: [
          Provider<ProductProvider>(
            create: (_) => ProductProvider(),
          ),
          Provider<CategoryProvider>(
            create: (_) => CategoryProvider(),
          ),
          Provider<WerehouseProvider>(
            create: (_) => WerehouseProvider(),
          ),
          Provider<JwtProvider>(
            create: (_) => JwtProvider(),
          ),
        ],
        child: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  final List<Widget> pages = [
    const HomePage(),
  ];

  final List<BottomNavigationBarItem> icons = [
    const BottomNavigationBarItem(icon: Icon(Icons.home)),
    const BottomNavigationBarItem(icon: Icon(Icons.camera)),
    const BottomNavigationBarItem(icon: Icon(Icons.info)),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: icons,
        onTap: (value) => setState(() => index = value),
      ),
      body: IndexedStack(index: index, children: pages),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
