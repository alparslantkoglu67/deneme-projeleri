import 'package:flutter/material.dart';
import 'package:uygulamalar/yemekprogramiClass.dart';

class DetayYemek extends StatefulWidget {
  Yemekler yemek;


  DetayYemek(this.yemek);

  @override
  State<DetayYemek> createState() => _DetayYemekState();
}

class _DetayYemekState extends State<DetayYemek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.yemek.yemek_Adi,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ),
    body:Center(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset(widget.yemek.yemek_Resim),
      Text("Fiyat: ${widget.yemek.yemek_Fiyat}\u{20BA}",style: TextStyle(fontSize: 40,color: Colors.blue,),),
      SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          child:Text("Sipariş Ver"),
          onPressed: (){
            print("${widget.yemek.yemek_Adi} Sipariş Verildi");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),

        ),
      ),

    ],
    ),

    ),
    );
  }
}
