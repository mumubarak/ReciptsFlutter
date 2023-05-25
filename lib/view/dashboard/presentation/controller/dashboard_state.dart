part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class ChangeTabButtonsState extends DashboardState {}
class GetLineChartLoading extends DashboardState {}
class GetPinChartLoading extends DashboardState {}
