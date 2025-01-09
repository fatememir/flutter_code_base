import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc()..add(const SplashEvent.started()),
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            state.maybeWhen(success: () {
              GoRouter.of(context).go('/product');
            }, orElse: () {});
          },
          builder: (context, state) {
            return const Stack(children: [Center(child: Icon(Icons.shopping_cart,size: 42,))]);
          },
        ),
      ),
    );
  }
}
