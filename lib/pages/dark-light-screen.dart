import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v2/providers/theme-provider.dart';

class DarkLightSceeen extends StatefulWidget {
  const DarkLightSceeen({super.key});

  @override
  State<DarkLightSceeen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DarkLightSceeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: const MaterialStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: MaterialStatePropertyAll(
                    themeProvider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(Icons.sunny),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value) {
                    themeProvider.toggledTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Việt Nam',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Icon(
                    themeProvider.isSelected ? Icons.nights_stay : Icons.sunny,
                    size: 250,
                    color: themeProvider.isSelected ? Colors.white : Colors.orange,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '25° C',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Chào buổi sáng',
                style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
              ),
              Text(
                'Tp. Hồ Chí Minh',
                style: TextStyle(fontSize: 25, color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 50,
                child: Divider(
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_twighlight),
                      Text("Mặt trời mọc"),
                      Text("5:30"),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.air),
                      Text("Gió"),
                      Text("4m/s"),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text("Nhiệt độ"),
                      Text("23"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
