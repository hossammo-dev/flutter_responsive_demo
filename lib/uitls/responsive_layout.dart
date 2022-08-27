import 'package:flutter/material.dart';

import 'constants.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, this.mobileLayout, this.tabletLayout, this.desktopLayout})
      : super(key: key);

  final Widget? mobileLayout;
  final Widget? tabletLayout;
  final Widget? desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth <= kMobileWidth ||
            constraints.maxHeight <= kMobileHeight) {
          return mobileLayout!;
        } else if (constraints.maxWidth <= kTabletWidth ||
            constraints.maxHeight <= kTabletHeight) {
          return tabletLayout!;
        } else {
          return desktopLayout!;
        }
      }),
    );
  }
}
