import 'package:application1/src/features/core/screens/upload_pdf/upload_pdf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PreviousYearPapers extends StatefulWidget {
  const PreviousYearPapers({super.key});

  @override
  State<PreviousYearPapers> createState() => _PreviousYearPapersState();
}

class _PreviousYearPapersState extends State<PreviousYearPapers> {
  var collageName,
      branchName,
      semesterName,
      subjectName,
      collageId,
      branchId,
      semesterId,
      subjectId,
      examName,
      examId;
  var setDefaultMake = true, setDefaultMakeModel = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('collageName: $collageName');
    debugPrint('branchName: $branchName');
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              Center(
                  child: Text(
                "Previous year papers",
                style: Theme.of(context).textTheme.displaySmall,
              )),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Collages')
                        .orderBy('Name')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // Safety check to ensure that snapshot contains data
                      // without this safety check, StreamBuilder dirty state warnings will be thrown
                      if (!snapshot.hasData) return Container();
                      // Set this value for default,
                      // setDefault will change if an item was selected
                      // First item from the List will be displayed
                  collageName = snapshot.data!.docs.isNotEmpty ? snapshot.data?.docs[0].get('Name') : '';
                    //  collageName = snapshot.data?.docs[0].get('Name');
                      if (setDefaultMake) {
                        debugPrint('setDefault make: $collageName');
                      }
                      return DropdownButtonFormField(
                        hint: const Text('Select collage name'),
                        isExpanded: true,
                        value: collageName,
                        items: snapshot.data?.docs.map((value) {
                          //collageId = value.id;
                          return DropdownMenuItem(
                            value: value.get('Name'),
                            child: Text('${value.get('Name')}'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            // Store the document ID of the selected branch
                            collageId = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value)
                                .id;
                                
                            collageName = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value);
        
                            debugPrint('collage ID: $collageId');
                            debugPrint('collage branch: $value');
                            // Selected value will be stored
                            branchName = value;
                            // Default dropdown value won't be displayed anymore
                            setDefaultMake = false;
                            // Set makeModel to true to display the first car from the list
                            setDefaultMakeModel = true;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: collageName != null
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Collages')
                                .doc(collageId)
                                .collection('Branches')
                                .orderBy('Name')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              // Safety check to ensure that snapshot contains data
                              // without this safety check, StreamBuilder dirty state warnings will be thrown
                              if (!snapshot.hasData) return Container();
                              // Set this value for default,
                              // setDefault will change if an item was selected
                              // First item from the List will be displayed
        
                              branchName = snapshot.data!.docs.isNotEmpty ? snapshot.data?.docs[0].get('Name') : '';
                             // branchName = snapshot.data?.docs[0].get('Name');
                              if (setDefaultMake) {
                                debugPrint('setDefault make: $branchName');
                              }
                              return DropdownButtonFormField(
                                hint: const Text('Select branch name'),
                                isExpanded: true,
                                value: branchName,
                                items: snapshot.data?.docs.map((value) {
                                  //branchId = value.id;
                                  return DropdownMenuItem(
                                    value: value.get('Name'),
                                    child: Text('${value.get('Name')}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // Store the document ID of the selected branch
                                    branchId = snapshot.data?.docs
                                        .firstWhere(
                                            (doc) => doc.get('Name') == value)
                                        .id;
        
                                        branchName = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value);
                                    debugPrint('Branch ID: $branchId');
                                    debugPrint('Selected branch: $value');
                                    // Selected value will be stored
                                    branchName = value;
                                    // Default dropdown value won't be displayed anymore
                                    setDefaultMake = false;
                                    // Set makeModel to true to display the first car from the list
                                    setDefaultMakeModel = true;
                                  });
                                },
                              );
                            },
                          )
                        : Container(
                            child: const Text('Processing...'),
                          )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: branchName != null
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Collages')
                                .doc(collageId)
                                .collection('Branches')
                                .doc(branchId)
                                .collection('Semester')
                                .orderBy('Name')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              // Safety check to ensure that snapshot contains data
                              // without this safety check, StreamBuilder dirty state warnings will be thrown
                              if (!snapshot.hasData) return Container();
                              // Set this value for default,
                              // setDefault will change if an item was selected
                              // First item from the List will be displayed
                              semesterName = snapshot.data!.docs.isNotEmpty ? snapshot.data?.docs[0].get('Name') : '';
                              //semesterName = snapshot.data?.docs[0].get('Name');
                              if (setDefaultMake) {
                                debugPrint('setDefault make: $semesterName');
                              }
                              return DropdownButtonFormField(
                                hint: const Text('Select semester name'),
                                isExpanded: false,
                                value: semesterName,
                                items: snapshot.data?.docs.map((value) {
                                  //semesterId = value.id;
                                  return DropdownMenuItem(
                                    value: value.get('Name'),
                                    child: Text('${value.get('Name')}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // Store the document ID of the selected branch
                                    semesterId = snapshot.data?.docs
                                        .firstWhere(
                                            (doc) => doc.get('Name') == value)
                                        .id;
                                        semesterName = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value);
                                    debugPrint('Branch ID: $semesterId');
                                    debugPrint('Selected branch: $value');
                                    // Selected value will be stored
                                    branchName = value;
                                    // Default dropdown value won't be displayed anymore
                                    setDefaultMake = false;
                                    // Set makeModel to true to display the first car from the list
                                    setDefaultMakeModel = true;
                                  });
                                },
                              );
                            },
                          )
                        : Container(
                            child: const Text('Processing...'),
                          )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: semesterName != null
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Collages')
                                .doc(collageId)
                                .collection('Branches')
                                .doc(branchId)
                                .collection('Semester')
                                .doc(semesterId)
                                .collection('Subjects')
                                .orderBy('Name')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              // Safety check to ensure that snapshot contains data
                              // without this safety check, StreamBuilder dirty state warnings will be thrown
                              if (!snapshot.hasData) return Container();
                              // Set this value for default,
                              // setDefault will change if an item was selected
                              // First item from the List will be displayed
                              subjectName = snapshot.data!.docs.isNotEmpty ? snapshot.data?.docs[0].get('Name') : '';
                             // subjectName = snapshot.data?.docs[0].get('Name');
                              if (setDefaultMake) {
                                debugPrint('setDefault make: $subjectName');
                              }
                              return DropdownButtonFormField(
                                hint: const Text('Select subject name'),
                                isExpanded: false,
                                value: subjectName,
                                items: snapshot.data?.docs.map((value) {
                                  //subjectId = value.id;
                                  return DropdownMenuItem(
                                    value: value.get('Name'),
                                    child: Text('${value.get('Name')}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // Store the document ID of the selected branch
                                    subjectId = snapshot.data?.docs
                                        .firstWhere(
                                            (doc) => doc.get('Name') == value)
                                        .id;
                                        subjectName = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value);
                                    debugPrint('Branch ID: $subjectId');
                                    debugPrint('Selected branch: $value');
                                    // Selected value will be stored
                                    branchName = value;
                                    // Default dropdown value won't be displayed anymore
                                    setDefaultMake = false;
                                    // Set makeModel to true to display the first car from the list
                                    setDefaultMakeModel = true;
                                  });
                                },
                              );
                            },
                          )
                        : Container(
                            child: const Text('Processing...'),
                          )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: semesterName != null
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Collages')
                                .doc(collageId)
                                .collection('Branches')
                                .doc(branchId)
                                .collection('Semester')
                                .doc(semesterId)
                                .collection('Subjects')
                                .doc(subjectId)
                                .collection('Exams')
                                .orderBy('Name')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              // Safety check to ensure that snapshot contains data
                              // without this safety check, StreamBuilder dirty state warnings will be thrown
                              if (!snapshot.hasData) return Container();
                              // Set this value for default,
                              // setDefault will change if an item was selected
                              // First item from the List will be displayed
                              examName = snapshot.data!.docs.isNotEmpty ? snapshot.data?.docs[0].get('Name') : '';
                             // examName = snapshot.data?.docs[0].get('Name');
                              if (setDefaultMake) {
                                debugPrint('setDefault make: $examName');
                              }
                              return DropdownButtonFormField(
                                hint: const Text('Select subject name'),
                                isExpanded: false,
                                value: examName,
                                items: snapshot.data?.docs.map((value) {
                                  //examId = value.id;
                                  return DropdownMenuItem(
                                    value: value.get('Name'),
                                    child: Text('${value.get('Name')}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // Store the document ID of the selected branch
                                    examId = snapshot.data?.docs
                                        .firstWhere(
                                            (doc) => doc.get('Name') == value)
                                        .id;
                                        examName = snapshot.data?.docs
                                .firstWhere((doc) => doc.get('Name') == value);
                                    debugPrint('Branch ID: $examId');
                                    debugPrint('Selected branch: $value');
                                    // Selected value will be stored
                                    branchName = value;
                                    // Default dropdown value won't be displayed anymore
                                    setDefaultMake = false;
                                    // Set makeModel to true to display the first car from the list
                                    setDefaultMakeModel = true;
                                  });
                                },
                              );
                            },
                          )
                        : Container(
                            child: const Text('Processing...'),
                          )),
              ),
              const SizedBox(height: 80),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  ),
                  child: Text('Open Route',style: Theme.of(context).textTheme.headline4,),
                  onPressed: () {
          if (collageId != null && branchId != null && semesterId != null && branchId != null && examId != null) {
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadPdf(
              collageId: collageId,
              branchId: branchId,
              semesterId: semesterId,
              subjectId: subjectId,
              examId: examId,
            ),
          ),
            );
          } else {
            showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please select all required fields.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
            );
          }
        },
                ),
              ),
            ],
          ),
      
      ),
    );
  }
}
