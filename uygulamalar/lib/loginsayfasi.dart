import 'package:flutter/material.dart';
import 'package:flutter/src/material/elevated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Uygulama 1'),
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
    ///Çoklu Ekran Desteği******************
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.only(bottom:ekranyuksekligi/20),
              child: SizedBox(
                  width: ekrangenisligi/4,
                  child: Image.asset("Resimler/login.png"
                  )
              ),
            ),
            Padding(
              padding:EdgeInsets.all(ekranyuksekligi/30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),

              ),
            ),
            Padding(
              padding:EdgeInsets.all(ekranyuksekligi/30),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),

              ),
            ),
            Padding(
              padding:EdgeInsets.all(ekranyuksekligi/30),
              child: SizedBox(
                width: ekrangenisligi/1.2,
                height: ekranyuksekligi/12,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,///*************************Butona renk verme
                    foregroundColor: Colors.white,
                    fixedSize: Size(ekrangenisligi/20, ekrangenisligi/20),

                  ),
                  onPressed: (){
                    print("Giriş Yapıldı");
                  },
                  child:
                  Text("Giriş Yap",style: TextStyle(fontSize: ekrangenisligi/20),



                  ),

                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  print("Yardıma giriş yapıldı!");
                },
                child: Text("Yardım!",style: TextStyle(fontSize: ekrangenisligi/30,color: Colors.pink,fontWeight: FontWeight.bold),)),
          ],


        ),
      ),
    );






  }
}



