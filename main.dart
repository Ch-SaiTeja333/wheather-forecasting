import 'package:flutter/material.dart';

void main() => runApp(const WeatherUIApp());

class WeatherUIApp extends StatelessWidget {
  const WeatherUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherUIScreen(),
    );
  }
}

class WeatherUIScreen extends StatefulWidget {
  const WeatherUIScreen({super.key});

  @override
  State<WeatherUIScreen> createState() => _WeatherUIScreenState();
}

class _WeatherUIScreenState extends State<WeatherUIScreen> {
  final TextEditingController _controller = TextEditingController();
  String city = "Monday";
  double temperature = 20;
  String condition = "Partly Cloudy";
  double humidity = 50;
  double windSpeed = 20;
  double pressure = 1010;

  List<Map<String, dynamic>> forecast = [
    {"day": "SUN", "temp": 25, "icon": Icons.wb_sunny},
    {"day": "MON", "temp": 19, "icon": Icons.cloud},
    {"day": "TUE", "temp": 15, "icon": Icons.wb_cloudy},
    {"day": "WED", "temp": 15, "icon": Icons.cloud_queue},
    {"day": "THU", "temp": 10, "icon": Icons.cloudy_snowing},
    {"day": "FRI", "temp": 8, "icon": Icons.thunderstorm},
    {"day": "SAT", "temp": 20, "icon": Icons.wb_sunny},
  ];

  void updateWeather(String newCity) {
    setState(() {
      city = newCity;
      temperature = 18 + (newCity.length % 10).toDouble();
      condition = "Sunny";
      humidity = 45 + (newCity.length % 30).toDouble();
      windSpeed = 10 + (newCity.length % 10).toDouble();
      pressure = 1000 + (newCity.length % 15).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter city name",
                    hintStyle: const TextStyle(color: Colors.white70),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          updateWeather(_controller.text);
                        }
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$temperature°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Icon(Icons.wb_sunny, color: Colors.yellow.shade300, size: 90),
                const SizedBox(height: 8),
                Text(
                  condition,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.water_drop, color: Colors.white),
                        Text(
                          "$humidity%",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.air, color: Colors.white),
                        Text(
                          "East, $windSpeed km/h",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.speed, color: Colors.white),
                        Text(
                          "$pressure hPa",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: forecast
                        .map(
                          (day) => Column(
                            children: [
                              Icon(day["icon"], color: Colors.white, size: 28),
                              const SizedBox(height: 4),
                              Text(
                                day["day"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "+${day["temp"]}°C",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
