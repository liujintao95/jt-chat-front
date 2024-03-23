import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jt_chat_front/views/add.dart';
import 'package:jt_chat_front/views/chat.dart';
import 'package:jt_chat_front/views/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomeContentBox(),
    UserContentBox(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "联系人",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: "用户",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.cyan,
          onTap: _onItemTapped,
        ));
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
          Expanded(
            child: ContactList()
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
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
                borderSide: const BorderSide(color: Colors.white, width: 0)
              ),
              border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: IconButton(
            icon: const Icon(
              Icons.add
            ),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const AddPage())
              );
            },
          ),
        ),
      ],
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({super.key});
  static const List<Widget> li = [
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
    ContactItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemCount: li.length,
      itemBuilder: (context, index) {
        return li[index];
      },
    );
  }
}

class ContactItem extends StatefulWidget {
  const ContactItem({super.key});

  @override
  State<ContactItem> createState() => _ContactItemState();

  
}

class _ContactItemState extends State<ContactItem> {
  Color currentColor = Colors.white;

  void _onItemTapped() {
    const timeout = Duration(milliseconds: 300);
    setState(() {
      currentColor = const Color.fromARGB(255, 219, 219, 219);
    });
    Timer(timeout, () {
      setState(() {
        currentColor =  Colors.white;
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context)=> const ChatPage())
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: currentColor,
        child:  const Row(
          children: [
            CircleImg(),
            NameAndMessage(),
            TimeAndCount()
          ],
        )
      ),
      onTap: () {
        _onItemTapped();
      },
    );
  }
}

class CircleImg extends StatelessWidget {
  const CircleImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: NetworkImage(
              "https://himg.bdimg.com/sys/portraitn/item/public.1.ae881e68.G2PBqIASRKyCsyWiY1HCQQ"),
            fit: BoxFit.cover)),
      )
    );
  }
}

class NameAndMessage extends StatelessWidget {
  const NameAndMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: SizedBox(
        width: 230,
        height: 60,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "这是名字",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold, // 设置加粗样式
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "这是最后一条数据信息哈哈哈哈,这是最后一条数据信息哈哈哈哈",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class TimeAndCount extends StatelessWidget {
  const TimeAndCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: SizedBox(
        width: 40,
        height: 60,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "03/17",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 25,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC10015),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("13",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 10.0
                    )
                  )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


class UserContentBox extends StatelessWidget {
  const UserContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://himg.bdimg.com/sys/portraitn/item/public.1.ae881e68.G2PBqIASRKyCsyWiY1HCQQ'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '北风忆夕',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '用户ID: 123456',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SettingItem(icon: Icons.person, title: '个人信息'),
          const Divider(indent: 60,),
          const SettingItem(icon: Icons.lock, title: '账号与安全'),
          const Divider(indent: 60,),
          const SettingItem(icon: Icons.notifications, title: '消息通知'),
          const Divider(indent: 60,),
          const LogOutButton()
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingItem({super.key, required this.icon, required this.title,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: ()=>{},
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: SelectionContainer.disabled(
          child: MaterialButton(
            color: Colors.cyan,
            textColor: Colors.white,
            minWidth: double.infinity,
            height: 58,
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>const LoginPage())
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "退出登录",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}