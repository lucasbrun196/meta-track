part of 'meta_track_controller.dart';

enum MetaTrackStatus { initial, loading, success, failure }

class MetaTrackState {
  final MetaTrackStatus status;
  final List<GoalsEntity> goals;
  MetaTrackState({
    required this.status,
    required this.goals,
  });

  MetaTrackState.initial()
      : this(
          status: MetaTrackStatus.initial,
          goals: [],
        );

  MetaTrackState copyWith({
    MetaTrackStatus? status,
    List<GoalsEntity>? goals,
  }) {
    return MetaTrackState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
    );
  }
}
