import 'package:experiments/provider/model/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdStreamWidget extends StatelessWidget {
  const ThirdStreamWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allWonders = Provider.of<List<LocationModelAdvanced>>(context);

    print('\n Inside third Widget..');

    return Container(
      child: Column(
        children: [for (var wonder in allWonders) Text(wonder.name)],
      ),
    );
  }
}
