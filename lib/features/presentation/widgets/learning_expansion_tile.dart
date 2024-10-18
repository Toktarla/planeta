import 'package:flutter/material.dart';
import '../../../config/routes/route_animations/fade_in_route_animation.dart';
import '../../domain/entities/planet_entity.dart';
import '../pages/planet/planet_explanation_page.dart';


class LearningExpansionTile extends StatelessWidget {
  const LearningExpansionTile({Key? key, required this.quizTitles, required this.icon, required this.planetEntity, required this.name, required this.titleIndex, required this.childrenLength}) : super(key: key);
  final List<String> quizTitles;
  final Icon icon;
  final PlanetEntity planetEntity;
  final String name;
  final int titleIndex;
  final int childrenLength;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(quizTitles[titleIndex]),
      leading: icon,
      children: List<Widget>.generate(childrenLength, (index) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 0, color: Colors.transparent),

          ),
          onPressed: () {
            Navigator.push(
                context,
                FadeInRoute(
                    page: PlanetExplanationPage(
                      planetEntity: planetEntity,
                    ),
                    routeName: "/PlanetExplanationPage"));
          },
          child: ListTile(
            title: Text(name),
          ),
        );
      }),
    );
  }
}

// PlanetEntity(
// explanation: JsonLocalizations.of(context)!
// .translate("planets", "explanation", index),
// whatis: JsonLocalizations.of(context)!
// .translate("planets", "whatis", index),
// planetType: JsonLocalizations.of(context)!
// .translate("planets", "planetType", index),
// image_url: JsonLocalizations.of(context)!
// .translate("planets", "image_url", index),
// description: JsonLocalizations.of(context)!
// .translate("planets", "description", index),
// name: JsonLocalizations.of(context)!
// .translate("planets", "name", index),
// ),