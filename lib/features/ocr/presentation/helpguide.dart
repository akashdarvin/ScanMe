import 'package:flutter/material.dart';

class Helpguide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Help centre"),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFAQItem(
                "How to scan an ID?", 
                "Tap on the 'Camera' button to open the scanner. Align the ID within the frame, and the app will automatically capture and process the ID details."
            ),
            _buildFAQItem(
                "How to access scanned history?", 
                "Tap on the 'History' button to view a list of previously scanned IDs. You can select an entry to view its details."
            ),
            _buildFAQItem(
                "How to manually enter ID details?", 
                "Currently, manual entry is not available. The app is designed to scan IDs using the camera or gallery. Future updates may include this feature."
            ),
            _buildFAQItem(
                "How to share scanned IDs?", 
                "After scanning an ID, navigate to the history section. Select the scanned ID you want to share, and tap on the 'Share' option to send it via email, messaging apps, or other available sharing methods."
            ),
            _buildFAQItem(
                "What to do if scanning fails?", 
                "Ensure good lighting, hold the ID steady, and make sure the camera lens is clean. Try adjusting the distance between the ID and the camera. If the issue persists, use the gallery option to upload a clearer image."
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
