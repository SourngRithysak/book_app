import 'package:flutter/material.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/data/file_strorage_service.dart';
import 'package:homeworks_01/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {
  String? fullName;

  int? _cartItemCount = 0;

  @override
  void initState() {
    super.initState();
    loadUser();
    _loadOrder();
  }

  Future<void> _loadOrder() async {
    List<String> orders = await FileStrorageService.getOrder();
    setState(() {
      _cartItemCount = orders.length;
    });
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString(AuthSharePref.FULL_NAME);
    String? email = prefs.getString("email");

    String? subUserName = email != null ? email.split("@")[0] : null;

    setState(() {
      fullName = username ?? subUserName ?? "Guest";
    });

    print("Üser data loaded");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appbar(context), body: _body);
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // SizedBox(
          //   child: Text(
          //     "Hi, ",
          //     style: TextStyle(color: Colors.redAccent, fontSize: 25,),
          //   ),
          // ),
          // SizedBox(width: 10),
          // SizedBox(
          //   child: Text(
          //     "$fullName",
          //     style: TextStyle(color: Colors.redAccent, fontSize: 25, fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(
            child: IconButton(onPressed: () {

            }, 
            icon: Icon(Icons.menu, color: Colors.redAccent, size: 35,)),
          )
        ],
      ),
      elevation: 2,
      actions: [
        badges.Badge(
          badgeContent: Text(
            "$_cartItemCount",
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.shopping_cart, size: 28, color: Colors.redAccent,),
        ),
        SizedBox(width: 5,),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.redAccent,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget get _body {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _welcomeWidget,
          _searchWidget,
          _topTitleWidget,
          _topProductListWidget,
        ],
      ),
    );
  }

  Widget get _slides {
    return Image.asset(
      "assets/images/khmer_book.png",
      height: 150,
      fit: BoxFit.cover,
    );
  }

  Widget get _welcomeWidget {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 20, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, $fullName",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          Text("What do you want to read today?", style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }

  Widget get _searchWidget {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [IconButton(onPressed: () {}, icon: Image.asset("assets/images/voice_over.png", fit: BoxFit.contain, width: 30,),), IconButton(onPressed: () {}, icon: Image.asset("assets/images/slider_icon.png", width: 30, fit: BoxFit.contain,)), SizedBox(width: 2,)],
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: "Search...",
        ),
      ),
    );
  }

  Widget get _topTitleWidget {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ថ្មីៗ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),
          Icon(Icons.navigate_next, color: Colors.grey,),
        ],
      ),
    );
  }

  Widget get _topProductListWidget {
    final cartItems =
        List.generate(10, (i) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Image.asset("assets/images/khmer_book.png", height: 200),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          FileStrorageService.saveOrder(i, 21.99, 1, 20);

                          final alert = AlertDialog(
                            title: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 100,
                            ),
                            content: Text("Order saved successfully"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"),
                              ),
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (context) => alert,
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList();

    return SizedBox(
      height: 258,
      child: ListView(scrollDirection: Axis.horizontal, children: cartItems),
    );
  }
}
