import 'package:dange/dange.dart';
import 'package:dange/lvls.dart';
import 'package:dange/models/variant_result.dart';
import 'package:dange/widgets/level_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello syka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hello syka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<VariantResult> variants = [];
  VariantResult? resultSelect;

  void _calculateRoutes() {
    variants = calculateRoutesV3(4000);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: ListView(
          children: [
            SizedBox(
              height: 160 * 4 + 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          levels[index].index.toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      LevelWidget(
                        level: levels[index],
                        indexSelect: resultSelect != null && (index < resultSelect!.levelsSelect.length)
                            ? resultSelect!.levelsSelect[index].platform
                            : null,
                      ),
                      if (resultSelect != null && (index < resultSelect!.levelsSelect.length))
                        SizedBox(
                          width: 100,
                          child: Text(
                            resultSelect!.message[index],
                            maxLines: 30,
                          ),
                        )
                    ],
                  );
                },
                itemCount: levels.length,
              ),
            ),
            if (resultSelect != null)
              InfoRow(
                title: 'Begin BS',
                text: 120.toString(),
              ),
            if (resultSelect != null)
              InfoRow(
                title: 'Total level',
                text: resultSelect!.lvl.toString(),
              ),
            if (resultSelect != null)
              InfoRow(
                title: 'Total BS',
                text: resultSelect!.totalBS.toString(),
              ),
            if (resultSelect != null)
              InfoRow(
                title: 'Energy ',
                text: resultSelect!.energy.toString(),
              ),
            if (resultSelect != null)
              InfoRow(
                title: 'Levels',
                text: resultSelect!.levelsSelect.toString(),
              ),
            if (resultSelect != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      resultSelect = null;
                    });
                  },
                  child: Text('clear'),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(''),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Total lvl'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Total bs'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Energy'),
                      ),
                    ],
                  ),
                  ...List.generate(variants.length, (index) {
                    return TableRow(
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              resultSelect = variants[index];
                              print(resultSelect);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Показать'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(variants[index].lvl.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(variants[index].totalBS.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(variants[index].energy.toString()),
                        ),
                      ],
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateRoutes,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String text;
  const InfoRow({required this.title, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          children: [
            TextSpan(
              text: title,
            ),
            TextSpan(text: '  ' + text, style: TextStyle(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
