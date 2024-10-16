import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/domain/entities/localized_planet_entity.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';

class PlanetWidget extends StatelessWidget {
  final PlanetEntity? planet;
  final bool? isRemovable;
  final void Function(PlanetEntity planet)? onRemove;

  const PlanetWidget({
    Key? key,
    this.planet,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 14, top: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          SizedBox(
              height: 200.h,
              width: 150.w,
              child: Image.asset(planet!.image_url!)
          ),
          _buildTitleAndDescription(context),
          _buildRemovableArea(),
        ],
      ),
    );
  }

  Widget _buildTitleAndDescription(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              planet!.name ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  planet!.description ?? '',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 24),
                const SizedBox(width: 4),
                Text(
                  planet!.whatis!,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red,size: 40,),
        ),
      );
    }
    return Container();
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(planet!);
    }
  }
}
