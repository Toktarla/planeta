import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';

class FeatureListTile extends StatelessWidget {
  const FeatureListTile({
    Key? key,
    required this.height,
    required this.width,
    required this.route,
    required this.imageUrl,
    required this.featureName,
    required this.featureDescription,
    required this.page,
  }) : super(key: key);

  final double height;
  final double width;
  final String route;
  final String imageUrl;
  final String featureName;
  final String featureDescription;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      onPressed: () {
        Navigator.push(context, FadeInRoute(page: page, routeName: route));
      },
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height / 6.5,
            width: width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageBuilder: (context, imageProvider) => Container(
          height: height / 6.5,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.8,
              image: imageProvider,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                featureName,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                featureDescription,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
