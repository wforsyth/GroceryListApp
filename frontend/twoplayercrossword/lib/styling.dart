import 'package:flutter/material.dart';
import '../constants.dart';

InputDecoration whiteInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    alignLabelWithHint: true,
    filled: true,
    fillColor: Color(0xFFf5f1e2),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.black54, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );
}

final TextTheme appTextTheme = TextTheme(
  displayLarge: TextStyle(
    // H1 equivalent
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sora',
    color: kPrimaryTextColor,
  ),
  displayMedium: TextStyle(
    // H2
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Sora',
    color: kPrimaryTextColor,
  ),
  bodyLarge: TextStyle(
    // Main body text
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Sora',
    color: kPrimaryTextColor,
  ),
  bodyMedium: TextStyle(
    // Secondary body text
    fontSize: 24,
    fontFamily: 'Sora',
    fontWeight: FontWeight.normal,
    color: kPrimaryTextColor,
  ),
  labelLarge: TextStyle(
    // Buttons
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Sora',
    color: kPrimaryTextColor,
  ),
);

final ButtonStyle appButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kBackgroundColor, // Your kPrimaryColor
  foregroundColor: kBackgroundColor, // Text/icon color
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  elevation: 2,
);

final BottomNavigationBarThemeData appBottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: kPrimaryColor,
  selectedItemColor: kBackgroundColor,
  unselectedItemColor: kBackgroundColor.withOpacity(0.7),
  selectedLabelStyle: appTextTheme.bodyLarge,
  unselectedLabelStyle: appTextTheme.bodyLarge,
  type: BottomNavigationBarType.fixed, // ensures labels always show
  elevation: 8,
);