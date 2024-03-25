// import 'package:flutter/material.dart';
// import 'package:flutter_up/enums/up_color_type.dart';
// import 'package:flutter_up/themes/up_style.dart';

// class UpSideBar extends StatelessWidget {
//   final Widget? rightSide;
//   final Image? image;
//   final Widget? leftSideDefaulltView;
//   final Widget? leftSideCompactView;
//   final UpColorType? colorType;
//   final UpStyle? style;

//   const UpSideBar({
//     Key? key,
//     this.rightSide,
//     required this.leftSideDefaulltView,
//     this.leftSideCompactView,
//     this.image,
//     this.colorType,
//     this.style,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return leftSideCompactView != null
//         ? Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width >=
//                         UpStyle.getSideBarMaximumWidthForCompactView(context,
//                             style: style, colorType: colorType)!
//                     ? MediaQuery.of(context).size.width *
//                         (UpStyle.getSideBarDefaultViewWidthPercentage(context,
//                                 style: style, colorType: colorType)! /
//                             100)
//                     : UpStyle.getSideBarCompactViewWidth(context,
//                         style: style, colorType: colorType)!,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: UpStyle.getSideBarLeftSideGradient(context,
//                       style: style, colorType: colorType),
//                   color: UpStyle.getSideBarLeftSideColor(context,
//                       style: style, colorType: colorType),
//                   borderRadius: BorderRadius.all(
//                     image != null
//                         ? const Radius.circular(0)
//                         : Radius.circular(
//                             UpStyle.getSideBarLeftSideRadius(context,
//                                 style: style, colorType: colorType),
//                           ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(
//                       style != null && style!.sideBarLeftSidePadding == false
//                           ? 0
//                           : 8),
//                   child: MediaQuery.of(context).size.width >=
//                           UpStyle.getSideBarMaximumWidthForCompactView(context,
//                               style: style, colorType: colorType)!
//                       ? leftSideDefaulltView
//                       : leftSideCompactView,
//                 ),
//               ),
//               rightSide != null
//                   ? Container(
//                       width: MediaQuery.of(context).size.width >=
//                               UpStyle.getSideBarMaximumWidthForCompactView(
//                                   context,
//                                   style: style,
//                                   colorType: colorType)!
//                           ? MediaQuery.of(context).size.width *
//                               (UpStyle.getSideBarRightSideWidthPercentage(
//                                       context,
//                                       style: style,
//                                       colorType: colorType)! /
//                                   100)
//                           : MediaQuery.of(context).size.width -
//                               UpStyle.getSideBarCompactViewWidth(context,
//                                   style: style, colorType: colorType)!,
//                       height: double.infinity,
//                       decoration: BoxDecoration(
//                           color: UpStyle.getSideBarRightSideColor(context,
//                               style: style, colorType: colorType),
//                           gradient: UpStyle.getSideBarRightSideGradient(context,
//                               style: style, colorType: colorType),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(
//                               UpStyle.getSideBarRightSideRadius(context,
//                                   style: style, colorType: colorType),
//                             ),
//                           )),
//                       child: Padding(
//                         padding: EdgeInsets.all(
//                           style != null &&
//                                   style!.sideBarRightSidePadding == false
//                               ? 0
//                               : 8,
//                         ),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: rightSide,
//                         ),
//                       ),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           )
//         : Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width *
//                     (UpStyle.getSideBarDefaultViewWidthPercentage(context,
//                             style: style, colorType: colorType)! /
//                         100),
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: UpStyle.getSideBarLeftSideGradient(context,
//                       style: style, colorType: colorType),
//                   color: UpStyle.getSideBarLeftSideColor(context,
//                       style: style, colorType: colorType),
//                   borderRadius: BorderRadius.all(
//                     image != null
//                         ? const Radius.circular(0)
//                         : Radius.circular(
//                             UpStyle.getSideBarLeftSideRadius(context,
//                                 style: style, colorType: colorType),
//                           ),
//                   ),
//                 ),
//                 child: Padding(
//                     padding: EdgeInsets.all(
//                         style != null && style!.sideBarLeftSidePadding == false
//                             ? 0
//                             : 8),
//                     child: leftSideDefaulltView),
//               ),
//               rightSide != null
//                   ? Container(
//                       width: MediaQuery.of(context).size.width *
//                           (UpStyle.getSideBarRightSideWidthPercentage(context,
//                                   style: style, colorType: colorType)! /
//                               100),
//                       height: double.infinity,
//                       decoration: BoxDecoration(
//                           color: UpStyle.getSideBarRightSideColor(context,
//                               style: style, colorType: colorType),
//                           gradient: UpStyle.getSideBarRightSideGradient(context,
//                               style: style, colorType: colorType),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(
//                               UpStyle.getSideBarRightSideRadius(context,
//                                   style: style, colorType: colorType),
//                             ),
//                           )),
//                       child: Padding(
//                         padding: EdgeInsets.all(
//                           style != null &&
//                                   style!.sideBarRightSidePadding == false
//                               ? 0
//                               : 8,
//                         ),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: rightSide,
//                         ),
//                       ),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           );
//   }
// }
