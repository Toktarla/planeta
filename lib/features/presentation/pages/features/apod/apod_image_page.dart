import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';
import 'package:untitled/features/presentation/pages/features/apod/save_nasa_article_page.dart';
import '../../../../domain/entities/nasa_article_entity.dart';
import '../../../bloc/nasa_article/remote/remote_nasa_article_bloc.dart';
import '../../../bloc/nasa_article/remote/remote_nasa_article_event.dart';
import '../../../bloc/nasa_article/remote/remote_nasa_article_state.dart';
import '../../../widgets/nasa_article_widget.dart';
import 'nasa_article_detail.page.dart';


class ApodImagePage extends StatelessWidget {

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(context, FadeInRoute(page: SavedNasaArticlesPage(), routeName: '/SavedNasaArticlesPage')),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Icon(Icons.bookmark,size: 24,),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  "Select the date to view the astronomy picture of the day:",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                ElevatedButton.icon(
                  key: const Key("datePicker"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.calendar_today),
                  label: Text("Choose a date"),
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2024));

                    if (dateTime != null) {
                      selectedDate = dateTime;
                      BlocProvider.of<RemoteNasaArticleBloc>(context).add(
                          GetNasaArticlesEvent(dateStampToYYYYMMDD(selectedDate)));
                    }
                  },
                ),



                SizedBox(height: 50.h),

                BlocBuilder<RemoteNasaArticleBloc, RemoteNasaArticleState>(
                  builder: (_, state) {
                    if (state is RemoteNasaArticleLaunching) {
                      return const Text("here will be data");
                    }
                    if (state is RemoteNasaArticleLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
                          height: MediaQuery.of(context).size.width / 2.2,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(end: 14),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: double.maxFinite,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 30.h,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        width: double.infinity,
                                        height: 30.h,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        width: 100.w,
                                        height: 30.h,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is RemoteNasaArticleError) {
                      return Text(state.error!.message!);
                    }
                    if (state is RemoteNasaArticleDone) {
                      return NasaArticleWidget(
                        article: state.nasaArticleEntity,
                        onArticlePressed: (article) => _onArticlePressed(context, article),
                      );
                    }
                    return const ColoredBox(color: Colors.greenAccent);
                  },
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}

String dateStampToYYYYMMDD(DateTime dateTime) {
  return "${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}";
}

void _onArticlePressed(BuildContext context, NasaArticleEntity article) {
  Navigator.push(context, FadeInRoute(page: NasaArticleDetailsViewPage(article: article,), routeName: '/NasaArticleDetails'));
}

