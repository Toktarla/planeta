import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/pages/planet/planet_explanation_page.dart';
import 'package:untitled/l10n/jsonlocalization.dart';

import '../../../../core/route_animations/fade_in_route_animation.dart';
import '../../widgets/planet_list_tile.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thickness: 4,


                child: ListView.builder(
                    itemCount: 21,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadeInRoute(
                                routeName: "/PlanetExplanationPage",
                                page: PlanetExplanationPage(
                                  planetEntity: PlanetEntity(
                                  name: JsonLocalizations.of(context)!
                                      .translate("planets", "name", index),
                                  description: JsonLocalizations.of(context)!
                                      .translate("planets", "description", index),
                                  image_url: JsonLocalizations.of(context)!
                                      .translate("planets", "image_url", index),
                                  planetType: JsonLocalizations.of(context)!
                                      .translate("planets", "planetType", index),
                                  whatis: JsonLocalizations.of(context)!
                                      .translate("planets", "whatis", index),
                                  explanation: JsonLocalizations.of(context)!
                                      .translate("planets", "explanation", index),
                                ),



                                ),
                              ),
                            );
                          },

                          child: PlanetListTile(
                            isSearchDelegatePage: false,
                            indexOfSavedPlanet: index,
                            color: Theme.of(context).cardColor,
                            imageHeight: 80.h,
                            imageWidth: 100.w,
                            width: width,
                            height: height,
                            planetEntity: PlanetEntity(
                              name: JsonLocalizations.of(context)!
                                  .translate("planets", "name", index),
                              description: JsonLocalizations.of(context)!
                                  .translate("planets", "description", index),
                              image_url: JsonLocalizations.of(context)!
                                  .translate("planets", "image_url", index),
                              planetType: JsonLocalizations.of(context)!
                                  .translate("planets", "planetType", index),
                              whatis: JsonLocalizations.of(context)!
                                  .translate("planets", "whatis", index),
                            ),

                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
