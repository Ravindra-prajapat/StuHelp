// import 'package:flutter/material.dart';

// class AssignmentSearchDelegate extends SearchDelegate<String> {
//   final List<QueryDocumentSnapshot> assignments;

//   AssignmentSearchDelegate(this.assignments);

//   @override
//   String get searchFieldLabel => 'Search Assignments';

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return theme.copyWith(
//       textTheme: TextTheme(
//         headline6: TextStyle(
//           color: Colors.white,
//           fontSize: 18.0,
//         ),
//       ),
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<QueryDocumentSnapshot> filteredAssignments = assignments.where((assignment) {
//       final assignmentName = assignment['num'].toString().toLowerCase();
//       return assignmentName.contains(query.toLowerCase());
//     }).toList();

//     return ListView.builder(
//       itemCount: filteredAssignments.length,
//       itemBuilder: (context, i) {
//         QueryDocumentSnapshot x = filteredAssignments[i];
//         return InkWell(
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => View(url: x['fileUrl']),
//               ),
//             );
//           },
//           child: Container(
//             height: 150,
//             padding: const EdgeInsets.all(20),
//             child: Card(
//               elevation: 10,
//               child: Center(
//                 child: Text(
//                   x["num"],
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<QueryDocumentSnapshot> filteredAssignments = assignments.where((assignment) {
//       final assignmentName = assignment['num'].toString().toLowerCase();
//       return assignmentName.contains(query.toLowerCase());
//     }).toList();

//     return ListView.builder(
//       itemCount: filteredAssignments.length,
//       itemBuilder: (context, i) {
//         QueryDocumentSnapshot x = filteredAssignments[i];
//         return InkWell(
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => View(url: x['fileUrl']),
//               ),
//             );
//           },
//           child: Container(
//             height: 150,
//             padding: const EdgeInsets.all(20),
//             child: Card(
//               elevation: 10,
//               child: Center(
//                 child: Text(
//                   x["num"],
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
