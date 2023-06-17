import 'package:flutter/material.dart';
import 'package:sample_flutter_app/utils/file_utils.dart';

class FileStorageScreen extends StatefulWidget {
  @override
  _FileStorageScreenState createState() => _FileStorageScreenState();
}

class _FileStorageScreenState extends State<FileStorageScreen> {

  TextEditingController textBoxController1 = TextEditingController();
  TextEditingController textBoxController2 = TextEditingController();

  void _showMessage(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    textBoxController1.dispose();
    textBoxController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Write and Read Tests"),),

      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextField(
                maxLines: 3,
                controller: textBoxController1,
              ),
              TextButton(
                child: Text("Write!"),
                onPressed: () {
                  FileUtils.save(textBoxController1.text).then((result) {
                    if (result) {
                      _showMessage(context, "File Saved Successfully");
                      textBoxController1.clear();
                    }
                    else
                      _showMessage(context, "A problem occured while writing the text content to the file");
                  });
                },
              ),

              TextField(
                maxLines: 4,
                controller: textBoxController2,
                readOnly: true,
              ),
              TextButton(
                  onPressed: () {
                    FileUtils.load().then((data) {
                      textBoxController2.text = data;
                      _showMessage(context, "File Loaded Successfully");
                    });
                  },
                  child: Text("Read!")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
