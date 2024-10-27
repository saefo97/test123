import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnapp/components/search_delegate.dart';
import 'package:learnapp/provider/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'components/testing.dart';

class LearningWidget extends StatefulWidget {
  const LearningWidget({super.key});

  @override
  State<LearningWidget> createState() => _LearningWidgetState();
}

class _LearningWidgetState extends State<LearningWidget> {

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Widgets"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: themeNotifier.isDarkTheme,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchDelegateScreen()));
            },
            title: const Text("Search Delegate"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TestClass()));
            },
            title: const Text(
              "TestTestTestTestTestTestTest",
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.purple,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                shadows: [
                  Shadow(
                    color: Colors.pink,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                  Shadow(
                    color: Colors.red,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
                fontFamily: 'Lora',
              ),
            ),
          ),
          Container(
            width: 250,
            height: 250,
            child: Text("Dobleh",
            style: TextStyle(
            ),),
            margin: EdgeInsets.all(18),
            padding: EdgeInsets.all(18.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                transform: GradientRotation(90),
              ),
            ),
          ),
        ],
      ),
    );
  }
}