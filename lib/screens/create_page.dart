import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const CreatePage());
  }
}

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  static const String path = '/create-page';

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final control = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1000,
            ),
            ElevatedButton(
              onPressed: () {
                control.toggle();
              },
              child: OverlayPortal(
                controller: control,
                overlayChildBuilder: (context) {
                  return Positioned(
                    top: 420,
                    child: Container(
                      width: 200,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('data'),
                    ),
                  );
                },
                child: Text('Create New value'),
              ),
            ),
            SizedBox(
              height: 1000,
            )
          ],
        ),
      ),
    );
  }
}
