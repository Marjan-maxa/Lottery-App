import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.title, required this.body, required this.showBackButton,  this.gradientColor});
final String title;
final Widget body;
final bool showBackButton;
final List<Color>?gradientColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title,
        style: const TextStyle(
           color: AppColors.white,
          fontWeight: .bold,
          fontSize: 22
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: .infinity,
        height: .infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: gradientColor?? AppColors.primaryGradient,
        )
      ),
        child: body,
    )
    );
  }
}
