import 'package:edhp/core/utils/app_components/widgets/SharedAppBar.dart';
import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget{
  final String title;
  final Widget body;

  ViewContainer({required this.title,required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
              Image.asset("assets/images/bg.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Scaffold(backgroundColor: Colors.transparent,
                  appBar: getSharedAppBarWithBack(context,title),
                  body: Container(
                      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                      child:body),
    )]);
  }


}