
import 'package:flutter/material.dart';
import 'package:uygulamalar/Tahminekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    var ekranbilgisi=MediaQuery.of(context);
    final double ekranyuksekligi=ekranbilgisi.size.height;
    final double ekrangenisligi=ekranbilgisi.size.width;

    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sayı Tahmin Oyunu",style: TextStyle(color: Colors.black,fontSize: 36),),

            Image.asset("Resimler/zar.png"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                  },
                  child: Text("Oyun Başla"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,///*************************Butona renk verme
                  foregroundColor: Colors.white,)
              ),
            ),
          ],

      ),



    );



  }
}



