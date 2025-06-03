import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ui/DetailsData.dart';

class MedicationsListScreen extends StatelessWidget {
  const MedicationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blue.shade800;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الأدوية'),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: Container(),
      ),
      backgroundColor: Colors.grey.shade100,
      body: user != null
          ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('medications')
                  .where('userId', isEqualTo: user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('لم يتم إضافة أي دواء بعد',
                        style: TextStyle(fontSize: 16)),
                  );
                }

                final docs = snapshot.data!.docs;
                return details_data(docs);
              },
            )
          : Center(
              child: Text('لم يتم إضافة أي دواء بعد',
                  style: TextStyle(fontSize: 16)),
            ),
    );
  }
}
