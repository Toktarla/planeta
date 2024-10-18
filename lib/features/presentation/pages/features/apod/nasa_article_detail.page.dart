
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_bloc.dart';
import '../../../../../../injection_container.dart';
import '../../../bloc/nasa_article/local/local_nasa_article_event.dart';

class NasaArticleDetailsViewPage extends HookWidget{
  final NasaArticleEntity? article;

  const NasaArticleDetailsViewPage({Key? key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalNasaArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () =>  Navigator.pop(context),
          child: const Icon(Ionicons.chevron_back),






        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(context),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            article!.title!,
            style:  Theme.of(context).textTheme.titleLarge
          ),

           SizedBox(height: 14.h),

          Row(
            children: [
              const Icon(Ionicons.time_outline, size: 16),
               SizedBox(width: 4.w),
              Text(
                article!.date!,
                style:  Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return CachedNetworkImage(
        imageUrl: article!.hdurl!,
        imageBuilder: (context,imageProvider) {
          return Container(
            width: double.infinity,
              height: 250.h,
              margin: const EdgeInsets.only(top: 14,left: 10,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              )

          );

        },

      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 250.h,
          margin: const EdgeInsets.only(top: 14,left: 10,right: 10),

          decoration: BoxDecoration(
              color: Colors.grey[300],

              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${article!.explanation ?? ''}\n\n${article!.title ?? 'there is title here'}',
        style:  TextStyle(fontSize: 16.sp),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(

        onPressed: () => _onFloatingActionButtonPressed(context),
        child: Icon(Ionicons.bookmark,color: Theme.of(context).iconTheme.color,),
        backgroundColor: Theme.of(context).cardColor,
      ),
    );
  }


  void _onFloatingActionButtonPressed(BuildContext context) {
    // if (doesNasaArticleExists(context, article!)) {
    //   ScaffoldMessenger.of(context).clearSnackBars();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text('This article already exists!'),
    //     ),
    //   );
    // }

    BlocProvider.of<LocalNasaArticleBloc>(context).add(
        SaveNasaArticleEvent(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Article saved successfully.'),
      ),
    );
  }




  }

  // bool doesNasaArticleExists(BuildContext context,NasaArticleEntity nasaArticleEntity) {
  //   BlocProvider.of<LocalNasaArticleBloc>(context).add(const GetSavedNasaArticlesEvent());
  //
  //   LocalNasaArticleBloc bloc = sl();
  //   LocalNasaArticleState savedArticles = bloc.state;
  //
  //
  //
  //
  //
  //
  //     print("!!!!!!!!!!!! ${savedArticles}") ;
  //     if (savedArticles is LocalNasaArticleDone) {
  //       final s = savedArticles.nasaArticles;
  //       if (s != null) {
  //         return s.contains(nasaArticleEntity);
  //       }
  //     }
  //
  //   return false;
  //
  //
  //
  // }

