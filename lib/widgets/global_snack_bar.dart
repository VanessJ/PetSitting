import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_sitting/main.dart';
import 'package:pet_sitting/styles.dart';

class GlobalSnackBar {

  static showAlertSuccess({required BuildContext context, String? bigText, String? smallText}){
    _buildAlert(context: context, bigText: bigText?? "Success", smallText: smallText, alertColor: mainGreen);
  }

  static showAlertError({required BuildContext context, String? bigText, String? smallText}){
    _buildAlert(context: context, bigText:bigText?? "Error", smallText: smallText, alertColor: ERROR_RED);
  }

  static _buildAlert(
      {required BuildContext context, String? bigText, String? smallText, required Color alertColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Stack(children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: alertColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              const SizedBox(width: 30),
              _buildTexts(bigText, smallText),
            ],
          ),
        ),
        _buildCross(context),
        _buildPawsDecoration(),
      ]),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  static Widget _buildTexts(String? bigText, String? smallText) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bigText ?? "",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(smallText ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }

  static Widget _buildPawsDecoration() {
    return Container(
        margin: EdgeInsets.all(5),
        child: SvgPicture.asset("assets/svgs/paws.svg",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 60,
            width: 60,
            fit: BoxFit.scaleDown));
  }

  static Widget _buildCross(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: IconButton(
              icon: SvgPicture.asset("assets/svgs/close-square.svg",
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              } //do something,
              ),
        ),
      ],
    );
  }
}
