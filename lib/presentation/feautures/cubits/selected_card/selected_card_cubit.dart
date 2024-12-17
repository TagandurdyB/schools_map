// import 'package:schools_map/config/core/exports.dart';
// import 'package:flutter/foundation.dart';

// part 'selected_card_state.dart';

// class SelectedCardCubit extends Cubit<SelectedCardState> {
//   SelectedCardCubit() : super(SelectedCardState(cards: []));

//   void addCard(CardEntity card) {
//     if (state.cards.length > 5) return;
//     var cards = state.cards;
//     cards.add(card);
//     emit(state.copyWith(cards: cards));
//   }

//   void erease({int? index}) {
//     if (index == null) {
//       emit(SelectedCardState(cards: []));
//     } else {
//       var cards = state.cards;
//       cards.removeAt(index);
//       emit(state.copyWith(cards: cards));
//     }
//   }
// }
