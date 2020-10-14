import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtinder/screens/user/chat_screen.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:newtinder/widgets/buttons/button_colorful_border.dart';

class MatchDialog extends StatefulWidget {
  const MatchDialog({
    Key key,
    @required this.chatsDb,
    @required this.user,
    @required this.matchUid,
  }) : super(key: key);

  final CollectionReference chatsDb;
  final User user;
  final String matchUid;

  @override
  _MatchDialogState createState() => _MatchDialogState();
}

class _MatchDialogState extends State<MatchDialog> {
  CollectionReference usersDb = FirebaseFirestore.instance.collection("users");
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usersDb.doc(widget.matchUid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map matchData = snapshot.data.data();
          return Dialog(
            insetPadding: EdgeInsets.all(0),
            backgroundColor: Colors.black54,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('It\'s a Match!',
                      style: GoogleFonts.norican(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 50))),
                  Text(
                      'You and ${matchData['username']} have liked each other.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.2,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage: NetworkImage(user.photoURL),
                      ),
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.2,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage: NetworkImage(matchData['profilePic']),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.5),
                  ButtonColorful(
                    onPressed: contactMatch,
                    title: 'Send message',
                  ),
                  ButtonColorfulBorder(
                    title: 'Keep swiping',
                    onPressed: () {
                      print('keep swiping');
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void contactMatch() async {
    DocumentReference chat = await widget.chatsDb.add({
      'members': [widget.user.uid, widget.matchUid]
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          chatId: chat.id,
          chatPartnerUid: widget.matchUid,
        ),
      ),
    );
  }
}
