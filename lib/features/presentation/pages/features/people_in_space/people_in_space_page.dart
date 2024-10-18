import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled/features/data/data_sources/remote/people_in_space_service.dart';
import 'package:untitled/features/domain/entities/people_in_space.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../injection_container.dart';

class PeopleInSpacePage extends StatelessWidget {
  const PeopleInSpacePage({Key? key}) : super(key: key);

  String _formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    return DateFormat.yMMMd().add_Hm().format(parsedDate);
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16.0),
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30.0,
                              ),
                              title: Container(height: 10, width: 80, color: Colors.grey),
                              subtitle: Container(height: 10, width: 80, color: Colors.grey),
                            ),
                          );
                        },
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
                                backgroundImage: CachedNetworkImageProvider(
                                    astronaut.imageUrl,
                                ),
                                radius: 30.0,
                              ),
                              title: Text(
                                astronaut.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Country: ${astronaut.country}', style: Theme.of(context).textTheme.bodyMedium),
                                  Text('Agency: ${astronaut.agency}', style: Theme.of(context).textTheme.bodyMedium),
                                ],
                              ),
                              trailing: Icon(Icons.launch),
                              onTap: () {
                                _launchURL(astronaut.url);
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
