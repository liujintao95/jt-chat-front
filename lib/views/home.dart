import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HomeContentBox()),
    );
  }
}

class HomeContentBox extends StatelessWidget {
  const HomeContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          SearchInput(),
          ContactList(),
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        fillColor: Colors.grey[80],
        filled: true,
        isCollapsed: true,
        contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: "搜索",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white, width: 0)),
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          ContactItem(),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleImg(),
        CircleImg(),
        CircleImg(),
        CircleImg(),
        CircleImg(),
        CircleImg(),
        CircleImg(),
        CircleImg(),
      ],
    );
  }
}

class CircleImg extends StatelessWidget {
  const CircleImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(    
        width: 60,
        height: 60,
        decoration: BoxDecoration(
        //  color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: NetworkImage("https://himg.bdimg.com/sys/portraitn/item/public.1.ae881e68.G2PBqIASRKyCsyWiY1HCQQ"
            )   ,
            fit:BoxFit.cover     
            )
        ),
      )
    );
  }
}