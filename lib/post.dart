import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String res = '';
void login(String email, String password) async {
  try {
    var response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/users/"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);

      print(data);
      print('Login successful');
    } else {
      print('Login failed');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            // Text(res),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


