import 'package:flutter/material.dart';
class SliderExample extends StatefulWidget {

  const SliderExample( { super.key});
  
 
   
  @override
  State<SliderExample> createState() => _SliderExampleState();
  double get_value(){
    return _SliderExampleState()._currentSliderValue;
  }

}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;
 
  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        });
      
      }}