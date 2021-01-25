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
  List<Marka> alllist;

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

                        print(index);
                        print("çuçu" +
                            allProductCategories[index]
                                .marka
                                .length
                                .toString());
                        setState(() {
                          int adet = allProductCategories[index].marka.length;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductListView(
                                        marka: allProductCategories[index]
                                            .marka[index]
                                            .marka,
                                        adet: adet,
                                      )));
                        });
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
