import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magazineinfos/pages/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAGAZINE INFOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Magazine Infos'), centerTitle: true),

      body: const MagazineInformation(),
    );
  }
}

class MagazineInformation extends StatefulWidget {
  const MagazineInformation({super.key});

  @override
  State<MagazineInformation> createState() => _MagazineInformationState();
}

class _MagazineInformationState extends State<MagazineInformation> {
  final Stream<QuerySnapshot> _streamMag = FirebaseFirestore.instance
      .collection('magazines')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _streamMag,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name'] ?? 'Nom inconnu'),
              subtitle: Text(data['couverture'] ?? 'Aucune couverture'),
            );
          }).toList(),
        );
      },
    );
  }
}
