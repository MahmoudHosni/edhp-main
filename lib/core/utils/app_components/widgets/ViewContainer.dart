import 'package:edhp/core/utils/app_components/widgets/SharedAppBar.dart';
import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget {
  final String title;
  final Widget body;
  bool showBack = true;

  ViewContainer(
      {required this.title, required this.body, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/images/bg.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getSharedAppBarWithBack(context, title, showBack),
        body: Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: body),
      )
    ]);
  }
}
