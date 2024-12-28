import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:happy_petshop/providers/cart_provider.dart';
import 'package:happy_petshop/models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.blue, // Warna tema untuk user
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produk dalam Keranjang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  final product = cartItem['product'] as Product;
                  final quantity = cartItem['quantity'] as int;
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/logoproduk.jpg', 
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text('${product.description}\nJumlah: $quantity'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _selectedProducts.contains(cartItem),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedProducts.add(cartItem);
                                } else {
                                  _selectedProducts.remove(cartItem);
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              cartProvider.removeFromCart(product);
                              setState(() {
                                _selectedProducts.remove(cartItem);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedProducts.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).pushNamed('/checkout', arguments: _selectedProducts);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
