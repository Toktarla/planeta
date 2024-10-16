import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/constants/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings_page_item2,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: width / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/app_icon/planeta_icon.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.app_name),
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.version),
              const SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.app_idea_taken),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: 'This is the text to be copied.'));
                    Fluttertoast.showToast(
                      msg: "Text copied",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                    );
                  },
                  child:
                      Text(AppLocalizations.of(context)!.app_idea_taken_url)),
            ],
          ),
        ),
      ),
    );
  }
}
