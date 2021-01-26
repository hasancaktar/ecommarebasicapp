import 'package:ecommarebasicapp/model/marka.dart';

class ProductModel {


	String id;
	String kategori;
	String kategori_resim;
	List<Marka> marka;

	ProductModel.fromJsonMap(Map<String, dynamic> map):
				id = map["id"],
				kategori = map["kategori"],
				kategori_resim = map["kategori_resim"],
				marka = List<Marka>.from(map["marka"].map((it) => Marka.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['kategori'] = kategori;
		data['kategori_resim'] = kategori_resim;
		data['marka'] = marka != null ?
		this.marka.map((v) => v.toJson()).toList()
				: null;
		return data;
	}
}
