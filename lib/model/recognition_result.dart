class TextRecognitionResult {
  final String text;
  final List<String> lines;

  const TextRecognitionResult(this.text, this.lines);

  bool isNotEmpty() => text.isNotEmpty && lines.isNotEmpty;

  factory TextRecognitionResult.empty() => const TextRecognitionResult('', <String>[]);
}
