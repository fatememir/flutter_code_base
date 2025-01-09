import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'core/bloc/app_bloc_provider.dart';
import 'core/di/injection_container.dart';
import 'core/router/router.dart';
import 'core/widgets/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await AppRouter.initializeRouter();

  final blocProviders = await AppBlocProviders.getProviders();

  runApp(
    MultiBlocProvider(
      providers: blocProviders,
      child: const AppWidget(),
    ),
  );
}
