import 'dart:convert';
import 'package:flutter_application_1/model/model_bacaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class BacaanShalat extends StatefulWidget {
  const BacaanShalat({super.key});

  @override
  State<BacaanShalat> createState() => _BacaanShalatState();
}

class _BacaanShalatState extends State<BacaanShalat> {
  Future<List<ModelBacaan>> ReadJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('assets/data/bacaanshalat.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelBacaan.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 249, 243),
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.black,),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 6, 8, 104)
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(top: 120, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bacaan Shalat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("Bacaan shalat dari doa iftitah sampai salam",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                ),
                child: Image.asset('assets/images/bg_doa.png',
                width: 330,
                height: 200,
                fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: Container(
          child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data){
              if(data.hasError){
                return Center(
                  child: Text("${data.error}"),
                );
              }else if(data.hasData){
                var items = data.data as List<ModelBacaan>;
                return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index){
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(15),
                      child: Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent), 
                      child: ExpansionTile(
                        title: Text(items[index].name.toString(),
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].arabic.toString(),
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      ),
                                      Padding(padding: EdgeInsets.only(
                                        left: 8, right: 8
                                      ),
                                      child: Text(
                                        items[index].latin.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic
                                        ),
                                      ),
                                      ),
                                      Padding(padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 5
                                      ),
                                      child: Text(
                                        items[index].terjemahan.toString(),
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      )
                      ),
                    );
                  }
                  );
              } else{
                return Center(
                  child: CircularProgressIndicator(),);
              }
            }
          ),
        ))
      ],
      )),
    );
  }
}