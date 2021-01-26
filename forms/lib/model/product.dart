class Product {
  final String name;
  final int amount;
  final double value;

  Product(
    this.name,
    this.amount,
    this.value,
  );

  @override
  String toString() {
    return 'Product{name: $name, amount: $amount, value: $value}';
  }
}
