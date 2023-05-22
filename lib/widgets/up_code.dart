import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/helpers/up_clipboard.dart';
import 'package:flutter_up/helpers/up_toast.dart';
import 'package:flutter_up/widgets/up_button.dart';
import 'package:flutter_up/widgets/up_dynamic_view.dart';

class UpCode extends StatefulWidget {
  final String? code;
  final String? assetCode;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final String language;
  final Map<String, TextStyle> theme;
  final bool showViewToggle;
  const UpCode({
    super.key,
    this.code,
    this.assetCode,
    this.height = 256,
    this.padding = const EdgeInsets.only(top: 12),
    this.backgroundColor,
    this.language = 'dart',
    this.showViewToggle = false,
    this.theme = const {
      'root': TextStyle(
          backgroundColor: Colors.transparent, color: Color(0xff272822)),
      'tag': TextStyle(color: Color(0xfff92672)),
      'keyword':
          TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
      'selector-tag':
          TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
      'literal':
          TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
      'strong': TextStyle(color: Color(0xfff92672)),
      'name': TextStyle(color: Color(0xfff92672)),
      'code': TextStyle(color: Color(0xff66d9ef)),
      'attribute': TextStyle(color: Color(0xffbf79db)),
      'symbol': TextStyle(color: Color(0xffbf79db)),
      'regexp': TextStyle(color: Color(0xffbf79db)),
      'link': TextStyle(color: Color(0xffbf79db)),
      'string': TextStyle(color: Color(0xFF0A3F02)),
      'bullet': TextStyle(color: Color(0xFF0A3F02)),
      'subst': TextStyle(color: Color(0xFF0A3F02)),
      'title': TextStyle(color: Color(0xFF0A3F02), fontWeight: FontWeight.bold),
      'section':
          TextStyle(color: Color(0xFF0A3F02), fontWeight: FontWeight.bold),
      'emphasis': TextStyle(color: Color(0xFF0A3F02)),
      'type': TextStyle(color: Color(0xFF0A3F02), fontWeight: FontWeight.bold),
      'built_in': TextStyle(color: Color(0xFF0A3F02)),
      'builtin-name': TextStyle(color: Color(0xffa6e22e)),
      'selector-attr': TextStyle(color: Color(0xffa6e22e)),
      'selector-pseudo': TextStyle(color: Color(0xffa6e22e)),
      'addition': TextStyle(color: Color(0xffa6e22e)),
      'variable': TextStyle(color: Color(0xFF0A3F02)),
      'template-tag': TextStyle(color: Color(0xffa6e22e)),
      'template-variable': TextStyle(color: Color(0xffa6e22e)),
      'comment': TextStyle(color: Color(0xff75715e)),
      'quote': TextStyle(color: Color(0xff75715e)),
      'deletion': TextStyle(color: Color(0xff75715e)),
      'meta': TextStyle(color: Color(0xff75715e)),
      'doctag': TextStyle(fontWeight: FontWeight.bold),
      'selector-id': TextStyle(fontWeight: FontWeight.bold),
    },
  });

  @override
  State<UpCode> createState() => _UpCodeState();
}

class _UpCodeState extends State<UpCode> {
  String mode = 'Code';

  String _fixAssetCode(String data) {
    return data.replaceAll("\u000d", "").replaceAll("\u0022", "'");
    // .replaceAll("\u0024 ", "\$");
  }

  Widget _fixedWidget(BuildContext context, String text) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: UpConfig.of(context).theme.primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: mode == 'Code'
                  ? HighlightView(
                      text,
                      language: widget.language,
                      theme: widget.theme,
                      padding: const EdgeInsets.all(16),
                    )
                  : UpDynamicView(
                      code: text,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: UpButton(
              onPressed: () {
                upCopyTextToClipboard(text);
                UpToast().showToast(
                  context: context,
                  text: "Copied to clipboard",
                  isRounded: true,
                  borderRadius: 20,
                );
              },
              type: UpButtonType.icon,
              child: const Icon(Icons.copy),
            ),
          ),
          Visibility(
            visible: widget.showViewToggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: UpButton(
                onPressed: () {
                  setState(() {
                    mode = mode == 'View' ? 'Code' : 'View';
                  });
                },
                type: UpButtonType.icon,
                child: const Icon(Icons.code),
              ),
            ),
          )
        ].toList(),
        // DartCodeViewer(
        //   backgroundColor:
        //       backgroundColor ?? const Color.fromARGB(40, 158, 158, 158),
        //   text,
        //   height: height,
        // ),
      ),
    );
  }

  // Widget _scrollableWidget(String text) {
  //   return Container(
  //     height: widget.maxHeight,
  //     padding: widget.padding,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.vertical,
  //       child:
  //           // DartCodeViewer(
  //           //   backgroundColor:
  //           //       backgroundColor ?? const Color.fromARGB(40, 158, 158, 158),
  //           //   text,
  //           //   height: height,
  //           //   width: 10000,
  //           //   // backgroundColor: GoogleFonts.robotoMono().copyWith(color: Colors.pink),
  //           // ),
  //           SizedBox(
  //         width: 10000,
  //         child: HighlightView(
  //           text,
  //           language: widget.language,
  //           theme: widget.theme,
  //           padding: const EdgeInsets.all(8),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _showCode(BuildContext context, String text) {
    return _fixedWidget(context, text.trim());
    // if (widget.maxHeight >= widget.height) {
    // } else {
    //   return _fixedWidget(context, text.trim());
    //   //_scrollableWidget(text.trim());
    // }
  }

  Widget _showMessage(String message) {
    return SizedBox(
      height: widget.height,
      child: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.code != null) {
      return _showCode(
        context,
        _fixAssetCode(widget.code!),
      );
    } else if (widget.assetCode != null) {
      return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(widget.assetCode!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return _showCode(context, _fixAssetCode(snapshot.data ?? ""));
            } else {
              return _showMessage("Error occured while loading Code!");
            }
          } else {
            return _showMessage("Loading!");
          }
        },
      );
    } else {
      return _showMessage("Nothing to show!");
    }
  }
}
