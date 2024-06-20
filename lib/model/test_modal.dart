class TestModel {
  final String id;
  final List<String> labIds;
  final String name;
  final String description;
  final int price;

  TestModel({
    required this.id,
    required this.labIds,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'labIds': labIds,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id'],
      labIds: List<String>.from(map['labIds'] ?? []),
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
}
