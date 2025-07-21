class CartItem {
  final String name;
  final int price;
  int quantity;
  String imgpath;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imgpath,
  });
}

// 전역 상태 (예시)
List<CartItem> cartItems = [];
