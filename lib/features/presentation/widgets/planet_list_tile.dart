import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/resources/data.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_bloc.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_event.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_state.dart';

import '../../../core/constants/constants.dart';
import '../../../injection_container.dart';

class PlanetListTile extends StatelessWidget {
  const PlanetListTile({Key? key,
    required this.height,
    required this.width,
    required this.imageHeight,
    required this.imageWidth,
    required this.planetEntity, required this.color, required this.indexOfSavedPlanet, required this.isSearchDelegatePage


  })
      : super(key: key);

  final PlanetEntity planetEntity;
  final double height;
  final double width;
  final double imageHeight;
  final double imageWidth;
  final Color color;
  final int indexOfSavedPlanet;
  final bool isSearchDelegatePage;

  @override
  Widget build(BuildContext context) {
    final _prefs = sl<SharedPreferences>();

    return Container(
        height: height / 6,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: FittedBox(
                child: Container(
                    height: imageHeight,
                    width: imageWidth,
                    child: Image.asset(
                      planetEntity.image_url!,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
             SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      planetEntity.name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                     SizedBox(
                      width: 2.w,
                    ),
                    planetEntity.planetType! == ""
                        ? Container()
                        : Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          planetEntity.planetType!,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.deepPurple[400]),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    planetEntity.whatis! == ""
                        ? Container()
                        : Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          planetEntity.whatis!,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.greenAccent[400])
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  planetEntity.description!,
                  style: Theme.of(context).textTheme.bodySmall
                ),
              ],
            ),
            Spacer(),
            IconButton(
                    onPressed: () {

                      BlocProvider.of<LocalPlanetBloc>(context).add(SavePlanetEvent(planetEntity));

                      List<String> mList = _prefs.getStringList('indexesOfSavedPlanets') ?? [];
                      List<int> indexesOfSavedPlanets = mList.map((i)=> int.parse(i)).toList();
                      indexesOfSavedPlanets.contains(indexOfSavedPlanet)
                          ? null
                          : indexesOfSavedPlanets.add(indexOfSavedPlanet);

                      ;
                      List<String> stringsList = indexesOfSavedPlanets.map((i)=>i.toString()).toList();
                      _prefs.setStringList('indexesOfSavedPlanets', stringsList);

                    },
                    icon: FaIcon(FontAwesomeIcons.star,color: Theme.of(context).iconTheme.color,))

          ],
        ));
  }
}
