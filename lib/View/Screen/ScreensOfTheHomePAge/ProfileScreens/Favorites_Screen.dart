import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Favorite".tr,
                style: Style().styleBoldTitle,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Text(
                  "Doctors".tr,
                  style: Style().styleBoldTitle,
                ),
                Text(
                  "Hospitals".tr,
                  style: Style().styleBoldTitle,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Text(
                "Doctors".tr,
                style: Style().styleBoldTitle,
              ),
              Text(
                "Hospitals".tr,
                style: Style().styleBoldTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
