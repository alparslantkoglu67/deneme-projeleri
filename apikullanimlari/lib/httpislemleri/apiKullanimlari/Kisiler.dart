class KisilerGet{
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  KisilerGet(this.kisi_id, this.kisi_ad, this.kisi_tel);
  factory KisilerGet.fromJson(Map<String,dynamic> json){
    return KisilerGet(json["kisi_id"] as String, json["kisi_ad"] as String, json["kisi_tel"] as String);
  }
}