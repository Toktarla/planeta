import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_bloc.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_state.dart';

import '../../../../injection_container.dart';
import '../../bloc/gallery/remote/remote_gallery_event.dart';

class PlanetExplanationPage extends StatelessWidget {
  const PlanetExplanationPage({
    Key? key,
    required this.planetEntity,
  }) : super(key: key);

  final PlanetEntity planetEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteGalleryBloc>(
      create: (context) => sl()..add(GetPhotosByQueryEvent("mercury", "5")),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: FaIcon(FontAwesomeIcons.arrowLeft)),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Share.share(
                                "${planetEntity.name}.\n${planetEntity.description}",
                                subject: "link to this page , dynamic link");
                          },
                          icon: FaIcon(FontAwesomeIcons.shareAlt)),
                    ],
                  ),
                  Center(
                    child: Image.asset(planetEntity.image_url ?? ""),
                  ),
                  Text(
                    planetEntity.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 40),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(planetEntity.description ?? "",
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    height: 2,
                    color: Theme.of(context).primaryColor,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: Text(planetEntity.explanation ?? "",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    height: 2.h,
                    color: Theme.of(context).primaryColor,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Gallery",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24)),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<RemoteGalleryBloc, RemoteGalleryState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 250.h,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 25.w);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Widget currentView;

                            if (state is RemoteGalleryLaunching || state is RemoteGalleryLoading) {
                              currentView = Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 180.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            else if (state is RemoteGalleryError) {
                              currentView = Text(state.error!.message!);
                            }
                            else if (state is RemoteGalleryDone) {
                              currentView = CachedNetworkImage(
                                
                                imageUrl: state.galleryEntity!.results[index].urls.regular,
                                imageBuilder: (context, imageProvider) => Container(
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              );
                            }
                            else {
                              currentView = Container();
                            }


                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(child: child, opacity: animation);
                              },
                              child: currentView,
                            );
                          },
                        ),
                      );
                    },
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
