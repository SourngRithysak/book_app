// ignore_for_file: avoid_print

import 'dart:io';

class FileStorageService {
  // Order file path
  static String orderPath = "assets/images/order.txt";

  static Future<void> saveOrder(
    int bookId,
    double price,
    int qty,
    int discount,
  ) async {
    // reference a file
    final file = File(orderPath);
    // Check exist file
    bool isExistFile = await file.exists();
    if (!isExistFile) {
      file.create();
    }
    // bookId=1,price=2000,qty=1,discount=10
    String data = "bookId=$bookId,price=$price,qty=$qty,discount=$discount";
    file.openWrite(mode: FileMode.append).writeln(data);
  }

  static Future<List<String>> getOrders() async {
    final file = File(orderPath);
    // Check exist file
    bool isExistFile = await file.exists();
    if (!isExistFile) {
      file.create();
    }
    final lines = await file.readAsLines();
    print("Data : $lines");
    return lines;
  }
}