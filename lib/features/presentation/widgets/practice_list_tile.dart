import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';

import '../../../core/constants/constants.dart';

class PracticeListTile extends StatelessWidget {
  const PracticeListTile({Key? key, required this.width, required this.height, required this.title, required this.icon, required this.imageUrl, required this.route, required this.page}) : super(key: key);
  final double width,height;
  final String title;
  final IconData icon;
  final String imageUrl;
  final String route;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height/6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 6,
          )
        ],


      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25)),
                OutlinedButton(
                  onPressed: () {
                        Navigator.push(
                            context,
                            FadeInRoute(page: page, routeName: route)
                        );
                    },
                  child: FaIcon(icon,color: Theme.of(context).iconTheme.color,),
                )

              ],
            ),

            Container(
              height: height/5,
              width: width/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: Image.asset(imageUrl).image,
                    fit: BoxFit.cover,
                  opacity: 0.85,

                ),

              ),

            ),

          ],
        ),
      ),
    );
  }
}
