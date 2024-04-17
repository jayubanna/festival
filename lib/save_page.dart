import 'dart:io';

import 'package:festival_ui/util.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SaveImage extends StatefulWidget {
  const SaveImage({super.key});

  @override
  State<SaveImage> createState() => _SaveImageState();
}

class _SaveImageState extends State<SaveImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)),
        title: Text("Save Image"),
      ),
      body: Column(
        children: [
          savedImg != null ? Image.memory(savedImg!) : Text("Not Save"),
          ElevatedButton.icon(
            onPressed: ()  async {
              Directory add = await getApplicationDocumentsDirectory();
              String myFilePath = "${add.path}/festival.png";
              print(myFilePath);

              File file = File(myFilePath);
              if (savedImg != null) {
                await file.writeAsBytes(savedImg!);
                print(file.path);
                Share.shareXFiles(
                  [
                    XFile(file.path),
                    XFile(file.path),
                  ],
                );
              }
            },
            icon: Icon(Icons.share),
            label: Text("Share"),
          ),
          ElevatedButton.icon(
            onPressed: () async{
              Directory add = await getApplicationDocumentsDirectory();
              String myFilePath = "${add.path}/festival.png";
              print(myFilePath);

              File file = File(myFilePath);
              if (savedImg != null) {
                await file.writeAsBytes(savedImg!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
              }
            },
            icon: Icon(Icons.download),
            label: Text("Download"),
          ),
        ],
      ),
    );
  }
}
