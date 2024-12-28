import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang di Happy Petshop!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              'Jelajahi berbagai produk, kelola pelanggan, dan pantau transaksi Anda dengan mudah.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildHomeCard(
                  context,
                  icon: Icons.pets,
                  title: 'Produk',
                  onTap: () {
                    Navigator.of(context).pushNamed('/products');
                  },
                ),
                _buildHomeCard(
                  context,
                  icon: Icons.people,
                  title: 'Pelanggan',
                  onTap: () {
                    Navigator.of(context).pushNamed('/customers');
                  },
                ),
                _buildHomeCard(
                  context,
                  icon: Icons.receipt,
                  title: 'Transaksi',
                  onTap: () {
                    Navigator.of(context).pushNamed('/transactions');
                  },
                ),
                _buildHomeCard(
                  context,
                  icon: Icons.map,
                  title: 'Peta',
                  onTap: () {
                    Navigator.of(context).pushNamed('/maps');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.green),
              const SizedBox(height: 10),
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
