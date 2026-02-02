import 'package:flutter/material.dart';
import 'product_card.dart';

class Product {
  final String name;
  final String price;
  final String imageUrl;
  const Product({required this.name, required this.price, required this.imageUrl});
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  final List<Product> products = const [
    Product(
      name: 'iPhone 15 Pro',
      price: '32.000.000đ',
      imageUrl:
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-model-unselect-gallery-1-202309?wid=5120&hei=2880&fmt=jpeg&qlt=80&.v=1692923778665',
    ),
    Product(
      name: 'Samsung Galaxy S24',
      price: '25.000.000đ',
      imageUrl: 'https://cdn.tgdd.vn/Products/Images/42/305659/samsung-galaxy-s24-ultra-grey-thumb-600x600.jpg',
    ),
    Product(
      name: 'MacBook Air M3',
      price: '28.000.000đ',
      imageUrl: 'https://cdn.tgdd.vn/Products/Images/44/322927/macbook-air-m3-2024-600x600.jpg',
    ),
    Product(
      name: 'iPad Pro 2024',
      price: '30.000.000đ',
      imageUrl: 'https://cdn.tgdd.vn/Products/Images/522/322928/ipad-pro-m4-2024-600x600.jpg',
    ),
    Product(
      name: 'Apple Watch Series 9',
      price: '12.000.000đ',
      imageUrl: 'https://cdn.tgdd.vn/Products/Images/7077/317509/apple-watch-s9-41mm-vien-nhom-day-silicone-hong-thumb-600x600.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              // ignore: avoid_print
              print('Tapped: [1m${product.name}[0m');
            },
            child: ProductCard(
              name: product.name,
              price: product.price,
              imageUrl: product.imageUrl,
            ),
          );
        },
      ),
    );
  }
}
