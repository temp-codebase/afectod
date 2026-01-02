import 'package:flutter/material.dart';

class AfectodScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatActionButton;

  const AfectodScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.floatActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
