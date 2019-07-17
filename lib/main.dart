import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<Step> _steps;
  int _current;

  void _stepContinue() {
    setState(() {
      _current++;
      if(_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if(_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _current = 0;
    _steps = <Step>[
      Step(
        title: Text("Step 1"),
        content: Text("Do something"),
        isActive: true
      ),
      Step(
          title: Text("Step 1"),
          content: Text("Do something"),
          isActive: false
      ),
      Step(
          title: Text("Step 1"),
          content: Text("Do something"),
          isActive: false
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Title Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Stepper(
            steps: _steps,
            type: StepperType.vertical,  // // TODO Info ->  StepperType.vertical is not working
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
          )
        ),
      ),
    );
  }

}
