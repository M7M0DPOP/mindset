import 'package:final_project/firebase_options.dart';
import 'package:final_project/screens/deatils.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/show_review.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void initrevielist() async {
  var snapshot = await firestor.collection('review').orderBy('time').get();
  final reviews = snapshot.docs.reversed;

  for (var review in reviews) {
    final reviewusername = review.get('username') ?? 'Unknown';
    final reviewdiscrep = review.get('review');
    final reviewrate = review.get('rate');
    final reviewtime = review.get('sendtime');

    final messageWidget = RewiewShape(
      username: reviewusername,
      reviewDiscrep: reviewdiscrep,
      rate: reviewrate,
      time: reviewtime.toString(),
    );
    reviewWidgets.add(messageWidget);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (reviewWidgets.length == 0) {
    initrevielist();
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
