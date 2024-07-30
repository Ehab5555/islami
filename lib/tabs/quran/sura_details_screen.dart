import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    loadSuraFile();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: ayat.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.14),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سورة ${args.suraName}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.play_circle_fill)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ListView.builder(
                          itemBuilder: (_, index) => Text(
                            ayat[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          itemCount: ayat.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
