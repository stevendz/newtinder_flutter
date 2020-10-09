import 'package:flutter/material.dart';
import 'dart:math' as math;

class AddPhotoCard extends StatelessWidget {
  final List photoPaths;
  final int index;
  final Function setPhotoUrl;
  const AddPhotoCard({
    Key key,
    @required this.photoPaths,
    @required this.index,
    @required this.setPhotoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade300,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: photoPaths[index] != null
                  ? DecorationImage(image: photoPaths[index], fit: BoxFit.cover)
                  : null,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              setPhotoUrl(index);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                gradient: photoPaths[index] == null
                    ? LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xffFF7759),
                          Color(0xffFF427A),
                        ],
                      )
                    : null,
              ),
              child: FittedBox(
                child: photoPaths[index] == null
                    ? Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    : Transform.rotate(
                        angle: math.pi / 12 * 45,
                        child: Icon(
                          Icons.add,
                          color: Colors.redAccent,
                        ),
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}