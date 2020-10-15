import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/chat/chat_list_tile.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chatsDb.where('members', arrayContains: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> chats = snapshot.data.docs.toList();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 16,
                    color: tinderRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ChatListTile(
                      data: chats,
                      user: user,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
