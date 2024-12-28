import 'package:flutter/material.dart';
import '../models/customer.dart';

class CustomerProvider extends ChangeNotifier {
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  void addCustomer(Customer customer) {
    _customers.add(customer);
    notifyListeners();
  }

  void removeCustomer(int id) {
    _customers.removeWhere((customer) => customer.id == id);
    notifyListeners();
  }

  void updateCustomer(Customer updatedCustomer) {
    final index = _customers.indexWhere((customer) => customer.id == updatedCustomer.id);
    if (index != -1) {
      _customers[index] = updatedCustomer;
      notifyListeners();
    }
  }
}
