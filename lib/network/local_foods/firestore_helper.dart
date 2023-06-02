import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:recipes/ui/recipes/custom_detail.dart';
import 'package:recipes/ui/recipes/custom_list.dart';

class LocalFoods extends StatefulWidget {
  const LocalFoods({Key? key}) : super(key: key);

  @override
  State<LocalFoods> createState() => _LocalFoodsState();
}

class _LocalFoodsState extends State<LocalFoods> {
  static get_stream() =>
      FirebaseFirestore.instance.collection('customfoods').doc('details').get();
  static get_stream_col() =>
      FirebaseFirestore.instance.collection('customfoods').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QueryDocumentSnapshot>(
        stream: get_stream_col(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget('');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(data[index].title),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
