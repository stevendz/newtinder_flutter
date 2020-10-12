import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final chatId;

  const ChatScreen({Key key, this.chatId}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference usersDb = FirebaseFirestore.instance.collection('users');
  CollectionReference chatsDb = FirebaseFirestore.instance.collection('chats');
  User user = FirebaseAuth.instance.currentUser;
  String chatPartnerImage = 'https://i.gifer.com/VLGA.gif';

  Future<void> fetchChatPartnerImage(data) async {
    String chatPartnerUid;
    data['members'].forEach((member) {
      if (member != user.uid) chatPartnerUid = member;
    });
    DocumentSnapshot chatPartnerData = await usersDb.doc(chatPartnerUid).get();
    setState(() {
      chatPartnerImage = chatPartnerData.data()['profilePic'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: chatsDb.doc(widget.chatId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data();
          if (chatPartnerImage == 'https://i.gifer.com/VLGA.gif') {
            fetchChatPartnerImage(data);
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              centerTitle: true,
              title: Text(
                'Team Tinder',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.redAccent),
                  onPressed: () {},
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: data['messages'].length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade100,
                        backgroundImage:
                            data['messages'][index]['sender'] == user.uid
                                ? NetworkImage(user.photoURL)
                                : NetworkImage(chatPartnerImage)),
                    Text(data['messages'][index]['message']),
                  ],
                );
              },
            ),
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
