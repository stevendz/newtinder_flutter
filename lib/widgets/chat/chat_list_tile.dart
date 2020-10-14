import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/screens/user/chat_screen.dart';

class ChatListTile extends StatefulWidget {
  const ChatListTile({
    Key key,
    @required this.data,
    @required this.user,
    @required this.index,
  }) : super(key: key);

  final List<QueryDocumentSnapshot> data;
  final user;
  final int index;

  @override
  _ChatListTileState createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  String chatPartnerUid;

  @override
  void initState() {
    getChatPartnerUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: usersDb.doc(chatPartnerUid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map chatPartner = snapshot.data.data();
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    chatId: widget.data[widget.index].id,
                    chatPartnerUid: chatPartnerUid,
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              backgroundImage: NetworkImage(chatPartner['profilePic']),
            ),
            title: Text(chatPartner['username']),
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void getChatPartnerUid() {
    widget.data[widget.index].data()['members'].toList().forEach((uid) {
      if (uid != null && uid != widget.user.uid) chatPartnerUid = uid;
    });
  }
}
