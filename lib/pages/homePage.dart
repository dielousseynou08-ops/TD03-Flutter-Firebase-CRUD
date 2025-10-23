import 'package:flutter/material.dart';
import 'package:magazineinfos/pages/ajout_redacteur.dart';
import 'package:magazineinfos/pages/infos_redacteur.dart';
import 'package:magazineinfos/widgets/widget_icon.dart';
import 'package:magazineinfos/widgets/widget_rubrique.dart';
import 'package:magazineinfos/widgets/widget_text.dart';
import 'package:magazineinfos/widgets/widget_titre.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            'Magazine Infos',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsetsGeometry.all(15),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'Magazine Infos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            ListTile(
              title: Text('Ajouter un Rédacteur'),
              leading: Icon(Icons.playlist_add_check_circle_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AjouterRedacteur(),
                  ),
                );
                //Navigator.pop(context);
              },
            ),
            Divider(height: 5, color: Theme.of(context).primaryColor),

            ListTile(
              title: Text('Liste des Redacteurs'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InformationRedacteur(),
                  ),
                );
              },
            ),
            Divider(height: 5, color: Theme.of(context).primaryColor),

            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/magazine.jpg',
                    width: 350,
                    height: 300,
                    fit: BoxFit.contain,
                    color: const Color.fromARGB(255, 230, 92, 82),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ],
            ),
            PartieTitre(),
            PartieText(),
            PartieIcons(),
            SizedBox(height: 20),
            PartieRubrique(),
          ],
        ),
      ), //fin du center

      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, //pour vérifier que ontap fonctionne

        backgroundColor: Colors.red,
        child: Text(
          'Click ici',

          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }

  Widget NavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Favorits', icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Icon(Icons.notification_add),
        ),
      ],
    );
  }
}

class InformationRedacteurur {
  const InformationRedacteurur();
}
