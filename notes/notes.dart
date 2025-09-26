// dart_practice.dart
import 'dart:async';
import 'dart:io';

/// ------------------------------------------------------------
/// 1) applyFunction: modify each element based on a provided fn
/// ------------------------------------------------------------
List<int> applyFunction(List<int> nums, int Function(int) fn) =>
    nums.map(fn).toList();

/// ------------------------------------------------------------
/// 2) transformList: anonymous fn capitalizes every other letter
///    (i.e., indices 0,2,4,... uppercase; 1,3,5,... lowercase)
/// ------------------------------------------------------------
List<String> transformList(List<String> input) {
  return input.map((s) {
    final chars = s.split('');
    for (var i = 0; i < chars.length; i++) {
      chars[i] = i.isEven ? chars[i].toUpperCase() : chars[i].toLowerCase();
    }
    return chars.join();
  }).toList();
}

/// ------------------------------------------------------------
/// 3) Arrow function: keep only odds, square them, return result
/// ------------------------------------------------------------
List<int> processOdds(List<int> nums) =>
    nums.where((n) => n.isOdd).map((n) => n * n).toList();

/// ------------------------------------------------------------
/// 4) greetUser: two OPTIONAL POSITIONAL args, default greeting
/// ------------------------------------------------------------
String greetUser([String? firstName, String? lastName]) {
  if ((firstName == null || firstName.isEmpty) &&
      (lastName == null || lastName.isEmpty)) {
    return 'Hello, Guest';
  }
  final parts = [firstName, lastName].where((p) => p != null && p!.isNotEmpty);
  return 'Hello, ${parts.join(' ')}';
}

/// ------------------------------------------------------------
/// 5) createEmail: NAMED args; extension has default "com"
/// ------------------------------------------------------------
String createEmail({
  required String username,
  required String domain,
  String extension = 'com',
}) =>
    '$username@$domain.$extension';

/// ------------------------------------------------------------
/// 6) Rectangle with named constructors: square & normal
/// ------------------------------------------------------------
class Rectangle {
  final double width;
  final double height;

  Rectangle.normal({required this.width, required this.height});
  Rectangle.square(double side)
      : width = side,
        height = side;

  double area() => width * height;

  @override
  String toString() => 'Rectangle($width x $height, area=${area()})';
}

void demonstrateRectangles() {
  final r1 = Rectangle.normal(width: 4, height: 6);
  final r2 = Rectangle.square(5);
  print('Normal: $r1');
  print('Square:  $r2');
}

/// ------------------------------------------------------------
/// 7) streamExample: stream 1..100, filter primes, print them
/// ------------------------------------------------------------
Stream<int> intRange(int start, int end) async* {
  for (var i = start; i <= end; i++) yield i;
}

bool _isPrime(int n) {
  if (n < 2) return false;
  if (n % 2 == 0) return n == 2;
  for (var d = 3; d * d <= n; d += 2) {
    if (n % d == 0) return false;
  }
  return true;
}

Future<void> streamExample() async {
  final primes = intRange(1, 100).where(_isPrime);
  await for (final p in primes) {
    // print prime numbers from 1..100
    stdout.write('$p ');
  }
  print('');
}

/// ------------------------------------------------------------
/// 8) fetchUserData: simulate network call with Future.delayed
/// ------------------------------------------------------------
Future<Map<String, dynamic>> fetchUserData() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return {
    'id': 42,
    'firstName': 'Ada',
    'lastName': 'Lovelace',
    'email': 'ada@example.com',
  };
}

Future<void> demoFetchUserData() async {
  final user = await fetchUserData();
  print('Fetched user: $user');
}

/// ------------------------------------------------------------
/// 9) compute: higher-order fn with anonymous ops (add/sub/mul)
/// ------------------------------------------------------------
int compute(int a, int b, int Function(int, int) op) => op(a, b);

void demonstrateCompute() {
  final add = compute(7, 5, (x, y) => x + y);
  final sub = compute(7, 5, (x, y) => x - y);
  final mul = compute(7, 5, (x, y) => x * y);
  print('add=$add, sub=$sub, mul=$mul');
}

/// ------------------------------------------------------------
/// 10) Async file sizes using arrow fns + Future + Stream
///     (Note: will work on real file paths; included try/catch)
/// ------------------------------------------------------------
Future<int> fileSize(String path) async => File(path).length();

Stream<int> fileSizes(List<String> paths) async* {
  for (final p in paths) {
    try {
      yield await File(p).length();
    } catch (_) {
      // Emit -1 for missing/inaccessible files to keep the stream going
      yield -1;
    }
  }
}

/// ------------------------------------------------------------
/// 11) Stream transform: square only even integers (anonymous fn)
/// ------------------------------------------------------------
Stream<int> evenSquares(Stream<int> source) =>
    source.map((n) => n.isEven ? n * n : n);

/// ------------------------------------------------------------
/// 12) Person with positional + named arguments; demo creator
/// ------------------------------------------------------------
class Person {
  final String firstName; // positional
  final String? lastName; // named
  final int? age;         // named

  Person(this.firstName, {this.lastName, this.age});

  @override
  String toString() =>
      'Person(firstName: $firstName, lastName: $lastName, age: $age)';
}

List<Person> makePeopleDemo() => [
      Person('Lia'),
      Person('Ken', lastName: 'Adams'),
      Person('Maya', age: 21),
      Person('Omar', lastName: 'Farouk', age: 30),
    ];

/// ------------------------------------------------------------
/// main(): quick demonstrations for each task
/// ------------------------------------------------------------
Future<void> main() async {
  // 1) applyFunction
  print(applyFunction([1, 2, 3, 4], (n) => n * 10)); // [10, 20, 30, 40]

  // 2) transformList
  print(transformList(['dart', 'Flutter', 'AbcDEF'])); // [DaRt, fLuTtEr, AbCdEf]

  // 3) odds squared
  print(processOdds([1, 2, 3, 4, 5, 6])); // [1, 9, 25]

  // 4) greetUser
  print(greetUser()); // Hello, Guest
  print(greetUser('Ada')); // Hello, Ada
  print(greetUser('Ada', 'Lovelace')); // Hello, Ada Lovelace

  // 5) createEmail
  print(createEmail(username: 'alice', domain: 'example')); // alice@example.com
  print(createEmail(username: 'bob', domain: 'mail', extension: 'org')); // bob@mail.org

  // 6) Rectangle constructors
  demonstrateRectangles();

  // 7) primes 1..100
  await streamExample();

  // 8) fetchUserData
  await demoFetchUserData();

  // 9) compute with anonymous ops
  demonstrateCompute();

  // 10) file sizes stream (replace with real paths to see sizes)
  final paths = ['README.md', 'does_not_exist.txt'];
  await for (final s in fileSizes(paths)) {
    print('size: $s');
  }

  // 11) evenSquares transform
  await for (final v in evenSquares(Stream.fromIterable([1, 2, 3, 4, 5, 6]))) {
    stdout.write('$v ');
  }
  print('');

  // 12) Person demo
  print(makePeopleDemo());
}