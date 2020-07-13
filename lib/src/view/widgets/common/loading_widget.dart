import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color col;

  LoadingWidget(this.col);

  @override
  Widget build(BuildContext context) {
    return Center(child:CircularProgressIndicator(backgroundColor: col,));
  }
}
