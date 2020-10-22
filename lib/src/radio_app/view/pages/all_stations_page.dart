import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/controls_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/avatar_widget.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/card_station.dart';

class AllStationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Miau',
                        style: TextStyle(
                          color: Color(0XFFFF296D),
                        ),
                      ),
                    ],
                  ),
                ),
                AvatarWidget(
                  side: 60,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'All Stations',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                children: Provider.of<StationProvider>(context)
                    .stations
                    .map((e) => CardStation(
                          station: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Container(
            child: ControlsSection(),
          ),
        ],
      ),
    );
  }
}
