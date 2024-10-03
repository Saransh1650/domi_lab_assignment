import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class MediaFiles extends GetxController {
  RxList pdfList =
      RxList(["sample.pdf", "sample-2.pdf", "sample-3.pdf", "sample-4.pdf"]);

  RxList picsList = RxList([
    "assets/1.webp",
    "assets/2.webp",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpg",
    "assets/6.jpeg",
    "assets/7.jpg",
    "assets/8.jpeg"
  ]);

  String getPath(String filePath) {
    return path.basename(filePath);
  }

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pdfList.add(result.paths[0]);
      print(result.paths);
      print(pdfList);
      //= result.paths.where((path) => path != null).map((path) => path!).toList();
    }
  }
}
