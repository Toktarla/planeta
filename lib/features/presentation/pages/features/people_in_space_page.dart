import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/features/data/data_sources/remote/people_in_space_service.dart';
import 'package:untitled/features/domain/entities/people_in_space.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../injection_container.dart';

class PeopleInSpacePage extends StatelessWidget {
  const PeopleInSpacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _astroService = sl<AstroApiService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.feature2_name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: FutureBuilder<AstroResponse>(
          future: _astroService.fetchAstronauts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [

                    Container(
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 48.h,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 20.h,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: 150.w,
                                      height: 20.h,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 24.w,
                                height: 24.h,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final astroResponse = snapshot.data!;
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.space_dashboard,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'In space now: ',
                          style: Theme.of(context).textTheme.displayLarge
                        ),
                        Text(
                            astroResponse.number.toString(),
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w900,fontSize: 50)
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: astroResponse.people.length,
                        itemBuilder: (context, index) {
                          final astronaut = astroResponse.people[index];
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16.0),
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  astronaut.name[0], // First letter of the name
                                  style: Theme.of(context).textTheme.displayLarge
                                ),
                              ),
                              title: Text(
                                astronaut.name,
                                style: Theme.of(context).textTheme.titleLarge
                              ),
                              subtitle: Text('Craft: ${astronaut.craft}',style: Theme.of(context).textTheme.bodyMedium,),
                              trailing: Icon(Icons.navigate_next),
                              onTap: () {



                              },
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data'));
            }
          }),
    );
  }
}
