import 'package:flutter/material.dart';

import 'colours.dart';

ButtonStyle mainButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith((states) => elementColour),
);