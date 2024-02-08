import 'dart:io';
import 'dart:convert';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler//KisilerCevapGet.dart';
import 'package:http/http.dart'as http;

import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/KisiDetay.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/KisiKayit.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaKisiler/Kisiler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home:Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyormu=false;
  String aramaKelimesi="";

  List<KisilerGet> parseKisilerCevap(String cevap) {
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevapGet.fromJson(jsonVeri);
    List<KisilerGet> kisilerListesi = kisilerCevap.kisilerListesi;
    return kisilerListesi;
  }

  Future<List<KisilerGet>> kisilerAra(String aramaKelimesi) async {
    var veri={"kisi_ad":aramaKelimesi};
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    var cevap = await http.post(url,body:veri);
    return parseKisilerCevap(cevap.body);
  }





  Future<List<KisilerGet>> tumKisilerGoster() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);

  }

  Future<bool> uygulamayiKapat() async{
    await exit(0);

  }
  Future<void> kisiSil(int kisi_id) async {
    var veri={"kisi_id":kisi_id.toString()};
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var cevap = await http.post(url,body:veri);
    print("Silme Cevap:${cevap.body}");
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              uygulamayiKapat();
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          aramaYapiliyormu ? IconButton(
          onPressed: (){
          setState(() {
            aramaYapiliyormu=false;
            aramaKelimesi="";
          });

          },
              icon: Icon(Icons.cancel))

              :IconButton(
              onPressed: (){
                setState(() {
                  aramaYapiliyormu=true;
                });
              },
              icon: Icon(Icons.search)),
        ],
        backgroundColor: Colors.red,
        title: aramaYapiliyormu ? TextField(
          decoration: InputDecoration(hintText: "Aramak istediğiniz şeyi yazın.."),
          onChanged: (aramasonucu){
            print("Arama sonucu: $aramasonucu");
            setState(() {
              aramaKelimesi=aramasonucu;
            });

          },
        )
            : Text("Kişiler Uygulaması",style: TextStyle(color: Colors.white),),
      ),
      body: WillPopScope(

        onWillPop: uygulamayiKapat,
        child: FutureBuilder<List<KisilerGet>>(
    future: aramaYapiliyormu?  kisilerAra((aramaKelimesi))  :tumKisilerGoster(),
    builder: (context,snapshot){
        if(snapshot.hasData){
          var kisilerListesi=snapshot.data;
          return ListView.builder(
            itemCount: kisilerListesi!.length,
              itemBuilder: (context,indeks){
              var kisi=kisilerListesi[indeks];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetay(kisi: kisi)));
                },
                child: Card(



                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,



                      children: [
                        Text(kisi.kisi_ad,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(kisi.kisi_tel.toString()),
                        IconButton(
                          onPressed: (){
                            kisiSil(int.parse(kisi.kisi_id));
                          },
                          icon: Icon(Icons.delete,color: Colors.grey),
                        )

                      ],
                    ),
                  ),
                ),
              );
              }
          );

        }else{
          return Center();
        }

    }
    ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => KisiKayit()));

        },
        tooltip: 'Kişi Ekle',
        child: Icon(Icons.add),
      ),



    );




  }
}