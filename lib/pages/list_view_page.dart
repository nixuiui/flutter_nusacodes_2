import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/components/add_button.dart';
import 'package:flutter_nusacodes_2/consts/colors.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: [
          const AddButton(),
          GridView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: const Icon(Icons.add_circle_outline, color: Colors.yellow)
              ),
              Container(
                color: ColorCustom.secondary,
                child: const Center(child: Text("Menu"))
              ),
              FilledButton(
                onPressed: () {},
                child: const Text("Click"),
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
            ],
          ),
          const Divider(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              final ganjil = index % 2 == 1;
              return Container(
                color: ganjil ? Colors.blue : Colors.green,
                child: Center(child: Text("Menu $index")),
              );
            }
          ),
          const Divider(height: 32),
          GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text("Menu"))
              ),
              Container(
                color: Colors.brown,
                child: const Center(child: Text("Menu"))
              ),
            ],
          ),
          const Divider(height: 32),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Text("Data ke $index"),
              );
            }
          ),
          const SizedBox(height: 16,),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Text("Data ke $index"),
            )
          ),
        ],
      ),
    );
  }
}