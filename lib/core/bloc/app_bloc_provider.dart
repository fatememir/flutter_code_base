import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/splash/preesentation/bloc/splash_bloc.dart';

class AppBlocProviders {
  static Future<List<BlocProvider>> getProviders() async {
    return [
      BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(),
      ),
    ];
  }
}
