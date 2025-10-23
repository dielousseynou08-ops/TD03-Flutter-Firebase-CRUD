import 'package:flutter/material.dart';

class PartieIcons extends StatelessWidget {
  const PartieIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            GestureDetector(
              child: Icon(Icons.phone, color: Theme.of(context).primaryColor),
              onTap: () {},
            ),

            Text(
              "Téléphone",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        SizedBox(),

        Column(
          children: [
            GestureDetector(
              child: Icon(Icons.mail, color: Theme.of(context).primaryColor),
              onTap: () {
                //pour vérifier que ontap fonctionne
              },
            ),

            Text(
              "Mail",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),

        SizedBox(),
        Column(
          children: [
            GestureDetector(
              child: Icon(Icons.share, color: Theme.of(context).primaryColor),
              onTap: () {},
            ),
            Text(
              "Partager",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
