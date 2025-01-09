import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

//for situation we do not need any params
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
