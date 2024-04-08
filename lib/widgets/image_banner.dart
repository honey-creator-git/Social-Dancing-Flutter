import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath; 

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints.expand(
      //   height: 100.0,
      // ),
      // decoration: BoxDecoration(color: Colors.grey),
      // padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      child: Image.asset(
        _assetPath,
        fit: BoxFit.contain,
      )
    );
  }
}