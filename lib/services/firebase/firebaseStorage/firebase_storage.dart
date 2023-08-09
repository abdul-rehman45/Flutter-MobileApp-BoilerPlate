import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();
  FirebaseStorage storage = FirebaseStorage.instance;
  List<ImageModel> images = [];

  Future<void> uploadImage(
    File? file,
    String upoadedBy,
    String description,
  ) async {
    try {
      int now = DateTime.now().millisecondsSinceEpoch;
      String imageName = "name" + now.toString();
      // Uploading the selected image with some custom meta data
      await storage.ref("Images/").child(imageName).putFile(
          file!,
          SettableMetadata(customMetadata: {
            'uploaded_by': upoadedBy,
            'description': description
          }));
      // String uploadedimage = await storage
      //     .ref("Images/")
      //     .child(imageName)
      //     .getDownloadURL()
      //     .toString();

      // print("geting images url......." + uploadedimage);
      // final FullMetadata fileMeta =
      //     await storage.ref("Images/").child(imageName).getMetadata();
      // ImageModel image = ImageModel(
      //   description:
      //       fileMeta.customMetadata?['description'] ?? 'No description',
      //   uploadedBy: fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
      //   path: "",
      //   url: uploadedimage,
      // );
      // images.add(image);

      // Refresh the UI
      // setState(() {});
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<List<ImageModel>> loadImages() async {
    try {
      final ListResult result = await storage.ref("Images").list();
      final List<Reference> allFiles = result.items;

      await Future.forEach<Reference>(allFiles, (file) async {
        final String fileUrl = await file.getDownloadURL();
        print("geting images url......." + fileUrl);
        final FullMetadata fileMeta = await file.getMetadata();
        ImageModel image = ImageModel(
          description:
              fileMeta.customMetadata?['description'] ?? 'No description',
          uploadedBy: fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
          path: file.fullPath,
          url: fileUrl,
          name: file.name,
        );
        images.add(image);
      });

      return images;
    } catch (e) {
      print("error while loading........" + e.toString());
      return images;
    }
  }
}

class ImageModel {
  String? url;
  String? path;
  String? uploadedBy;
  String? description;
  String? name;
  ImageModel(
      {this.url, this.path, this.uploadedBy, this.description, this.name});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    path = json['path'];
    uploadedBy = json['uploaded_by'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['path'] = this.path;
    data['uploaded_by'] = this.uploadedBy;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}
