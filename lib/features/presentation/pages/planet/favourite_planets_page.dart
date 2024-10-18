import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_bloc.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_event.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_state.dart';
import '../../../../../injection_container.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/jsonlocalization.dart';
import '../../../domain/entities/localized_planet_entity.dart';
import '../../widgets/planet_widget.dart';

class FavouritePlanetsPage extends HookWidget {
  const FavouritePlanetsPage({Key ? key});



  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (_) => sl<LocalPlanetBloc>()..add(GetSavedPlanetsEvent()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Icon(Ionicons.chevron_back,color: AppColors.whiteColor,),
        ),
      ),
      title: Text('Saved Planets',style: Theme.of(context).textTheme.displayLarge,),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<LocalPlanetBloc, LocalPlanetState>(
      builder: (context, state) {
        if (state is LocalPlanetLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalPlanetDone) {
          List<PlanetEntity> savedPlanets = state.planets!;



          return _buildPlanetsList(savedPlanets,context);
        }
        return ColoredBox(color: Colors.red);
      },
    );
  }

  Widget _buildPlanetsList(List<PlanetEntity> planets,BuildContext context) {
    final _prefs = sl<SharedPreferences>();
    List<String> mList = (_prefs.getStringList('indexesOfSavedPlanets') ?? []);
    List<int> indexesOfSavedPlanets = mList.map((i)=> int.parse(i)).toList();
    if (indexesOfSavedPlanets.isEmpty) {
      return Center(
          child: Text(
            'NO SAVED PLANETS',
            style: Theme.of(context).textTheme.titleLarge,
          ));
    }


    return ListView.builder(
      itemCount: indexesOfSavedPlanets.length,
      itemBuilder: (context, index) {



        int savedIndex = indexesOfSavedPlanets[index];
        LocalizedPlanetEntity localizedPlanet = LocalizedPlanetEntity(
          name: JsonLocalizations.of(context)!
              .translate("planets", "name", savedIndex),
          description: JsonLocalizations.of(context)!
              .translate("planets", "description", savedIndex),
          image_url: JsonLocalizations.of(context)!
              .translate("planets", "image_url", savedIndex),
          planetType: JsonLocalizations.of(context)!
              .translate("planets", "planetType", savedIndex),
          whatis: JsonLocalizations.of(context)!
              .translate("planets", "whatis", savedIndex),
        );

        return PlanetWidget(
          planet: localizedPlanet,
          isRemovable: true,
          onRemove: (planet) => _onRemoveArticle(context, localizedPlanet,index),
        );
      },
    );
  }



  void _onRemoveArticle(BuildContext context, PlanetEntity planet,int indexOfSavedPlanet) {
    BlocProvider.of<LocalPlanetBloc>(context).add(RemovePlanetEvent(planet));
    final _prefs = sl<SharedPreferences>();
    List<String> mList = _prefs.getStringList('indexesOfSavedPlanets') ?? [];
    List<int> indexesOfSavedPlanets = mList.map((i)=> int.parse(i)).toList();

    indexesOfSavedPlanets.removeAt(indexOfSavedPlanet);
    List<String> stringsList=  indexesOfSavedPlanets.map((i)=>i.toString()).toList();

    _prefs.setStringList('indexesOfSavedPlanets', stringsList);
  }


}