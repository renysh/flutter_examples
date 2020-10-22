import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/view/pages/all_stations_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/label_destination.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    Provider.of<StationProvider>(context, listen: false).loadStations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF01012A),
      body: Row(
        children: [
          NavigationRail(
            minWidth: 79,
            backgroundColor: Color(0XFF080833),
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.white.withOpacity(0.3),
            ),
            leading: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset('assets/images/radio_app/icon_login.png'),
                  height: 33,
                ),
              ],
            ),
            groupAlignment: 0.0,
            destinations: [
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 0,
                  text: 'All Stations',
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 1,
                  text: 'Favorites',
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 2,
                  text: 'Popular',
                ),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                AllStationsPage(),
                Container(
                  child: Center(
                    child: Text('selectedIndex: $_selectedIndex'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('selectedIndex: $_selectedIndex'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
