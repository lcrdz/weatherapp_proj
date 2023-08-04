import 'package:flutter/material.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String? _searchText;
  final String _geolocation = "geolocation";
  String _displayedText = '';

  void updateDisplayedText(String text) {
    setState(() {
      _displayedText = text;
    });
  }

  void updateSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'buscar',
            onPressed: () => updateDisplayedText(_searchText ?? ''),
          ),
          title: TextField(
            decoration: const InputDecoration(
              hintText: 'search location...',
              border: InputBorder.none,
            ),
            onChanged: (text) => updateSearchText(text),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.location_pin),
              tooltip: 'geolocalização',
              onPressed: () => updateDisplayedText(_geolocation),
            )
          ],
        ),
        body: TabBarView(
          children: [
            tabScreen(["It's currently tab!", _displayedText]),
            tabScreen(["It's today tab!", _displayedText]),
            tabScreen(["It's weekly tab!", _displayedText]),
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          child: TabBar(
            tabs: [
              Tab(
                text: 'Currently',
                icon: Icon(Icons.sunny),
              ),
              Tab(
                text: 'Today',
                icon: Icon(Icons.today),
              ),
              Tab(
                text: 'Weekly',
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tabScreen(List<String> texts) {
  texts.removeWhere((element) => element.trim().isEmpty);
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: texts.map((text) => Text(text)).toList(),
    ),
  );
}
