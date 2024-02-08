import 'dart:convert';

import 'package:apikullanimlari/httpislemleri/apiKullanimlari/KisilerCevapGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart'as http;
import 'package:apikullanimlari/httpislemleri/apiKullanimlari/Kisiler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrintBeginFrameBanner=false;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<KisilerGet> parseKisilerCevap(String cevap) {
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevapGet.fromJson(jsonVeri);
    List<KisilerGet> kisilerListesi = kisilerCevap.kisilerListesi;
    return kisilerListesi;
  }

  Future<List<KisilerGet>> tumKisiler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }
  Future<void> kisiSil(int kisi_id) async {
    var veri={"kisi_id":kisi_id.toString()};
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var cevap = await http.post(url,body:veri);
    print("Silme Cevap:${cevap.body}");
  }

   /*Future<void> kisileriGoster() async {
    var liste = await tumKisiler();
    for (var i in liste) {
      print("***************");
      print("Kisi id: ${i.kisi_id}");
      print("Kisi ad: ${i.kisi_ad}");
      print("Kisi tel ${i.kisi_tel}");
    }

  }*/
  @override
  void initState() {
    // TODO: implement initState
    kisiSil(552);
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Anasayfa"),
      ),
      body: Center(),







    );
  }
}
