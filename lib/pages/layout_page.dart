import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Layout',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  color: Colors.black12,
                  height: 100,
                  width: 100,
                  child: const Center(child: Text("ROW")),
                ),
                Expanded(
                  flex: 2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        color: Colors.orange,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.brown,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.orange,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.brown,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 300,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 100,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 350,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 200,
                  child: const Center(child: Text("Hello")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}