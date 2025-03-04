import 'dart:async';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular progress indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: Colors.black45),
          SizedBox(height: 20),
          Text('Circular y Linear controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatefulWidget {
  const _ControlledProgressIndicator();

//initState() y dispose() son métodos que se ejecutan cuando el widget se crea y se destruye, respectivamente.
  @override
  State<_ControlledProgressIndicator> createState() =>
      _ControlledProgressIndicatorState();
}

class _ControlledProgressIndicatorState
    extends State<_ControlledProgressIndicator> {
  double _progressValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _progressValue += 0.05;
        if (_progressValue >= 1.0) {
          _progressValue = 1.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: _progressValue,
            strokeWidth: 2,
            backgroundColor: Colors.black12,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}



//no funciono el LinearProgressIndicator
// import 'package:flutter/material.dart';

// class ProgressScreen extends StatelessWidget {

//   static const name = 'progress_screen';

//   const ProgressScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Progress Indicators'),
//       ),
//       body: const _ProgressView(),
//     );
//   }
// }

// class _ProgressView extends StatelessWidget {
//   const _ProgressView();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: const [
//           SizedBox(height: 30),
//           Text('Circula progress indicator'),
//           SizedBox(height: 10),
//           CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.black45 ),
          
//           SizedBox(height: 20),
//           Text('Circular y Linear controlado'),
//           SizedBox(height: 10),
//           _ControlledProgresIndicator(),

//         ],
//       ),
//     );
//   }
// }


// class _ControlledProgresIndicator extends StatelessWidget {
//   const _ControlledProgresIndicator();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Stream.periodic( const Duration( milliseconds: 300 ), (value) {
//         return (value * 2) / 100; // 0.0, 1.0
//       }).takeWhile((value) => value < 100 ),
//       builder: (context, snapshot) {

//         final progressValue = snapshot.data ?? 0;

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator( value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12, ),
//               const SizedBox(width: 20,),
//               Expanded(
//                 child: LinearProgressIndicator(value: progressValue )
//               ),
              
//             ],
//           ),
//         );

//       },
//     );
//   }
// }