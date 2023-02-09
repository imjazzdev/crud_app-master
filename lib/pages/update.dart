import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/utils/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class UpdatePage extends StatefulWidget {
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController namaController = TextEditingController();

  TextEditingController nimController = TextEditingController();

  TextEditingController alamatController = TextEditingController();

  TextEditingController prodiController = TextEditingController();

  EditDataController eDC = EditDataController();

  @override
  Widget build(BuildContext context) {
    final mahasiswa = FirebaseFirestore.instance.collection('mahasiswa');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 241, 162, 255),
                  Color.fromARGB(255, 161, 207, 245)
                ])),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: FutureBuilder<DocumentSnapshot<Object?>>(
              future: eDC.getData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  eDC.namaC.text = data['nama'];
                  eDC.nimC.text = data['nim'].toString();
                  eDC.prodiC.text = data['prodi'];
                  eDC.alamatC.text = data['alamat'];

                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Flexible(
                          child: Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                                    Color.fromARGB(255, 247, 205, 255),
                                    Color.fromARGB(255, 253, 237, 255)
                                  ])),
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: eDC.namaC,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
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
                                    Color.fromARGB(255, 247, 205, 255),
                                    Color.fromARGB(255, 253, 237, 255)
                                  ])),
                              child: TextField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: eDC.nimC,
                                  decoration: InputDecoration(
                                      border: InputBorder.none)),
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
                                    Color.fromARGB(255, 247, 205, 255),
                                    Color.fromARGB(255, 253, 237, 255)
                                  ])),
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: eDC.alamatC,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
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
                                    Color.fromARGB(255, 247, 205, 255),
                                    Color.fromARGB(255, 253, 237, 255)
                                  ])),
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: eDC.prodiC,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      )),
                      Flexible(
                          child: InkWell(
                              onTap: () {
                                eDC.editData(
                                    eDC.namaC.text,
                                    eDC.nimC.text,
                                    eDC.prodiC.text,
                                    eDC.alamatC.text,
                                    Get.arguments);
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      Colors.purple,
                                      Colors.purpleAccent
                                    ])),
                                child: Text(
                                  'UPDATE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )))
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
