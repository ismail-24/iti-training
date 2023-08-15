part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class UsersLoding extends TodoState {}

final class UsersSuccess extends TodoState {}

final class UsersError extends TodoState {}
