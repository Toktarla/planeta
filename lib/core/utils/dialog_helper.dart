import 'package:flutter/material.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/presentation/pages/introduction/menu_page.dart';
import '../../features/presentation/pages/settings/settings_page.dart';

class DialogHelper {

  static openFullScreenDialog(BuildContext context, List<PlanetModel> planets) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0),
          child: MenuPage(planets: planets)
        );
      },
    );
  }

  static openAnimatedSettingsPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}