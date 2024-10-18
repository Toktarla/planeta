import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../cubit/theme_cubit.dart';
import '../../cubit/localization_cubit.dart';
import '../../widgets/circle_button.dart';
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
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context); // Go back on swipe right
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30), // Adjust to avoid overlap with back button
                child: SingleChildScrollView( // Allows the page to scroll
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildThemeSwitch(context),
                      _buildLanguageSwitch(context),
                      SettingsListTile(
                        icon: Icons.share_rounded,
                        text: AppLocalizations.of(context)!.settings_page_item3,
                        onPressed: () => shareLink("Planeta is an app to explore planets"),
                      ),
                      SettingsListTile(
                        icon: Icons.star,
                        text: AppLocalizations.of(context)!.settings_page_item4,
                        onPressed: () => launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.galaxy.starmap")),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          AppLocalizations.of(context)!.feed_back,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SettingsListTile(
                        icon: Icons.telegram,
                        text: AppLocalizations.of(context)!.feed_back_telegram,
                        onPressed: () => launchUrl(Uri.parse("https://t.me/+HgZDdny5r2NhYWUy")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          AppLocalizations.of(context)!.feed_back_telegram_description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleButton(
                  width: 60,
                  height: 60,
                  circleColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  child: Icon(Icons.exit_to_app, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSwitch(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
        value = !value;
      },
      child: Row(
        children: [
          context.read<ThemeCubit>().state.brightness == Brightness.light
              ? Icon(Icons.light_mode_rounded, color: Theme.of(context).iconTheme.color)
              : Icon(Icons.dark_mode_rounded, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 15.w),
          context.read<ThemeCubit>().state.brightness == Brightness.light
              ? Text(AppLocalizations.of(context)!.day, style: Theme.of(context).textTheme.titleLarge)
              : Text(AppLocalizations.of(context)!.night, style: Theme.of(context).textTheme.titleLarge),
          Spacer(),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            value: value,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSwitch(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.language, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 15.w),
          Text(AppLocalizations.of(context)!.settings_page_item1, style: Theme.of(context).textTheme.titleLarge),
          Spacer(),
          DropdownButton(
            value: context.read<LocalizationCubit>().state,
            items: [
              DropdownMenuItem(
                child: Text("ru"),
                value: "ru",
              ),
              DropdownMenuItem(
                child: Text("en"),
                value: "en",
              ),
            ],
            onChanged: (value) {
              context.read<LocalizationCubit>().changeLanguage(value!);
            },
          ),
        ],
      ),
    );
  }

  void shareLink(String shareText) {
    Share.share(shareText);
  }
}
