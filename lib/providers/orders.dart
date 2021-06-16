import 'package:flutter/foundation.dart';

import 'cart.dart';

class OrderItem {
  final String orderId;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.amount,
    required this.orderId,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    //print(cartProduct);
    _orders.insert(
        0,
        OrderItem(
          orderId: DateTime.now().toString(),
          dateTime: DateTime.now(),
          products: cartProduct,
          amount: total,
        ));

    //print(_orders);

    notifyListeners();
  }
}
