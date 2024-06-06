import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fantasy_app_agneepath/main.dart';

class selectedplayer {
  static String? Football;
  static String? Basketball;
  static String? Tennis;
  static String? Squash;
  static String? TT;
  static String? Badminton;
  static String? Swimming;
  static String? Pool;
  static String? Snooker;
  static String? Cricket;
  static String? Volleyball;
  static String? Chess;
  static String? Powerlifting;
}

class Athletes {
  static var Football;
  static var Basketball;
  static var Tennis;
  static var Squash;
  static var TT;
  static var Badminton;
  static var Swimming;
  static var Pool;
  static var Snooker;
  static var Cricket;
  static var Volleyball;
  static var Chess;
  static var Powerlifting;
}

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  var name;
  var status;

  void getdata() async {
    final info = await pointou.doc(auth.currentUser?.uid).get();
    final data = info.data();
    name = data?['name'];
    status = data?['status'];
    setState(() {
      selectedplayer.Football = data?['Team']['Football'];
      selectedplayer.Powerlifting = data?['Team']['Powerlifting'];
      selectedplayer.Chess = data?['Team']['Chess'];
      selectedplayer.Volleyball = data?['Team']['Volleyball'];
      selectedplayer.Cricket = data?['Team']['Cricket'];
      selectedplayer.Snooker = data?['Team']['Snooker'];
      selectedplayer.Pool = data?['Team']['Pool'];
      selectedplayer.Swimming = data?['Team']['Swimming'];
      selectedplayer.Badminton = data?['Team']['Badminton'];
      selectedplayer.Squash = data?['Team']['Squash'];
      selectedplayer.Tennis = data?['Team']['Tennis'];
      selectedplayer.Basketball = data?['Team']['Basketball'];
      selectedplayer.TT = data?['Team']['Table_Tennis'];
    });

    print(data);
  }

  void draft() {
    pointou.doc(auth.currentUser?.uid).update({
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
    }).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => dashboard())));
  }

  void update() {
    if (selectedplayer.Football == null ||
        selectedplayer.Basketball == null ||
        selectedplayer.Tennis == null ||
        selectedplayer.Squash == null ||
        selectedplayer.TT == null ||
        selectedplayer.Badminton == null ||
        selectedplayer.Swimming == null ||
        selectedplayer.Pool == null ||
        selectedplayer.Snooker == null ||
        selectedplayer.Cricket == null ||
        selectedplayer.Volleyball == null ||
        selectedplayer.Chess == null ||
        selectedplayer.Powerlifting == null) {
      print("");
    } else {
      print("All variables have values");
    }
    pointou.doc(auth.currentUser?.uid).update({
      'status': 'Confirm',
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
    }).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => dashboard())));
  }

  void getplayerinfo() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Athletes').get();
    setState(() {
      Athletes.Football = snapshot.child('Football').value;
      Athletes.Basketball = snapshot.child('Basketball').value;
      Athletes.Tennis = snapshot.child('Tennis').value;
      Athletes.Squash = snapshot.child('Squash').value;
      Athletes.TT = snapshot.child('TT').value;
      Athletes.Badminton = snapshot.child('Badminton').value;
      Athletes.Swimming = snapshot.child('Swimming').value;
      Athletes.Pool = snapshot.child('Pool').value;
      Athletes.Snooker = snapshot.child('Snooker').value;
      Athletes.Cricket = snapshot.child('Cricket').value;
      Athletes.Volleyball = snapshot.child('Volleyball').value;
      Athletes.Chess = snapshot.child('Chess').value;
      Athletes.Powerlifting = snapshot.child('Powerlifting').value;
    });
  }

  @override
  void initState() {
    super.initState;
    getplayerinfo();
    getdata();
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

  String? Sports;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Athletes.TT == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [image(), logout()],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [welcome()],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Football(MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5),
                                            Basketball(MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Badminton(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.5 /
                                                          2),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: TT(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            2),
                                                  )
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Tennis(MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5 /
                                                      3),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Cricket(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Squash(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  )
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Pool(MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5 /
                                                      3),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Snooker(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Volleyball(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  )
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Chess(MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5 /
                                                      3),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Powerlifting(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    child: Swimming(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5 /
                                                            3),
                                                  )
                                                ])
                                          ]
                                              .map((widget) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16),
                                                    child: widget,
                                                  ))
                                              .toList(),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [stats()],
                                        ))
                                  ],
                                )
                                // Positioned(top:50,child:Center(child:  Row(mainAxisAlignment:MainAxisAlignment.start,children: [status == 'draft' ? maketeam() : formedteam(),],)))
                              ]
                                  .map((widget) => Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: widget,
                                      ))
                                  .toList(),
                            ))),
                    Positioned(
                        bottom: 40,
                        right: 20,
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: update, child: Text('Confirm')),
                            ElevatedButton(
                              onPressed: draft,
                              child: Text('save draft'),
                            )
                          ],
                        )),
                  ],
                ),
              ));
  }

  Widget Football(width) {
    return selectedplayer.Football != null
        ? Container(
            width: width + 32,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Football}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Football[selectedplayer.Football].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Football = value.toString();
                                print(selectedplayer.Football);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Football.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Football[item].split(',')[2].split("'")[1]})( ₹${Athletes.Football[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Football[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text('Football',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontSize: 19,
                                  fontVariations: [
                                    FontVariation('ital', 1),
                                    FontVariation('wght', 700)
                                  ],
                                  color: Colors.white)),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Football[selectedplayer.Football].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width + 32,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Football = value.toString();
                          print(selectedplayer.Football);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Football.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Football[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Football[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Football[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text('Football',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 19,
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              color: Colors.black)),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Basketball(width) {
    return selectedplayer.Basketball != null
        ? Container(
            width: width + 32,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Basketball}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Basketball[selectedplayer.Basketball].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Basketball = value.toString();
                                print(selectedplayer.Basketball);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Basketball.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Basketball[item].split(',')[2].split("'")[1]})( ₹${Athletes.Basketball[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Basketball[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Basketball',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Basketball[selectedplayer.Basketball].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width + 32,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Basketball = value.toString();
                          print(selectedplayer.Basketball);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Basketball.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Basketball[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Basketball[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Basketball[item]
                                                .split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Basketball',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Tennis(width) {
    return selectedplayer.Tennis != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Tennis}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Tennis[selectedplayer.Tennis].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Tennis = value.toString();
                                print(selectedplayer.Tennis);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Tennis.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Tennis[item].split(',')[2].split("'")[1]})( ₹${Athletes.Tennis[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Tennis[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Tennis',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Tennis[selectedplayer.Tennis].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Tennis = value.toString();
                          print(selectedplayer.Tennis);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Tennis.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Tennis[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Tennis[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Tennis[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Tennis',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Squash(width) {
    return selectedplayer.Squash != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Squash}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Squash[selectedplayer.Squash].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Squash = value.toString();
                                print(selectedplayer.Squash);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Squash.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Squash[item].split(',')[2].split("'")[1]})( ₹${Athletes.Squash[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Squash[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Squash',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Squash[selectedplayer.Squash].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Squash = value.toString();
                          print(selectedplayer.Squash);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Squash.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Squash[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Squash[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Squash[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Squash',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget TT(width) {
    return selectedplayer.TT != null
        ? Container(
            width: width + 8,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.TT}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.TT[selectedplayer.TT].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.TT = value.toString();
                                print(selectedplayer.TT);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .TT.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.TT[item].split(',')[2].split("'")[1]})( ₹${Athletes.TT[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.TT[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Table Tennis',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.TT[selectedplayer.TT].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width + 8,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.TT = value.toString();
                          print(selectedplayer.TT);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes.TT.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.TT[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.TT[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.TT[item].split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Table Tennis',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Badminton(width) {
    return selectedplayer.Badminton != null
        ? Container(
            width: width + 8,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Badminton}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Badminton[selectedplayer.Badminton].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Badminton = value.toString();
                                print(selectedplayer.Badminton);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Badminton.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Badminton[item].split(',')[2].split("'")[1]})( ₹${Athletes.Badminton[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Badminton[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Badminton',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Badminton[selectedplayer.Badminton].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width + 8,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Badminton = value.toString();
                          print(selectedplayer.Badminton);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Badminton.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Badminton[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Badminton[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Badminton[item]
                                                .split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Badminton',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Swimming(width) {
    return selectedplayer.Swimming != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Swimming}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Swimming[selectedplayer.Swimming].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Swimming = value.toString();
                                print(selectedplayer.Swimming);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Swimming.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Swimming[item].split(',')[2].split("'")[1]})( ₹${Athletes.Swimming[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Swimming[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Swimming',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Swimming[selectedplayer.Swimming].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Swimming = value.toString();
                          print(selectedplayer.Swimming);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Swimming.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Swimming[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Swimming[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Swimming[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Swimming',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Pool(width) {
    return selectedplayer.Pool != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Pool}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Pool[selectedplayer.Pool].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Pool = value.toString();
                                print(selectedplayer.Pool);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Pool.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Pool[item].split(',')[2].split("'")[1]})( ₹${Athletes.Pool[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Pool[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Pool',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Pool[selectedplayer.Pool].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Pool = value.toString();
                          print(selectedplayer.Pool);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes.Pool.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Pool[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Pool[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Pool[item].split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Pool',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Snooker(width) {
    return selectedplayer.Snooker != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Snooker}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Snooker[selectedplayer.Snooker].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Snooker = value.toString();
                                print(selectedplayer.Snooker);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Snooker.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Snooker[item].split(',')[2].split("'")[1]})( ₹${Athletes.Snooker[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Snooker[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Snooker',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Snooker[selectedplayer.Snooker].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Snooker = value.toString();
                          print(selectedplayer.Snooker);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Snooker.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Snooker[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Snooker[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Snooker[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Snooker',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Cricket(width) {
    return selectedplayer.Cricket != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Cricket}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Cricket[selectedplayer.Cricket].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Cricket = value.toString();
                                print(selectedplayer.Cricket);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Cricket.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Cricket[item].split(',')[2].split("'")[1]})( ₹${Athletes.Cricket[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Cricket[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Cricket',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Cricket[selectedplayer.Cricket].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Cricket = value.toString();
                          print(selectedplayer.Cricket);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Cricket.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Cricket[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Cricket[item].split(',')[1]})',
                                  style: TextStyle(
                                    color:
                                        Athletes.Cricket[item].split(',')[0] ==
                                                "'cis'"
                                            ? Colors.purple
                                            : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Cricket',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Volleyball(width) {
    return selectedplayer.Volleyball != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Volleyball}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Volleyball[selectedplayer.Volleyball].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Volleyball = value.toString();
                                print(selectedplayer.Volleyball);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Volleyball.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Volleyball[item].split(',')[2].split("'")[1]})( ₹${Athletes.Volleyball[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Volleyball[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Volleyball',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Volleyball[selectedplayer.Volleyball].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Volleyball = value.toString();
                          print(selectedplayer.Volleyball);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Volleyball.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Volleyball[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Volleyball[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Volleyball[item]
                                                .split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Volleyball',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Chess(width) {
    return selectedplayer.Chess != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Chess}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Chess[selectedplayer.Chess].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Chess = value.toString();
                                print(selectedplayer.Chess);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Chess.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Chess[item].split(',')[2].split("'")[1]})( ₹${Athletes.Chess[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Chess[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Chess',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Chess[selectedplayer.Chess].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Chess = value.toString();
                          print(selectedplayer.Chess);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes.Chess.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Chess[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Chess[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Chess[item].split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Chess',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget Powerlifting(width) {
    return selectedplayer.Powerlifting != null
        ? Container(
            width: width,
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                color: HexColor('#4dffa8'),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${selectedplayer.Powerlifting}'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontStyle: FontStyle.italic,
                                    fontVariations: [
                                      FontVariation('ital', 1),
                                      FontVariation('wght', 900)
                                    ],
                                    fontSize: 28),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: (width + 32) * 0.2),
                              child: Text(
                                '${Athletes.Powerlifting[selectedplayer.Powerlifting].split(',')[2].split("'")[1]}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    if (status == 'draft')
                      Positioned(
                          top: 10,
                          left: 10,
                          child: PopupMenuButton(
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.black,
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedplayer.Powerlifting = value.toString();
                                print(selectedplayer.Powerlifting);
                              });
                            },
                            itemBuilder: (BuildContext context) => Athletes
                                .Powerlifting.keys
                                .toList()
                                .map<PopupMenuEntry<dynamic>>(
                                    (item) => PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item} (${Athletes.Powerlifting[item].split(',')[2].split("'")[1]})( ₹${Athletes.Powerlifting[item].split(',')[1]})',
                                            style: TextStyle(
                                              color: Athletes.Powerlifting[item]
                                                          .split(',')[0] ==
                                                      "'cis'"
                                                  ? Colors.purple
                                                  : Colors.pink,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          )),
                    Positioned(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Powerlifting',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                        ),
                        color: Colors.black,
                        height: 38,
                      ),
                      top: 0,
                      right: 30,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 25,
                        child: Text(
                          '₹${Athletes.Powerlifting[selectedplayer.Powerlifting].split(',')[1]}',
                          style: TextStyle(
                              fontFamily: "montserrat",
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 700)
                              ],
                              fontSize: 25),
                        ))
                  ],
                ),
              ),
            ))
        : Container(
            width: width,
            height: 150,
            color: HexColor('#282828'),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: PopupMenuButton(
                      child: Icon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedplayer.Powerlifting = value.toString();
                          print(selectedplayer.Powerlifting);
                        });
                      },
                      itemBuilder: (BuildContext context) => Athletes
                          .Powerlifting.keys
                          .toList()
                          .map<PopupMenuEntry<dynamic>>((item) => PopupMenuItem(
                                value: item,
                                child: Text(
                                  '${item}(${Athletes.Powerlifting[item].split(',')[2].split("'")[1]}) ( ₹${Athletes.Powerlifting[item].split(',')[1]})',
                                  style: TextStyle(
                                    color: Athletes.Powerlifting[item]
                                                .split(',')[0] ==
                                            "'cis'"
                                        ? Colors.purple
                                        : Colors.pink,
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Powerlifting',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ),
                    color: Colors.white,
                    height: 30,
                  ),
                  top: 10,
                  right: 30,
                )
              ],
            ),
          );
  }

  Widget image() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.15,
        child: Image.asset('images/logo.png',
            width: MediaQuery.of(context).size.width * 0.5));
  }

  Widget welcome() {
    return Text(
      'Welcome, ${name} to the Fantasy Game',
      style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.025,
          fontFamily: 'montserrat',
          fontStyle: FontStyle.italic,
          fontVariations: [
            FontVariation('ital', 1),
            FontVariation('wght', 900)
          ]),
    );
  }

  Widget maketeam() {
    print('makee');
    return Column(
      children: [
        Row(
          children: [],
        ),
        Row(
          children: [
            Text(
              'Badminton',
              style: TextStyle(fontSize: 50),
            )
          ],
        )
      ],
    );
  }

  Widget formedteam() {
    print('formed');
    return Column(
      children: [Text('Welcome ${name},')],
    );
  }

  Widget stats() {
    return Container(
      color: HexColor('#666666'),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: HexColor('#282828'),
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Money',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontFamily: 'montserrat',
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 900)
                              ],
                              fontSize: 50),
                        ),
                        Text(
                          'Left',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontFamily: 'montserrat',
                              fontVariations: [
                                FontVariation('ital', 1),
                                FontVariation('wght', 900)
                              ],
                              fontSize: 50),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: DropdownButton(
                  // Initial Value
                  value: Sports,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: [
                    'Football',
                    'Basketball',
                    'Tennis',
                    'Squash',
                    'TT',
                    'Badminton',
                    'Swimming',
                    'Pool',
                    'Snooker',
                    'Cricket',
                    'Volleyball',
                    'Chess',
                    'Powerlifting'
                  ].map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      Sports = newValue!;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
