import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constants/constants.dart';


class SettingsListTile extends StatelessWidget {
  const SettingsListTile({Key? key, required this.text, required this.icon, this.onPressed,}) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0, color: Colors.transparent),
        padding: EdgeInsets.all(16.0),

      ),
      onPressed: () => onPressed?.call(),
      child: Row(
        children: [
          Icon(icon,color: Theme.of(context).iconTheme.color,),
           SizedBox(width: 15.w,),
          Text(text,style: Theme.of(context).textTheme.titleMedium,),
          Spacer(),
          Icon(Icons.navigate_next,color: Theme.of(context).iconTheme.color,),
        ],
      ),
    );
  }
}
