/*
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadPdf extends StatefulWidget {
  final String collageId, branchId, semesterId, subjectId, examId;
  const UploadPdf({
    Key? key,
     required this.collageId, required this.branchId, required this.semesterId, required this.subjectId,required this.examId
  }) : super(key: key);

  @override
  State<UploadPdf> createState() => _UploadPdfState();
}

class _UploadPdfState extends State<UploadPdf> {
  String url = "";
  int? number;
  uploadDataToFirebase() async {
    //pick pdf file
    number = Random().nextInt(10);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var file = result?.files.first.path;
    String name = DateTime.now().millisecondsSinceEpoch.toString();
// upload file to firebase
    var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
    UploadTask task = pdfFile.putString(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();

    //upload file to cloud firebase
    await FirebaseFirestore.instance
        .collection(
            "Collages/collageId/Branches/branchId/Semester/semesterId/Subjects/subjectId/examId")
        .doc()
        .set({'fileUrl': url, 'num': "MidTermPaper-" + number.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Previous year Papers",
          style: Theme.of(context).textTheme.headline3,
        )),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("file").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View(url: x['fileUrl'])));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(x["num"]),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadDataToFirebase,
        child: Icon(Icons.add),
      ),
    );
  }
}

class View extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final url;
  View({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF View"),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,
      ),
    );
  }
}


*/

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadPdf extends StatefulWidget {
  final String collageId, branchId, semesterId, subjectId, examId;
  const UploadPdf(
      {Key? key,
      required this.collageId,
      required this.branchId,
      required this.semesterId,
      required this.subjectId,
      required this.examId})
      : super(key: key);

  @override
  State<UploadPdf> createState() => _UploadPdfState();
}

class _UploadPdfState extends State<UploadPdf> {
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
            'Collages/${widget.collageId}/${widget.branchId}/${widget.semesterId}/${widget.subjectId}/${widget.examId}')
        .child('Exam-$number.pdf');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);


         TaskSnapshot? snapshot = await uploadTask;
          url = (await snapshot.ref.getDownloadURL());
          await FirebaseFirestore.instance
              .collection(
                  "Collages/${widget.collageId}/Branches/${widget.branchId}/Semester/${widget.semesterId}/Subjects/${widget.subjectId}/Exams/${widget.examId}/ExamPaper")
              .doc()
              .set(
                  {'fileUrl': url, 'num': "ExamPaper-$number"});


    print("done..!");
    return Future.value(uploadTask);

    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 254, 255, 255),
          title: const Text("FlutterFire PDF"),
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
          stream: FirebaseFirestore.instance.collection("Collages/${widget.collageId}/Branches/${widget.branchId}/Semester/${widget.semesterId}/Subjects/${widget.subjectId}/Exams/${widget.examId}/ExamPaper").snapshots(),
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
                            child: Center(child: Text(x["num"],style: Theme.of(context).textTheme.displaySmall,)),
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
        title: const Text("PDF View"),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,
      ),
    );
  }
}
