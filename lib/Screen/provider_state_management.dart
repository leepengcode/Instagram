import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotifireState extends StatefulWidget {
  const NotifireState({super.key});

  @override
  State<NotifireState> createState() => _NotifireStateState();
}

class _NotifireStateState extends State<NotifireState> {
  @override
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _togglePwd = ValueNotifier(false);
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  "${_counter.value.toString()}",
                  style: TextStyle(fontSize: 30),
                );
              },
            )),
            SizedBox(
              height: 100,
            ),
            ValueListenableBuilder(
              valueListenable: _togglePwd,
              builder: (context, value, child) {
                return TextField(
                  obscureText: _togglePwd.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: InkWell(
                          onTap: () {
                            _togglePwd.value = !_togglePwd.value;
                          },
                          child: Icon(_togglePwd.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print("${_counter.value}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
