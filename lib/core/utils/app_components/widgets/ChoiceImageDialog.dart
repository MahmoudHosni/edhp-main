import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChoiceImageDialog {

  getImageDialog(BuildContext context, Function callBack) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: const Text(
              "اختر",
              style: TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  ListTile(
                    onTap: () {
                      callBack(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    title: Text(
                      "معرض الصور",
                      style:
                      Styles.textStyle13W500.copyWith(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  ListTile(
                    onTap: () {
                      callBack(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    title: Text("الكاميرا",
                        style: Styles.textStyle13W500
                            .copyWith(color: Colors.white)),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}