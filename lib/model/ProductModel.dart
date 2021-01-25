import 'package:ecommarebasicapp/model/marka.dart';

class ProductModel {

  String id;
  String kategori;
  List<Marka> marka;

	ProductModel.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		kategori = map["kategori"],
		marka = List<Marka>.from(map["marka"].map((it) => Marka.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['kategori'] = kategori;
		data['marka'] = marka != null ? 
			this.marka.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
