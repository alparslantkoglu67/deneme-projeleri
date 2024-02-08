import 'package:flutter/material.dart';
import 'package:uygulamalar/filmclass.dart';
import 'package:uygulamalar/filmdetay.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Filmler'),
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
  Future<List<Filmler>>filmgetir()async{
    var film_Listesi=<Filmler>[];
    var f1=Filmler(1, "Interstellar", "Christopher Nolan", 9.99, "Resimler/filmler/interstellar.jpeg");
    var f2=Filmler(2, "Last Samurai", "Edward Zwick", 7.99, "Resimler/filmler/samuray.jpeg");
    var f3=Filmler(3, "Lord Of The Rings\n       Two Tower", "Peter Jackson", 19.99, "Resimler/filmler/lord.jpeg");
    var f4=Filmler(4, "Tenet", "Christopher Nolan", 29.99, "Resimler/filmler/tenet.jpeg");
    var f5=Filmler(5, "Green Mile", "Frank Darabont", 5.99, "Resimler/filmler/yesil.jpeg");
    var f6=Filmler(6, "Django", "Quentin Tarantinon", 15.99, "Resimler/filmler/django.jpeg");

    film_Listesi.add(f1);
    film_Listesi.add(f2);
    film_Listesi.add(f3);
    film_Listesi.add(f4);
    film_Listesi.add(f5);
    film_Listesi.add(f6);
    return film_Listesi;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
      ),
      body:FutureBuilder<List<Filmler>>(
        future: filmgetir(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            var film_Listesi=snapshot.data;
            return GridView.builder(

              itemCount: film_Listesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/4,
              ),
              itemBuilder: (context,indeks){
                var film=film_Listesi[indeks];
                return GestureDetector(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Filmdetay(film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        SizedBox(
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("${film.film_Resim}"),
                            )),
                        Text(film.film_Ad,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text("Yönetmen: ${film.film_Yonetmen}",style: TextStyle(fontSize: 10)),
                        Text("Fiyat: ${film.film_Fiyat}\u{20BA}",style: TextStyle(fontSize: 15),),
                      ],
                    ),

                  ),
                );
              },


            );

          }
          else{
            return Center();
          }
          }
      ),



    );



  }
}