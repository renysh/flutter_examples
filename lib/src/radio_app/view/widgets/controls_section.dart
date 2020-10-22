import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';
import 'package:flutter_examples/src/radio_app/view/painters/waves_painter.dart';
import 'dart:math' as math;

import 'package:flutter_examples/src/radio_app/view/widgets/control_button.dart';
import 'package:provider/provider.dart';

class ControlsSection extends StatefulWidget {
  @override
  _ControlsSectionState createState() => _ControlsSectionState();
}

class _ControlsSectionState extends State<ControlsSection>
    with SingleTickerProviderStateMixin {
  AnimationController _resizableController;
  Animation<double> _animationBorder1;

  @override
  void initState() {
    _resizableController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });

    _animationBorder1 = Tween(
      begin: 1.0,
      end: 2.5,
    ).animate(CurvedAnimation(
      parent: _resizableController,
      curve: Interval(
        0,
        1,
      ),
    ));
    _resizableController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 145.0,
      // width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ControlButton(
                height: 50,
                width: 45,
                icon: Transform.rotate(
                  angle: math.pi,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                backgroundColor: Color(0XFF05D8E8).withOpacity(0.2),
              ),
              AnimatedBuilder(
                animation: _resizableController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: WavesPainter(
                      Color(0XFFFF296D),
                      _animationBorder1.value,
                    ),
                    child: Container(
                      height: 85,
                      width: 80,
                      alignment: Alignment.center,
                      child: CustomPaint(
                        painter: WavesPainter(
                          Color(0XFF05D8E8),
                          _animationBorder1.value,
                        ),
                        child: Container(
                          height: 70,
                          width: 65,
                          alignment: Alignment.center,
                          child: ControlButton(
                            height: 55,
                            width: 50,
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            backgroundColor: Color(0XFFFF296D),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ControlButton(
                height: 50,
                width: 45,
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30.0,
                ),
                backgroundColor: Color(0XFF05D8E8).withOpacity(0.2),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.volume_up,
                color: Color(0XFF32324E),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2.0,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 6.0,
                    ),
                    trackShape: RectangularSliderTrackShape(),
                  ),
                  child: Slider(
                    min: 0,
                    activeColor: Color(0XFF05D8E8),
                    inactiveColor: Color(0XFF262640),
                    value: Provider.of<StationProvider>(context).percentValue,
                    onChanged: (value) {
                      Provider.of<StationProvider>(context, listen: false)
                          .setPercent(value);
                    },
                    max: 100,
                  ),
                ),
              ),
              Text(
                Provider.of<StationProvider>(context).percentLabel(),
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _resizableController?.dispose();
    super.dispose();
  }
}
