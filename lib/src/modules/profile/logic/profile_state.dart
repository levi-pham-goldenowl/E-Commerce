part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final XUser data;
  const ProfileState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];

  ProfileState copyWith({XUser? data}) {
    return ProfileState(
      data: data ?? this.data,
    );
  }
}
