import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DataCubit extends Cubit<List<dynamic>> {

  static late List<dynamic> list;

  DataCubit() : super([]);


  List<dynamic> readPlanetDataFromJson(BuildContext context,String language) {
    DefaultAssetBundle.of(context)
        .loadString("assets/jsons/${language}.json")
        .then((s) {
          list = jsonDecode(s);
        });
    return list[0];
  }
}