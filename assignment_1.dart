void main() {
  List<Map<String, dynamic>> students = [
    {
      'name': 'Ahmed',
      'age': 21,
      'grades': [85, 90, 78]
    },
    {
      'name': 'Kariem',
      'age': 19,
      'grades': [92, 88, 95]
    },
    {
      'name': 'Salah',
      'age': 22,
      'grades': [75, 82, 79]
    }
  ];

  print('Student First Created');
  printInfoFun(students);

  students.add({
    'name': 'Muhammad',
    'age': 19,
    'grades': [80, 85, 90]
  });

  print('Add Single Student');
  printInfoFun(students);

  students.addAll([
    {
      'name': 'Ali',
      'age': 23,
      'grades': [70, 75, 80]
    },
    {
      'name': 'Omar',
      'age': 20,
      'grades': [95, 90, 93]
    }
  ]);

  print('Add Multiable Students');
  printInfoFun(students);

  students[0] = {
    'name': 'Hani',
    'age': 22,
    'grades': [94, 89, 97]
  };

  print('info of the first student Updated ');
  printInfoFun(students);

  print('Avg degress of all students');
  List<double> averages = calcAvg(students);
  for (int i = 0; i < students.length; i++) {
    print('${students[i]['name']}: ${averages[i].toStringAsFixed(2)}');
  }
}

List<double> calcAvg(List<Map<String, dynamic>> students) {
  return students.map((student) {
    List<int> grades = student['grades'];
    return grades.reduce((a, b) => a + b) / grades.length;
  }).toList();
}

void printInfoFun(List<Map<String, dynamic>> students) {
  List<double> averages = calcAvg(students);

  students.asMap().forEach((index, student) {
    print('${index + 1}. name: ${student['name']}, age: ${student['age']}, '
        'grades: ${student['grades']}, avg: ${averages[index].toStringAsFixed(2)}');
  });
}
