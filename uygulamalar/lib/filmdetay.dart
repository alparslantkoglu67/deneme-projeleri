import 'package:flutter/material.dart';
import 'package:uygulamalar/filmclass.dart';

class Filmdetay extends StatefulWidget {
  Filmler film;


  Filmdetay(this.film);

  @override
  State<Filmdetay> createState() => _FilmdetayState();
}

class _FilmdetayState extends State<Filmdetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
    title: Text(widget.film.film_Ad,style: TextStyle(color: Colors.white),),
    ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("${widget.film.film_Resim}"),
          Text(widget.film.film_Ad,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          Text("Yönetmen: ${widget.film.film_Yonetmen}",style: TextStyle(fontSize: 20)),
          Text("Fiyat: ${widget.film.film_Fiyat}\u{20BA}",style: TextStyle(fontSize: 25,color: Colors.blue),),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                print("${widget.film.film_Ad}: Kiralandı");
              },
              child: Text("KİRALA"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
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
