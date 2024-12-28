import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final List<Map<String, dynamic>> _customers = [
    {'id': 1, 'name': 'Pelanggan 1', 'email': 'pelanggan1@example.com'},
    {'id': 2, 'name': 'Pelanggan 2', 'email': 'pelanggan2@example.com'},
  ];

  void _addCustomer() {
    setState(() {
      _customers.add({
        'id': _customers.length + 1,
        'name': 'Pelanggan ${_customers.length + 1}',
        'email': 'pelanggan${_customers.length + 1}@example.com',
      });
    });
  }

  void _updateCustomer(int id, String name, String email) {
    setState(() {
      final index = _customers.indexWhere((customer) => customer['id'] == id);
      if (index != -1) {
        _customers[index]['name'] = name;
        _customers[index]['email'] = email;
      }
    });
  }

  void _deleteCustomer(int id) {
    setState(() {
      _customers.removeWhere((customer) => customer['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pelanggan'),
        backgroundColor: Colors.green, // Warna tema untuk admin
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _addCustomer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Tambah Pelanggan'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _customers.length,
                itemBuilder: (context, index) {
                  final customer = _customers[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(customer['name']),
                      subtitle: Text(customer['email']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Aksi untuk mengedit pelanggan
                              _updateCustomer(customer['id'], 'Updated ${customer['name']}', 'Updated ${customer['email']}');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Aksi untuk menghapus pelanggan
                              _deleteCustomer(customer['id']);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
