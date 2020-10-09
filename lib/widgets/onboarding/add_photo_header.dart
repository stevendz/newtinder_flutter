import 'package:flutter/material.dart';

class AddPhotoHeader extends StatelessWidget {
  const AddPhotoHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Add Photos',
        style: TextStyle(
          fontSize: 50,
          color: Colors.blueGrey.shade800,
        ),
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Add atleast 2 photos to continue',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
