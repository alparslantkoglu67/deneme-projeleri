import 'package:flutter/material.dart';
import 'package:uygulamalar/detayyemek.dart';
import 'package:uygulamalar/yemekprogramiClass.dart';

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
      home: const MyHomePage(title: 'Yemek Pidesi'),
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
  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi=<Yemekler>[];
    var y1=Yemekler(1, "Makarna", "Resimler/yemek/makarna.jpeg", 19.90);
    var y2=Yemekler(2, "Pide", "Resimler/yemek/pide.jpeg", 39.90);
    var y3=Yemekler(3, "Ayran", "Resimler/yemek/ayran.jpeg", 4.90);
    var y4=Yemekler(4, "Lahmacun", "Resimler/yemek/lahmacun.jpeg", 37.50);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    return yemekListesi;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:FutureBuilder(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi=snapshot.data;
            return ListView.builder(
                itemCount: yemekListesi!.length,
                itemBuilder: (context,indeks){
                var yemek=yemekListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetayYemek(yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset(yemek.yemek_Resim)),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(yemek.yemek_Adi,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                ),

                            SizedBox(height: 50,),
                            Text("${yemek.yemek_Fiyat} \u{20BA}",style: TextStyle(fontSize: 25,color: Colors.blue),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),

                      ],
                    ),
                  ),
                );

                }
            );
          }
          else {
            return Center();
          }

        }
      ),



    );



  }
}