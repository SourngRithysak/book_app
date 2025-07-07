import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConnected extends StatefulWidget {
  const ApiConnected({super.key});

  @override
  State<ApiConnected> createState() => _ApiStateConnected();
}

class _ApiStateConnected extends State<ApiConnected> {
  List<dynamic> userLists = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final url = Uri.parse('http://localhost:5000/api/user/getUserData');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          setState(() {
            userLists = data['payload'];
            errorMessage = '';
          });
        }
      } else if (response.statusCode == 204) {
        if (mounted) {
          setState(() {
            errorMessage = 'No user data found!';
          });
        }
      } else {
        if (mounted) {
          setState(() {
            errorMessage =
                'Failed to load data. Status: ${response.statusCode}';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = 'Failed to connect to API: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(errorMessage, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: fetchUsers, child: const Text("Retry")),
            ],
          ),
        ),
      );
    }

    if (userLists.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: userLists.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = userLists[index];
        return ListTile(
          leading: CircleAvatar(child: Text(user['id'].toString())),
          title: Text(user['name']),
          subtitle: Text(user['email']),
        );
      },
    );
  }
}
