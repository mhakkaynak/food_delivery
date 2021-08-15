extension ImagePathExtension on String {
  String get toPng => 'asset/images/png/$this.png';
  String get toSvg => 'asset/images/svg/$this.svg';
}
