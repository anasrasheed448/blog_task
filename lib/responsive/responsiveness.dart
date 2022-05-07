
import 'package:flutter/widgets.dart';

// static isLargeScreen;

int largeScreenSize = 1366;
int mediumScreenSize = 768;
int smallScreenSize = 360;
isLargeScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= largeScreenSize;

isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width > smallScreenSize;

class Responsiveness extends StatelessWidget {
  const Responsiveness(this.largeScreen, {required this.mediumScreen, required this.smallScreen});
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double _width = constraints.maxWidth;
        print(_width);
        if (_width >= largeScreenSize)
          return largeScreen;
        else if (_width < largeScreenSize && _width >= mediumScreenSize)
          return mediumScreen ;
        else return smallScreen;
      },
    );
  }
}
