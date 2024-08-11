import 'package:flutter/material.dart';
import 'package:votes_app/presentation/widget/home_app_bar.dart';
import 'package:votes_app/presentation/widget/home_options_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeAppBar(),
              Expanded(
                child: HomeOptionsGrid(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
