import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
