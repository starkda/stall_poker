import 'dart:math';
class Player {
  final int id;
  final String name;
  final int money;
  final bool isPlaying;
  final int? currentBet;
  final bool isDiller;
  final bool isMe;

  Player(
      {required this.id,
      required this.name,
      required this.money,
      required this.isPlaying,
      this.currentBet,
      required this.isDiller,
      required this.isMe});
  factory Player.generatePlayer(){
    var rng = Random();
    return Player(id: rng.nextInt(100000), name: rng.nextInt(100000000).toString(), money: rng.nextInt(100000), isPlaying: rng.nextBool(), isDiller: rng.nextBool(), isMe: rng.nextBool(), currentBet: rng.nextInt(100000));
  }
  static List<Player> generateListOfPlayers(int min, int max){
    List<Player> ret = [];
    var rng = Random();
    int val = min + rng.nextInt(max - min + 1) - 1;

    for (int i = 0; i < val; i++){
      ret.add(Player.generatePlayer());
    }
    return ret;
  }
}
