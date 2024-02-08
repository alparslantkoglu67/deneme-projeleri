import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/mainKisiler.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class KisiKayit extends StatefulWidget {


  @override
  State<KisiKayit> createState() => _KisiKayitState();
}

class _KisiKayitState extends State<KisiKayit> {
  var tfKisiAdi=TextEditingController();
  var tfKisiTel=TextEditingController();

  Future<void> kisiEkle(String kisi_ad,String kisi_tel) async {
    var veri={"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var cevap = await http.post(url,body:veri);
    print("Ekle Cevap:${cevap.body}");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Kişi Kayıt",style: TextStyle(color: Colors.white)),
    ),
    body:Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 50,right: 50),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Kisi Ad"),
          controller: tfKisiAdi,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Kisi Tel"),
          controller: tfKisiTel,
        ),
      ],
      ),
    ),
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          kisiEkle(tfKisiAdi.text, tfKisiTel.text);


        },
        tooltip: 'Kişi Kayıt',
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}
