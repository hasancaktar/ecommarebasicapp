import 'dart:convert';
import 'dart:ui';

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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              Colors.red.shade100,
              Colors.orange.shade100,
              Colors.pink.shade100,
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "HOŞ GELDİNİZ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.red)),
                      child: Text(
                        "MAĞAZAYI ZİYARET ET",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.brown,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => KategoriesView()));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
