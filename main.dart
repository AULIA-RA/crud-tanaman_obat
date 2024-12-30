import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tnmn_obat/ui/beranda.dart';
import 'package:tnmn_obat/ui/login.dart';
import 'package:tnmn_obat/ui/plant_list.dart';
import 'package:tnmn_obat/ui/profile.dart';

import 'package:tnmn_obat/ui/register.dart';
import 'package:tnmn_obat/ui/scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herbal Care',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/HomePage1': (context) => HomePage1(),
        '/profile': (context) => ProfilePage(),
        '/PlantListPage': (context) => PlantListPage(),
        '/ScanPage': (context) => ScanPage(),
      },
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showText = false;
  bool showSubText = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        showSubText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/LOGO.jpg',  
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: showText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text( 
                'Herbal',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 71, 212, 151),
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              opacity: showSubText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                'FOR HEALTHY LIFE\nCare',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 5, 231, 160),
                ),
              ),
            ),
            SizedBox(height: 40),  // Jarak lebih besar untuk tombol
            ElevatedButton(
              onPressed: () {
                // Cek jika pengguna sudah login atau belum
                // Untuk contoh ini, kita asumsikan pengguna belum login
                Navigator.pushReplacementNamed(context, '/login');  // Arahkan ke halaman login
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 5, 231, 160),  // Warna tombol
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),  // Padding tombol
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


