class Customer {
  final int id;
  final String name;
  final String contact;

  Customer({
    required this.id,
    required this.name,
    required this.contact,
  });

  // Convert Customer to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
    };
  }

  // Create Customer from Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      contact: map['contact'],
    );
  }
}
