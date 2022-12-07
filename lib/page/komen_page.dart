import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Komentar extends StatefulWidget {
  const Komentar({super.key});

  @override
  State<Komentar> createState() => _KomentarState();
}

class _KomentarState extends State<Komentar> {
  String nama = "";
  String komen = "";

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference comment = firestore.collection('comment');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Diskusi Publik'),
        ),
        backgroundColor: Colors.white,
        body:
        Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
                ),
              ),
            ListView(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: comment.snapshots(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data.docs[index]['nama']),
                            subtitle: Text(snapshot.data.docs[index]['komen']),
                          );
                        },
                      );
                    }else{
                      return Text('');
                    }
                  },
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                            onChanged: (value){
                              nama = value;
                            },
                              decoration: InputDecoration(hintText: "Nama"),
                            ),
                            TextField(
                            onChanged: (value){
                              komen = value;
                            },
                              decoration: InputDecoration(hintText: "Pesan"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: ElevatedButton(
                            child: const Text('Kirim'),
                            onPressed: () {
                              if(nama != "" && komen !=""){
                                comment.add({
                                'nama': nama,
                                'komen': komen
                                });
                              }
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
