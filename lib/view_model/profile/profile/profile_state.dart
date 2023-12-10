part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class ProfileInitState extends ProfileState {}

class ChangeProfileState extends ProfileState {
  final String name;
  final String email;
  const ChangeProfileState({
    required this.name,
    required this.email,
  });

  @override
  List<Object> get props => [name, email];
}

class ChangeProfileImageState extends ProfileState {
  final String imageName;

  const ChangeProfileImageState(this.imageName);

  @override
  List<Object?> get props => [imageName];
}
