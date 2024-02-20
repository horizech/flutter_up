import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/helpers/rich_text_editor_helper.dart';
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
      selection: const TextSelection.collapsed(offset: 0));
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
      iconButtonSelectedStyle: ButtonStyle(
        iconColor: MaterialStateProperty.all<Color>(
          UpConfig.of(context).theme.primaryColor,
        ),
        surfaceTintColor: MaterialStateProperty.all<Color>(
          Colors.blue,
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.limeAccent,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          UpConfig.of(context).theme.basicStyle?.buttonBackgroundColor ??
              Colors.transparent,
        ),
      ),
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
      iconButtonUnselectedStyle: const ButtonStyle(),
    );
    return SizedBox(
      child: QuillEditorProvider(
        editorConfigurations: QuillEditorConfigurations(
          controller: controller,
          sharedConfigurations: QuillSharedConfigurations(
            dialogTheme: QuillDialogTheme(
              dialogBackgroundColor:
                  UpConfig.of(context).theme.baseColor.shade100,
              inputTextStyle: TextStyle(
                color: UpConfig.of(context).theme.baseColor.shade900,

                // backgroundColor: UpConfig.of(context).theme.baseColor.shade100,
              ),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
                visible: widget.readOnly == false,
                child: QuillToolbar(
                  // toolbarConfigurations: const QuillToolbarConfigurations(
                  // buttonOptions: QuillSimpleToolbarButtonOptions(),
                  // embedButtons: FlutterQuillEmbeds.toolbarButtons(),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5.0),
                  // ),
                  // ),
                  // configurations: const QuillToolbarConfigurations(
                  //   buttonOptions: QuillSimpleToolbarButtonOptions(
                  //       undoHistory: QuillToolbarHistoryButtonOptions()),
                  // ),
                  child: Wrap(
                    children: [
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
                            defaultItemColor:
                                UpConfig.of(context).theme.baseColor.shade900,
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
                              color:
                                  UpConfig.of(context).theme.baseColor.shade600,
                              backgroundColor:
                                  UpConfig.of(context).theme.baseColor.shade100,
                            ),
                          ),
                        ),
                      ),

                      QuillToolbarImageButton(
                          controller: controller,
                          options: QuillToolbarImageButtonOptions(
                            iconTheme: iconTheme,
                          )),
                      // QuillToolbarCameraButton(
                      //   controller: controller,
                      //   options: QuillToolbarCameraButtonOptions(
                      //     iconTheme: iconTheme,
                      //   ),
                      // ),
                    ],
                  ),
                  // QuillSimpleToolbar(
                  //   configurations: QuillSimpleToolbarConfigurations(
                  //     toolbarIconAlignment: WrapAlignment.start,
                  //     toolbarIconCrossAlignment: WrapCrossAlignment.start,
                  //     multiRowsDisplay: true,
                  //     controller: controller,
                  // buttonOptions: const QuillSimpleToolbarButtonOptions(),

                  // childrenBuilder: (context) {
                  //   final controller = context.requireQuillController;
                  //   return [
                  //     QuillToolbarHistoryButton(
                  //       controller: controller,
                  //       isUndo: true,
                  //       options: QuillToolbarHistoryButtonOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarHistoryButton(
                  //       controller: controller,
                  //       isUndo: false,
                  //       options: QuillToolbarHistoryButtonOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),

                  //     QuillToolbarFontSizeButton(
                  //         options: const QuillToolbarFontSizeButtonOptions(

                  //             // iconTheme: iconTheme,
                  //             ),
                  //         controller: controller),
                  //     QuillToolbarFontFamilyButton(
                  //         options: QuillToolbarFontFamilyButtonOptions(
                  //           iconTheme: iconTheme,
                  //         ),
                  //         controller: controller),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.bold,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_bold,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.italic,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_italic,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.underline,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_underline,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarClearFormatButton(
                  //       controller: controller,
                  //       options: QuillToolbarClearFormatButtonOptions(
                  //         iconData: Icons.format_clear,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarSelectHeaderStyleButtons(
                  //       controller: controller,
                  //       options:
                  //           QuillToolbarSelectHeaderStyleButtonsOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.ol,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_list_numbered,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.ul,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_list_bulleted,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarToggleStyleButton(
                  //       attribute: Attribute.blockQuote,
                  //       controller: controller,
                  //       options: QuillToolbarToggleStyleButtonOptions(
                  //         iconData: Icons.format_quote,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),

                  //     QuillToolbarIndentButton(
                  //         controller: controller,
                  //         isIncrease: true,
                  //         options: QuillToolbarIndentButtonOptions(
                  //           iconData: Icons.format_indent_increase,
                  //           iconTheme: iconTheme,
                  //         )),
                  //     QuillToolbarIndentButton(
                  //       controller: controller,
                  //       isIncrease: false,
                  //       options: QuillToolbarIndentButtonOptions(
                  //         iconData: Icons.format_indent_decrease,
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarColorButton(
                  //       controller: controller,
                  //       isBackground: false,
                  //       options: QuillToolbarColorButtonOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarColorButton(
                  //       controller: controller,
                  //       isBackground: true,
                  //       options: QuillToolbarColorButtonOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarLinkStyleButton(
                  //       controller: controller,
                  //       options: QuillToolbarLinkStyleButtonOptions(
                  //         iconTheme: iconTheme,
                  //       ),
                  //     ),
                  //     QuillToolbarSearchButton(
                  //       controller: controller,
                  //       options: QuillToolbarSearchButtonOptions(
                  //         iconTheme: iconTheme,
                  //         dialogTheme: QuillDialogTheme(
                  //           dialogBackgroundColor: UpConfig.of(context)
                  //               .theme
                  //               .baseColor
                  //               .shade100,
                  //           inputTextStyle: TextStyle(
                  //             color: UpConfig.of(context)
                  //                 .theme
                  //                 .baseColor
                  //                 .shade600,
                  //             backgroundColor: UpConfig.of(context)
                  //                 .theme
                  //                 .baseColor
                  //                 .shade100,
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     QuillToolbarImageButton(
                  //         controller: controller,
                  //         options: QuillToolbarImageButtonOptions(
                  //           iconTheme: iconTheme,
                  //         )),
                  //     // QuillToolbarCameraButton(
                  //     //   controller: controller,
                  //     //   options: QuillToolbarCameraButtonOptions(
                  //     //     iconTheme: iconTheme,
                  //     //   ),
                  //     // ),
                  //     // QuillToolbarVideoButton(
                  //     //     options: QuillToolbarVideoButtonOptions(
                  //     //       iconTheme: iconTheme,
                  //     //     ),
                  //     //     controller: controller),
                  //   ];

                  // },
                  // ),
                  // )),)
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: UpConfig.of(context).theme.baseColor.shade100,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: QuillEditor.basic(
                  focusNode: FocusNode(),
                  scrollController: ScrollController(),
                  configurations: QuillEditorConfigurations(
                    controller: controller,
                    embedBuilders: kIsWeb
                        ? FlutterQuillEmbeds.editorWebBuilders()
                        : FlutterQuillEmbeds.editorBuilders(),
                    readOnly: widget.readOnly,
                    scrollable: true,
                    autoFocus: false,
                    padding: const EdgeInsets.all(8.0),
                    expands: false,
                    placeholder: "Enter ${widget.label}",
                    showCursor: true,
                    minHeight: 150,
                    customStyles: DefaultStyles(
                        paragraph: DefaultTextBlockStyle(
                      TextStyle(
                        color: UpConfig.of(context).theme.baseColor.shade900,
                      ),
                      const VerticalSpacing(0, 0),
                      const VerticalSpacing(0, 0),
                      null,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
