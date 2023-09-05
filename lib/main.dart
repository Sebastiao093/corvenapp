import 'package:corven_app/providers/login_provider.dart';
import 'package:corven_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => LoginFormProvider()),
      ],
      child: MyApp(),
    )
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corven App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': ( _ ) => LoginScreen(),
        'home': ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color.fromRGBO(247, 143, 30, 2),
          centerTitle: true,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(247, 143, 30, 5),
          elevation: 0
        )
      ),
      
    );
  }
}