import 'package:firecast_app/utils/constants.dart';
import 'package:firecast_app/widgets/image_loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageScreen extends StatelessWidget {
  ImageScreen({
    @required this.assetEntity,
    @required this.onCollapse,
    @required this.onPlayNextMedia,
    @required this.onPlayPreviousMedia,
    this.doHardRefresh: false,
  });
  final AssetEntity assetEntity;
  final bool doHardRefresh;
  final Function onCollapse;
  final Function onPlayNextMedia;
  final Function onPlayPreviousMedia;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 20.0,
          color: Colors.grey,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 40.0, right: 40.0),
        child: Material(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.cast_connected,
                      size: 25.0, color: Colors.orangeAccent),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "Currently Showing",
                      style: TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      onTap: onCollapse,
                      child: Icon(Icons.expand_more)),
                ],
              ),
              SizedBox(height: 20.0),
              doHardRefresh
                  ? PlayerImageLoader(
                      assetEntity: assetEntity,
                      isImageFiles: true,
                      key: UniqueKey(),
                    )
                  : PlayerImageLoader(
                      assetEntity: assetEntity,
                      isImageFiles: true,
                    ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      onTap: onPlayPreviousMedia,
                      child: Icon(Icons.skip_previous,
                          size: 70.0, color: kPrimaryTextColor),
                    )),
                    Expanded(child: Container()),
                    Expanded(
                        child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      onTap: onPlayNextMedia,
                      child: Icon(Icons.skip_next,
                          size: 70.0, color: kPrimaryTextColor),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
