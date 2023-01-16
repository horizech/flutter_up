import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/models/up_label_value.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpDropDown extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final UpColorType? colorType;
  String value;
  final List<UpLabelValuePair> itemList;
  UpDropDown({
    Key? key,
    // this.type = UpInputType.outline,
    required this.value,
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
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController searchText = TextEditingController();

  List<UpLabelValuePair>? filteredProducts = [];
  bool isSearchable = false;

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
                            searchText.text = e.label;
                            changeValue(e.value);
                            _focusNode.unfocus();
                          },
                        );
                      }).toList()),
                ),
              ),
            ));
  }

  changeValue(value) {
    widget.onChanged(value);
    setState(() {
      widget.value = value;
    });
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry!);
      } else {
        _overlayEntry!.remove();
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
    if (searchText.text.isEmpty || searchText.text == "") {
      filteredProducts = widget.itemList;
    }
    return Container(
      child: isSearchable == false
          ? DropdownButtonFormField(
              value: widget.value,
              iconSize: 24,
              elevation: 8,
              focusColor: Colors.transparent,
              icon: const Text(""),
              autofocus: false,
              validator: (value) {
                if (value == null) {
                  return 'Select ${widget.label}';
                }
                return null;
              },
              isExpanded: true,
              decoration: InputDecoration(
                label: Text(
                  widget.label ?? "",
                  style: TextStyle(
                    color: UpStyle.getDropdownLabelColor(
                      context,
                      style: widget.style,
                      colorType: widget.colorType,
                    ),
                    fontSize: UpStyle.getDropdownLabelSize(
                      context,
                      style: widget.style,
                      colorType: widget.colorType,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchable = true;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
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
                hintText: widget.hint,
                enabledBorder: UpStyle.getDropdownBorderStyle(
                  context,
                  type: widget.type ?? UpInputType.outline,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
                labelStyle: TextStyle(
                  color: UpStyle.getDropdownLabelColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                  fontSize: UpStyle.getDropdownLabelSize(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                ),
                focusedBorder: UpStyle.getDropdownBorderStyle(
                  context,
                  type: widget.type ?? UpInputType.outline,
                  style: widget.style,
                  colorType: widget.colorType,
                  isFocused: true,
                ),
                errorBorder: UpStyle.getDropdownBorderStyle(
                  context,
                  type: widget.type ?? UpInputType.outline,
                  style: widget.style,
                  colorType: widget.colorType,
                  isError: true,
                ),
                border: UpStyle.getDropdownBorderStyle(
                  context,
                  type: widget.type ?? UpInputType.outline,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
              ),
              items: getDropDownMenuItems(),
              onChanged: changeValue,
            )
          : CompositedTransformTarget(
              link: _layerLink,
              child: SizedBox(
                child: UpTextField(
                  focusNode: _focusNode,
                  controller: searchText,
                  onChanged: (value) {
                    if ((value == null && (value ?? "").isEmpty) ||
                        value == "") {
                      filteredProducts = widget.itemList;
                      _focusNode.requestFocus();
                    } else {
                      filteredProducts = widget.itemList
                          .where(
                            (element) => element.label
                                .toLowerCase()
                                .contains(searchText.text.toLowerCase()),
                          )
                          .toList();
                    }
                    setState(() {});
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
                                changeValue("");

                                // filteredProducts = widget.itemList;
                                // _focusNode.requestFocus();
                                setState(
                                  () {
                                    searchText.text = "";
                                  },
                                );
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
                            _focusNode.unfocus();
                            setState(() {
                              isSearchable = false;
                            });
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
  }
}
