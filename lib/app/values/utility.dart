import 'package:flutter/material.dart';
import 'package:portfolio/app/values/color.dart';

BorderSide get borderSide => BorderSide(width: 1, color: borderColor);

BorderSide get activeBorderSide =>
    BorderSide(width: 2, color: selectedBorderColor);
