import 'dart:io';
import 'dart:async';
import 'dart:math';
// import 'dart:ui';

Stream<int> generateNumbers(StreamController<int> controller) async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 1));

    controller.sink.add(i);
  }
}

Future<int> getRandomValue() async {
  await Future.delayed(Duration(seconds: 2));
  var random = new Random();
  return random.nextInt(150);
}

int findMaxVal(List<int> list) {
  list.forEach((e) => print(e));
  return list.reduce(max);
}

void main() async{
  final controller = StreamController<int>();

  final stream = generateNumbers(controller);

  stream.listen((value) {
    print(value);
  });

  Future.delayed(Duration(seconds: 3), () {
    controller.close();
  });

  // final maximum = await Future.wait([
  //   getRandomValue(),
  //   getRandomValue(),
  //   getRandomValue(),
  //   getRandomValue(),
  //   getRandomValue(),
  //   getRandomValue()
  // ]).then((List<int> results) => findMaxVal(results));
  //
  // print("Maximum is: ${maximum}");

  //creating and using map
  Map<String, int> ageMap = {
    'Alice': 24,
    'Bob': 30,
    'John': 30,
  };

  int aliceAge = ageMap['Alice'];

  ageMap['david'] = 28;

  ageMap.remove('Charlie');
}


// void main(){
//   //asynchronous task
//   File file1 = new File("C:\\Users\\6243880\\Desktop\\names.txt");
//   Future<String> fs = file1.readAsString();
//
//   fs.then((data)=>print(data));
//   print("end of main");
//
//   //synchronous task
//   print("enter your favorite car");
//
//   var car = stdin.readLineSync();
//
//   print("the car is ${car}");
//   print("end of main");
// }