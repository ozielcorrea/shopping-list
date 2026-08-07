import 'package:flutter/material.dart';
import 'package:shopping_list/product.dart';

class ListViewProductsCustom extends StatelessWidget{
  final List<Product> products;
  final Function(int index) deleteProduct;

  const ListViewProductsCustom({super.key, required this.products, required this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text((products[index].price / 100).toString()),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => deleteProduct(index),
          ),
        );
      },
    );
  }
}
