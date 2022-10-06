import 'package:cleanarchitecture/falavor_config.dart';
import 'package:cleanarchitecture/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  final devConfig = FlavorConfig()
    ..appTitle = "dev"
    ..apiEndpoint = {
      Endpoints.items: 'random.api.dev/items',
      Endpoints.details: 'random.api.dev/details',
    }
    ..imageLocation = "assets/images/de.png"
    ..theme = ThemeData(
        primaryColor: Colors.red,
        appBarTheme: ThemeData.light()
            .appBarTheme
            .copyWith(backgroundColor: Colors.red));

}
