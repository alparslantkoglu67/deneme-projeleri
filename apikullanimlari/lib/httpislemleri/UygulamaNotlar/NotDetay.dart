import 'package:flutter/material.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/mainNotlar.dart';
import 'package:apikullanimlari/httpislemleri/UygulamaNotlar/Notlar.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class NotDetay extends StatefulWidget {
  Notlar not;


  NotDetay({required this.not});

  @override
  State<NotDetay> createState() => _NotDetayState();
}

class _NotDetayState extends State<NotDetay> {
  var tfDersAdi=TextEditingController();
  var tfnot1=TextEditingController();
  var tfnot2=TextEditingController();

  Future<void> notSil(int not_id) async{
    var veri={"not_id":not_id.toString()};
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/delete_not.php");
    var cevap = await http.post(url,body:veri);
    print("Silme Cevap:${cevap.body}");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  Future<void> notGuncelle(int not_id,String ders_adi, int not1, int not2 ) async{
    var veri={"not_id":not_id.toString() ,"ders_adi":ders_adi,"not1":not1.toString(),"not2":not2.toString()};
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/update_not.php");
    var cevap = await http.post(url,body:veri);
    print("Güncelle Cevap:${cevap.body}");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }
  @override
  void initState() {
    var not=widget.not;
    tfDersAdi.text=not.ders_adi;
    tfnot1.text=not.not1.toString();
    tfnot2.text=not.not2.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: (){
                notSil(int.parse(widget.not.not_id));
              },
              child: Text("Sil",style: TextStyle(color: Colors.white),)
          ),
          TextButton(
              onPressed: (){
                notGuncelle(int.parse(widget.not.not_id),tfDersAdi.text, int.parse(tfnot2.text), int.parse(tfnot2.text));
              },
              child: Text("Güncelle",style: TextStyle(color: Colors.white),)),
        ],
        title: Text("Not Detay",style: TextStyle(color: Colors.white),),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(hintText: "Ders Adı"),
              ),
              TextField(
                controller: tfnot1,
                decoration: InputDecoration(hintText: "1.Not"),
              ),
              TextField(
                controller: tfnot2,
                decoration: InputDecoration(hintText: "2.Not"),
              ),
            ],
          ),
        ),
      ),




    );
  }
}
