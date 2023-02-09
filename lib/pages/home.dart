import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/pages/about.dart';
import 'package:crud_app/pages/create.dart';
import 'package:crud_app/pages/update.dart';
import 'package:crud_app/utils/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = FirebaseFirestore.instance;
  final eDC = EditDataController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AboutPage());
              },
              icon: Icon(
                Icons.info_outline_rounded,
                size: 30,
              ))
        ],
        title: Text('Data Mahasiswa ITelkom'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 253, 146, 209),
                  Color.fromARGB(255, 146, 118, 255)
                ]),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 238, 251, 255),
                  Color.fromARGB(255, 254, 231, 255),
                ])),
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: db.collection('mahasiswa').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('ERROR');
                }
                var data = snapshot.data!.docs;
                return ListView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    itemCount: data.length,
                    itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 229, 184, 255),
                                    Color.fromARGB(255, 194, 227, 255)
                                  ])),
                          child: Stack(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].data()['nama'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      data[index].data()['nim'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      data[index].data()['prodi'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      data[index].data()['alamat'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                              Positioned(
                                top: 0,
                                right: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.to(UpdatePage(),
                                                arguments: snapshot
                                                    .data!.docs[index].id
                                                    .toString());
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.amber,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 10),
                                            ],
                                            size: 40,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 249, 235, 255),
                                                  content: Text("Hapus data?"),
                                                  actions: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .purple)),
                                                        onPressed: () {
                                                          eDC.deleteData(
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id);
                                                          Get.back();
                                                        },
                                                        child: Text('Ok')),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: Icon(Icons.delete,
                                              color: Colors.red,
                                              shadows: [
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 53, 52, 52),
                                                    offset: Offset(1, 1),
                                                    blurRadius: 20),
                                              ],
                                              size: 40))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 192, 57, 233),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePage(),
              ));
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
