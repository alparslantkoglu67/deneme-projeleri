import 'package:apikullanimlari/httpislemleri/UygulamaSozluk/KelimelerCevap.dart';
import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaSozluk/DetaySayfa.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaSozluk/Kelimeler.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;


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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
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

  List<Kelimeler> parseKelimelerCevap(String cevap) {
    var jsonVeri = json.decode(cevap);
    var kelimelerCevap = KelimelerCevap.fromJson(jsonVeri);
    List<Kelimeler> kelimelerListesi = kelimelerCevap.kelimelerListesi;
    return kelimelerListesi;
  }


  Future<List<Kelimeler>>tumKelimelerGoster()async{
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php");
    var cevap = await http.get(url);
    return parseKelimelerCevap(cevap.body);

  }
  Future<List<Kelimeler>>kelimelerAra(String aramaKelimesi)async{
    var veri={"ingilizce":aramaKelimesi};
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/kelime_ara.php");
    var cevap = await http.post(url,body:veri);
    return parseKelimelerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [

          aramaYapiliyormu ?
          IconButton(
            onPressed: (){
              setState(() {
                aramaYapiliyormu=false;
                aramaKelimesi="";
              });
            },
            icon: Icon(Icons.cancel),)
              :IconButton(
            onPressed: (){
              setState(() {
                aramaYapiliyormu=true;
              });
            },
            icon: Icon(Icons.search),)
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: aramaYapiliyormu ? TextField(
          decoration: InputDecoration(
            hintText: "Arama İçin Bir Şey Yazın",
          ),
          onChanged: (aramaSonucu){
            print("Arama Sonucu: $aramaSonucu");
            setState(() {
              aramaKelimesi=aramaSonucu;
            });

          },
        ):
        Text("Sözlük Uygulaması"),
      ),
      body:FutureBuilder<List<Kelimeler>>(
        future: aramaYapiliyormu ? kelimelerAra(aramaKelimesi): tumKelimelerGoster(),
          builder: (context, snapshot){
          if(snapshot.hasData){
            var kelimelerListesi=snapshot.data;
            return ListView.builder(
              itemCount: kelimelerListesi!.length,
              itemBuilder: (context,indeks){
                var kelime=kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime: kelime)));
                  },
                  child: SizedBox(
                    height:50 ,
                    child: Card(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce,style: TextStyle(fontWeight: FontWeight.bold),),
                        ],

                      ),
                    ),
                  ),
                );
              },
            );

          }else{
            return Center();
          }
          }
      ),



    );



  }
}