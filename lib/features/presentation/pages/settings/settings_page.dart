import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';
import 'package:untitled/features/presentation/cubit/localization_cubit.dart';
import 'package:untitled/features/presentation/pages/settings/about_page.dart';
import 'package:untitled/features/presentation/pages/settings/donation_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/theme/theme_cubit.dart';
import 'package:share_plus/share_plus.dart';
import '../../widgets/settings_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool value = true;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 0, color: Colors.transparent),

            ),
            onPressed: (){
              context.read<ThemeCubit>().toggleTheme();
              value = !value;
            },
            child: Row(
              children: [
                context.read<ThemeCubit>().state.brightness == Brightness.light
                    ? Icon(Icons.light_mode_rounded,color: Theme.of(context).iconTheme.color,)
                    : Icon(Icons.dark_mode_rounded,color: Theme.of(context).iconTheme.color),

                 SizedBox(width: 15.w,),
                context.read<ThemeCubit>().state.brightness == Brightness.light
                    ? Text(AppLocalizations.of(context)!.day,style: Theme.of(context).textTheme.titleLarge,)
                    : Text(AppLocalizations.of(context)!.night,style: Theme.of(context).textTheme.titleLarge,),



                Spacer(),

                Switch(
                    activeColor: Theme.of(context).primaryColor,
                    activeTrackColor: Theme.of(context).cardColor,
                    value: value,
                    onChanged: (newValue) {

                      setState(() {
                        value = newValue;
                      });
                      context.read<ThemeCubit>().toggleTheme();

                    }

                )

              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 0, color: Colors.transparent),

            ),
            onPressed: (){

            },
            child: Row(
              children: [

                Icon(Icons.language,color: Theme.of(context).iconTheme.color,),

                SizedBox(width: 15.w,),

                Text(AppLocalizations.of(context)!.settings_page_item1,style: Theme.of(context).textTheme.titleLarge),
                Spacer(),
                DropdownButton(
                    value: context.read<LocalizationCubit>().state,
                    items: [
                      DropdownMenuItem(child: Text("ru"),value: "ru",),
                      DropdownMenuItem(child: Text("en"),value: "en",),
                    ],
                    onChanged: (value) {
                      context.read<LocalizationCubit>().changeLanguage(value!);
                    }
                ),

              ],
            ),
          ),
          SettingsListTile(
            icon: Icons.app_shortcut_outlined,
            text: AppLocalizations.of(context)!.settings_page_item2,
            onPressed: () => navigateToAboutPage('/AboutPage',AboutPage()),
          ),
          SettingsListTile(
             icon: Icons.share_rounded,
            text: AppLocalizations.of(context)!.settings_page_item3,
            onPressed: () => shareLink("Planeta is an app to explore planets"),
          ),
          SettingsListTile(
            icon: Icons.star,
            text: AppLocalizations.of(context)!.settings_page_item4,
            onPressed: () =>launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.galaxy.starmap")) ,
            ),
          SettingsListTile(
              icon: Icons.attach_money_outlined,
              text: AppLocalizations.of(context)!.settings_page_item5,
              onPressed: () => navigateToAboutPage("/DonationPage",DonationPage()),
            ),

          const SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(AppLocalizations.of(context)!.feed_back,style: Theme.of(context).textTheme.titleLarge),
          ),

          SettingsListTile(
            icon: Icons.telegram,
            text: AppLocalizations.of(context)!.feed_back_telegram,
            onPressed: () => launchUrl(Uri.parse("https://t.me/+HgZDdny5r2NhYWUy")),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(AppLocalizations.of(context)!.feed_back_telegram_description,style: Theme.of(context).textTheme.bodyMedium,),
          ),






          ],
      ),
    );
  }

  void shareLink(String shareText) {
    Share.share(shareText);
  }

  void navigateToAboutPage(String routeName,Widget page){
    Navigator.push(context, FadeInRoute(page: page, routeName: routeName));
  }


}
