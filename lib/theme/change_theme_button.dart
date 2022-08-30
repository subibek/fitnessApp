import 'package:flutter/material.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class ChangeThemeButton extends StatefulWidget {

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: Colors.white,
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context,listen: false );
          provider.toggleTheme(value);
        }
    );
  }
}

