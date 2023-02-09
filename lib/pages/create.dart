import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CreatePage extends StatefulWidget {
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController namaController = TextEditingController();

  TextEditingController nimController = TextEditingController();

  TextEditingController alamatController = TextEditingController();

  TextEditingController prodiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference mahasiswa = firestore.collection('mahasiswa');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 252, 162, 255),
                  Color.fromARGB(255, 165, 234, 255)
                ])),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Flexible(
                    child: Text(
                  'CREATE',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Nama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(colors: [
                              Colors.purple.shade100,
                              Colors.purple.shade50
                            ])),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: namaController,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'NIM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(colors: [
                              Colors.purple.shade100,
                              Colors.purple.shade50
                            ])),
                        child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: nimController,
                            decoration:
                                InputDecoration(border: InputBorder.none)),
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Alamat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(colors: [
                              Colors.purple.shade100,
                              Colors.purple.shade50
                            ])),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: alamatController,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Prodi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(colors: [
                              Colors.purple.shade100,
                              Colors.purple.shade50
                            ])),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: prodiController,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: InkWell(
                        onTap: () {
                          mahasiswa.add({
                            'nama': namaController.text,
                            'nim': int.tryParse(nimController.text) ?? 0,
                            'alamat': alamatController.text,
                            'prodi': prodiController.text
                          });
                          namaController.text = '';
                          nimController.text = '';
                          alamatController.text = '';
                          prodiController.text = '';
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.purple,
                                Colors.purpleAccent
                              ])),
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
