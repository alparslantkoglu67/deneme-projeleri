import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Form Deneme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Giriş Yap'),
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
  var formKey=GlobalKey<FormState>();
  var tfKullaniciAdi=TextEditingController();
  var tfKullaniciSifre=TextEditingController();
  bool aramadurum=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: aramadurum? TextField(
          decoration: InputDecoration(hintText: "Aramak İstediğinizi Yazın"),
          onChanged: (aramasonucu){
            print("Arama Sonucu = $aramasonucu");
          },

        )
            :Text(widget.title),
        actions: [
          aramadurum?
          IconButton(
          onPressed: (){
            setState(() {
              aramadurum=false;
            });

          },
          icon: Icon(Icons.cancel),
          )
          :IconButton(
            onPressed: (){
              setState(() {
                aramadurum=true;
              });

            },
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: tfKullaniciAdi,
                    decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                    validator: (tfGirdisi){
                      if(tfGirdisi!.isEmpty){
                        return "Kullanıcı Adı Giriniz";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tfKullaniciSifre,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Şifre"),
                    validator: (tfGirdisi){
                      if(tfGirdisi!.isEmpty){
                        return "Şifrenizi Giriniz";
                      }
                      if(tfGirdisi.length<6){
                        return "Şifreniz En Az 6 Haneli Olmalıdır";
                      }
                      return null;
                    },


                  ),
                  ElevatedButton(
                      onPressed: (){
                        bool kontrolSonucu=formKey.currentState!.validate();
                        if(kontrolSonucu==true){
                          String ka=tfKullaniciAdi.text;
                          String s=tfKullaniciSifre.text;
                          print("Kullanıcı Adı: $ka");
                          print("Şifre: $s");
                          tfKullaniciSifre.text="";
                          tfKullaniciAdi.text="";
                        }


                      },
                      child: Text("Giriş Yap"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),



    );



  }
}