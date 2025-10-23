import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:magazineinfos/pages/ajout_redacteur.dart';

class InformationRedacteur extends StatefulWidget {
  const InformationRedacteur({super.key});

  @override
  State<InformationRedacteur> createState() => _InformationRedacteurState();
}

class _InformationRedacteurState extends State<InformationRedacteur> {
  final Stream<QuerySnapshot> _streamRedac = FirebaseFirestore.instance
      .collection('Rédacteurs')
      .snapshots();

  CollectionReference redac = FirebaseFirestore.instance.collection(
    'Rédacteurs',
  );

  Future<void> deleteRedac(String id) async {
    try {
      await redac.doc(id).delete();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Rédacteur supprimé avec succès')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression : $e')),
      );
    }
  }

  Future<void> updateRedac(
    String id,
    String currentName,
    String currentSpe,
  ) async {
    TextEditingController nameController = TextEditingController(
      text: currentName,
    );
    TextEditingController speController = TextEditingController(
      text: currentSpe,
    );

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modifier le rédacteur'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              TextField(
                controller: speController,
                decoration: InputDecoration(labelText: 'Spécialité'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await redac.doc(id).update({
                    'name': nameController.text,
                    'spécialité': speController.text,
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Rédacteur modifié avec succès')),
                  );
                } catch (element) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Erreur : $element')));
                }
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AjouterRedacteur()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Liste de Rédacteurs',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamRedac,
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
              return Card(
                child: ListTile(
                  title: Text(data['name'] ?? 'Nom inconnu'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data['spécialité'] ?? 'Aucune spécialité'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              updateRedac(
                                document.id,
                                data['name'] ?? '',
                                data['spécialité'] ?? '',
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 14,
                              color: Colors.blueAccent,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Êtes-vous sûr de vouloir supprimer ce rédacteur ?',
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Annuler'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          deleteRedac(document.id);
                                          try {
                                            await redac
                                                .doc(document.id)
                                                .delete();
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Rédacteur Supprimé avec succès',
                                                ),
                                              ),
                                            );
                                          } catch (element) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Erreur : $element',
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text('Supprimer'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
