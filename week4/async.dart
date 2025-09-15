import 'dart:async';
import 'dart:collection';
// void main() async{
//   print('start fetching recipes');
//
//   await Future.delayed(Duration(seconds: 1), () {
//     print('recipes fetched');
//   });
//
//   print('after fetching recipees');
//
//
//   String computation = 'a random computation';
//   print(computation);
// }

// void main(){
//   Future.delayed(Duration(seconds: 1), () {
//     print('inside delayed 1');
//   }).then((_) {
//     print('inside then 1');
//   });
//
//   Future.delayed(Duration(seconds: 1), () {
//     print('inside delayed 2');
//   }).then((_) {
//     print('inside then 2');
//   });
//
//   print('after delayed');
// }

// void main() async{
//   Stream stream = countStream(5);
//   stream.listen((data) {
//     print('Data: $data');
//   });
//
//   Stream<int> countStream(int max) async* {
//     for (int i = 1; i<= max; i++) {
//       await Future.delayed(Duration(seconds: 1));
//       yield i;
//     }
//   }
//
//
// }

void main() {
  HashMap map1 = new HashMap<int, String>();

  map1.putIfAbsent(1, () => "apple");
  map1.putIfAbsent(2, () => "banana");
  map1.putIfAbsent(3, () => "orange");
  LinkedHashMap map2 = new LinkedHashMap<int, String>();

  map2.putIfAbsent(1, () => "apple");
  map2.putIfAbsent(2, () => "banana");
  map2.putIfAbsent(3, () => "orange");
  SplayTreeMap map3 = new SplayTreeMap<int, String>();

  map3.putIfAbsent(1, () => "apple");
  map3.putIfAbsent(2, () => "banana");
  map3.putIfAbsent(3, () => "orange");
}