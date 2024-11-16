void hello(String name, int age) {
  print('Haloo $name, usia $age');
}

void hello2({
  required String name,
  int? age
}) {
  print('Haloo $name, usia ${age ?? 0}');
}

void main() {
  hello('Niki', 10);
  hello2(
    name: 'Niki',
  );
}