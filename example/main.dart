import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_up/dialogs/up_about_app.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/dialogs/up_info.dart';
import 'package:flutter_up/dialogs/up_loading.dart';
import 'package:flutter_up/helpers/up_clipboard.dart';
import 'package:flutter_up/helpers/up_console.dart';

import 'package:flutter_up/helpers/up_security.dart';
import 'package:flutter_up/helpers/up_toast.dart';
import 'package:flutter_up/services/up_navigation.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/services/up_url.dart';
import 'package:flutter_up/services/up_search.dart';

import 'package:flutter_up/models/up_label_value.dart';
import 'package:flutter_up/models/up_app_bar_item.dart';

import 'package:flutter_up/widgets/up_drop_down_menu.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

import 'package:flutter_up/locator.dart';
import 'package:flutter_up/themes.dart';

/// Example Service
class MyService {
  info() {
    console(UpConsoleLevel.info, "Hello World!");
  }
}

/// Example Widget
class MyWidget extends StatefulWidget {
  final String completerId;
  final dynamic document;
  const MyWidget({Key? key, required this.completerId, required this.document})
      : super(key: key);

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  _closeDialog() {
    ServiceManager<UpDialogService>().completeDialog(
        context: context,
        completerId: widget.completerId,
        result: {'success': true});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.document['title']),
      actionsPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      content: Container(),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("Okay"),
          onPressed: () {
            /// Okay pressed
          },
        ),
        ElevatedButton(
          child: const Text("Cancel"),
          onPressed: () {
            _closeDialog();
          },
        ),
      ],
    );
  }
}

/// Example Dialog showing usage of UpBaseDialog to create custom dialogs
class MyDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
        context: context,
        builder: (context) => const MyWidget(
            completerId: "CompleterId", document: {'title': 'MyWidget'}));
  }
}

/// Using themes
/// flutter_up comes with a few default themes which can be accessed using
class MyTheme {
  static ThemeData myTheme = FlutterUpThemes.themeRed;
}

/// Using various models
/// UpLabelValuePair
List<UpLabelValuePair> myUpLabelValuePairs = [
  UpLabelValuePair(label: 'Arts', value: 'Arts'),
  UpLabelValuePair(label: 'Business', value: 'Business'),
  UpLabelValuePair(label: 'Development', value: 'Development'),
  UpLabelValuePair(label: 'Other', value: 'Other')
];

/// Using various Dialogs
/// FlutterUp comes with many dialogs which can be used as follows

class DialogsExamples {
  showAboutDialog(context) {
    ServiceManager<UpDialogService>().showDialog(context, UpAboutAppDialog(),
        data: {'title': 'My Application', 'text': 'I write great software!'});
  }

  /// Loading Dialog
  loadingDialogExample(context) {
    String loadingDialogCompleterId = ServiceManager<UpDialogService>()
        .showDialog(context, UpLoadingDialog(),
            data: {'text': 'Logging in...'});

    /// perform task
    ServiceManager<UpDialogService>().completeDialog(
        context: context, completerId: loadingDialogCompleterId, result: null);
  }

  /// Info Dialog
  infoDialogExample(context) {
    ServiceManager<UpDialogService>().showDialog(context, UpInfoDialog(),
        data: {'title': 'Error', 'text': 'Please fill all fields!'});

    ServiceManager<UpDialogService>().showDialog(context, UpInfoDialog(),
        data: {'title': 'Success', 'text': 'Signup successful!'});
  }
}

/// Services
/// flutter_up includes many services
class ServicesExamples {
  /// ServiceManager uses locator to register services which can be accessed throughtout application
  /// To setup locator and set credential key
  void serviceManagerExample() {
    /// Initialize locators (ServiceManager)
    setupFlutterUpLocators();

    /// Add any extra service that you have created
    ServiceManager.registerLazySingleton(() => MyService());

    /// Run application
    /// runApp(Application());
  }

