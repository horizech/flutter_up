import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/models/up_label_value.dart';
import 'package:flutter_up/services/up_search.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_checkbox.dart';
import 'package:flutter_up/widgets/up_text.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpDropDown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final ValueChanged<List<String>?>? onMultipleChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final UpValidation? validation;
  final UpColorType? colorType;
  final List<UpLabelValuePair> itemList;
  final String? value;
  final List<String>? values;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final bool isMultipleSelect;
  final bool readOnly;
  const UpDropDown({
    Key? key,
    this.value,
    this.readOnly = false,
    this.validation,
    required this.itemList,
    this.onChanged,
    this.style,
    this.colorType,
    this.type,
    this.label,
    this.hint,
    this.values,
    this.prefixIcon,
    this.contentPadding,
    this.onMultipleChanged,
    this.isMultipleSelect = false,
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
    return widget.isMultipleSelect
        ? _upDropDownMultipleSelectBody(
            inputValue: inputValue,
            itemList: widget.itemList,
            validation: widget.validation,
            onChanged: ((value) {
              // inputValue.value = value;
              if (widget.onMultipleChanged != null) {
                widget.onMultipleChanged!(value);
              }
            }),
            style: widget.style,
            colorType: widget.colorType,
            type: widget.type,
            label: widget.label,
            prefixIcon: widget.prefixIcon,
            hint: widget.hint,
            readOnly: widget.readOnly,
            values: widget.values ?? [],
            contentPadding: widget.contentPadding,
          )
        : _upDropDownSingleSelectBody(
            inputValue: inputValue,
            validation: widget.validation,
            itemList: widget.itemList,
            readOnly: widget.readOnly,
            onChanged: ((value) {
              inputValue.value = value;
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            }),
            style: widget.style,
            colorType: widget.colorType,
            type: widget.type,
            label: widget.label,
            hint: widget.hint,
            prefix: widget.prefixIcon,
            contentPadding: widget.contentPadding,
          );
  }
}

class _upDropDownSingleSelectBody extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final UpColorType? colorType;
  final List<UpLabelValuePair> itemList;
  final ValueNotifier<String?> inputValue;
  final Widget? prefix;
  final EdgeInsets? contentPadding;
  final UpValidation? validation;
  final bool readOnly;

  const _upDropDownSingleSelectBody(
      {Key? key,
      this.readOnly = false,
      required this.inputValue,
      required this.itemList,
      required this.onChanged,
      this.style,
      this.colorType,
      this.validation,
      this.type,
      this.label,
      this.hint,
      this.prefix,
      this.contentPadding})
      : super(key: key);

  @override
  State<_upDropDownSingleSelectBody> createState() =>
      _upDropDownSingleSelectBodyState();
}

