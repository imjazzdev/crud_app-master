import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 202, 162, 255),
                  Color.fromARGB(255, 165, 234, 255)
                ])),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Nama Kelompok',
                    style: Theme.of(context).textTheme.headline4),
                // CircleAvatar(
                //   radius: 100,
                //   child: Image.asset(
                //     'assets/img/nisa.jpeg',
                //     fit: BoxFit.cover,
                //   ),
                // ),

                Container(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/img/nisa.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Text('Annisa Nur Rufaida 20103007',
                    style: Theme.of(context).textTheme.headline6),
                Container(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/img/ela.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Elaa Fauziyah Syafi\'i 20103021',
                    style: Theme.of(context).textTheme.headline6),
                Container(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/img/venita.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Ella Venita Alaya Pardede 20103022',
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
