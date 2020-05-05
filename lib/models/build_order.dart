import 'package:goblin_chief/models/inventory.dart';
import 'package:goblin_chief/models/worker.dart';

class BuildOrder {
  BuildOrder({this.inventory, this.item}) {
    progress = 0;
    setMinimums();
    setName();
  }

  String name;
  int progress;
  Inventory inventory;
  InventoryItemEnum item;

  int minSticks = 0;
  int minRocks = 0;
  int minStraw = 0;
  int minHerbs = 0;
  int minBones = 0;
  int minFurs = 0;
  int minClay = 0;
  int minTeeth = 0;
  int minTools1 = 0;
  int minBlood = 0;
  int minEntrails = 0;

  setName() {
    if (item == InventoryItemEnum.WorkbenchT1) {
      name = "Workbench for decent tools";
    } else if (item == InventoryItemEnum.Tool1) {
      name = "Rough tool";
    } else if (item == InventoryItemEnum.Tool2) {
      name = "Decent tool";
    } else if (item == InventoryItemEnum.Weapon1) {
      name = "Rough weapon";
    } else if (item == InventoryItemEnum.Weapon2) {
      name = "Decent weapon";
    } else if (item == InventoryItemEnum.Armor1) {
      name = "Rough armor";
    } else if (item == InventoryItemEnum.Armor2) {
      name = "Decent armor";
    } else if (item == InventoryItemEnum.Powder1) {
      name = "No Sleep Powder";
    } else if (item == InventoryItemEnum.Powder2) {
      name = "Bright Lights Powder";
    } else if (item == InventoryItemEnum.Powder3) {
      name = "Big Strong Powder";
    } else if (item == InventoryItemEnum.Badge) {
      name = "Clan Badge";
    } else if (item == InventoryItemEnum.WorkbenchT2) {
      name = "Workbench for good tools";
    } else if (item == InventoryItemEnum.WorkbenchW1) {
      name = "Workbench for decent weapons";
    } else if (item == InventoryItemEnum.WorkbenchW2) {
      name = "Workbench for good weapons";
    } else if (item == InventoryItemEnum.WorkbenchA1) {
      name = "Workbench for decent armor";
    } else if (item == InventoryItemEnum.WorkbenchA2) {
      name = "Workbench for good armor";
    } else if (item == InventoryItemEnum.Ichor) {
      name = "Ichor";
    }
  }

  setMinimums() {
    minBlood = 0;
    minBones = 0;
    minClay = 0;
    minEntrails = 0;
    minFurs = 0;
    minHerbs = 0;
    minRocks = 0;
    minSticks = 0;
    minStraw = 0;
    minTeeth = 0;

    if (item == InventoryItemEnum.WorkbenchT1) {
      minRocks = 20;
      minStraw = 10;
      minSticks = 10;
      minTools1 = 1;
      minClay = 5;
    } else if (item == InventoryItemEnum.WorkbenchW1) {
      minRocks = 20;
      minStraw = 10;
      minSticks = 10;
      minTools1 = 1;
      minClay = 5;
    } else if (item == InventoryItemEnum.WorkbenchA1) {
      minRocks = 25;
      minStraw = 20;
      minSticks = 20;
      minTools1 = 2;
      minClay = 10;
    } else if (item == InventoryItemEnum.Tool1) {
      minRocks = 1;
      minSticks = 1;
      minStraw = 1;
    } else if (item == InventoryItemEnum.Tool2) {
      minRocks = 4;
      minSticks = 3;
      minStraw = 3;
      minClay = 1;
    } else if (item == InventoryItemEnum.Weapon1) {
      minRocks = 2;
      minSticks = 2;
      minStraw = 1;
    } else if (item == InventoryItemEnum.Weapon2) {
      minRocks = 3;
      minSticks = 4;
      minStraw = 5;
      minClay = 1;
    } else if (item == InventoryItemEnum.Armor1) {
      minFurs = 3;
      minBones = 5;
      minStraw = 5;
      minClay = 4;
    } else if (item == InventoryItemEnum.Armor2) {
      minRocks = 2;
      minSticks = 2;
      minStraw = 1;
    } else if (item == InventoryItemEnum.Powder1) {
      minHerbs = 1;
    } else if (item == InventoryItemEnum.Powder2) {
      minHerbs = 2;
    } else if (item == InventoryItemEnum.Powder3) {
      minHerbs = 3;
    } else if (item == InventoryItemEnum.Ichor) {
      minHerbs = 2;
      minBlood = 1;
      minEntrails = 1;
    } else if (item == InventoryItemEnum.Badge) {
      minBones = 2;
      minTeeth = 5;
      minClay = 2;
      // Need another item or two...
    }
  }

