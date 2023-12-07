import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/helpers/rich_text_editor_helper.dart';
import 'package:flutter_up/controller/up_rich_text_editor_controller.dart';
import 'package:flutter_up/themes/up_themes.dart';

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
    if (widget.controller.text.isNotEmpty) {
      controller =
          UpRichTextEditorHelper.convertStringToQuill(widget.controller.text);
    }
    controller.addListener(() {
      widget.controller.text =
          UpRichTextEditorHelper.convertQuillToString(controller);
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
      if (widget.controller.text.isEmpty) {
        controller = UpRichTextEditorHelper.convertStringToQuill(
            widget.initialValue ?? "");
      }
    }
    QuillIconTheme iconTheme = QuillIconTheme(
      iconSelectedFillColor: UpConfig.of(context).theme.primaryColor,
      iconUnselectedFillColor:
          UpConfig.of(context).theme.basicStyle?.buttonBackgroundColor ??
              Colors.transparent,
      iconUnselectedColor: UpThemes.getContrastColor(
          UpConfig.of(context).theme.basicStyle?.buttonBackgroundColor ??
              Colors.transparent),
      iconSelectedColor: UpThemes.getContrastColor(
        UpConfig.of(context).theme.primaryColor,
      ),
    );
    return SizedBox(
      child: QuillProvider(
        configurations: QuillConfigurations(
          controller: controller,
          sharedConfigurations: QuillSharedConfigurations(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: widget.readOnly == false,
              child: QuillToolbarProvider(
                  toolbarConfigurations: QuillToolbarConfigurations(
                    embedButtons: FlutterQuillEmbeds.toolbarButtons(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: QuillBaseToolbar(
                    configurations: QuillBaseToolbarConfigurations(
                      toolbarIconAlignment: WrapAlignment.start,
                      toolbarIconCrossAlignment: WrapCrossAlignment.start,
                      multiRowsDisplay: true,
                      childrenBuilder: (context) {
                        final controller = context.requireQuillController;
                        return [
                          QuillToolbarHistoryButton(
                            controller: controller,
                            options: QuillToolbarHistoryButtonOptions(
                              iconTheme: iconTheme,
                              isUndo: true,
                            ),
                          ),
                          QuillToolbarHistoryButton(
                            controller: controller,
                            options: QuillToolbarHistoryButtonOptions(
                              isUndo: false,
                              iconTheme: iconTheme,
                            ),
                          ),

                          QuillToolbarFontSizeButton(
                              options: QuillToolbarFontSizeButtonOptions(
                                iconTheme: iconTheme,
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
                            options:
                                QuillToolbarSelectHeaderStyleButtonsOptions(
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
                                dialogBackgroundColor: UpConfig.of(context)
                                    .theme
                                    .baseColor
                                    .shade100,
                                inputTextStyle: TextStyle(
                                  color: UpConfig.of(context)
                                      .theme
                                      .baseColor
                                      .shade600,
                                  backgroundColor: UpConfig.of(context)
                                      .theme
                                      .baseColor
                                      .shade100,
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
                          // QuillToolbarVideoButton(
                          //     options: QuillToolbarVideoButtonOptions(
                          //       iconTheme: iconTheme,
                          //     ),
                          //     controller: controller),
                        ];
                      },
                    ),
                  )),
            ),
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
                    embedBuilders: kIsWeb
                        ? FlutterQuillEmbeds.editorsWebBuilders()
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
