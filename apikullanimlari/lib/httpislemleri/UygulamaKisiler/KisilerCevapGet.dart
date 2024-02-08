import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/Kisiler.dart';

class KisilerCevapGet{
  int success;
  List<KisilerGet> kisilerListesi;

  KisilerCevapGet(this.success, this.kisilerListesi);
  factory KisilerCevapGet.fromJson(Map<String, dynamic> json){
    var jsonArray=json["kisiler"] as List;
    List<KisilerGet> kisilerListesi=jsonArray.map((jsonArrayNesnesi) => KisilerGet.fromJson(jsonArrayNesnesi)).toList();
    return KisilerCevapGet(json["success"] as int, kisilerListesi);
  }
}