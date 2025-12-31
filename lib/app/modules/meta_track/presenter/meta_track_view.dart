import 'package:flutter/material.dart';

class MetaTrackView extends StatefulWidget {
  const MetaTrackView({super.key});

  @override
  State<MetaTrackView> createState() => _MetaTrackViewState();
}

class _MetaTrackViewState extends State<MetaTrackView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meta Track'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
