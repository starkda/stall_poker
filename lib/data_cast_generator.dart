class DataCastGenerator {
  Map<String, dynamic> initializeCast() {
    return {};
  }

  Map<String, dynamic> getCreateGameDataCast() {
    Map<String, dynamic> cast = initializeCast();
    cast['private'] = false;
    cast['bots'] = false;
    cast['maximal_players'] = 5.0;
    cast['blind_bet'] = 1.0;
    cast['thinking_time'] = 5.0;
    // some additional work....
    return cast;
  }
}
