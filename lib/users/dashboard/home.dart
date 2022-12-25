import 'package:aides_help/api_connection/api_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/book.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future getData() async {
    final response = await http.get(Uri.parse(API.books));
    if (response.statusCode == 200) {
      String jsonData = response.body.toString();
      var responsebody = jsonDecode(jsonData);
      return responsebody;
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Books"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  List list = snapshot.data;
                  return Text(snapshot.data![i]['typebook']);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
