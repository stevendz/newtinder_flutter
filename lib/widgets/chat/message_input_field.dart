import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController messageController;
  final Function sendMessage;
  const MessageInputField({
    Key key,
    @required this.messageController,
    @required this.sendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.1),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                controller: messageController,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
