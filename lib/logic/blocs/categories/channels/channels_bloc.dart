import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbark_iptv/helpers/helpers.dart';
import 'package:mbark_iptv/repository/models/channel_movie.dart';

import '../../../../repository/api/api.dart';
import '../../../../repository/models/channelLive.dart';
import '../../../../repository/models/channel_serie.dart';

part 'channels_event.dart';
part 'channels_state.dart';

class ChannelsBloc extends Bloc<ChannelsEvent, ChannelsState> {
  final IpTvApi api;
  ChannelsBloc(this.api) : super(ChannelsLoading()) {
    on<GetLiveChannelsEvent>((event, emit) async {
      emit(ChannelsLoading());

      if (event.typeCategory == TypeCategory.live) {
        final result = await api.getLiveChannels(event.catyId);
        emit(ChannelsLiveSuccess(result));
      } else if (event.typeCategory == TypeCategory.movies) {
        final result = await api.getMovieChannels(event.catyId);
        emit(ChannelsMovieSuccess(result));
      } else if (event.typeCategory == TypeCategory.series) {
        final result = await api.getSeriesChannels(event.catyId);
        emit(ChannelsSeriesSuccess(result));
      }
    });
  }
}
