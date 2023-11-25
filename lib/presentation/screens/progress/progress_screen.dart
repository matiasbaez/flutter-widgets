
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {

  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30),

            Text('Circular progress indicator'),
            SizedBox(height: 10),
            Wrap(
              spacing: 20,
              children: [
                CircularProgressIndicator( strokeWidth: 2 ),
                CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.black45 ),
              ],
            ),

            SizedBox(height: 20),
            Text('Linear progress indicator'),
            SizedBox(height: 10),
            SizedBox(
              height: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator()
              )
            ),

            SizedBox(height: 20),
            Text('Circular progress indicator (controlled)'),
            SizedBox(height: 10),
            Wrap(
              spacing: 20,
              children: [
                _ControlledProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {

  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(

      stream: Stream.periodic( const Duration(milliseconds: 300 ), (value) {
        return (value * 2) / 100;
      } ).takeWhile((value) => value < 100),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue))
            ],
          ),
        );
      }
    );
  }
}
