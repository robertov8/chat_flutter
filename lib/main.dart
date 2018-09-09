import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  Firestore.instance
      .collection('teste')
      .document('teste')
      .setData({'teste': 'teste'});

  DocumentSnapshot getSnapshot =
      await Firestore.instance.collection('teste').document('teste').get();
  print("getSnapshot: ${getSnapshot.documentID}");

  QuerySnapshot querySnapshot =
      await Firestore.instance.collection('teste').getDocuments();

  for (DocumentSnapshot doc in querySnapshot.documents) {
    print("querySnapshot: ${doc.documentID}");
  }

  Firestore.instance.collection('teste').snapshots().listen((snapshot) {

    for (DocumentSnapshot doc in snapshot.documents) {
      print("listen: ${doc.data}");
    }
  });

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
