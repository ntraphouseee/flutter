import 'package:get/get.dart';
import 'package:pemain_app/models/player.dart';

class PlayerController extends GetxController {
  var players = <Player>[
    Player(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHvFZnu-odZeu949vhlIvvu2hV8-qBK_aPAkXDKpT6CV39SiL3ofx1kpjrepqV0kWLH0k&usqp=CAU',
      name: 'Cristiano Ronaldo',
      position: 'Forward',
      number: 7,
    ),
    Player(
      image: 'https://imageio.forbes.com/specials-images/imageserve/663e595b4509f97fdafb95f5/0x0.jpg?format=jpg&crop=383,383,x1045,y23,safe&height=416&width=416&fit=bounds',
      name: 'Lionel Messi',
      position: 'Midfielder',
      number: 10,
    ),
  ].obs;

  void updatePlayer(int index, Player updatedPlayer) {
    players[index] = updatedPlayer;
  }

  void addPlayer(Player player) {
    players.add(player);
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }
}
