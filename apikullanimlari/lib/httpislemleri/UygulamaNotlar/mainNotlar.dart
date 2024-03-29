import 'dart:io';
import 'dart:convert';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/NotlarCevap.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/NotDetay.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/NotKayitSayfa.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/Notlar.dart';


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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

  List<Notlar> parseNotlarCevap(String cevap) {
  return NotlarCevap.fromJson(json.decode(cevap)).notlarListesi;
  }


  Future<List<Notlar>> tumNotlarGoster()async{
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/tum_notlar.php");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);


  }
  Future<bool> uygulamayiKapat()async {
    await exit(0);
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
            icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blue,
        title: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Notlar Uygulaması",style: TextStyle(color: Colors.white,fontSize: 16),),

              FutureBuilder(
                future: tumNotlarGoster(),
                builder: (context,snapshot){
                 if(snapshot.hasData){
                 var notlarListesi=snapshot.data;


                 double ortalama=0.0;

                 if(!notlarListesi!.isEmpty){
                   double toplam=0.0;
                   for(var n in notlarListesi) {
                     toplam = toplam + int.parse(n.not1) + int.parse(n.not2)/2;
                   }
                     ortalama=toplam/notlarListesi.length;

                   }
                 return Text("Ortalama: ${ortalama.toInt()}",style: TextStyle(color: Colors.white,fontSize: 14),);
                 }else{
                   return Text("Ortalama: 0",style: TextStyle(color: Colors.white,fontSize: 14),);


                 }
                }

              ),
            ],

          ),
        ),
      ),
      body:WillPopScope(
        onWillPop: uygulamayiKapat,
        child: FutureBuilder<List<Notlar>>(
          future: tumNotlarGoster(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var notlarListesi=snapshot.data;
              return ListView.builder(
                itemCount: notlarListesi!.length,
                  itemBuilder: (context,indeks){
                  var not = notlarListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotDetay(not: not)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(not.ders_adi,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(not.not1.toString()),
                            Text(not.not2.toString()),
                              ],

                        ),
                      ),
                    ),
                  );},
              );

            }else{
              return Center();
            }

          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotKayitSayfa()));

        },
        tooltip: 'Not Ekle',
        child: Icon(Icons.add),
      ),



    );



  }
}