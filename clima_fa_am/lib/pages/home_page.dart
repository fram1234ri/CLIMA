import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../widgets/weather_card.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherModel>(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Clima',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              weather.city,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Actualizado (demo)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    WeatherCard(weather: weather),
                    const SizedBox(height: 20),
                    // Pronóstico horario
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pronóstico horario',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weather.hourly.length,
                        itemBuilder: (context, index) {
                          final h = weather.hourly[index];
                          return Container(
                            width: 90,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 6),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  h.hour,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${h.tempC.toStringAsFixed(0)}°C',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  h.condition,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        // navegar a mapa
                        _onNavTap(1);
                      },
                      icon: const Icon(Icons.map),
                      label: const Text('Ver mapa de Quito'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Página del mapa (segunda pestaña)
          const MapPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Clima'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        ],
      ),
    );
  }
}
