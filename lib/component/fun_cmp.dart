import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<Uint8List> assetstoFile({
  required String fileName,
}) async {
  Directory tempDir = await getTemporaryDirectory();
  final tempPath = '${tempDir.path}/${fileName.split('/').last}';
  final byteData = await rootBundle.load(fileName);
  File file = File(tempPath);
  File files = await file.writeAsBytes(byteData.buffer.asUint8List());
  return files.readAsBytesSync();
}

copyPath({
  required String sourceFilePath,
}) async {
  final sourceFile = File(sourceFilePath);
  Directory? downloadsDir = await getDownloadsDirectory();

  print("---------------->downloadsDir--->${downloadsDir!.path}");

  final destinationDirPath =
      '${downloadsDir!.path}/${sourceFile.uri.pathSegments.last}';

  final destinationDir = Directory(destinationDirPath);

  // if (!await destinationDir.exists()) {
  //   await destinationDir.create(recursive: true);
  // }

  await sourceFile.copy(destinationDir.path);
}
