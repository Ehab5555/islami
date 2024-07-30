import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/loading_indicator.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) loadHadethFile();
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        const SizedBox(
          height: 12,
        ),
        ahadeth.isEmpty
            ? LoadingIndicator()
            : Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethDetailsScreen.routeName,
                      arguments: ahadeth[index],
                    ),
                    child: Text(
                      ahadeth[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                ),
              ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');
    ahadeth = ahadethText.map(
      (hadethText) {
        List<String> hadethLines = hadethText.trim().split('\n');
        String title = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title: title, content: content);
      },
    ).toList();
    setState(() {});
  }
}
