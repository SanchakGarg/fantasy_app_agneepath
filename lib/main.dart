import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';
import 'pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';




final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fantasy League',
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(background: HexColor('#1E1E1E'),),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Column(children: [Login()],),),
    );
  }
}