class _upDropDownSingleSelectBodyState
    extends State<_upDropDownSingleSelectBody> {
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
  bool isOverlayExist = false;
  @override
  void dispose() {
    super.dispose();
    widget.inputValue.removeListener(() {});
    _focusNode.removeListener(() {});
    searchText.removeListener(() {});
  }

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
                child: TextFieldTapRegion(
                  child: Material(
                    elevation: 4.0,
                    child: Container(
                      color: UpStyle.getDropdownMenuColor(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      ),
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: filteredProducts!.map((e) {
                            return Container(
                              color: e.value == previousInputValue
                                  ? UpConfig.of(context).theme.primaryColor
                                  : Colors.transparent,
                              child: ListTile(
                                title: UpText(
                                  e.label,
                                  style: UpStyle(
                                    textColor: e.value == previousInputValue
                                        ? UpThemes.getContrastColor(
                                            UpConfig.of(context)
                                                .theme
                                                .primaryColor)
                                        : UpConfig.of(context)
                                            .theme
                                            .baseColor
                                            .shade900,
                                  ),
                                ),
                                onTap: () {
                                  if (!widget.readOnly) {
                                    widget.onChanged(e.value);
                                    _focusNode.unfocus();
                                  }
                                },
                              ),
                            );
                          }).toList()),
                    ),
                  ),
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
          isOverlayExist = true;
          searchText.text = displayText.text;
          searchText.selection =
              TextSelection.collapsed(offset: searchText.text.length);
          curTextEditingController = searchText;
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry!);
        });
        // debugPrint("Focused");
      } else {
        setState(() {
          isOverlayExist = false;
          searchText.clear();
          curTextEditingController = displayText;
          _overlayEntry!.remove();
        });
        // debugPrint("UnFocused");
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
        return CompositedTransformTarget(
          link: _layerLink,
          child: SizedBox(
            child: TextFormField(
              style: TextStyle(
                color: UpStyle.getDropdownTextColor(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
              ),
              readOnly: widget.readOnly,
              validator: (value) {
                if (widget.validation != null &&
                    (widget.validation!.isRequired ?? false)) {
                  if (value == null || value == "" || value.isEmpty) {
                    return 'Please enter ${(widget.label)?.toLowerCase()}';
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.only(
                      left: 12.0,
                      right: 3.0,
                      bottom: 15.0,
                      top: 0.0,
                    ),
                label: Text(
                  widget.label ?? "",
                  style: TextStyle(
                    color: _focusNode.hasFocus
                        ? UpStyle.getDropdownFocusedLabelColor(
                            context,
                            style: widget.style,
                            colorType: widget.colorType,
                          )
                        : UpStyle.getDropdownLabelColor(
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
                filled: true,
                fillColor: _focusNode.hasFocus
                    ? UpStyle.getDropdownFocusedFilledColor(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      )
                    : UpStyle.getDropdownFilledColor(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      ),
                hintText: widget.hint,
                enabledBorder: UpStyle.getDropdownBorderStyle(
                  context,
                  type: widget.type ?? UpInputType.outline,
                  style: widget.style,
                  colorType: widget.colorType,
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
                prefixIcon: widget.prefix,
                suffixIcon: SizedBox(
                  width: 55,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        child: Visibility(
                          visible: searchText.text.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                searchText.text = "";
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
                      SizedBox(
                        width: 25,
                        child: IconButton(
                          onPressed: () {
                            // if (isOverlayExist) {
                            //   _focusNode.unfocus();
                            // } else {
                            //   _focusNode.requestFocus();
                            // }
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
                      ),
                    ],
                  ),
                ),
              ),
              focusNode: _focusNode,
              controller: curTextEditingController ?? displayText,
              onChanged: (value) {
                if (isOverlayExist) {
                  _overlayEntry!.remove();
                }
                _overlayEntry = _createOverlayEntry();
                Overlay.of(context).insert(_overlayEntry!);
              },
            ),
          ),
        );
      },
      valueListenable: widget.inputValue,
    );
  }
}

class _upDropDownMultipleSelectBody extends StatefulWidget {
  final ValueChanged<List<String>?> onChanged;
  final String? label;
  final UpInputType? type;
  final String? hint;
  final UpStyle? style;
  final List<String>? values;
  final UpColorType? colorType;
  final List<UpLabelValuePair> itemList;
  final ValueNotifier<String?> inputValue;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final UpValidation? validation;
  final bool readOnly;

  const _upDropDownMultipleSelectBody(
      {Key? key,
      this.readOnly = false,
      required this.inputValue,
      this.validation,
      required this.itemList,
      this.values,
      required this.onChanged,
      this.style,
      this.colorType,
      this.type,
      this.label,
      this.prefixIcon,
      this.hint,
      this.contentPadding})
      : super(key: key);

  @override
  State<_upDropDownMultipleSelectBody> createState() =>
      _upDropDownMultipleSelectBodyState();
}

class _upDropDownMultipleSelectBodyState
    extends State<_upDropDownMultipleSelectBody> {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController displayText = TextEditingController();
  final TextEditingController valuesController = TextEditingController();
  List<UpLabelValuePair>? filteredProducts = [];
  List<String> multipleSelectionsList = [];
  Map<String, bool> checkboxValues = {};

  String? previousInputValue;
  bool isOverlayCreated = false;

  @override
  void dispose() {
    super.dispose();
    widget.inputValue.removeListener(() {});
    _focusNode.removeListener(() {});
    ServiceManager<UpSearchService>().remove();
  }

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
          child: TextFieldTapRegion(
            child: Material(
              color: UpStyle.getDropdownMenuColor(
                context,
                style: widget.style,
                colorType: widget.colorType,
              ),
              elevation: 4.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: UpTextField(
                        controller: displayText,
                        onChanged: ((newVal) {
                          ServiceManager<UpSearchService>().update(newVal);
                        }),
                        suffixIcon: Visibility(
                          visible: displayText.text.isNotEmpty,
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                displayText.text = "";
                                ServiceManager<UpSearchService>().update("");
                              },
                              icon: Icon(
                                Icons.cancel,
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
                          ),
                        ),
                        label: "Search",
                      ),
                    ),
                    StreamBuilder(
                      stream: ServiceManager<UpSearchService>().stream$,
                      builder: (BuildContext context, searchkey) {
                        getFilteredProducts(searchkey.data.toString());
                        return filteredProducts != null
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                children: filteredProducts!.map(
                                  (e) {
                                    return ListTile(
                                      title: Row(
                                        children: [
                                          UpCheckbox(
                                              label: e.label,
                                              style: widget.style,
                                              colorType: widget.colorType,
                                              onChange: (newCheck) {
                                                onClick(e.value, newCheck);
                                                _updateValuesTextfield();
                                              }),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              )
                            : const SizedBox(
                                child: UpText("No item found"),
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getFilteredProducts(String searchText) {
    if (searchText.isEmpty) {
      if (filteredProducts != widget.itemList) {
        filteredProducts = widget.itemList;
      }
    } else {
      filteredProducts = widget.itemList
          .where(
            (element) =>
                element.label.toLowerCase().contains(searchText.toLowerCase()),
          )
          .toList();
    }
  }

  onClick(String key, bool newCheck) {
    checkboxValues[key] = newCheck;
    if (newCheck) {
      if (!multipleSelectionsList.contains(key)) {
        multipleSelectionsList.add(key);
      }
    } else {
      if (multipleSelectionsList.contains(key)) {
        multipleSelectionsList.removeWhere((element) => element == key);
      }
    }
    setState(() {
      widget.onChanged(multipleSelectionsList);
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.itemList;
    if (checkboxValues.isEmpty) {
      for (var element in widget.itemList) {
        checkboxValues[element.value] = false;
      }
    }
    if (widget.values != null && widget.values!.isNotEmpty) {
      multipleSelectionsList = widget.values ?? [];
    }
    if (multipleSelectionsList.isNotEmpty) {
      _updateValuesTextfield();
    }

    for (var element in widget.itemList) {
      if (multipleSelectionsList.contains(element.value)) {
        checkboxValues[element.value] = true;
      }
    }
    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     setState(() {
    //       _overlayEntry = _createOverlayEntry();

    //       Overlay.of(context).insert(_overlayEntry!);
    //     });
    //     // debugPrint("Focused");
    //   } else {
    //     setState(() {
    //       _overlayEntry!.remove();
    //     });
    //     // debugPrint("UnFocused");
    //   }
    // });
  }

  _updateValuesTextfield() {
    valuesController.text = multipleSelectionsList
        .map((e) =>
            widget.itemList.where((element) => element.value == e).first.label)
        .join(',');
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
    return SizedBox(
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextFormField(
          readOnly: true,
          validator: (value) {
            if (widget.validation != null &&
                (widget.validation!.isRequired ?? false)) {
              if (value == null || value == "" || value.isEmpty) {
                return 'Please enter ${(widget.label)?.toLowerCase()}';
              }
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                const EdgeInsets.only(
                  left: 12.0,
                  right: 3.0,
                  bottom: 15.0,
                  top: 0.0,
                ),
            label: Text(
              widget.label ?? "",
              style: TextStyle(
                color: _focusNode.hasFocus
                    ? UpStyle.getDropdownFocusedLabelColor(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      )
                    : UpStyle.getDropdownLabelColor(
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
            filled: true,
            fillColor: _focusNode.hasFocus
                ? UpStyle.getDropdownFilledColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  )
                : UpStyle.getDropdownFilledColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
            hintText: widget.hint,
            enabledBorder: UpStyle.getDropdownBorderStyle(
              context,
              type: widget.type ?? UpInputType.outline,
              style: widget.style,
              colorType: widget.colorType,
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
            prefixIcon: widget.prefixIcon,
            suffixIcon: SizedBox(
              child: IconButton(
                onPressed: () {
                  if (isOverlayCreated) {
                    _overlayEntry!.remove();
                    isOverlayCreated = false;
                  } else {
                    _overlayEntry = _createOverlayEntry();
                    Overlay.of(context).insert(_overlayEntry!);
                    isOverlayCreated = true;
                  }
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
            ),
          ),
          focusNode: _focusNode,
          controller: valuesController,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
