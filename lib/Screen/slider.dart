import 'package:demo_app_provider/Provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  // double value = 1.0;

  @override
  Widget build(BuildContext context) {
    final Slidervalue = Provider.of<SliderProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            min: 0,
            max: 1,
            value: Slidervalue.value,
            onChanged: (value) {
              Slidervalue.setValue(value);
            },
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.green.withOpacity(Slidervalue.value),
                          child: Center(
                              child: Text(
                            "${Slidervalue.value}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.blue.withOpacity(Slidervalue.value),
                          child: Center(
                              child: Text(
                            "${Slidervalue.value}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
