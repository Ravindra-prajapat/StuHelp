import 'dart:io';
import 'dart:math';
import 'package:application1/src/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadAssignmentPdf extends StatefulWidget {
  final String collageId, branchId, semesterId, subjectId;
  const UploadAssignmentPdf({
    Key? key,
    required this.collageId,
    required this.branchId,
    required this.semesterId,
    required this.subjectId,
  }) : super(key: key);

  @override
  State<UploadAssignmentPdf> createState() => _UploadAssignmentPdfState();
}

class _UploadAssignmentPdfState extends State<UploadAssignmentPdf> {
  String url = "";
  int? number;

  Future<firebase_storage.UploadTask?> uploadFile(File file) async {
    if (file == null) {
      return null;
    }

    firebase_storage.UploadTask uploadTask;
    number = Random().nextInt(10);
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'Collages/${widget.collageId}/${widget.branchId}/${widget.semesterId}/${widget.subjectId}')
        .child('Assignment-$number.pdf');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    // TaskSnapshot? snapshot = await uploadTask;
    // url = (await snapshot.ref.getDownloadURL());
    // await FirebaseFirestore.instance
    //     .collection(
    //         "Collages/${widget.collageId}/Branches/${widget.branchId}/Semester/${widget.semesterId}/Subjects/${widget.subjectId}/Assignment/")
    //     .doc()
    //     .set({'fileUrl': url, 'num': "ExamPaper-$number"});

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    TaskSnapshot? snapshot = await uploadTask;
    url = (await snapshot.ref.getDownloadURL());

    String? assignmentName = await promptAssignmentName(context);
    if (assignmentName != null) {
      await FirebaseFirestore.instance
          .collection(
              "Collages/${widget.collageId}/Branches/${widget.branchId}/Semester/${widget.semesterId}/Subjects/${widget.subjectId}/Assignment/")
          .doc()
          .set({'fileUrl': url, 'num': assignmentName});
    }

    print("done..!");
    return Future.value(uploadTask);
  }

  Future<String?> promptAssignmentName(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Assignment Name'),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_textFieldController.text);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tPrimaryColor,
        title: Center(
            child: Text(
          "Assignments       ",
          style: Theme.of(context).textTheme.headline3,
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          final path = await FlutterDocumentPicker.openDocument();
          print("path is : $path");
          File file = File(path!);
          firebase_storage.UploadTask? task = await uploadFile(file);
        },
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(
                "Collages/${widget.collageId}/Branches/${widget.branchId}/Semester/${widget.semesterId}/Subjects/${widget.subjectId}/Assignment/")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View(url: x['fileUrl'])));
                    },
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        elevation: 10,
                        child: Center(
                            child: Text(
                          x["num"],
                          style: Theme.of(context).textTheme.displaySmall,
                        )),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class View extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final url;
  View({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tPrimaryColor,
        title: Center(
            child: Text(
          "View Assignment       ",
          style: Theme.of(context).textTheme.headline3,
        )),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,
      ),
    );
  }
}



