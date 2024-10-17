import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';
import 'package:untitled/core/route_animations/turn_right_route_animation.dart';
import 'package:untitled/features/presentation/pages/features/features_page.dart';
import 'package:untitled/features/presentation/pages/introduction/introduction_page.dart';
import 'package:untitled/features/presentation/pages/planet/favourite_planets_page.dart';
import 'package:untitled/features/presentation/pages/planet/planet_explanation_page.dart';
import 'package:untitled/features/presentation/pages/settings/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/jsonlocalization.dart';
import '../../../domain/entities/planet_entity.dart';
import '../../cubit/index_cubit.dart';
import '../../widgets/planet_list_tile.dart';
import '../planet/planet_page.dart';
import '../practice/practice_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _screens = [
      PlanetPage(),
      PracticePage(),
      FeaturesPage(),
    ];
    final List appBar = [
      AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.app_name,style: Theme.of(context).textTheme.displayLarge,),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search,color: AppColors.whiteColor,),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    FadeInRoute(
                        page: FavouritePlanetsPage(),
                        routeName: "/FavouritePlanetsPage"));
              },
              icon: Icon(Icons.star,color: AppColors.whiteColor))
        ],
      ),
      null,
      null,
    ];
    return BlocBuilder<IndexCubit, int>(
      builder: (context, state) {
        return Scaffold(

          resizeToAvoidBottomInset: false,
          appBar: appBar[state],
          bottomNavigationBar: SalomonBottomBar(

            currentIndex: state,
            onTap: (i) => context.read<IndexCubit>().changeBottomBarIndex(i),
            items: [
              SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.earthAmericas),
                title: Text(AppLocalizations.of(context)!.bottomBarTitle1),
                selectedColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
              ),
              SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.bookAtlas),
                title: Text(AppLocalizations.of(context)!.bottomBarTitle2),
                selectedColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,

              ),
              SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.thumbsUp),
                title: Text(AppLocalizations.of(context)!.bottomBarTitle3),
                selectedColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,

              ),
            ],
          ),
          body: _screens[state],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  FadeInRoute(
                      page: IntroductionPage(),
                      routeName: "/IntroductionPage"));
            },
            child: FaIcon(Icons.start),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const FaIcon(FontAwesomeIcons.xmark))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: FaIcon(FontAwesomeIcons.arrowLeft));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PlanetEntity?> readData() {
      List<PlanetEntity?> list = [];
      for (int i = 0; i < 21; i++) {
        list.add(PlanetEntity(
          name: JsonLocalizations.of(context)!.translate("planets", "name", i),
          description: JsonLocalizations.of(context)!
              .translate("planets", "description", i),
          image_url: JsonLocalizations.of(context)!
              .translate("planets", "image_url", i),
          planetType: JsonLocalizations.of(context)!
              .translate("planets", "planetType", i),
          whatis:
              JsonLocalizations.of(context)!.translate("planets", "whatis", i),
          explanation: JsonLocalizations.of(context)!
              .translate("planets", "explanation", i),
        ));
      }

      return list;
    }

    List<PlanetEntity?> searchTerms = readData();
    List<PlanetEntity?> matchTerms = [];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    for (var planet in searchTerms) {
      if (planet != null && planet.name != null) {
        if (query != " " && planet.name!.toLowerCase().contains(query.toLowerCase())) {
          matchTerms.add(planet);
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: matchTerms.length,
          itemBuilder: (context, index) {
            var planet = matchTerms[index];

            return GestureDetector(
              onTap: () {
                try {
                  Navigator.push(
                      context,
                      FadeInRoute(
                          page: PlanetExplanationPage(
                            planetEntity: planet,
                          ),
                          routeName: "/PlanetExplanationPage"));
                } catch (e) {
                  print(e);
                }
              },
              child: Container(

                margin: EdgeInsets.only(bottom: 8),
                child: PlanetListTile(
                  isSearchDelegatePage: true,
                  indexOfSavedPlanet: index,
                  color : Theme.of(context).cardColor,
                  imageHeight: 80.h,
                  imageWidth: 80.w,
                  width: width,
                  height: height,
                  planetEntity: planet!,
                ),
              ),
            );
          }),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(

      appBarTheme:  AppBarTheme(
        color: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        elevation: 0,
      ),


    );
  }


}
