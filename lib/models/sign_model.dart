part of 'models.dart';

enum SignType {
  letter,
  number,
}

extension SignTypeExtension on SignType {
  String get name {
    switch (this) {
      case SignType.letter:
        return 'letra';
      case SignType.number:
        return 'número';
      default:
        return '';
    }
  }
}

class Sign {
  String letter;
  String pathImage;
  SignType? type;
  Sign(this.letter, this.pathImage, {this.type = SignType.letter});
}
