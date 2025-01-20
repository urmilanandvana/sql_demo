import 'package:flutter/material.dart';

class ProgressCmp {
  // this is where you would do your fullscreen loading
  Future<void> startLoading({
    required BuildContext context,
  }) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading({
    required BuildContext context,
  }) async {
    Navigator.of(context).pop();
  }
}

ProgressCmp progressCmp = ProgressCmp();
