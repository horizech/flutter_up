import 'package:flutter/cupertino.dart';
import 'package:flutter_up/helpers/up_layout.dart';

class UpResponsivePage extends StatelessWidget {
  final Widget? desktopPage;
  final Widget? tabletPage;
  final Widget? mobilePage;

  const UpResponsivePage({
    Key? key,
    this.desktopPage,
    this.tabletPage,
    this.mobilePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      if (UpLayout.isMobile(context)) {
        return mobilePage ?? tabletPage ?? desktopPage ?? Container();
      } else if (UpLayout.isTablet(context)) {
        return tabletPage ?? mobilePage ?? desktopPage ?? Container();
      } else {
        return desktopPage ?? tabletPage ?? mobilePage ?? Container();
      }
    });
  }
}
