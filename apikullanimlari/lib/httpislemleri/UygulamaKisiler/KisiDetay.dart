import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/Kisiler.dart';

import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/mainKisiler.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class KisiDetay extends StatefulWidget {
  KisilerGet kisi;


  KisiDetay({required this.kisi});

  @override
  State<KisiDetay> createState() => _KisiDetayState();
}

class _KisiDetayState extends State<KisiDetay> {
  var tfKisiAdi=TextEditingController();
  var tfKisiTel=TextEditingController();



  Future<void> kisiGuncelle(int kisi_id,String kisi_ad,String kisi_tel) async {
    var veri={"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var cevap = await http.post(url,body:veri);
    print("Güncelle Cevap:${cevap.body}");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var kisi=widget.kisi;
    tfKisiAdi.text=kisi.kisi_ad;
    tfKisiTel.text=kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

        backgroundColor: Colors.red,
        title: Text("Kişi Detay",style: TextStyle(color: Colors.white)),
    ),
    body:Center(
      child: Padding(
        padding: const EdgeInsets.only(left:50,right: 50),
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
          kisiGuncelle(int.parse(widget.kisi.kisi_id), tfKisiAdi.text, tfKisiTel.text);


        },
        tooltip: 'Kişi Güncelle',
        icon: Icon(Icons.update),
        label: Text("Güncelle"),
      ),
    );
  }
}
