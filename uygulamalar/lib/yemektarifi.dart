import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi=MediaQuery.of(context);
    final double ekranyuksekligi=ekranbilgisi.size.height;
    final double ekrangenisligi=ekranbilgisi.size.width;

    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi=MediaQuery.of(context);
    final double ekranyuksekligi=ekranbilgisi.size.height;
    final double ekrangenisligi=ekranbilgisi.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: ekrangenisligi,

                child: Image.asset("Resimler/patates.jpg")
            ),
            Row(

              children: [
                Expanded(
                  child: SizedBox(
                    width: ekrangenisligi/8,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: (){print("Beğenildi");},
                      child: Yazi("Beğen", ekrangenisligi/25),

                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    width: ekrangenisligi/8,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: (){print("Yorum Yapıldı");}
                      ,
                      child: Yazi("Yorum Yap", ekrangenisligi/25),
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding:EdgeInsets.all(ekranyuksekligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Patates Püresi",style: TextStyle(color: Colors.orange,fontSize: ekrangenisligi/20,fontWeight: FontWeight.bold),),

                  Row(
                    children: [
                      Yazi("Fırında Pişirmeye Uygun", ekrangenisligi/25),
                      Spacer(),
                      Yazi("8 Temmuz 2023", ekrangenisligi/25),
                    ],
                  ),

                ],
              ),
            ),
            Yazi("Patates püresi için öncelikle patatesler soyulur, doğranır ve bol suda kaynatılır.Yumuşayan patatesler süzülür.Soğumadan içine tereyağı ilave edilir ve ezilir.Süt, tuz ve karabiber eklenir.İyice püre haline gelene kadar ezilir.Patates püresi sıcak olarak et, tavuk veya rosto yemekleri ile servis yapılır.Afiyet olsun.", ekrangenisligi/25),
            Yazi("Püf Noktaları", ekrangenisligi/20),
            Yazi("Zaman almaması ve daha yumuşak olması için patatesleri soyduktan sonra küp küp doğrayarak haşlayabilirsiniz.Haşlanmış patatesleri ezici ile ezerek daha iyi sonuç alabilirsiniz.Patates püresi yaparken süt yerine süt kreması da eklenebilir.", ekrangenisligi/25),

          ],

        ),
      ),

    );



  }
}
class Yazi extends StatelessWidget {
  String icerik;
  double yaziboyut;


  Yazi(this.icerik, this.yaziboyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziboyut),);
  }
}



