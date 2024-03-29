import 'package:experiments/provider/helpers/utilities.dart';
import 'package:experiments/provider/model/location.dart';
import 'package:experiments/provider/services/connectivity.dart';
import 'package:experiments/provider/widgets/first.dart';
import 'package:experiments/provider/widgets/network.dart';
import 'package:experiments/provider/widgets/second.dart';
import 'package:experiments/provider/widgets/third.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await firestoreWondersInstance.settings(
    timestampsInSnapshotsEnabled: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<LocationModelAdvanced>.value(
        //   initialData: LocationModelAdvanced.initialData(),
        //   stream: locationStreamInstance.locationInfo(),
        // ),
        // StreamProvider<LocationModelNormal>.value(
        //   initialData: LocationModelNormal.initialData(),
        //   stream: locationStreamInstance.specificLocation(_thirdWonder),
        // ),
        StreamProvider<ConnectionStatus>.value(
          stream: ConnectivityService().connectivityController.stream,
        ),
      ],
      child: MaterialApp(
        // theme: ThemeData(
        //   brightness: Brightness.light,
        // ),
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
        theme: ThemeData.dark(),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _secondWonder = 'second';
    final _thirdWonder = 'third';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: NetworkWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamProvider<LocationModelAdvanced>.value(
              initialData: LocationModelAdvanced.initialData(),
              stream: locationStreamInstance.locationInfo(),
              child: FirstStreamWidget(),
            ),
            StreamProvider<LocationModelNormal>.value(
              initialData: LocationModelNormal.initialData(),
              stream: locationStreamInstance.specificLocation(_secondWonder),
              child: SecondStreamWidget(),
            ),
            // StreamProvider<List<LocationModelAdvanced>>.value(
            //   initialData: LocationModelAdvanced.initialListData(),
            //   stream: locationStreamInstance.allLocations(),
            //   child: ThirdStreamWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
