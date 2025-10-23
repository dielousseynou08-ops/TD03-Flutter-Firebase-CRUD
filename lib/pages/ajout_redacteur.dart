import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazineinfos/pages/homePage.dart';

class AjouterRedacteur extends StatefulWidget {
  const AjouterRedacteur({super.key});

  @override
  State<AjouterRedacteur> createState() => _AjouterRedacteurState();
}

class _AjouterRedacteurState extends State<AjouterRedacteur> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deskController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Ajouter un Rédacteur',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //demander le nom du Rédacteur
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                //shape: RectangularRangeSliderTrackShape(
              ),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Entrez le nom du Rédacteur',
                  enabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            //demander la spécialité du Rédacteur
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(),
              child: TextFormField(
                controller: deskController,
                decoration: InputDecoration(
                  hintText: 'Spécialité du Rédacteur',
                  enabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),

            // Button de validation pour envoyer nos donneés dans la base de donnée.
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('Rédacteurs').add({
                    'name': nameController.value.text,
                    'spécialité': deskController.value.text,
                  });

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(color: Colors.white, fontSize: 18),
                ),
                child: Text(
                  'Ajouter Rédacteur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
