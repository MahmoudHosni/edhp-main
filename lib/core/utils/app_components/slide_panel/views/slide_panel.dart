import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/slide_panel/models/is_opened_provider.dart';
import 'package:edhp/core/utils/app_components/slide_panel/views/body_panel.dart';
import 'package:edhp/core/utils/app_components/slide_panel/views/left_slide_panel.dart';
import 'package:edhp/core/utils/app_components/slide_panel/views/right_slide_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlidePanel extends StatefulWidget {
  final Widget body;
  final Widget leftSlide;
  final Widget rightSlide;
  final double slidePanelWidth;
  final double slidePanelHeight;
  final double slideHandlerWidth;
  final bool slideOffBodyTap;
  final bool leftPanelVisible;
  final bool rightPanelVisible;
  final bool appbarIsExist;

  const SlidePanel({
    required this.body,
    required this.leftSlide,
    required this.rightSlide,
    required this.slidePanelWidth,
    required this.slidePanelHeight,
    required this.slideHandlerWidth,
    required this.slideOffBodyTap,
    required this.leftPanelVisible,
    required this.rightPanelVisible,
      this.appbarIsExist = true});
  @override
  _SlidePanelState createState() => _SlidePanelState();
}

class _SlidePanelState extends State<SlidePanel> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IsOpenedProvider>(
      create: (_) => IsOpenedProvider(),
      child: Stack(
        children: <Widget>[
          BodyPanel(
            body: widget.body,
            slideOffBodyTap: widget.slideOffBodyTap,
          ),
          widget.leftPanelVisible
              ? LeftSlidePanel(
                  body: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                    color: Colors.black38,
                  ),
                      width: widget.slidePanelWidth + widget.slideHandlerWidth,
                      height: widget.slidePanelHeight,
                      // color: Colors.amberAccent,
                      child: widget.leftSlide),
                  slideHandlerWidth: widget.slideHandlerWidth,
                  slidePanelHeight: widget.slidePanelHeight,
                  slidePanelWidth: widget.slidePanelWidth,
                  appbarIsExist: widget.appbarIsExist,
                )
              : Container(),
          widget.rightPanelVisible
              ? RightSlidePanel(
                  body: Container(
                      width: widget.slidePanelWidth + widget.slideHandlerWidth,
                      height: widget.slidePanelHeight,
                      color: Colors.green,
                      child: widget.rightSlide),
                  slideHandlerWidth: widget.slideHandlerWidth,
                  slidePanelHeight: widget.slidePanelHeight,
                  slidePanelWidth: widget.slidePanelWidth,
                  appbarIsExist: widget.appbarIsExist,
                )
              : Container()
        ],
      ),
    );
  }
}
