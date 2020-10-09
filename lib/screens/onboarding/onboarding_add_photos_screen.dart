import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:newtinder/widgets/onboarding/add_photo_card.dart';
import 'package:newtinder/widgets/onboarding/add_photo_header.dart';

class OnboardingAddPhotosScreen extends StatefulWidget {
  @override
  _OnboardingAddPhotosScreenState createState() =>
      _OnboardingAddPhotosScreenState();
}

class _OnboardingAddPhotosScreenState extends State<OnboardingAddPhotosScreen> {
  List photoPaths = [
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  isValid() {
    List validPhotos = [];
    photoPaths.forEach((element) {
      if (element != null) {
        validPhotos.add(element);
      }
    });
    return validPhotos.length >= 2;
  }

  setPhotoUrl(index) async {
    try {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );
      setState(() {
        photoPaths[index] = AssetImage(
          pickedFile.path,
        );
      });
      isValid();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            height: 25,
            color: Colors.blueGrey.shade100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddPhotoHeader(),
            Container(
              height: MediaQuery.of(context).size.width * 0.75,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: photoPaths.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return AddPhotoCard(
                    photoPaths: photoPaths,
                    index: index,
                    setPhotoUrl: setPhotoUrl,
                  );
                },
              ),
            ),
            ButtonColorful(
              title: 'Continue',
              onPressed: isValid()
                  ? () {
                      print('valid');
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
