void main() {
  print(null ?? 2);
  print(1 ?? 4);
  print(null ?? 0);

  var value;
  //print(value.toLowerCase()); <-- THIS WILL CRASH
  print(value?.toLowerCase());

}