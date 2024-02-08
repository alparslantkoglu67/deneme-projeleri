

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uygulamalar/Sonucekrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tf=TextEditingController();
  int rastgeleSayi=0;
  int kalanHak=5;
  String yonlendirme="";
  @override
  void initState() {
    super.initState();
    rastgeleSayi=Random().nextInt(40);
    print("Rastgele sayı: $rastgeleSayi");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Kalan Hak: $kalanHak",style: TextStyle(color: Colors.pinkAccent,fontSize: 30),),
          Text("Yardım: $yonlendirme",style: TextStyle(color: Colors.black,fontSize: 24),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tf,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),

                labelText: "Tahmin",
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    kalanHak=kalanHak-1;

                  });
                  int tahmin=int.parse(tf.text);
                  if(tahmin==rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(true)));
                    return;
                  }
                  if(tahmin>rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini Azalt";
                    });
                  }
                  if(tahmin<rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini Arttır";
                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(false)));
                  }
                  tf.text="";
                },
                child: Text("Tahmin Et"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,)
            ),
          ),

        ],
      ),




    );
  }
}
