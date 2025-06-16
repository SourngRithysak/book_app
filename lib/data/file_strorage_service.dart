import 'dart:io';

class FileStrorageService {

  // Order file part
  static String orderPart = "assets/data/order.txt";

  // Book id=1,Price=2000,qty=1,discount=10
  static void saveOrder(int bookid, double price, int qty, int discount) async {

    // reference file
    final file = File(orderPart);
    bool isExistFile = await file.exists();

    if(!isExistFile){
      file.create();
    }

    String data = "bookid=$bookid, price=$price, qty=$qty, discount=$discount";

    file.openWrite(mode: FileMode.append).writeln(data);
  }

  static Future<List<String>> getOrder() async {
    final file = File(orderPart);

    // Check exist file
    bool isExistFile = await file.exists();
    if(!isExistFile){
      file.create();
    }

    final lines = await file.readAsLines();
    print("Data: $lines");
    return lines;

  }

}