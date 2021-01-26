import 'dart:convert';

import 'package:ecommarebasicapp/model/ProductModel.dart';
import 'package:ecommarebasicapp/model/marka.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  List<String> ProductMarkaList = [];
  List<String> ProductFiyatList = [];
  List<String> ProductResim = [];
  List<String> ProductTarihList = [];
  String katergori;

  int adet;

  ProductListView(
      {this.adet,
      this.katergori,
      this.ProductResim,
      this.ProductMarkaList,
      this.ProductFiyatList,
      this.ProductTarihList});

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    print("Burası liste");
    return Scaffold(
      appBar: AppBar(actions: [IconButton(icon: Icon(Icons.shopping_basket), onPressed: (){

      })],
        title: Center(child: Text(widget.katergori)),
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card( elevation: 8,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        widget.ProductResim[index],
                      ),
                      flex: 4,
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.2),
                        child: Column(
                          children: [
                            Text(
                              widget.ProductMarkaList[index],
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(widget.ProductFiyatList[index] + " TL",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: widget.adet),
      ),
    );
  }
/*
  ListTile(
  title: Text(widget.ProductMarkaList[index]),
  subtitle: Text(widget.ProductFiyatList[index]),
  )*/
// Future<List<Marka>> veriKaynaginiOku() async {
//   var gelenJson = await DefaultAssetBundle.of(context)
//       .loadString("assets/data/product.json");
//   List<Marka> urunListesi = (json.decode(gelenJson) as List)
//       .map((mapYapisi) => Marka.fromJsonMap(mapYapisi))
//       .toList();
//
//   for (int i = 0; i < urunListesi.length; i++) {
//     print("Urunler" + urunListesi[i].toString());
//   }
//   return urunListesi;
// }
}
