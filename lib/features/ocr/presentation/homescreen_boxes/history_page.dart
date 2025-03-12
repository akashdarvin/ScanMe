// import 'package:flutter/material.dart';

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
        
//         title: Text("History"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> scannedIDs = []; // List to store scanned IDs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: scannedIDs.isEmpty
          ? Center(child: Text("No scanned IDs yet!"))
          : ListView.builder(
              itemCount: scannedIDs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text(scannedIDs[index]),
                );
              },
            ),
    );
  }
}
