import 'package:flutter/material.dart';
import 'package:shopping_list/product.dart';

class EditProductDialogCustom extends StatelessWidget{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final Function(Product product) addProduct;

  EditProductDialogCustom({super.key, required this.addProduct});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit product'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(
                hintText: 'Enter the product name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _productPriceController,
              decoration: const InputDecoration(
                hintText: 'Enter the product price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            _productNameController.clear();
            _productPriceController.clear();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Accept'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              addProduct(
                Product(
                  name: _productNameController.text,
                  price: (double.parse(_productPriceController.text) * 100)
                      .round(),
                ),
              );
              _productNameController.clear();
              _productPriceController.clear();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
