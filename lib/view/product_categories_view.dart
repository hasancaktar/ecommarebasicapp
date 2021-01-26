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
  List<String> ProductResim = [];

  String kategori, marka, fiyat, tarih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Test"),
              accountEmail: Text("test@test.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("T"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Anasayfa",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Profil",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.info_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Hakkında",style: TextStyle(fontSize: 20),)
                ],
              ),
            )


          ],
        ),
      ),
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.info), onPressed: () {})],
        title: Center(child: Text("Kategoriler")),
      ),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allProductCategories = snapshot.data;
              return GridView.builder(
                  padding: EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        UrunleriListeleme(index, context);
                      },
                      child: Stack(
                        children: [
                          Card(
                            elevation: 15,
                            child: Center(
                              child: GridTile(
                                child: Opacity(
                                    opacity: 0.4,
                                    child: Image.network(
                                        allProductCategories[index]
                                            .kategori_resim)),
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                allProductCategories[index].kategori,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              )),
                        ],
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
    ProductFiyatList.clear();
    ProductTarihList.clear();
    ProductResim.clear();
    for (int i = 0; i < allProductCategories[index].marka.length; i++) {
      ProductMarkaList.add(allProductCategories[index].marka[i].marka);
      ProductFiyatList.add(allProductCategories[index].marka[i].fiyat);
      ProductTarihList.add(allProductCategories[index].marka[i].tarih);
      ProductResim.add(allProductCategories[index].marka[i].resim);
    }
    kategori = allProductCategories[index].kategori;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ProductListView(
                  ProductFiyatList: ProductFiyatList,
                  ProductTarihList: ProductTarihList,
                  ProductMarkaList: ProductMarkaList,
                  ProductResim: ProductResim,
                  katergori: kategori,
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
