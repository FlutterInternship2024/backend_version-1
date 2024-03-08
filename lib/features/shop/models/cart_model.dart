class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}

class CartModel {
  final List<CartItem> items;

  CartModel({required this.items});

  static double calculateCartTotal(CartModel cart) {
    return cart.items.map((e) => e.price).fold(0,
        (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  }
}
