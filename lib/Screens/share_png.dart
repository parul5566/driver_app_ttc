import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';



class ShareApp extends StatelessWidget {

  final _controller = ScreenshotController();

   ShareApp({Key? key}) : super(key: key);

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share Link',
        text: 'Example share text',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.kampibellbath',
        chooserTitle: 'Example Chooser Title'
    );
  }

  Future<void> shareFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return null;
    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: result.files[0] as String,
    );
  }

  Future<void> shareScreenshot() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath =
        '${directory!.path}/${DateTime.now().toIso8601String()}.png';

    await _controller.captureAndSave(localPath);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
        title: 'Compartilhar comprovante',
        filePath: localPath,
        fileType: 'image/png'
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ShareApp'),
        ),
        body: Center(
          child: Screenshot(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Text('Share text and link'),
                  onPressed: share,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}