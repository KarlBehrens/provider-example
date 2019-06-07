import 'package:cached_network_image/cached_network_image.dart';
import 'package:experiments/provider/model/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstStreamWidget extends StatelessWidget {
  const FirstStreamWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var advancedWonder = Provider.of<LocationModelAdvanced>(context);

    final _width = MediaQuery.of(context).size.width;

    print('Inside First Widget');

    return Flexible(
      // child: Text(advancedWonder),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('${advancedWonder.name}'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: advancedWonder.url,
              fadeInDuration: Duration(milliseconds: 500),
              fadeInCurve: Curves.easeIn,
              placeholder: (context, url) => SizedBox(
                    width: _width,
                    child: const FlutterLogo(
                      style: FlutterLogoStyle.horizontal,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
