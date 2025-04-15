import '../../../home/data/models/furniture_model.dart';

class CartItem {
  final FurnitureModel furniture;
  int quantity;

  CartItem({required this.furniture, this.quantity = 1});
}

class CartService {
  // This is a simple list for storing the cart items.
  static List<CartItem> cartItems = [];

  // Add cart item
  static void addItem(CartItem item) {

    cartItems.add(item);
    
  }

  // Remove cart item
  static void removeItem(CartItem item) {
    cartItems.remove(item);
  }

  // Get all cart items
  static List<CartItem> getCartItems() {
    return cartItems;
  }
}
