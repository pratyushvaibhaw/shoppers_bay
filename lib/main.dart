import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/utils/routes/routes.dart';
import 'package:shoppers_bay/utils/routes/routes_name.dart';
import 'package:shoppers_bay/view_model/auth_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        
        theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: AppColor.themeColor3,
            )),
        onGenerateRoute: Routes().generateRoute,
        initialRoute: RoutesName.splashview,
      ),
    );
  }
}
