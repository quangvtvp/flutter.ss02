import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
  });
}

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
      id: 1,
      name: 'Bánh mì',
      price: 15000,
      description: 'Bánh mì Việt Nam thơm ngon',
      quantity: 20,
    ),
    Product(
      id: 2,
      name: 'Sữa tươi',
      price: 12000,
      description: 'Sữa tươi nguyên chất',
      quantity: 35,
    ),
    Product(
      id: 3,
      name: 'Cà phê',
      price: 25000,
      description: 'Cà phê đen đá',
      quantity: 15,
    ),
    Product(
      id: 4,
      name: 'Trà sữa',
      price: 30000,
      description: 'Trà sữa trân châu',
      quantity: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách sản phẩm')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Giá: ${product.price.toStringAsFixed(0)} VNĐ'),
                  Text('Mô tả: ${product.description}'),
                  Text('Số lượng: ${product.quantity}'),
                ],
              ),
              leading: CircleAvatar(child: Text(product.id.toString())),
            ),
          );
        },
      ),
    );
  }
}
