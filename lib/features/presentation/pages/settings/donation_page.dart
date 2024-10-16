import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings_page_item5,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.donation_page_text1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5,),
            Text(
              AppLocalizations.of(context)!.donation_page_text2,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10,),


            Container(
              width: double.maxFinite,
              height: 200.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/images/Kaspi-Gold-2.jpg").image,
                  fit: BoxFit.cover,
                  opacity: 0.7
                )
              ),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),

                      ),

                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: '+77771667270'));
                        Fluttertoast.showToast(
                          msg: "Text copied",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      },
                      child: Text(
                        "+7 777 166 72 70",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),

                      ),

                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: '4444 4444 4444 4444'));
                        Fluttertoast.showToast(
                          msg: "Text copied",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      },
                      child: Text(
                        "4444 4444 4444 4444",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0, color: Colors.transparent),

                      ),

                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: 'Токтар Султан'));
                        Fluttertoast.showToast(
                          msg: "Text copied",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      },
                      child: Text(
                        "Токтар Султан",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 8,),

            Text(
              "★"+AppLocalizations.of(context)!.donation_page_text3,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8,),

            OutlinedButton(
              onPressed: (){
                launchUrl(Uri.parse("https://instagram.com/watashiwatoktar?utm_source=qr&igshid=MzNlNGNkZWQ4Mg=="));
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 0, color: Colors.transparent),

              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/insta.png"),
                  backgroundColor: Colors.transparent,

                ),
                title: Text("watashiwatoktar",style: Theme.of(context).textTheme.titleMedium,),
                subtitle: Text(Locale.fromSubtags().languageCode == "ru" ? "Токтар Султан" :"Toktar Sultan" ,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w300),),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
