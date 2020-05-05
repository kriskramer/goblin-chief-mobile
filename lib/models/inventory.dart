import 'package:flutter/foundation.dart';

class Inventory with ChangeNotifier {
  List<int> inventoryItems = new List(100);
  List<int> inventoryTotals = new List(100);
  List<int> inventoryUsed = new List(100);

  Inventory() {
    // Init all Lists to 0
      for (int i = 0; i < inventoryItems.length; i++) {
        inventoryItems[i] = 0;
      }

      for (int i = 0; i < inventoryItems.length; i++) {
        inventoryTotals[i] = 0;
      }

      for (int i = 0; i < inventoryItems.length; i++) {
        inventoryUsed[i] = 0;
      }

    // Set starting amounts
    inventoryItems[InventoryItemEnum.Food.index] = 15;
    inventoryItems[InventoryItemEnum.Stick.index] = 10;
    inventoryItems[InventoryItemEnum.Rock.index] = 5;
    inventoryItems[InventoryItemEnum.Shiny.index] = 1;
    inventoryItems[InventoryItemEnum.Straw.index] = 10;
    inventoryItems[InventoryItemEnum.Herb.index] = 3;
    inventoryItems[InventoryItemEnum.Clay.index] = 3;
    inventoryItems[InventoryItemEnum.Space.index] = 100;
    inventoryItems[InventoryItemEnum.Spore.index] = 1;
  }

