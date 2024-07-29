import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(height: 30),
          Text(
            'اذاعة القرأن الكريم',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.skip_previous_rounded,
                size: 50,
                color: AppTheme.darkPrimary,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: AppTheme.darkPrimary,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.skip_next_rounded,
                size: 50,
                color: AppTheme.darkPrimary,
              )
            ],
          )
        ],
      ),
    );
  }
}
