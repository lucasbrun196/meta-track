import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_track/app/modules/meta_track/presenter/controller/meta_track_controller.dart';

class MetaTrackView extends StatefulWidget {
  final MetaTrackController controller;
  const MetaTrackView({super.key, required this.controller});

  @override
  State<MetaTrackView> createState() => _MetaTrackViewState();
}

class _MetaTrackViewState extends State<MetaTrackView> {
  @override
  void initState() {
    widget.controller.getGoals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.black,
            elevation: 10,
            backgroundColor: Color.fromARGB(255, 120, 87, 217),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            title: Text(
              'Meta Track',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 32,
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Container(
            margin: EdgeInsets.only(bottom: 12, left: 12, right: 12, top: 50),
            child: BlocBuilder<MetaTrackController, MetaTrackState>(
              bloc: widget.controller,
              builder: (context, state) {
                if (state.status == MetaTrackStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == MetaTrackStatus.success) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(49, 158, 158, 158),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.goals[index].title),
                                Row(
                                  children: [
                                    Text(state.goals[index].deadline.toString())
                                  ],
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: state.goals.length);
                } else {
                  return Container();
                }
              },
            ),
          )),
    );
  }
}
