import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:joybuy.com/config/Constants.dart';

class Url {
  static launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchDetailURL(id) async {
    var url = DomainUrl.joybuy + id + ".html";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
