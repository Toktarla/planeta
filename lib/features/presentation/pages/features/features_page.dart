import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/presentation/pages/features/apod_image_page.dart';
import 'package:untitled/features/presentation/pages/features/people_in_space_page.dart';
import 'package:untitled/features/presentation/widgets/feature_list_tile.dart';

import '../../../domain/entities/nasa_article_entity.dart';
import '../../bloc/nasa_article/remote/remote_nasa_article_bloc.dart';
import '../../bloc/nasa_article/remote/remote_nasa_article_event.dart';
import '../../bloc/nasa_article/remote/remote_nasa_article_state.dart';
import '../../widgets/nasa_article_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeaturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FeatureListTile(
              imageUrl:
                  "https://th.bing.com/th/id/OIP.ObYWWF0C44fjTdLJfqQcSwHaE1?pid=ImgDet&rs=1",
              height: height,
              width: width,
              featureDescription:
                  AppLocalizations.of(context)!.feature1_description,
              featureName: AppLocalizations.of(context)!.feature1_name,
              route: "/ApodImagePage",
              page: ApodImagePage(),
            ),
            const SizedBox(height: 10,),
            FeatureListTile(
                height: height,
                width: width,
                route: "/PeopleInSpacePage",
                imageUrl: "https://th.bing.com/th/id/R.d4501330e81f495499c5d15d1c21c562?rik=RTHeh%2fZxAQw%2b4w&pid=ImgRaw&r=0",
                featureName: AppLocalizations.of(context)!.feature2_name,
                featureDescription: AppLocalizations.of(context)!.feature2_description,
                page: PeopleInSpacePage()
            )
          ],
        ),
      ),
    );
  }
}
