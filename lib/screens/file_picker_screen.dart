import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class PdfPicker extends StatefulWidget {
  const PdfPicker({super.key});

  @override
  _PdfPickerState createState() => _PdfPickerState();
}

class _PdfPickerState extends State<PdfPicker> {
  List<String> pdfPaths = [];

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfPaths = result.paths.where((path) => path != null).map((path) => path!).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select PDF'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickPdf,
            child: const Text('Pick PDF Files'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pdfPaths.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pdfPaths[index].split('/').last),
                  onTap: () {
                    OpenFile.open(pdfPaths[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

