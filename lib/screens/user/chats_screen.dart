import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/screens/user/chat_screen.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  CollectionReference chatsDb = FirebaseFirestore.instance.collection('chats');
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chatsDb.where('members', arrayContains: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> data = snapshot.data.docs.toList();

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String chatPartnerUid;
              data[0].data()['members'].toList().forEach((uid) {
                if (uid != null && uid != user.uid) chatPartnerUid = uid;
              });
              print(chatPartnerUid);
              return FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        chatId: data[0].id,
                        chatPartnerUid: chatPartnerUid,
                      ),
                    ),
                  );
                },
                child: Text(data[0].id),
              );
            },
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
