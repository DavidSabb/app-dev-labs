import 'package:week3/shape.dart';

class Circle extends Shape {
  @override
  void area() {
    print("area of circle is PI * R * R");
  }

}

class Square extends Shape {
  @override
  void area() {
    print("area of square is side * side");
  }

}

enum Operation {
  plus,
  minus,
  multiply,
  divide
}

void main(){
  Square sq = new Square();
  sq.area();

  double tempFaren = 90.25;
  double tempCelc = (tempFaren - 32) / 1.8;

  print( '${tempFaren.toStringAsFixed(1)}F = ${tempCelc.toStringAsFixed(1)}C');

  add(int x, int y) => x + y;

  print(add(10,20));


  printNumber(123, 321);
  print(pow(2,3));
  print(pow(2,4));
  print(pow(3));

  test_param(123);
  test_param(123,s1:'hello');
  test_param(123,s2:'hello',s1:'world');

  var words = ['sky', 'cloud', 'forest', 'welcome'];
  words.forEach((String word) {
    print('$word has ${word.length} characters');
  });

  int inc(int x) => ++x;

  int dec(int x) => --x;

  int apply(int x, Function f) {
    return f(x);
  }

  int r1 = apply(3, inc);
  int r2 = apply(2, dec);
  print(r1);
  print(r2);
  Student emp1 = new Student();
  Student emp2 = new Student.namedConst("ST001");

  var macbook = Macbook(name: "Macbook Pro", color: "grey");
}

class Laptop {
  Laptop({var name, var color}){
    print("Laptop constructor");
    print("Name: $name");
    print("Color: $color");
  }
}

class Macbook extends Laptop {
  Macbook({var name, var color}) : super(name: name, color: color) {
    print("macbook constructor");
  }
}

class Student {
  Student(){
    print("Inside student constructor");
  }
  Student.namedConst(String stCode) {
    print(stCode);
  }
}

void printNumber(n1, [s1]) {
  print(n1);
  print(s1);
}

void test_param(n1, {s1, s2}) {
  print(n1);
  print(s1);
}

int pow(int x, [int y = 2]){
  int r = 1;
  for (int i = 0; i < y; i++) {
    r *= x;
  }
  return r;
}