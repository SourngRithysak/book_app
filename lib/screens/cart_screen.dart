import 'package:flutter/material.dart';
import 'package:homeworks_01/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/models/order.dart';

class CartScreen extends StatefulWidget{
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartStateScreen();
}

class _CartStateScreen extends State<CartScreen>{

  final cartController = Get.put(CartController());
  List<Order> orders = [];
  bool _isLoading = false;

  @override
  void initState(){
    super.initState();
    _loadOrder();
  }

  Future<void> _loadOrder() async {
    setState(() {
      _isLoading = true;
    });
    cartController.getOrders().then((value) {
      setState(() {
        orders = value;
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        elevation: 2,
        centerTitle: true,
        actions: [
          Icon(Icons.search)
        ],
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = orders[index];
          print("Order : $order");

          return Dismissible(
              key: ValueKey(order.id),
              child: Card(
                elevation: 0.5,
                child: ListTile(
                  leading: Icon(Icons.shopping_cart_outlined),
                  title: Text("${order.productId}"),
                  subtitle: Text("Order"),
                  trailing: Icon(Icons.delete_outline),
                ),
              ),
            confirmDismiss: (direction) async {
                final alert = AlertDialog(
                  title: Icon(Icons.delete_outline, size: 30, color: Colors.redAccent,),
                  content: Text("Are you sure you want to delete this order?"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false),
                        child: Text("No")
                    ),
                    TextButton(onPressed: () {
                      cartController.deleteOrder(order.id!);
                      _loadOrder();
                      Navigator.pop(context, false);
                    }, child: Text("Yes"))
                  ],
                );
                showDialog(context: context, builder: (context) => alert);
            },
          );
        },
      ),
      // body: FutureBuilder(
      //   future: FileStorageService.getOrders(),
      //   builder: (
      //     BuildContext context,
      //     AsyncSnapshot<List<String>> asyncSnapshot,
      //   ){
      //   // loading
      //   if(asyncSnapshot.connectionState == ConnectionState.waiting){
      //     return Center(child: CircularProgressIndicator(),);
      //   }
      //
      //   // error
      //   if(asyncSnapshot.hasError){
      //     return Center(child: Text("${asyncSnapshot.error}"),);
      //   }
      //
      //   // No data
      //   if(!asyncSnapshot.hasData){
      //     return Center(child: Text("No data"),);
      //   }
      //
      //   List<dynamic> orders = asyncSnapshot.data as List;
      //
      //   return ListView.builder(itemCount: orders.length,
      //   itemBuilder: (BuildContext context, int index){
      //     String order = orders[index];
      //     return Card(
      //       elevation: 0.5,
      //       child: ListTile(
      //         leading: Icon(Icons.shopping_cart),
      //         title: Text(order),
      //         subtitle: Text("Order $index"),
      //         trailing: Icon(Icons.details),
      //       ),
      //     );
      //   },
      //   );
      // },
      // ),
    );
  }
}