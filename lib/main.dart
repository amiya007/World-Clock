import 'package:flutter/material.dart';

import 'package:world_time/widgets/home.dart';
import 'package:world_time/widgets/loading.dart';
import 'package:world_time/widgets/choose_location.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (ctx) => Loading(),
          '/home': (ctx) => Home(),
          '/location': (ctx) => ChooseLocation(),
        },
      ),
    );