  areMaterialsAvailable() {
    if (inventory.inventoryItems[InventoryItemEnum.Stick.index] >= minSticks &&
        inventory.inventoryItems[InventoryItemEnum.Rock.index] >= minRocks &&
        inventory.inventoryItems[InventoryItemEnum.Herb.index] >= minHerbs &&
        inventory.inventoryItems[InventoryItemEnum.Bone.index] >= minBones &&
        inventory.inventoryItems[InventoryItemEnum.Fur.index] >= minFurs &&
        inventory.inventoryItems[InventoryItemEnum.Teeth.index] >= minTeeth &&
        inventory.inventoryItems[InventoryItemEnum.Tool1.index] >= minTools1 &&
        inventory.inventoryItems[InventoryItemEnum.Clay.index] >= minClay &&
        inventory.inventoryItems[InventoryItemEnum.Blood.index] >= minBlood &&
        inventory.inventoryItems[InventoryItemEnum.Entrails.index] >=
            minEntrails &&
        inventory.inventoryItems[InventoryItemEnum.Straw.index] >= minStraw) {
      return true;
    }
  }

  startWork() {
    removeMaterials();
    progress = 5;
  }

  removeMaterials() {
    inventory.updateInventoryItem(InventoryItemEnum.Bone, minBones * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Fur, minFurs * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Herb, minHerbs * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Rock, minRocks * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Stick, minSticks * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Straw, minStraw * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Teeth, minTeeth * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Blood, minBlood * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Entrails, minEntrails * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Tool1, minTools1 * -1);
    inventory.updateInventoryItem(InventoryItemEnum.Clay, minClay * -1);
  }

  makeProgress() {
    if (item == InventoryItemEnum.WorkbenchT1) {
      progress += 5;
    } else if (item == InventoryItemEnum.Tool1) {
      progress += 50;
    } else if (item == InventoryItemEnum.Tool2) {
      progress += 25;
    } else if (item == InventoryItemEnum.Weapon1) {
      progress += 50;
    } else if (item == InventoryItemEnum.Weapon2) {
      progress += 25;
    } else if (item == InventoryItemEnum.Armor1) {
      progress += 50;
    } else if (item == InventoryItemEnum.Armor2) {
      progress += 25;
    } else if (item == InventoryItemEnum.Powder1) {
      progress += 50;
    } else if (item == InventoryItemEnum.Powder2) {
      progress += 45;
    } else if (item == InventoryItemEnum.Powder3) {
      progress += 45;
    } else if (item == InventoryItemEnum.Ichor) {
      progress += 50;
    } else if (item == InventoryItemEnum.Badge) {
      progress += 15;
    }
  }

  bool isOrderComplete() {
    if (progress > 99) {
      return true;
    } else {
      return false;
    }
  }

  finishWork() {
    inventory.updateInventoryItem(item, 1);
  }

  cancelOrder() {
    if (progress > 0) {
      inventory.updateInventoryItem(InventoryItemEnum.Bone, minBones);
      inventory.updateInventoryItem(InventoryItemEnum.Fur, minFurs);
      inventory.updateInventoryItem(InventoryItemEnum.Herb, minHerbs);
      inventory.updateInventoryItem(InventoryItemEnum.Rock, minRocks);
      inventory.updateInventoryItem(InventoryItemEnum.Stick, minSticks);
      inventory.updateInventoryItem(InventoryItemEnum.Straw, minStraw);
      inventory.updateInventoryItem(InventoryItemEnum.Teeth, minTeeth);
      inventory.updateInventoryItem(InventoryItemEnum.Blood, minBlood);
      inventory.updateInventoryItem(InventoryItemEnum.Entrails, minEntrails);
      inventory.updateInventoryItem(InventoryItemEnum.Tool1, minTools1);
      inventory.updateInventoryItem(InventoryItemEnum.Clay, minClay);
      progress = 0;
    }
  }
}


