import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/deatils.dart';
import 'package:final_project/screens/show_review.dart';
import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  Future<void> sendReview() {
    // Call the user's CollectionReference to add a new user
    return firestor
        .collection('review')
        .doc()
        .set({
          'username': name.text,
          'review': describetion.text,
          'sendtime': DateTime.now().toString(),
          'time': FieldValue.serverTimestamp(),
          'rate': sliderVal.toString() // Stokes and Sons
        })
        .then((value) => print("Review Added"))
        .catchError((error) => print("Failed to add review: $error"));
  }

  double sliderVal = 0;
  TextEditingController name = TextEditingController();
  TextEditingController describetion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ReviewStreamBuilder()));
          },
        ),
        title: const Text('Add Review', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Type your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'How was your experience?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: describetion,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Describe your experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Star',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: sliderVal,
              min: 0.0,
              max: 5.0,
              divisions: 5,
              activeColor: Colors.purple,
              inactiveColor: Colors.grey[300],
              onChanged: (value) {
                setState(() {
                  sliderVal = value;
                });
              },
            ),
            const SizedBox(height: 250),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (name.text.isNotEmpty && describetion.text.isNotEmpty) {
                    sendReview();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Review',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Future<void> sendmessage() {
  // Call the user's CollectionReference to add a new user
  return firestor
      .collection('review')
      .doc()
      .set({
        'username': '', // John Doe
        'review': FieldValue.serverTimestamp(),
        'rate':  // Stokes and Sons
      })
      .then((value) => print("Review Added"))
      .catchError((error) => print("Failed to add review: $error"));
}
*/
var firestor = FirebaseFirestore.instance;
