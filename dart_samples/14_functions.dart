yell(str) => str.toUpperCase();

List<String> lines(String str) {
  return str.split('\n');
}

const poem = '''
The wren
Earns his living
Noiselessly.''';

void main() {
  var poemLines = lines(poem);
  print('大写字母：${yell(poemLines.first)}');

  // main主函数内可以创建函数
  var whisper = (String str) => str.toLowerCase();
  print('小写字母：${poemLines.map(whisper).last}');

  print('poem:${poem}');
}
