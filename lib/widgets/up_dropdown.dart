import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/models/up_label_value.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpDropDown extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final UpColorType? colorType;
  final List<UpLabelValuePair> itemList;
  final String? value;

  const UpDropDown({
    Key? key,
    // this.type = UpInputType.outline,
    this.value,
    required this.itemList,
    required this.onChanged,
    this.style,
    this.colorType,
    this.type,
    this.label,
    this.hint,
  }) : super(key: key);

  @override
  State<UpDropDown> createState() => _UpDropDownState();
}

class _UpDropDownState extends State<UpDropDown> {
  ValueNotifier<String?> inputValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    if (inputValue.value != widget.value) {
      inputValue.value = widget.value;
    }
    return _upDropDownBody(
      inputValue: inputValue,
      itemList: widget.itemList,
      onChanged: ((value) {
        inputValue.value = value;
        widget.onChanged(value);
      }),
      style: widget.style,
      colorType: widget.colorType,
      type: widget.type,
      label: widget.label,
      hint: widget.hint,
    );

    // if (previousInputValue != widget.value) {
    //   previousInputValue = widget.value;
    //   if (widget.value != curValue) {
    //     curValue = widget.value;

    //     displayText.text = widget.itemList
    //         .where((element) => element.value == widget.value)
    //         .first
    //         .label;
    //   }
    // }
    // if (widget.value.isNotEmpty) {
    //   String label = widget.itemList
    //       .where((element) => element.value == widget.value)
    //       .first
    //       .label;
    //   debugPrint(label);
    //   setState(() {
    //     searchText.text = label;
    //   });
    //   // initialValue = label;
    // }
  }
}

class _upDropDownBody extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final UpColorType? colorType;
  final List<UpLabelValuePair> itemList;
  final ValueNotifier<String?> inputValue;

  const _upDropDownBody({
    Key? key,
    required this.inputValue,
    required this.itemList,
    required this.onChanged,
    this.style,
    this.colorType,
    this.type,
    this.label,
    this.hint,
  }) : super(key: key);

  @override
  State<_upDropDownBody> createState() => __upDropDownBodyState();
}

class __upDropDownBodyState extends State<_upDropDownBody> {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController searchText = TextEditingController();
  final TextEditingController displayText = TextEditingController();
  TextEditingController? curTextEditingController;

  List<UpLabelValuePair>? filteredProducts = [];
  bool isSearchable = false;
  bool isSearching = false;

  String? previousInputValue;

