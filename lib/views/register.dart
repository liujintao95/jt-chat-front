import 'package:flutter/material.dart';
import 'package:jt_chat_front/views/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RegisterFormBox(),
      ),
    );
  }
}

class RegisterFormBox extends StatelessWidget {
  const RegisterFormBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        children: [
          TextTitle(text: "注册"),
          MobileInput(),
          PasswordInput(),
          PasswordAgainInput(),
          SubmitButton(),
          BackButton(),
        ],
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class MobileInput extends StatelessWidget {
  const MobileInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.black87),
          decoration: InputDecoration(
              fillColor: Colors.grey[80],
              filled: true,
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: "mobile",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.white, width: 0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ));
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.black87),
          decoration: InputDecoration(
              fillColor: Colors.grey[80],
              filled: true,
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: "password",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.white, width: 0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ));
  }
}

class PasswordAgainInput extends StatelessWidget {
  const PasswordAgainInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.black87),
          decoration: InputDecoration(
              fillColor: Colors.grey[80],
              filled: true,
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: "password again",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.white, width: 0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ));
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: SelectionContainer.disabled(
          child: MaterialButton(
            color: const Color.fromARGB(255, 40, 44, 255),
            textColor: Colors.white,
            minWidth: double.infinity,
            height: 58,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "创建",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

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
              "返回",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
