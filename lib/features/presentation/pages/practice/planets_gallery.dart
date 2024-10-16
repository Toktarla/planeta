import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_bloc.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_event.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_state.dart';

import '../../../../injection_container.dart';


class PrimaryPlanetsGallery extends StatelessWidget {
  const PrimaryPlanetsGallery({Key? key, required this.title, required this.imageTitles, required this.indexOfTitle})
      : super(key: key);
  final String title;
  final List<String> imageTitles;
  final int indexOfTitle;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteGalleryBloc>(
      create: (context) =>
      sl()
        ..add(GetPhotosByQueryEvent(imageTitles[indexOfTitle], "20")),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<RemoteGalleryBloc, RemoteGalleryState>(
          builder: (context, state) {

            if (state is RemoteGalleryLoading || state is RemoteGalleryLaunching) {
              return Center(child: CupertinoActivityIndicator());
            }
            if (state is RemoteGalleryError) {
              return Text(state.error!.message!);
            }

            if (state is RemoteGalleryDone) {
              return MasonryGridView.builder(

                  itemCount: state.galleryEntity!.results.length,
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FullScreenWidget(
                        disposeLevel: DisposeLevel.High,
                        child: CachedNetworkImage(
                          imageBuilder: (context,imageProvider) {
                            return Container(
                              height: 200.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,

                                )
                              ),
                            );
                          },
                          imageUrl: state.galleryEntity!.results[index].urls.regular,
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          placeholder: (context,imageUrl) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 200.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  });

            }

            return Container();
          },
        ),
      ),
    );
  }
}
