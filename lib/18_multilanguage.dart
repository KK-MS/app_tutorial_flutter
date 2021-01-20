// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:easy_localization/easy_localization.dart';

// class Multilang extends StatelessWidget {
//   // This Widget is the root of our App

//   @override
//   Widget build(BuildContext context) {
//     var data = EasyLocalizationProvider.of(context).data;
//     return EasyLocalizationProvider(
//         data: data,
//         child: MaterialApp(
//           title: 'Flutter Multi-Language',
//           theme: ThemeData(
//             primarySwatch: Colors.yellow,
//           ),
//           home: MyHomePage(),
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             // app-specific localization
//             EasylocaLizationDelegate(
//               locale: data.locale,
//               path: 'assets',
//             ),
//           ],
//           supportedLocales: [Locale('de', 'DE'), Locale('en', 'US')],
//           locale: data.savedLocale,
//         ));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     var data = EasyLocalizationProvider.of(context).data;
//     return EasyLocalizationProvider(
//       data: data,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               AppLocalizations.of(context).tr('title'),
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Center(child: Text(AppLocalizations.of(context).tr('content'))),
//               RaisedButton(
//                 padding: EdgeInsets.all(10.0),
//                 color: Colors.yellow.shade600,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   setState(() {
//                     data.changeLocale(Locale('en', 'US'));
//                   });
//                 },
//                 child: Text(
//                   AppLocalizations.of(context).tr('Übersetzen nach Englische'),
//                 ),
//               ),
//               RaisedButton(
//                 padding: EdgeInsets.all(10.0),
//                 color: Colors.yellow.shade600,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   setState(() {
//                     data.changeLocale(Locale('de', 'DE'));
//                   });
//                 },
//                 child: Text(
//                   AppLocalizations.of(context).tr('Change it to Deutsch'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
