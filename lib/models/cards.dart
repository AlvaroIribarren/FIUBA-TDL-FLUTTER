import "dart:math";


const oro = "ORO";
const basto = "BASTO";
const copa = "COPA";
const espada = "ESPADA";



class  Card {
  String type,image;
  num order, number;
  Card(this.type, this.number, this.order, this.image);
  updateOrder(){
      if((number >= 4 && number < 7) || (number >=10 && number <= 12)){
        order = number;
      } else if(number == 7 && ((type == copa) || (type == basto))){
        order = number;
      }
      else if(number == 1 && type != espada && type != basto){
          order = 13;
      } else if (number == 2) {
        order = 14;
      } else if (number == 3) {
        order = 15;
      } else if(number == 7 && type == oro){
        order = 16;
      } else if(number == 7 && type == oro){
        order = 17;
      } else if(number == 1 && type == basto){
        order = 18;
      } else {
        order = 19;
      }

  }
}

class Mazo {
  List<Card> cards = List.empty();
  Mazo() {
    _createCardOfType(oro);
    _createCardOfType(basto);
    _createCardOfType(espada);
    _createCardOfType(copa);
  }

  _createCardOfType(String type) {
    for (var i = 1; i <= 12; i++) {
      if (i != 8 && i != 9) {
        cards.add(Card(type, i, i, ""));
        cards[i].updateOrder();
      }
    }
  }

  dealCards(){
    final _random = Random();
    var cards = List.empty();
    for(var i = 0; i < 3; i++) {
      cards.add(this.cards[_random.nextInt(this.cards.length)]);
    }
    return cards;
  }


}
