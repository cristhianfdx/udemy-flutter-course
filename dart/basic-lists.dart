void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  numbers.add(6);
  print(numbers);

  List<int> otherNumbers = List(10);
  print(otherNumbers);

  otherNumbers[0] = 1;
  print(otherNumbers);
}
