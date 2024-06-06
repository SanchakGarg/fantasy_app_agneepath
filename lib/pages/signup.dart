import 'package:fantasy_app_agneepath/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_app_agneepath/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in_button/sign_in_button.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final pointou = FirebaseFirestore.instance.collection('Users');

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void check() async {
    DocumentSnapshot documentSnapshot = await pointou.doc(auth.currentUser?.uid).get();
    if (documentSnapshot.exists) {
      print('exists');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => dashboard()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => signup()));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    // googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters(
        {'login_hint': 'user@example.com', 'prompt': 'select_account'});

    // Once signed in, return the UserCredential
    return await auth.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!333333');

      } else {
        print('User is signed in!');
        check();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: signInWithGoogle, child: Text('sign in'));
  }
}

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: auth.signOut, child: Text('Log out',style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white)),));

  }
}

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final name = TextEditingController();

  @override
  void initState() {
    super.initState;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!333333');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print('User is signed in!');
      }
    });
  }

  void register() {
    pointou.doc(auth.currentUser?.uid).update({
      'name': name.text,
      'status': 'draft',
      'Team': {
        'Football': selectedplayer.Football,
        'Basketball': selectedplayer.Basketball,
        'Tennis': selectedplayer.Tennis,
        'Squash': selectedplayer.Squash,
        'Table_Tennis': selectedplayer.TT,
        'Badminton': selectedplayer.Badminton,
        'Swimming': selectedplayer.Swimming,
        'Pool': selectedplayer.Pool,
        'Snooker': selectedplayer.Snooker,
        'Cricket': selectedplayer.Cricket,
        'Volleyball': selectedplayer.Volleyball,
        'Chess': selectedplayer.Chess,
        'Powerlifting': selectedplayer.Powerlifting
      }
    }).catchError((e) {
      pointou.doc(auth.currentUser?.uid).set({
        'name': name.text,
        'status': 'draft',
        'Team': {
          'Football': selectedplayer.Football,
          'Basketball': selectedplayer.Basketball,
          'Tennis': selectedplayer.Tennis,
          'Squash': selectedplayer.Squash,
          'Table_Tennis': selectedplayer.TT,
          'Badminton': selectedplayer.Badminton,
          'Swimming': selectedplayer.Swimming,
          'Pool': selectedplayer.Pool,
          'Snooker': selectedplayer.Snooker,
          'Cricket': selectedplayer.Cricket,
          'Volleyball': selectedplayer.Volleyball,
          'Chess': selectedplayer.Chess,
          'Powerlifting': selectedplayer.Powerlifting
        }
      });
    }).then((value) =>
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(top: 16, right: 16, child: logout()),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              nametextfield(),
              button(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget nametextfield() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: TextField(
        controller: name,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'enter name'),
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 40,
        child: ElevatedButton(onPressed: register, child: Text('Submit')),
      ),
    );
  }
}
