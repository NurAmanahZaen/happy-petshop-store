import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:happy_petshop/providers/cart_provider.dart';
import 'package:happy_petshop/models/product.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>>? selectedProducts = ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>?;
    final cartProvider = Provider.of<CartProvider>(context);

    if (selectedProducts == null || selectedProducts.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text('Tidak ada produk yang dipilih untuk checkout.'),
        ),
      );
    }

    double totalPrice = 0.0;
    for (var item in selectedProducts) {
      totalPrice += item['product'].price * item['quantity'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.green, // Warna tema untuk checkout
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produk yang Dipilih',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedProducts.length,
                itemBuilder: (context, index) {
                  final product = selectedProducts[index]['product'] as Product;
                  final quantity = selectedProducts[index]['quantity'] as int;
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/logoproduk.jpg', // Ganti dengan URL gambar atau gambar default
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text('${product.description}\nJumlah: $quantity'),
                      trailing: Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk menyelesaikan pembelian
                for (var item in selectedProducts) {
                  cartProvider.removeFromCart(item['product']);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pembelian berhasil!')),
                );
                Navigator.of(context).pushNamedAndRemoveUntil('/user_home', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Selesaikan Pembelian'),
            ),
          ],
        ),
      ),
    );
  }
}
