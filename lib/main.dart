import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youtube/screens/home.dart';
import 'package:youtube/screens/login.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

// ddebugkey -storepass android -keypass android
// Alias name: androiddebugkey
// Creation date: 30-Dec-2024
// Entry type: PrivateKeyEntry
// Certificate chain length: 1
// Certificate[1]:
// Owner: C=US, O=Android, CN=Android Debug
// Issuer: C=US, O=Android, CN=Android Debug
// Serial number: 1
// Valid from: Mon Dec 30 10:52:36 PKT 2024 until: Wed Dec 23 10:52:36 PKT 2054
// Certificate fingerprints:
// SHA1: 91:5E:4D:AD:B7:30:92:F6:4E:07:0F:17:06:19:31:A6:D0:98:CB:66
// SHA256: 00:55:82:7A:78:05:E4:67:8C:DA:CD:A6:50:CE:DE:C1:62:B0:04:BE:6C:FC:99:07:12:DF:9B:B9:3C:57:EE:B5
// Signature algorithm name: SHA256withRSA
// Subject Public Key Algorithm: 2048-bit RSA key
// Version: 1