class BuildOrderUtil {
  static bool doMaterialsCheck(Task task, Inventory inventory) {
    // if (task == InventoryItemEnum.WorkbenchT1) {
    //   minRocks = 20;
    //   minStraw = 10;
    //   minSticks = 10;
    //   minTools1 = 1;
    //   minClay = 5;
    // } else if (task == InventoryItemEnum.WorkbenchW1) {
    //   minRocks = 20;
    //   minStraw = 10;
    //   minSticks = 10;
    //   minTools1 = 1;
    //   minClay = 5;
    // } else if (task == InventoryItemEnum.WorkbenchA1) {
    //   minRocks = 25;
    //   minStraw = 20;
    //   minSticks = 20;
    //   minTools1 = 2;
    //   minClay = 10;
    // } else if (task == InventoryItemEnum.Tool1) {
    if (task == Task.Tool1) {
      if (inventory.inventoryItems[InventoryItemEnum.Rock.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Stick.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Straw.index] >= 1) {
        return true;
      }
    } else if (task == Task.Tool2) {
      if (inventory.inventoryItems[InventoryItemEnum.Rock.index] >= 4 &&
          inventory.inventoryItems[InventoryItemEnum.Stick.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.Clay.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Straw.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.WorkbenchT1.index] >= 1) {
        return true;
      }
    } else if (task == Task.Weapon1) {
      if (inventory.inventoryItems[InventoryItemEnum.Rock.index] >= 2 &&
          inventory.inventoryItems[InventoryItemEnum.Stick.index] >= 2 &&
          inventory.inventoryItems[InventoryItemEnum.Straw.index] >= 1) {
        return true;
      }
    } else if (task == Task.Weapon2) {
      if (inventory.inventoryItems[InventoryItemEnum.Rock.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.Stick.index] >= 4 &&
          inventory.inventoryItems[InventoryItemEnum.Clay.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Ore1.index] >= 1) {
        return true;
      }
    } else if (task == Task.Armor1) {
      if (inventory.inventoryItems[InventoryItemEnum.Fur.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.Bone.index] >= 5 &&
          inventory.inventoryItems[InventoryItemEnum.Clay.index] >= 4 &&
          inventory.inventoryItems[InventoryItemEnum.Straw.index] >= 5) {
        return true;
      }
    } else if (task == Task.Armor2) {
      if (inventory.inventoryItems[InventoryItemEnum.Rock.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.Stick.index] >= 4 &&
          inventory.inventoryItems[InventoryItemEnum.Clay.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Ore1.index] >= 1) {
        return true;
      }
    } else if (task == Task.Powder1) {
      if (inventory.inventoryItems[InventoryItemEnum.Herb.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Blood.index] >= 1) {
        return true;
      }
    } else if (task == Task.Powder2) {
      if (inventory.inventoryItems[InventoryItemEnum.Herb.index] >= 2 &&
          inventory.inventoryItems[InventoryItemEnum.Worm.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Blood.index] >= 1) {
        return true;
      }
    } else if (task == Task.Powder3) {
      if (inventory.inventoryItems[InventoryItemEnum.Herb.index] >= 4 &&
        inventory.inventoryItems[InventoryItemEnum.Worm.index] >= 2 &&
        inventory.inventoryItems[InventoryItemEnum.Blood.index] >= 2) {
        return true;
      }

    } else if (task == Task.Ichor) {
      if (inventory.inventoryItems[InventoryItemEnum.Herb.index] >= 3 &&
          inventory.inventoryItems[InventoryItemEnum.Entrails.index] >= 1 &&
          inventory.inventoryItems[InventoryItemEnum.Blood.index] >= 1) {
        return true;
      }
    } else if (task == Task.Badge) {
      if (inventory.inventoryItems[InventoryItemEnum.Bone.index] >= 2 &&
        inventory.inventoryItems[InventoryItemEnum.Teeth.index] >= 5 &&
        inventory.inventoryItems[InventoryItemEnum.Clay.index] >= 2) {
        return true;
      }
      // Need another item or two...
    }

    return false;
  }
}