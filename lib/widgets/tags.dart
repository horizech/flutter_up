
 // prefixIcon: multipleSelectionsList.isNotEmpty
              //     ? Padding(
              //         padding: const EdgeInsets.only(
              //             left: 2.0, right: 2.0, top: 2.0, bottom: 2.0),
              //         child: SizedBox(
              //           child: Wrap(
              //               alignment: WrapAlignment.center,
              //               runAlignment: WrapAlignment.center,
              //               children: multipleSelectionsList
              //                   .map((e) => Padding(
              //                         padding: const EdgeInsets.only(
              //                           left: 2.0,
              //                           right: 2.0,
              //                           top: 2.0,
              //                           bottom: 2.0,
              //                         ),
              //                         child: Container(
              //                           height: 20,

              //                           decoration: BoxDecoration(
              //                             border:
              //                                 Border.all(color: Colors.black),
              //                             borderRadius: const BorderRadius.all(
              //                                 Radius.circular(12.0)),
              //                           ),
              //                           child: Padding(
              //                             padding: const EdgeInsets.all(2.0),
              //                             child: UpText(
              //                               widget.itemList
              //                                   .where((element) =>
              //                                       element.value == e)
              //                                   .first
              //                                   .label,
              //                             ),
              //                           ),
              //                           //  Padding(
              //                           //   padding:
              //                           //       const EdgeInsets.only(left: 2.0),
              //                           //   child: Row(
              //                           //     children: [

              //                           // GestureDetector(
              //                           //   onTap: () {
              //                           //     checkBoxValues[e] = false;
              //                           //     if (multipleSelectionsList
              //                           //         .contains(e)) {
              //                           //       multipleSelectionsList
              //                           //           .removeWhere((element) =>
              //                           //               element == e);
              //                           //     }

              //                           //     setState(() {});
              //                           //   },
              //                           //   child: Icon(
              //                           //     Icons.clear,
              //                           //     size: UpStyle.getIconSize(
              //                           //       context,
              //                           //       style: widget.style,
              //                           //       colorType: widget.colorType,
              //                           //     ),
              //                           //     color: UpStyle.getIconColor(
              //                           //       context,
              //                           //       style: widget.style,
              //                           //       colorType: widget.colorType,
              //                           //     ),
              //                           //   ),
              //                           // ),
              //                           //     ],
              //                           //   ),
              //                           // ),
              //                         ),
              //                       ))
              //                   .toList()),
              //         ),
              //       )
              //     : const SizedBox(),