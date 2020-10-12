import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({
    Key key,
    @required this.messageController,
  }) : super(key: key);

  final TextEditingController messageController;

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
            onPressed: () {
              print(messageController.text);
            },
          ),
        ],
      ),
    );
  }
}
