import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/helpers/up_rich_text_editor_helper.dart';
import 'package:flutter_up/controller/up_rich_text_editor_controller.dart';

class UpRichTextEditor extends StatefulWidget {
  final bool readOnly;
  final UpRichTextEditorController controller;
  final String? initialValue;
  final String label;
  const UpRichTextEditor({
    super.key,
    required this.controller,
    required this.label,
    this.initialValue = "",
    this.readOnly = false,
  });

  @override
  State<UpRichTextEditor> createState() => _UpRichTextEditorState();
}

class _UpRichTextEditorState extends State<UpRichTextEditor> {
  QuillController controller = QuillController(
      document: Document(),
      readOnly: false,
      selection: const TextSelection.collapsed(offset: 0));
  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    if (widget.controller.deltaText.isNotEmpty) {
      controller = UpRichTextEditorHelper.convertTextToQuill(
          widget.controller.deltaText);
    }
    controller.addListener(() {
      widget.controller.deltaText =
          UpRichTextEditorHelper.convertQuillToText(controller);
      widget.controller.plainText =
          UpRichTextEditorHelper.convertQuillToPlainText(controller);
      widget.controller.htmlText =
          UpRichTextEditorHelper.convertQuillToHtmlText(controller);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(() {});
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      if (widget.controller.deltaText.isEmpty) {
        controller = UpRichTextEditorHelper.convertTextToQuill(
            widget.initialValue ?? "");
      }
    }
    QuillIconTheme iconTheme = QuillIconTheme(
      // iconButtonSelectedStyle: ButtonStyle(
      //   iconColor: MaterialStateProperty.all<Color>(
      //     UpConfig.of(context).theme.primaryColor,
      //   ),
      //   surfaceTintColor: MaterialStateProperty.all<Color>(
      //     Colors.blue,
      //   ),
      //   overlayColor: MaterialStateProperty.all<Color>(
      //     Colors.limeAccent,
      //   ),
      //   backgroundColor: MaterialStateProperty.all<Color>(
      //     UpConfig.of(context).theme.basicStyle?.buttonBackgroundColor ??
      //         Colors.transparent,
      //   ),
      // ),

      iconButtonSelectedData: IconButtonData(
        color: UpConfig.of(context).theme.primaryColor,
        disabledColor: Colors.grey,
        iconSize: 12,
      ),
      iconButtonUnselectedData: IconButtonData(
        color: UpConfig.of(context).theme.baseColor.shade900,
        disabledColor: Colors.grey,
        iconSize: 12,
      ),
    );
    final buttonsList = [
      QuillToolbarHistoryButton(
        controller: controller,
        isUndo: true,
        options: QuillToolbarHistoryButtonOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarHistoryButton(
        controller: controller,
        isUndo: false,
        options: QuillToolbarHistoryButtonOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarFontSizeButton(
          options: QuillToolbarFontSizeButtonOptions(
            defaultItemColor: UpConfig.of(context).theme.baseColor.shade900,
          ),
          controller: controller),
      QuillToolbarFontFamilyButton(
          options: QuillToolbarFontFamilyButtonOptions(
            iconTheme: iconTheme,
          ),
          controller: controller),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.bold,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_bold,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.italic,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_italic,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.underline,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_underline,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarClearFormatButton(
        controller: controller,
        options: QuillToolbarClearFormatButtonOptions(
          iconData: Icons.format_clear,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarSelectHeaderStyleButtons(
        controller: controller,
        options: QuillToolbarSelectHeaderStyleButtonsOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.ol,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_list_numbered,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.ul,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_list_bulleted,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarToggleStyleButton(
        attribute: Attribute.blockQuote,
        controller: controller,
        options: QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_quote,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarIndentButton(
          controller: controller,
          isIncrease: true,
          options: QuillToolbarIndentButtonOptions(
            iconData: Icons.format_indent_increase,
            iconTheme: iconTheme,
          )),
      QuillToolbarIndentButton(
        controller: controller,
        isIncrease: false,
        options: QuillToolbarIndentButtonOptions(
          iconData: Icons.format_indent_decrease,
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarColorButton(
        controller: controller,
        isBackground: false,
        options: QuillToolbarColorButtonOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarColorButton(
        controller: controller,
        isBackground: true,
        options: QuillToolbarColorButtonOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarLinkStyleButton(
        controller: controller,
        options: QuillToolbarLinkStyleButtonOptions(
          iconTheme: iconTheme,
        ),
      ),
      QuillToolbarSearchButton(
        controller: controller,
        options: QuillToolbarSearchButtonOptions(
          iconTheme: iconTheme,
          dialogTheme: QuillDialogTheme(
            dialogBackgroundColor:
                UpConfig.of(context).theme.baseColor.shade100,
            inputTextStyle: TextStyle(
              color: UpConfig.of(context).theme.baseColor.shade600,
              backgroundColor: UpConfig.of(context).theme.baseColor.shade100,
            ),
          ),
        ),
      ),
      QuillToolbarImageButton(
          controller: controller,
          options: QuillToolbarImageButtonOptions(
            iconTheme: iconTheme,
          )),
    ];
    try {
      return Column(
        children: [
          QuillSimpleToolbar(
            controller: controller,
            config: QuillSimpleToolbarConfig(
              iconTheme: iconTheme,
            ),
          ),
          Container(
            height: 300,
            color: UpConfig.of(context).theme.baseColor.shade100,
            child: QuillEditor.basic(
              focusNode: focusNode,
              scrollController: scrollController,
              controller: controller,
              config: QuillEditorConfig(
                  dialogTheme: QuillDialogTheme(
                    dialogBackgroundColor:
                        UpConfig.of(context).theme.baseColor.shade100,
                    inputTextStyle: TextStyle(
                      color: UpConfig.of(context).theme.baseColor.shade900,
                    ),
                  ),
                  enableSelectionToolbar: true,
                  autoFocus: true,
                  minHeight: 200,
                  maxHeight: 300,
                  contextMenuBuilder: (BuildContext context,
                      QuillRawEditorState rawEditorState) {
                    print("rawEditorState: $rawEditorState");
                    return Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.abc,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            print('Bold button pressed');
                          },
                        ),
                      ],
                    );
                  }
                  // contextMenuBuilder: (context, rawEditorState) {
                  //   return Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       // IconButton(
                  //       //   icon: Icon(Icons.),
                  //       //   onPressed: () {
                  //       //     print('Bold button pressed');
                  //       //   },
                  //       // ),
                  //       // Visibility(
                  //       // visible: widget.readOnly == false,
                  //       // child:
                  //       // SizedBox(child: Column(children: buttonsList)),
                  //       // ),
                  //       // Padding(
                  //       //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  //       //   child: Container(
                  //       //     decoration: BoxDecoration(
                  //       //       color: UpConfig.of(context).theme.baseColor.shade100,
                  //       //       borderRadius: BorderRadius.circular(5.0),
                  //       //     ),
                  //       //     child: QuillEditor.basic(
                  //       //       // readOnly: widget.readOnly,
                  //       //       controller: controller,
                  //       //       focusNode: FocusNode(),
                  //       //       scrollController: ScrollController(),
                  //       //       config: QuillEditorConfig(
                  //       //         embedBuilders: kIsWeb
                  //       //             ? FlutterQuillEmbeds.editorWebBuilders()
                  //       //             : FlutterQuillEmbeds.editorBuilders(),
                  //       //         scrollable: true,
                  //       //         autoFocus: false,
                  //       //         padding: const EdgeInsets.all(8.0),
                  //       //         expands: false,
                  //       //         placeholder: "Enter ${widget.label}",
                  //       //         showCursor: true,
                  //       //         minHeight: 150,
                  //       //         customStyles: DefaultStyles(
                  //       //             paragraph: DefaultTextBlockStyle(
                  //       //                 TextStyle(
                  //       //                   color: UpConfig.of(context)
                  //       //                       .theme
                  //       //                       .baseColor
                  //       //                       .shade900,
                  //       //                 ),
                  //       //                 const HorizontalSpacing(0, 0),
                  //       //                 const VerticalSpacing(0, 0),
                  //       //                 const VerticalSpacing(0, 0),
                  //       //                 null)),
                  //       //       ),
                  //       //     ),
                  //       //   ),
                  //       // ),
                  //     ],
                  //   );
                  // },

                  ),
            ),
          ),
        ],
      );
    } catch (e) {
      return Text(e.toString());
    }
  }
}
