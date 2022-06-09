import 'dart:io';

getFileSize({required String filepath}) async {
  var file = File(filepath);
  int fileSize = await file.length();
  return fileSize;
}

bool isImage(String path) {
  RegExp regType = RegExp(r'.jpeg|.jpg|.JPG|.png|.PNG');
  return regType.hasMatch(path.substring(path.length - 4, path.length));
}
