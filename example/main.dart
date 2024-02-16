import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_about_app.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/dialogs/up_info.dart';
import 'package:flutter_up/dialogs/up_loading.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
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
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_alert_dialog.dart';
import 'package:flutter_up/widgets/up_button.dart';
import 'package:flutter_up/widgets/up_checkbox.dart';
import 'package:flutter_up/widgets/up_dropdown.dart';

import 'package:flutter_up/widgets/up_loading_button.dart';
import 'package:flutter_up/widgets/up_orientational_column_row.dart';
import 'package:flutter_up/widgets/up_radio_button.dart';
import 'package:flutter_up/widgets/up_text.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

import 'package:flutter_up/locator.dart';

/// Example Service
class MyService {
  info() {
    upConsole(UpConsoleLevel.info, "Hello World!");
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
    return UpAlertDialog(
      title: UpText(widget.document['title']),
      content: Container(),
      actions: <Widget>[
        ElevatedButton(
          child: const UpText("Okay"),
          onPressed: () {
            /// Okay pressed
          },
        ),
        ElevatedButton(
          child: const UpText("Cancel"),
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
  // static ThemeData myTheme = UpThemes.;
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
    setupFlutterUpLocators([
      FlutterUpLocators.upDialogService,
      FlutterUpLocators.upNavigationService,
      FlutterUpLocators.upScaffoldHelperService,
      FlutterUpLocators.upSearchService,
      FlutterUpLocators.upUrlService
    ]);

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
    // ServiceManager<UpNavigationService>().goBack();
    // ServiceManager<UpNavigationService>().goBack(result: true);

    // /// Navigate to route
    // ServiceManager<UpNavigationService>().navigateTo("HOME");

    // /// Wait for result
    // dynamic result =
    //     await ServiceManager<UpNavigationService>().navigateTo("LOGINSIGNUP");
    // upConsole(UpConsoleLevel.info, result);
  }

  /// Dialog Service
  dialogServiceExample(BuildContext context) {
    String completerId = ServiceManager<UpDialogService>()
        .showDialog(context, MyDialog(), data: null);
    ServiceManager<UpDialogService>()
        .onDialogComplete(completerId)!
        .then((value) {
      if (value != null && value['success'] == true) {
        upConsole(UpConsoleLevel.info, 'Success!');
      } else {
        upConsole(UpConsoleLevel.error, 'Error');
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
    upConsole(UpConsoleLevel.info, result.toString());
  }
}

/// Helpers
helpersExample(BuildContext context) {
  /// upConsole
  upConsole(UpConsoleLevel.info, 'Hello World!');

  /// Toast
  UpToast().showToast(
    context: context,
    text: "Not implemented yet!",
  );

  /// Clipboard
  upCopyTextToClipboard("Hi!");
  // upCopyToClipboard(const ClipboardData());

  /// UpSecurity
  /// UpSecurity helper uses AES 256 bit encryption
  /// so the passwords/keys need to be multiple of 16

  /// Initialize UpSecurity module (16 characters)
  UpSecurity.initialize("___AES_IV_KEY___");

  /// Descrypt text
  String? decryptedResult =
      UpSecurity.decrypt(text: "EncText", key: "1234567890123456");
  upConsole(UpConsoleLevel.debug, decryptedResult!);

  /// Encrypt text
  String encryptedResult =
      UpSecurity.encrypt(text: "Text", key: "1234567890123456");
  upConsole(UpConsoleLevel.debug, encryptedResult);
}

class WidgetsExamples {
  /// Flexible Text Field
  final _passwordVisible = false;
  final _passwordTextEditingController = TextEditingController();

  // _togglePasswordVisible() {
  //   /// If using in a widget
  //   /// setState(() {
  //   ///   _passwordVisible = !_passwordVisible;
  //   /// });
  //   _passwordVisible = !_passwordVisible;
  // }

  flexibleTextFieldExample() {
    return UpTextField(
      keyboardType: TextInputType.text,
      label: "Password",
      autofillHint: AutofillHints.password,
      readOnly: false,
      isFlexible: true,

      // decoration: InputDecoration(
      //     labelText: 'Password',
      //     suffixIcon: IconButton(
      //       icon: Icon(
      //         _passwordVisible ? Icons.visibility : Icons.visibility_off,
      //         semanticLabel:
      //             _passwordVisible ? 'Hide Password' : 'Show Password',
      //       ),
      //       onPressed: () {
      //         _togglePasswordVisible();
      //       },
      //     )),
      obscureText: !_passwordVisible,
      controller: _passwordTextEditingController,
    );
  }

  //UpCheckbox
  upCheckboxExample() {
    return UpCheckbox(
      labelDirection: UpTextDirection.left,
      label: "Number",
      onChange: (newcheck) {
        // Do something
      },
    );
  }

  //UpRadio
  upRadioExample() {
    return UpRadioButton(
      // label: "Male",

      labelDirection: UpTextDirection.left,
      // fillColor: Colors.white,
      items: const [],
      onChange: (radioValue) {
        //Do something
      },
    );
  }

  //UpButton
  upButtonExample() {
    return UpButton(
      type: UpButtonType.elevated,
      style: UpStyle(
        isDisabled: false,
        isRounded: true,
        borderRadius: 8,
      ),
      colorType: UpColorType.warn,
      onPressed: () {
        //Do something
      },
      child: const UpText("Button"),
    );
  }

  //UpLoadingButton
  upLoadingButtonExample() {
    return UpLoadingButton(
      isError: false,
      text: "Login",
      isLoading: false,
      isSuccess: true,
      onPress: () {
        //Do something
      },
    );
  }

  //upOrientationalColumnRow
  upOrientationalColumnRowExample() {
    return const UpOrientationalColumnRow(
      widths: [200, 0],
      children: [
        Text("child 1"),
        Text("child 2"),
      ],
    );
  }

  /// UpDropDownMenuWidget
  dropDownWidgetExample() {
    return UpDropDown(
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
                  // color: UpThemes.vintage.themeData.primaryColor,
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
