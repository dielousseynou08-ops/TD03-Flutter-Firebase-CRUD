import 'package:flutter/material.dart';

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),

            child: Image.asset(
              'assets/images/glamour.jpg',
              height: 100,
              width: 150,
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),

            child: Image.asset(
              'assets/images/surat-magazine.jpg',
              height: 100,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
