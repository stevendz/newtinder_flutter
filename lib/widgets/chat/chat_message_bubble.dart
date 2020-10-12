import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    Key key,
    @required this.messages,
    @required this.user,
    @required this.index,
    @required this.chatPartnerImage,
  }) : super(key: key);

  final List messages;
  final User user;
  final int index;
  final String chatPartnerImage;

  @override
  Widget build(BuildContext context) {
    bool myMessage = user.uid == messages[index]['sender'];
    return Container(
      padding: EdgeInsets.all(8.0),
      margin:
          myMessage ? EdgeInsets.only(left: 75) : EdgeInsets.only(right: 75),
      child: Row(
        textDirection: myMessage ? TextDirection.rtl : TextDirection.ltr,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey.shade100,
            backgroundImage: messages[index]['sender'] == user.uid
                ? NetworkImage(user.photoURL)
                : NetworkImage(chatPartnerImage),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: myMessage
                    ? Colors.blueGrey.withOpacity(0.1)
                    : Colors.indigoAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                messages[index]['message'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
