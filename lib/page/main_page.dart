import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/niat_shalat_page.dart';
import 'package:flutter_application_1/page/bacaan_shalat_page.dart';
import 'package:flutter_application_1/page/ayat_kursi_page.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/page/register_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 155, 188, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NiatShalat()));
                    },
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_niat.png"),
                        height: 100, 
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Niat Shalat", 
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BacaanShalat()));
                    },
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_bacaan.png"),
                        height: 100, 
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bacaan Shalat", 
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => AyatKursi()));
                    },
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_doa.png"),
                        height: 100, 
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ayat Kursi", 
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      
                    },
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_tanya.png"),
                        height: 100, 
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Diskusi Publik", 
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      
                    },
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_user.png"),
                        height: 100, 
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Informasi Akun", 
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),)
        )
      ),
    );
  }
}