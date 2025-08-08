import 'package:flutter/material.dart';
import 'package:homeworks_01/models/order.dart';
import 'package:homeworks_01/services/order_service.dart';

class CartProvider with ChangeNotifier {

  Future<List<Order>> getOrders() async {
    final orderService = OrderService.instance;
    return await orderService.getOrders();
  }

  Future<void> insertOrder(Order order) async {
    final orderService = OrderService.instance;
    await orderService.insertOrder(order);
    notifyListeners();
  }

  Future<void> deleteOrder(int id) async {
    final orderService = OrderService.instance;
    await orderService.deleteOrder(id);
    notifyListeners();
  }

}