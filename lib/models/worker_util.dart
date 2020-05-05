import 'dart:math';

class WorkerUtil {

  static int getStartingAttributeValue() {
    return new Random().nextInt(25) + 10;
  }

  static int getStartingHealthValue() {
    return new Random().nextInt(50) + 30;
  }

  
}

enum WorkerStatEnum {
    none,
    focus,
    perception,
    strength,
    loyalty,
    constitution,
    intelligence,
    dexterity,
    cunning,
    spirit,
    health
}