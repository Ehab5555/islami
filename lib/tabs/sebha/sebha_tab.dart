import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int numberOfTasbeh = 0;
  double angelDegree = 0.0;
  String tasbehName = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  left: MediaQuery.of(context).size.width * 0.47,
                  child: Image.asset(
                    'assets/images/head_sebha_logo.png',
                  ),
                ),
                Transform.rotate(
                  angle: angelDegree,
                  child: Image.asset(
                    'assets/images/body_sebha_logo.png',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.34,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 69,
              height: 81,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.darkPrimary.withOpacity(0.6),
              ),
              child: Text(
                '$numberOfTasbeh',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkPrimary,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                setState(() {
                  numberOfTasbeh++;
                  angelDegree += 12.0;
                  if (numberOfTasbeh == 0 || numberOfTasbeh == 99) {
                    tasbehName = 'سبحان الله';
                    numberOfTasbeh = 0;
                  } else if (numberOfTasbeh == 33) {
                    tasbehName = 'الله اكبر';
                  } else if (numberOfTasbeh == 66) {
                    tasbehName = 'لا اله الا الله';
                  }
                });
              },
              child: Text(
                tasbehName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
