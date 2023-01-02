import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ModalImage {
  final picker = ImagePicker();
  FileType _pickingType = FileType.image;
  String profilePicture = "";

  final Function(String) onImageSelect;
  bool isImageCroppable;
  var openGallery;
  ModalImage({required this.onImageSelect, required this.isImageCroppable});
  callGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (Utility.isNotNullEmptyOrFalse(image?.path ?? '')) {
      if (isImageCroppable) {
        cropImage(image!.path).then((croppedImagePath) {
          if (Utility.isNotNullEmptyOrFalse(croppedImagePath)) {
            onImageSelect(croppedImagePath);
          }
        });
      } else {
        onImageSelect(image!.path);
      }
    }
  }

  callCamera() async {
    var image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 20,
    );
    image?.path != null ? onImageSelect(image!.path) : null;
  }

  Future<String> cropImage(String imagePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.rectangle,
        compressQuality: 70,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              showCropGrid: false,
              toolbarColor: const Color.fromARGB(240, 132, 104, 236),
              // toolbarColor: Colors.lightGreen,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ]);

    if (Utility.isNotNullEmptyOrFalse(croppedImage)) {
      return croppedImage!.path;
    } else {
      return "";
    }
  }

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 235.0,
            color: const Color.fromRGBO(0, 0, 0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Gallery"),
                  onTap: callGallery,
                ),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text("Camera"),
                  onTap: callCamera,
                ),
                ListTile(
                  leading: const Icon(Icons.cancel),
                  title: const Text("Cancel"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
