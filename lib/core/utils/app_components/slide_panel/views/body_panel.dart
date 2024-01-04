import 'package:edhp/core/utils/app_components/slide_panel/models/is_opened_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPanel extends StatefulWidget {
  final Widget body;
  final bool slideOffBodyTap;

  BodyPanel({required this.body,required this.slideOffBodyTap}) ;

  @override
  _BodyPanelState createState() => _BodyPanelState();
}

class _BodyPanelState extends State<BodyPanel> {
  @override
  Widget build(BuildContext context) {
    IsOpenedProvider isOpenedProvider = Provider.of<IsOpenedProvider>(context);
    if (widget.slideOffBodyTap) {
      return GestureDetector(
        onTap: () {
          isOpenedProvider.setOpenLeftState(false);
          isOpenedProvider.setOpenRightState(false);
        },
        child: widget.body,
      );
    }
    return widget.body;
  }
}
