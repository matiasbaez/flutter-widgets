
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  const SnackbarScreen({ super.key });

  void showCustomSnackBar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text('Snackbar'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false, // Force to select an option to close
      builder: (_) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Cillum consectetur sit reprehenderit deserunt laborum Lorem ad ut id eu. Quis eiusmod ipsum esse exercitation elit ut sit deserunt. Duis cillum quis aliquip sit mollit ad. Amet aute esse do sint.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Anim nostrud cupidatat pariatur do deserunt nulla deserunt. Ex do ipsum proident nisi. Exercitation ipsum minim aute labore enim culpa consequat aliqua incididunt do aliquip ipsum ut. Quis ullamco nulla deserunt duis sint ea proident. Nulla voluptate fugiat voluptate nostrud veniam cupidatat.'),
                  ]
                );
              },
              child: const Text('Used licenses')
            ),

            FilledButton(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Show dialog')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        },
        icon: const Icon( Icons.remove_red_eye_outlined ),
        label: const Text('Show snackbar')
      ),
    );
  }
}
