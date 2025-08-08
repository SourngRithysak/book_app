class Product{

  int? id;
  String? name;
  String? description;
  double? price;
  int? discount;
  int? rate;

  Product({
    this.id, this.name, this.description,
    this.price, this.discount, this.rate
});

  Map<String, dynamic> toMap() =>
      {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'rate': rate
      };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map['id'],
    name: map['name'],
    description: map['description'],
    price: map['price'],
    discount: map['discount'],
    rate: map['rate']
  );
}