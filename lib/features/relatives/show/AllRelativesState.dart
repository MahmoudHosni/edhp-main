import 'package:edhp/models/RelativeMembership.dart';

abstract class AllRelativesState{}

class AllRelativesInitalState extends AllRelativesState{}

class AllRelativesListState extends AllRelativesState{
  final List<RelativeMembership> relatives;

  AllRelativesListState({required this.relatives});
}

class AllRelativesFailState extends AllRelativesState{}