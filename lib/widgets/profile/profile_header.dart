import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(userData['profilePic']),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              mini: true,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey.shade200,
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userData['username'],
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(
              'assets/icons/verify.svg',
              height: 18,
              color: Colors.blueGrey.shade100,
            ),
          ],
        ),
      ],
    );
  }
}
