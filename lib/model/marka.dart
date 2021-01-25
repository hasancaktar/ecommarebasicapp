
class Marka {

  String marka;
  String fiyat;
  String tarih;

	Marka.fromJsonMap(Map<String, dynamic> map): 
		marka = map["marka"],
		fiyat = map["fiyat"],
		tarih = map["tarih"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['marka'] = marka;
		data['fiyat'] = fiyat;
		data['tarih'] = tarih;
		return data;
	}
}
