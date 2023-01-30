import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/current_game.dart';

class DataProvider extends StateNotifier<CurrentGame> {
  DataProvider(CurrentGame gameData) : super(gameData);
}
