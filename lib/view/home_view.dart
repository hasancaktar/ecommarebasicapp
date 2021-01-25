import 'dart:convert';

import 'package:ecommarebasicapp/view/product_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'product_list_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List tumList;

  @override
  void initState() {
    print("init çalıştı");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: Text("KATEGORİLER"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => KategoriesView()));
                }),
            RaisedButton(
                child: Text("LİSTELER"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProductListView()));
                })
          ],
        ),
      ),
    );
  }
}
