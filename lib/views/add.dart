import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("添加朋友"),
      ),
      body: const Center(
        child: AddUserBox(),
      ),
    );
  }
}

class AddUserBox extends StatelessWidget {
  const AddUserBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [SearchInput(), Expanded(child: SearchList())],
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
        hintText: "手机号或名称",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white, width: 0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({super.key});
  static const List<Widget> li = [
    SearchItem(),
    SearchItem(),
    SearchItem(),
    SearchItem(),
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

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  Color currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          color: currentColor,
          child: const Row(
            children: [
              CircleImg(),
              NameAndMessage(),
            ],
          )),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              child: const AddForm(),
            );
          },
        );
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
                      "https://gss0.bdstatic.com/6LZ1dD3d1sgCo2Kml5_Y_D3/sys/portrait/item/tb.1.e5a43d5.Nt2L1tujsLSpNNk_WGnGLw?t=1710656895"),
                  fit: BoxFit.cover)),
        ));
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
                  "这是他的个性签名",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  String? note;
  String? desc;

  void _submit() {
    print(note);
    print(desc);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => note = value,
              onSaved: (value) => note = value,
              decoration: const InputDecoration(
                labelText: '备注',
                hintText: '请输入备注',
              ),
            ),
            Expanded(
              child: TextFormField(
                onChanged: (value) => desc = value,
                decoration: const InputDecoration(
                  labelText: '说明',
                  hintText: '请输入说明',
                ),
                maxLines: null, // 允许输入多行
              ),
            ),
            MaterialButton(
              height: 58,
              minWidth: 300,
              onPressed: _submit,
              child: const Text('发送请求'),
            ),
          ],
        ),
      ),
    );
  }
}
