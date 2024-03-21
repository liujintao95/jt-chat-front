import 'package:flutter/material.dart';
import 'package:jt_chat_front/views/home.dart';
import 'package:jt_chat_front/views/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginFormBox(),
      ),
    );
  }
}

class LoginFormBox extends StatelessWidget {
  const LoginFormBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        children: [
          TextTitle(text: "锦涛社"),
          MobileInput(),
          PasswordInput(),
          SubmitButton(),
          RegisterButton(),
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
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>const HomePage())
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "进入",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

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
                MaterialPageRoute(builder: (context)=>const RegisterPage())
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "注册",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