  OverlayEntry _createOverlayEntry() {
    var size = _layerLink.leaderSize;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: size?.width ?? 100,
              height: 200,
              bottom: 1,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, (size?.height ?? 55) + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: filteredProducts!.map((e) {
                        return ListTile(
                          title: Text(e.label),
                          onTap: () {
                            widget.onChanged(e.value);
                            _focusNode.unfocus();
                          },
                        );
                      }).toList()),
                ),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.itemList;

    if ((widget.inputValue.value ?? "").isNotEmpty) {
      displayText.text = widget.itemList
          .firstWhere((element) => element.value == widget.inputValue.value)
          .label;
    }
    previousInputValue = widget.inputValue.value;

    widget.inputValue.addListener(() {
      if (widget.inputValue.value != previousInputValue) {
        Future.delayed(const Duration(milliseconds: 50), () {
          setState(() {
            displayText.text = widget.itemList
                .firstWhere(
                    (element) => element.value == widget.inputValue.value)
                .label;
            previousInputValue = widget.inputValue.value;
          });
        });
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          searchText.text = displayText.text;
          curTextEditingController = searchText;
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context)!.insert(_overlayEntry!);
        });
        debugPrint("Focused");
      } else {
        setState(() {
          searchText.clear();
          curTextEditingController = displayText;
          _overlayEntry!.remove();
        });
        debugPrint("UnFocused");
      }
    });

    searchText.addListener(() {
      if (searchText.text.isEmpty || searchText.text == displayText.text) {
        if (filteredProducts != widget.itemList) {
          setState(() {
            filteredProducts = widget.itemList;
          });
        }
      } else {
        setState(() {
          filteredProducts = widget.itemList
              .where(
                (element) => element.label
                    .toLowerCase()
                    .contains(searchText.text.toLowerCase()),
              )
              .toList();
        });
      }
    });
  }

  List<DropdownMenuItem<dynamic>> getDropDownMenuItems() {
    return widget.itemList
        .map<DropdownMenuItem<dynamic>>(
          (item) => DropdownMenuItem<dynamic>(
            value: item.value,
            child: Text(item.label),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      builder: (BuildContext context, String? value, Widget? child) {
        return Container(
          // child: isSearchable == false
          //     ? DropdownButtonFormField(
          //         value: widget.value,
          //         iconSize: 24,
          //         elevation: 8,
          //         focusColor: Colors.transparent,
          //         icon: const Text(""),
          //         autofocus: false,
          //         validator: (value) {
          //           if (value == null) {
          //             return 'Select ${widget.label}';
          //           }
          //           return null;
          //         },
          //         isExpanded: true,
          //         decoration: InputDecoration(
          //           label: Text(
          //             widget.label ?? "",
          //             style: TextStyle(
          //               color: UpStyle.getDropdownLabelColor(
          //                 context,
          //                 style: widget.style,
          //                 colorType: widget.colorType,
          //               ),
          //               fontSize: UpStyle.getDropdownLabelSize(
          //                 context,
          //                 style: widget.style,
          //                 colorType: widget.colorType,
          //               ),
          //             ),
          //           ),
          //           suffixIcon: IconButton(
          //             onPressed: () {
          //               setState(() {
          //                 isSearchable = true;
          //               });
          //             },
          //             icon: Icon(
          //               Icons.arrow_drop_down,
          //               color: UpStyle.getIconColor(
          //                 context,
          //                 style: widget.style,
          //                 colorType: widget.colorType,
          //               ),
          //               size: UpStyle.getIconSize(
          //                 context,
          //                 style: widget.style,
          //                 colorType: widget.colorType,
          //               ),
          //             ),
          //           ),
          //           hintText: widget.hint,
          //           enabledBorder: UpStyle.getDropdownBorderStyle(
          //             context,
          //             type: widget.type ?? UpInputType.outline,
          //             style: widget.style,
          //             colorType: widget.colorType,
          //           ),
          //           labelStyle: TextStyle(
          //             color: UpStyle.getDropdownLabelColor(
          //               context,
          //               style: widget.style,
          //               colorType: widget.colorType,
          //             ),
          //             fontSize: UpStyle.getDropdownLabelSize(
          //               context,
          //               style: widget.style,
          //               colorType: widget.colorType,
          //             ),
          //           ),
          //           focusedBorder: UpStyle.getDropdownBorderStyle(
          //             context,
          //             type: widget.type ?? UpInputType.outline,
          //             style: widget.style,
          //             colorType: widget.colorType,
          //             isFocused: true,
          //           ),
          //           errorBorder: UpStyle.getDropdownBorderStyle(
          //             context,
          //             type: widget.type ?? UpInputType.outline,
          //             style: widget.style,
          //             colorType: widget.colorType,
          //             isError: true,
          //           ),
          //           border: UpStyle.getDropdownBorderStyle(
          //             context,
          //             type: widget.type ?? UpInputType.outline,
          //             style: widget.style,
          //             colorType: widget.colorType,
          //           ),
          //         ),
          //         items: getDropDownMenuItems(),
          //         onChanged: changeValue,
          //       )

          child: CompositedTransformTarget(
            link: _layerLink,
            child: SizedBox(
              child: UpTextField(
                focusNode: _focusNode,
                // initialValue: ,
                controller: curTextEditingController ?? displayText,
                onChanged: (value) {
                  // if ((value == null && (value ?? "").isEmpty) ||
                  //     value == "") {
                  //   filteredProducts = widget.itemList;
                  //   // _focusNode.requestFocus();
                  // } else {}
                },
                label: widget.label ?? "",
                suffixIcon: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Visibility(
                          visible: searchText.text.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                searchText.clear();
                              });
                            },
                            child: Icon(
                              Icons.clear,
                              size: UpStyle.getIconSize(
                                context,
                                style: widget.style,
                                colorType: widget.colorType,
                              ),
                              color: UpStyle.getIconColor(
                                context,
                                style: widget.style,
                                colorType: widget.colorType,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _focusNode.requestFocus();
                        },
                        icon: Icon(
                          Icons.arrow_drop_up,
                          color: UpStyle.getIconColor(
                            context,
                            style: widget.style,
                            colorType: widget.colorType,
                          ),
                          size: UpStyle.getIconSize(
                            context,
                            style: widget.style,
                            colorType: widget.colorType,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      valueListenable: widget.inputValue,
    );
  }
}
