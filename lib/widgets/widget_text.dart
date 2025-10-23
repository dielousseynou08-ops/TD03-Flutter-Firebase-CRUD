import 'package:flutter/material.dart';

class PartieText extends StatelessWidget {
  const PartieText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        "Magazine Infos est bien plus qu’un simple  magazine d’information. c’est votre passerelle vers le monde, une source inestimable de connaissances et d’actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, la culture, la science, l’IA et le divertissement (les jeux).",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
