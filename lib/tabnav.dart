// import 'package:flutter/material.dart';
// import 'bottomnav.dart';
// import 'package:vocab/Pages/annexe.dart';
// import 'package:vocab/Pages/home4.dart';
// import 'home.dart';


// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }

// class TabNavigator extends StatelessWidget {
//   TabNavigator({this.navigatorKey, this.tabItem});
//   final GlobalKey<NavigatorState> navigatorKey;
//   final TabItem tabItem;

//   void _push(BuildContext context) {
//     var routeBuilders = _routeBuilders(context, );

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
//       ),
//     );
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
//       {int materialIndex: 500}) {
//     return {
//       TabNavigatorRoutes.root: (context) => Annexe(
//             // color: activeTabColor[tabItem],
//             // title: tabName[tabItem],
            
//           ),
//       TabNavigatorRoutes.detail: (context) => GrammairePage(
            
//           ),
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.root,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) => routeBuilders[routeSettings.name](context),
//         );
//       },
//     );
//   }
// }