  void updateInventoryItem(InventoryItemEnum item, int value) {
    if (item == InventoryItemEnum.Armor1) {
      inventoryItems[InventoryItemEnum.Armor1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Armor1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Armor1.index] += value;
    }
    if (item == InventoryItemEnum.Badge) {
      inventoryItems[InventoryItemEnum.Badge.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Badge.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Badge.index] += value;
    }
    if (item == InventoryItemEnum.Blood) {
      inventoryItems[InventoryItemEnum.Blood.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Blood.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Blood.index] += value;
    }

    if (item == InventoryItemEnum.Bone) {
      inventoryItems[InventoryItemEnum.Bone.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Bone.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Bone.index] += value;
    }

    if (item == InventoryItemEnum.Clay) {
      inventoryItems[InventoryItemEnum.Clay.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Clay.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Clay.index] += value;
    }

    if (item == InventoryItemEnum.Crystal) {
      inventoryItems[InventoryItemEnum.Crystal.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Crystal.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Crystal.index] += value;
    }

    if (item == InventoryItemEnum.Entrails) {
      inventoryItems[InventoryItemEnum.Entrails.index] += value;
      if (value > 0)
        inventoryTotals[InventoryItemEnum.Entrails.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Entrails.index] += value;
    }

    if (item == InventoryItemEnum.Essence) {
      inventoryItems[InventoryItemEnum.Essence.index] += value;
      if (value > 0)
        inventoryTotals[InventoryItemEnum.Essence.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Essence.index] += value;
    }

    if (item == InventoryItemEnum.Food) {
      inventoryItems[InventoryItemEnum.Food.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Food.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Food.index] += value;
    }

    if (item == InventoryItemEnum.Fur) {
      inventoryItems[InventoryItemEnum.Fur.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Fur.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Fur.index] += value;
    }

    if (item == InventoryItemEnum.Herb) {
      inventoryItems[InventoryItemEnum.Herb.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Herb.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Herb.index] += value;
    }

    if (item == InventoryItemEnum.Ichor) {
      inventoryItems[InventoryItemEnum.Ichor.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Ichor.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Ichor.index] += value;
    }

    if (item == InventoryItemEnum.Ore1) {
      inventoryItems[InventoryItemEnum.Ore1.index] += value;
      
      if (value > 0)
        inventoryTotals[InventoryItemEnum.Ore1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Ore1.index] += value;
    }

    if (item == InventoryItemEnum.Potion1) {
      inventoryItems[InventoryItemEnum.Potion1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Potion1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Potion1.index] += value;
    }

    if (item == InventoryItemEnum.Powder1) {
      inventoryItems[InventoryItemEnum.Powder1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Powder1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Powder1.index] += value;
    }

    if (item == InventoryItemEnum.Rock) {
      inventoryItems[InventoryItemEnum.Rock.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Rock.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Rock.index] += value;
    }

    if (item == InventoryItemEnum.Rune1) {
      inventoryItems[InventoryItemEnum.Rune1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Rune1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Rune1.index] += value;
    }

    if (item == InventoryItemEnum.Shiny) {
      inventoryItems[InventoryItemEnum.Shiny.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Shiny.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Shiny.index] += value;
    }

    if (item == InventoryItemEnum.Space) {
      inventoryItems[InventoryItemEnum.Space.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Space.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Space.index] += value;
    }

    if (item == InventoryItemEnum.Spore) {
      inventoryItems[InventoryItemEnum.Spore.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Spore.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Spore.index] += value;
    }

    if (item == InventoryItemEnum.Stick) {
      inventoryItems[InventoryItemEnum.Stick.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Stick.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Stick.index] += value;
    }

    if (item == InventoryItemEnum.Straw) {
      inventoryItems[InventoryItemEnum.Straw.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Straw.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Straw.index] += value;
    }

    if (item == InventoryItemEnum.Teeth) {
      inventoryItems[InventoryItemEnum.Teeth.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Teeth.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Teeth.index] += value;
    }

    if (item == InventoryItemEnum.Tool1) {
      inventoryItems[InventoryItemEnum.Tool1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Tool1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Tool1.index] += value;
    }

    if (item == InventoryItemEnum.Totem1) {
      inventoryItems[InventoryItemEnum.Totem1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Totem1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Totem1.index] += value;
    }

    if (item == InventoryItemEnum.Vat1) {
      inventoryItems[InventoryItemEnum.Vat1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Vat1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Vat1.index] += value;
    }

    if (item == InventoryItemEnum.Wall1) {
      inventoryItems[InventoryItemEnum.Wall1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Wall1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Wall1.index] += value;
    }

    if (item == InventoryItemEnum.Wand) {
      inventoryItems[InventoryItemEnum.Wand.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Wand.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Wand.index] += value;
    }

    if (item == InventoryItemEnum.Weapon1) {
      inventoryItems[InventoryItemEnum.Weapon1.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Weapon1.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Weapon1.index] += value;
    }

    if (item == InventoryItemEnum.Worm) {
      inventoryItems[InventoryItemEnum.Worm.index] += value;

      if (value > 0)
        inventoryTotals[InventoryItemEnum.Worm.index] += value;
      else
        inventoryUsed[InventoryItemEnum.Worm.index] += value;
    }

    notifyListeners();
  }
}

enum InventoryItemEnum {
  none,
  Food,
  Stick,
  Rock,
  Herb,
  Straw,
  Shiny,
  Bone,
  Teeth,
  Blood,
  Entrails,
  Fur,
  Clay,
  Spore,
  Worm,
  Ore1,
  Ore2,
  Ore3,
  Armor1,
  Armor2,
  Armor3,
  Armor4,
  Tool1,
  Tool2,
  Tool3,
  Tool4,
  Weapon1,
  Weapon2,
  Weapon3,
  Weapon4,
  Horn1,
  Trap1,
  Totem1,
  Totem2,
  Totem3,
  Vat1,
  Vat2,
  Vat3,
  Wall1,
  Wall2,
  Wall3,
  WorkbenchT1,
  WorkbenchT2,
  WorkbenchT3,
  WorkbenchW1,
  WorkbenchW2,
  WorkbenchW3,
  WorkbenchA1,
  WorkbenchA2,
  WorkbenchA3,
  Powder1,
  Powder2,
  Powder3,
  Potion1,
  Potion2,
  Potion3,
  Potion4,
  Potion5,
  Rune1,
  Rune2,
  Rune3,
  Essence,
  Ichor,
  Crystal,
  Wand,
  Badge,
  Space
}
