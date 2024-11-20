import 'package:easy_pms/features/log_in/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String name;
  final String password;

  UserEntity({required this.name, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [name, password];
}

extension UserEnityEx on UserEntity{
  UserModel toModel(){
    return UserModel(name: name, password: password);
  }
}