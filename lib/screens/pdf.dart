import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfListScreen extends StatefulWidget {
  const PdfListScreen({super.key});

  @override
  _PdfListScreenState createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {
  List<FileSystemEntity> _pdfFiles = [];

  @override
  void initState() {
    super.initState();
    _getPdfFiles();
  }

  Future<void> _getPdfFiles() async {
    // Request storage permissions
    var status = await Permission.storage.request();

    if (status.isGranted) {
      // Get the storage directory
      Directory? directory = await getExternalStorageDirectory();
      String? path = directory?.path;

      // List all files in the directory
      _pdfFiles = Directory(path!).listSync().where((item) {
        return item.path.endsWith('.pdf');
      }).toList();

      setState(() {});
    } else {
      // Handle the case when permission is denied
      print("Permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF List"),
      ),
      body: _pdfFiles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _pdfFiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pdfFiles[index].path.split('/').last),
            onTap: () {
              // Handle PDF file tap
              // You can use a package like open_file or pdf viewer to open the file
            },
          );
        },
      ),
    );
  }
}

