import 'package:uygulamalar/Tahminekrani.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uygulamalar/Anasayfa.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;


  SonucEkrani(this.sonuc);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.sonuc? Image.asset("Resimler/smile.png",):Image.asset("Resimler/sad.png",),

          widget.sonuc?Text("Kazandınız",style: TextStyle(color: Colors.black,fontSize: 36),):Text("Kaybettiniz",style: TextStyle(color: Colors.black,fontSize: 36),),

          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Tekrar Dene"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,)
            ),
          ),
        ],

      ),



    );
  }
}
