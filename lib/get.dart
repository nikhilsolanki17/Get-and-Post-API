import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetApi extends StatefulWidget {
  @override
  _GetApiState createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
late Future<List<dynamic>> futureData;
Future<List<dynamic>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return fetchData();
  }
}
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API '),
      ),
      body: Center(
        child: FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index]['title'],
                            style: TextStyle(fontSize: 18)),
                        subtitle: Text(snapshot.data![index]['body'],
                            style: TextStyle(fontSize: 10)),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
