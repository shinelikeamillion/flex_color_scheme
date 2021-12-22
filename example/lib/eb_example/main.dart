import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/utils/app_scroll_behavior.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 1 - Basic Theme Usage
//
// This example shows how to use a selected predefined color scheme in
// FlexColorScheme to define light and dark themes using the scheme,
// and then how to switch between the light and dark mode.
// -----------------------------------------------------------------------------
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'Basic Theme Usage',
      theme: ThemeData.light(),
      // Same definition for the dark theme, but using FlexThemeData.dark().
      darkTheme: ThemeData.dark(),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we can toggle theme mode between light and dark.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. Not
        // needed to use FlexColorScheme, but we use it to
        // show the active theme's name, description and colors in the
        // demo. It is also used by the theme mode switch that shows the
        // theme's colors in the different theme modes.
        flexSchemeData: FlexColor.schemes[FlexScheme.mandyRed]!,
      ),
    );
  }
}