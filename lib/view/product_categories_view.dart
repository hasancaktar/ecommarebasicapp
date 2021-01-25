import 'dart:convert';

import 'package:ecommarebasicapp/model/ProductModel.dart';
import 'package:ecommarebasicapp/model/marka.dart';
import 'package:ecommarebasicapp/view/product_list_view.dart';
import 'package:flutter/material.dart';

class KategoriesView extends StatefulWidget {
  @override
  _KategoriesViewState createState() => _KategoriesViewState();
}

class _KategoriesViewState extends State<KategoriesView> {
  List<ProductModel> allProductCategories;

  List<String> ProductMarkaList = [];
  List<String> ProductFiyatList = [];
  List<String> ProductTarihList = [];

  String kategori, marka, fiyat, tarih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allProductCategories = snapshot.data;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        UrunleriListeleme(index, context);
                      },
                      child: Card(
                        child: Center(
                          child: GridTile(
                            child: Text(allProductCategories[index].kategori),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: allProductCategories.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  void UrunleriListeleme(int index, BuildContext context) {
     int adet = allProductCategories[index].marka.length;
    ProductMarkaList.clear();
    for (int i = 0;
        i < allProductCategories[index].marka.length;
        i++) {
      ProductMarkaList.add(
          allProductCategories[index].marka[i].marka);
      ProductFiyatList.add(
          allProductCategories[index].marka[i].fiyat);
      ProductTarihList.add(
          allProductCategories[index].marka[i].tarih);
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ProductListView(
                  ProductFiyatList: ProductFiyatList,
                  ProductTarihList: ProductTarihList,
                  ProductMarkaList: ProductMarkaList,
                  adet: adet,
                )));
  }

  Future<List<ProductModel>> veriKaynaginiOku() async {
    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/product.json");
    List<ProductModel> urunListesi = (json.decode(gelenJson) as List)
        .map((mapYapisi) => ProductModel.fromJsonMap(mapYapisi))
        .toList();

    for (int i = 0; i < urunListesi.length; i++) {
      print("Urunler: " + urunListesi[i].kategori.toString());
    }
    return urunListesi;
  }
}
