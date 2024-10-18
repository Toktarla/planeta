import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/utils/functions.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_bloc.dart';
import 'package:untitled/features/presentation/pages/planet/planet_explanation_page.dart';
import 'package:untitled/features/presentation/pages/practice/planets_gallery.dart';
import 'package:untitled/l10n/jsonlocalization.dart';
import '../../../../config/routes/route_animations/fade_in_route_animation.dart';
import '../../../../injection_container.dart';

class LearnPlanetsPage extends StatelessWidget {
  const LearnPlanetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizTitles = AppFunctions.readQuizTitles(context);
    final imageTitles = [
      "primary%20planets",
      "dwarf%20planets",
      "planets",
      "exoplanets"
    ];

    return BlocProvider<RemoteGalleryBloc>(
      create: (context) => sl(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Learn Planets",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ExpansionTile(
                  iconColor: Theme.of(context).primaryColor,
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  title: Text(
                    quizTitles[0],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  leading: IconButton(
                    onPressed: null,
                    icon: FaIcon(
                      FontAwesomeIcons.globe,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  children: List<Widget>.generate(8, (index) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadeInRoute(
                                page: PlanetExplanationPage(
                                  planetEntity: PlanetEntity(
                                    explanation: JsonLocalizations.of(context)!
                                        .translate(
                                            "planets", "explanation", index),
                                    whatis: JsonLocalizations.of(context)!
                                        .translate("planets", "whatis", index),
                                    planetType: JsonLocalizations.of(context)!
                                        .translate(
                                            "planets", "planetType", index),
                                    image_url: JsonLocalizations.of(context)!
                                        .translate(
                                            "planets", "image_url", index),
                                    description: JsonLocalizations.of(context)!
                                        .translate(
                                            "planets", "description", index),
                                    name: JsonLocalizations.of(context)!
                                        .translate("planets", "name", index),
                                  ),
                                ),
                                routeName: "/PlanetExplanationPage"));
                      },
                      child: ListTile(
                        title: Text(
                          JsonLocalizations.of(context)!
                              .translate("planets", "name", index),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    );
                  }),
                ),
                ExpansionTile(
                    childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading: IconButton(
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.earthOceania,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    title: Text(
                      quizTitles[1],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    children: List<Widget>.generate(5, (index) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0, color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              FadeInRoute(
                                  page: PlanetExplanationPage(
                                    planetEntity: PlanetEntity(
                                      explanation:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "explanation", index + 9),
                                      whatis: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "whatis", index + 9),
                                      planetType: JsonLocalizations.of(context)!
                                          .translate("planets", "planetType",
                                              index + 9),
                                      image_url: JsonLocalizations.of(context)!
                                          .translate("planets", "image_url",
                                              index + 9),
                                      description:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "description", index + 9),
                                      name: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "name", index + 9),
                                    ),
                                  ),
                                  routeName: "/PlanetExplanationPage"));
                        },
                        child: ListTile(
                          title: Text(
                            JsonLocalizations.of(context)!
                                .translate("planets", "name", index + 9),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      );
                    })),
                ExpansionTile(
                    childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading: IconButton(
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.earthOceania,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    title: Text(
                      quizTitles[2],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    children: List<Widget>.generate(1, (index) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0, color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              FadeInRoute(
                                  page: PlanetExplanationPage(
                                    planetEntity: PlanetEntity(
                                      explanation:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "explanation", index + 14),
                                      whatis: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "whatis", index + 14),
                                      planetType: JsonLocalizations.of(context)!
                                          .translate("planets", "planetType",
                                              index + 14),
                                      image_url: JsonLocalizations.of(context)!
                                          .translate("planets", "image_url",
                                              index + 14),
                                      description:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "description", index + 14),
                                      name: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "name", index + 14),
                                    ),
                                  ),
                                  routeName: "/PlanetExplanationPage"));
                        },
                        child: ListTile(
                          title: Text(
                              JsonLocalizations.of(context)!
                                  .translate("planets", "name", index + 14),
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      );
                    })),
                ExpansionTile(
                    childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading: IconButton(
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.earthOceania,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    title: Text(
                      quizTitles[3],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    children: List<Widget>.generate(6, (index) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0, color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              FadeInRoute(
                                  page: PlanetExplanationPage(
                                    planetEntity: PlanetEntity(
                                      explanation:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "explanation", index + 15),
                                      whatis: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "whatis", index + 15),
                                      planetType: JsonLocalizations.of(context)!
                                          .translate("planets", "planetType",
                                              index + 15),
                                      image_url: JsonLocalizations.of(context)!
                                          .translate("planets", "image_url",
                                              index + 15),
                                      description:
                                          JsonLocalizations.of(context)!
                                              .translate("planets",
                                                  "description", index + 15),
                                      name: JsonLocalizations.of(context)!
                                          .translate(
                                              "planets", "name", index + 15),
                                    ),
                                  ),
                                  routeName: "/PlanetExplanationPage"));
                        },
                        child: ListTile(
                          title: Text(
                              JsonLocalizations.of(context)!
                                  .translate("planets", "name", index + 15),
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      );
                    })),
                ExpansionTile(
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: IconButton(
                    onPressed: null,
                    icon: FaIcon(
                      FontAwesomeIcons.earthAsia,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  title: Text(
                    "Earth and Moon",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadeInRoute(
                                page: PlanetExplanationPage(
                                  planetEntity: PlanetEntity(
                                    explanation: JsonLocalizations.of(context)!
                                        .translate("planets", "explanation", 2),
                                    whatis: JsonLocalizations.of(context)!
                                        .translate("planets", "whatis", 2),
                                    planetType: JsonLocalizations.of(context)!
                                        .translate("planets", "planetType", 2),
                                    image_url: JsonLocalizations.of(context)!
                                        .translate("planets", "image_url", 2),
                                    description: JsonLocalizations.of(context)!
                                        .translate("planets", "description", 2),
                                    name: JsonLocalizations.of(context)!
                                        .translate("planets", "name", 2),
                                  ),
                                ),
                                routeName: "/PlanetExplanationPage"));
                      },
                      child: ListTile(
                        title: Text(JsonLocalizations.of(context)!
                            .translate("planets", "name", 2)),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadeInRoute(
                                page: PlanetExplanationPage(
                                  planetEntity: PlanetEntity(
                                    explanation: JsonLocalizations.of(context)!
                                        .translate("planets", "explanation", 8),
                                    whatis: JsonLocalizations.of(context)!
                                        .translate("planets", "whatis", 8),
                                    planetType: JsonLocalizations.of(context)!
                                        .translate("planets", "planetType", 8),
                                    image_url: JsonLocalizations.of(context)!
                                        .translate("planets", "image_url", 8),
                                    description: JsonLocalizations.of(context)!
                                        .translate("planets", "description", 8),
                                    name: JsonLocalizations.of(context)!
                                        .translate("planets", "name", 8),
                                  ),
                                ),
                                routeName: "/PlanetExplanationPage"));
                      },
                      child: ListTile(
                        title: Text(
                            JsonLocalizations.of(context)!
                                .translate("planets", "name", 8),
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                        leading: IconButton(
                          onPressed: null,
                          icon: FaIcon(
                            FontAwesomeIcons.image,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        title: Text(
                          "Planet Images",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        children: List<Widget>.generate(4, (index) {
                          return OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                            onPressed: () {

                              Navigator.push(
                                  context,
                                  FadeInRoute(
                                      page: PrimaryPlanetsGallery(
                                        imageTitles: imageTitles,
                                        indexOfTitle: index,
                                        title: quizTitles[index],
                                      ),
                                      routeName: "/PrimaryPlanetsGallery"));
                            },
                            child: ListTile(
                              title: Text(quizTitles[index],
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                          );
                        }
                        )
                    )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
