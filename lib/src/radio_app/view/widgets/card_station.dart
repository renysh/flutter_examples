import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';
import 'package:flutter_examples/src/radio_app/models/station.model.dart';
import 'package:flutter_examples/src/radio_app/view/pages/station_detail_page.dart';
import 'package:flutter_examples/src/radio_app/view/painters/equalizer_painter.dart';
import 'package:provider/provider.dart';

class CardStation extends StatelessWidget {
  final Station station;
  const CardStation({@required this.station});

  @override
  Widget build(BuildContext context) {
    final selectedStation =
        Provider.of<StationProvider>(context).selectedStation;

    return InkWell(
      onTap: () {
        Provider.of<StationProvider>(context, listen: false)
            .changeStation(station);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => StationDetailPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: station.id == selectedStation.id
              ? Color(0XFFFF296D)
              : Colors.transparent,
          border: station.id == selectedStation.id
              ? Border.all(color: Colors.transparent)
              : Border.all(color: Color(0XFF32324E), width: 2),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 10, right: 15.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    station.id == selectedStation.id ? 'Playing' : '',
                    style: TextStyle(
                      color: Color(0XFFAA1E4A),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  station.id == selectedStation.id
                      ? Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    station.frecuence,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: station.id == selectedStation.id
                          ? Colors.white
                          : Color(0XFFFFFFFF).withOpacity(0.2),
                    ),
                  ),
                  Text(
                    station.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: station.id == selectedStation.id
                          ? Colors.white
                          : Color(0XFFFFFFFF).withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomPaint(
                        foregroundPainter: EqualizerPainter(
                          station.id == selectedStation.id,
                          station.pointsColor,
                        ),
                        child: Container(
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
