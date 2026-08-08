import 'package:flutter/material.dart';
import 'package:shopping_list/edit_product_dialog_custom.dart';
import 'package:shopping_list/list_view_products_custom.dart';
import 'package:shopping_list/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  Future<void> _showEditProductDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return EditProductDialogCustom(
          addProduct: _addProduct,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListViewProductsCustom(
        products: _products,
        deleteProduct: _deleteProduct,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showEditProductDialog,
        tooltip: 'Add product',
        child: const Icon(Icons.add),
      ),
    );
  }
}
