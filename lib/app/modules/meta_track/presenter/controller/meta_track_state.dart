part of 'meta_track_controller.dart';

enum MetaTrackStatus { initial, loading, success, failure }

class MetaTrackState {
  final MetaTrackStatus status;
  MetaTrackState({required this.status});

  MetaTrackState.initial() : this(status: MetaTrackStatus.initial);

  MetaTrackState copyWith({
    MetaTrackStatus? status,
  }) {
    return MetaTrackState(
      status: status ?? this.status,
    );
  }
}