  /// Navigation Service
  navigationServiceExample() async {
    /// UpNavigationService contains one Navigator key
    MaterialApp(
        title: "Title",
        navigatorKey: ServiceManager<UpNavigationService>().navigatorKey);

    /// Go back
    ServiceManager<UpNavigationService>().goBack();
    ServiceManager<UpNavigationService>().goBack(result: true);

    /// Navigate to route
    ServiceManager<UpNavigationService>().navigateTo("HOME");

    /// Wait for result
    dynamic result =
        await ServiceManager<UpNavigationService>().navigateTo("LOGINSIGNUP");
    console(UpConsoleLevel.info, result);
  }

  /// Dialog Service
  dialogServiceExample(BuildContext context) {
    String completerId = ServiceManager<UpDialogService>()
        .showDialog(context, MyDialog(), data: null);
    ServiceManager<UpDialogService>()
        .onDialogComplete(completerId)!
        .then((value) {
      if (value != null && value['success'] == true) {
        console(UpConsoleLevel.info, 'Success!');
      } else {
        console(UpConsoleLevel.error, 'Error');
      }
    });
  }

  /// UpSearchService
  seachServiceExample() {
    /// Get stream
    ServiceManager<UpSearchService>().stream$;

    /// Get current value
    ServiceManager<UpSearchService>().current;

    /// Update value
    ServiceManager<UpSearchService>().update("search keyword");
  }

  /// UpUrlService
  urlServiceExample() async {
    bool result =
        await ServiceManager<UpUrlService>().openUrl("https://google.com/");
    console(UpConsoleLevel.info, result.toString());
  }
}

/// Helpers
helpersExample(BuildContext context) {
  /// Console
  console(UpConsoleLevel.info, 'Hello World!');

  /// Toast
  showUpToast(context, "Not implemented yet!");

  /// Clipboard
  copyTextToClipboard("Hi!");
  copyToClipboard(const ClipboardData());

  /// UpSecurity
  /// UpSecurity helper uses AES 256 bit encryption
  /// so the passwords/keys need to be multiple of 16

  /// Initialize UpSecurity module (16 characters)
  UpSecurity.initialize("___AES_IV_KEY___");

  /// Descrypt text
  String? decryptedResult = UpSecurity.decrypt("EncText", "1234567890123456");
  console(UpConsoleLevel.debug, decryptedResult!);

  /// Encrypt text
  String encryptedResult = UpSecurity.encrypt("Text", "1234567890123456");
  console(UpConsoleLevel.debug, encryptedResult);
}

class WidgetsExamples {
  /// Flexible Text Field
  var _passwordVisible = false;
  final _passwordTextEditingController = TextEditingController();

  _togglePasswordVisible() {
    /// If using in a widget
    /// setState(() {
    ///   _passwordVisible = !_passwordVisible;
    /// });
    _passwordVisible = !_passwordVisible;
  }

  flexibleTextFieldExample() {
    return UpTextField(
      readOnly: false,
      fixedLengths: const [16],
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              semanticLabel:
                  _passwordVisible ? 'Hide Password' : 'Show Password',
            ),
            onPressed: () {
              _togglePasswordVisible();
            },
          )),
      obscureText: !_passwordVisible,
      controller: _passwordTextEditingController,
    );
  }

  /// UpDropDownMenuWidget
  dropDownWidgetExample() {
    return UpDropDownMenuWidget(
      value: 'Arts',
      itemList: myUpLabelValuePairs,
      onChanged: (value) => {
        /// Do something
      },
    );
  }

  //UpAppBarItem
  popupMenuButtonExample() {
    return PopupMenuButton<UpAppBarItem>(
      itemBuilder: (BuildContext context) {
        return [
          UpAppBarItem(title: 'Delete', icon: Icons.delete),
          UpAppBarItem(title: 'Logout', icon: Icons.power_settings_new)
        ].map((UpAppBarItem item) {
          return PopupMenuItem<UpAppBarItem>(
              value: item,
              child: Row(children: [
                Icon(
                  item.icon,
                  color: FlutterUpThemes.themeRed.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(item.title ?? ""),
                )
              ]));
        }).toList();
      },
    );
  }
}
