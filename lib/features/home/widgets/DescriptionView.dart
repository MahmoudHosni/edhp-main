import 'dart:io';

import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DescriptionView extends StatefulWidget{
  final String title;
  final String fileName;

  DescriptionView({required this.fileName,required this.title});

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  String txt="";

  @override
  void initState() {
    super.initState();
    readFile(widget.fileName);
  }

  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: widget.title,body: Container(alignment: Alignment.center,width: double.infinity,height: double.infinity,
        child: SingleChildScrollView(child: Text(txt,style: Styles.textStyle15W500.copyWith(color: Colors.black,height: 1.8),textAlign: TextAlign.right,))));
  }

  void readFile(String fileName) async{
      rootBundle.loadString("assets/${widget.fileName}").then((value) =>
          setState(() {
            txt = value;
          })
      );

  }

  Future<File> _localFile(String myPath) async {
    return File(myPath);
  }
}