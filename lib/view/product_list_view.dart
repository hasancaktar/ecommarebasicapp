import 'dart:convert';

import 'package:ecommarebasicapp/model/ProductModel.dart';
import 'package:ecommarebasicapp/model/marka.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  String kategori, marka, fiyat, tarih;
  List allProducts;
  int adet=0;
  ProductListView({this.kategori,this.marka,this.fiyat,this.tarih,this.adet,this.allProducts});
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<Marka> allProductList;

  @override
  Widget build(BuildContext context) {
    print("Burası liste");
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(widget.marka),
                 // subtitle: Text(widget.fiyat),

                ),
              );
            },
            itemCount: widget.adet),
      ),
    );
  }

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
