import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:goblin_chief/models/build_order.dart';
import 'package:goblin_chief/models/inventory.dart';
import 'package:goblin_chief/models/worker_util.dart';

import '../constants/names.dart';

class Worker with ChangeNotifier {
  int id;
  String name;
  String status;
  Task task = Task.Hunt;
  WorkerType workerType = WorkerType.Grunt;
  InventoryItemEnum buildTask;

  int focus;
  int perception;
  int loyalty;
  int strength;
  int constitution;
  int cunning;
  int intelligence;
  int spirit;
  int dexterity;
  int focusTemp = 0;
  int perceptionTemp = 0;
  int loyaltyTemp = 0;
  int strengthTemp = 0;
  int constitutionTemp = 0;
  int intelligenceTemp = 0;
  int spiritTemp = 0;
  int dexterityTemp = 0;
  int cunningTemp = 0;

  int health = 0;
  int healthMax = 0;
  int fatigue = 0;
  int hunger = 0;
  int tired = 0;
  int exp = 0;
  int level = 1;
  int starLevel = 0;
  int skillPoint = 0;

  bool isHungry = false;
  bool isExhausted = false;
  bool isInjured = false;
  bool isAwake = true;
  bool isTired = false;
  bool isDead = false;

  bool tool1Equipped = false;
  bool tool2Equipped = false;
  bool tool3Equipped = false;

  bool weapon1Equipped = false;
  bool weapon2Equipped = false;
  bool weapon3Equipped = false;

  bool badgeEquipped = false;

  bool runeEquipped = false;

  bool armor1Equipped = false;
  bool armor2Equipped = false;
  bool armor3Equipped = false;

  int ticksSinceStartWork = 0;
  int timeSinceInjured = 0;
  int previousLoyaltyHits = 0;

  bool noSleepPowder = false;
  bool brightLightsPowder = false;
  bool bigStrongPowder = false;

  BuildOrder buildOrder;

  List<String> workerStatusHistory = new List();

  List<int> totalGathered = new List(
      100); // captures the items this particular goblin has gathered, for stats

  double task1 = 0.0;

  Inventory inventory;

  Worker(int id, Inventory inv) {
    id = id;
    name = getRandomName();
    focus = WorkerUtil.getStartingAttributeValue();
    perception = WorkerUtil.getStartingAttributeValue();
    loyalty = WorkerUtil.getStartingAttributeValue();
    strength = WorkerUtil.getStartingAttributeValue();
    constitution = WorkerUtil.getStartingAttributeValue();
    cunning = WorkerUtil.getStartingAttributeValue();
    intelligence = WorkerUtil.getStartingAttributeValue();
    spirit = WorkerUtil.getStartingAttributeValue();
    dexterity = WorkerUtil.getStartingAttributeValue();
    health = WorkerUtil.getStartingHealthValue();
    healthMax = health;
    logStatus('Laying around...', true);

    for (int i = 0; i < totalGathered.length; i++) {
      totalGathered[i] = 0;
    }

    inventory = inv;
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 2);
    new Timer.periodic(oneSec, (Timer t) {
      incrementTask1(0.1);
      mainLoop();

      if (task1 > 1.0) {
        task1 = 0.0;
        notifyListeners();
        //return;
      }
    });
  }

  void mainLoop() {
    if (isExhausted) {
      doSleep();
      return;
    }

    if (isHungry) {
      doEat();
      return;
    }

    if (isInjured) {
      setTask(Task.Injured);
    }

    if (task == Task.Injured) {
      if (isInjured) {
        doInjured();
        return;
      } else {
        setTask(Task.None);
      }
    }

    if (task == Task.None) {
      doIdle();
    } else {
      doWork();
    }

    fatigueCheck();
    hungerCheck();
  }

  void doSleep() {
    setStatus(" is taking a nap.", false);
    isAwake = false;
    clearTempBuffs();
    fatigue -= 10;

    if (fatigue < 1) {
      fatigue = 0;
      isTired = false;
      isExhausted = false;
      isAwake = true;
      noSleepPowder = false;
      brightLightsPowder = false;
      bigStrongPowder = false;
    }
    regenHealth();

    notifyListeners();
  }

  void regenHealth() {
    health++;
    if (health > healthMax) {
      health = healthMax;
    }
  }

  void doEat() {
    if (inventory.inventoryItems[InventoryItemEnum.Food.index] > 0) {
      setStatus(" is eating.", false);
      //ticksSinceStartWork++;
      inventory.updateInventoryItem(InventoryItemEnum.Food, -1);
      hunger = 0;
      isHungry = false;
    } else {
      modifyStat(WorkerStatEnum.loyalty, previousLoyaltyHits);
      previousLoyaltyHits++;
      hunger -= 10; // temp hunger reduction
      isHungry = false;
    }

    notifyListeners();
  }

  void doInjured() {
    timeSinceInjured++;
    if (isInjured) {
      setTask(Task.Injured);
      setStatus(" is too injured to work.", false);
    }
  }

  void doIdle() {
    setStatus(" is doing nothing.", false);
    ticksSinceStartWork++;
  }

  void doWork() {
    if (getStatModified(WorkerStatEnum.loyalty) < 10) {
      setStatus(" refuses to do any work.", false);
      return;
    }

    ticksSinceStartWork++;

    // Check if worker is distracted
    if (!doStatCheck(WorkerStatEnum.focus)) {
      setStatus(getDistractedText(), false);
      return;
    }

    // Check if worker is disloyal/defiant
    if (!doStatCheck(WorkerStatEnum.loyalty)) {
      setStatus(" is disobeying orders...", false);
      return;
    }

    if (task == Task.Gather) {
      setStatus(" is gathering supplies.", false);
      gatherSticks(75);
      gatherRocks(40);
      gatherHerbs(15);
      gatherStraw(45);
      gatherShinies(5);
      gatherClay(10);
      gatherSpores(10);
      gatherWorms(5);
    } else if (task == Task.Hunt) {
      setStatus(" is hunting for food.", false);
      gatherFood();
      gatherShinies(5);
    } else if (task == Task.Dig) {
      //digSpace();
      gatherShinies(5);
      gatherClay(5);
    } else if (task == Task.Tool1 ||
        task == Task.Tool2 ||
        task == Task.Tool3 ||
        task == Task.Weapon1 ||
        task == Task.Weapon2 ||
        task == Task.Weapon3) {
      doBuild();
      // } else if (task == Task.magic) {
      //     doMagic();
    }
  }

  String getTaskString() {
    if (task == Task.Dig) {
      return 'Digging';
    } else if (task == Task.Gather) {
      return 'Gathering';
    } else if (task == Task.Hunt) {
      return 'Hunting';
    } else if (task == Task.Tool1 || task == Task.Tool2) {
      return 'Building Tool';
    } else if (task == Task.Weapon1 || task == Task.Weapon2) {
      return 'Building Weapon';
    } else if (task == Task.Powder1 || task == Task.Powder2) {
      return 'Arcanery';
    } else if (task == Task.Potion1 || task == Task.Potion2) {
      return 'Brewing';
    } else if (task == Task.Injured) {
      return 'Injured';
    } else if (task == Task.None) {
      return 'Idling';
    }
    return '';
  }

  void fatigueCheck() {
    int rand = Random().nextInt(100) + 1;
    int idleModifier = 0;

    if (task == Task.None) {
      idleModifier = 20;
    }

    if (rand - idleModifier > (strength + strengthTemp) * 1.25) {
      if (noSleepPowder) {
        fatigue += 2;
      } else {
        fatigue += 4;
      }

      if (fatigue > 100) {
        fatigue = 100;
      }
    }

    if (fatigue >= 80) {
      isTired = true;
    }

    if (fatigue >= 100) {
      isExhausted = true;
    }
  }

  void hungerCheck() {
    int rand = Random().nextInt(100) + 1;
    int hungerCheckValue = 100;

    // Modifying hungerCheckValue so that Strong or Healthy goblins get hungrier faster
    if (strength > 30) {
      hungerCheckValue -= 10;
    }
    if (strength > 45) {
      hungerCheckValue -= 10;
    }
    if (health > 50) {
      hungerCheckValue -= 10;
    }
    if (health > 70) {
      hungerCheckValue -= 10;
    }

    // Need to eventually work in a modifier that takes into account whether the worker is working or idle. Idle will make this checks (fatigue and hunger) go a little more slowly.
    if (rand > (85)) {
      hunger += 10;
      if (hunger > hungerCheckValue) {
        hunger = hungerCheckValue;
      }
    }

    if (hunger >= hungerCheckValue) {
      isHungry = true;
    }
  }

  void clearTempBuffs() {
    focusTemp = perceptionTemp = loyaltyTemp = strengthTemp = 0;
    constitutionTemp =
        cunningTemp = dexterityTemp = intelligenceTemp = spiritTemp = 0;
  }

  void setTask(Task t) {
    // print('Current task - ' + task.toString());
    // print('New task - ' + t.toString());

    if (isInjured) {
      return;
    }

    if (task == t) {
      return; // Same task, so we don't need to do all this other work
    }

    resetTask();
    task = t;
    ticksSinceStartWork = 0;

    startBuildOrder();
    startMagicOrder();
    startRaiding();

    setWorkerTypeFromTask();
//        logStatus(status);
    notifyListeners();
  }

  void startBuildOrder() {
    stopBuild();

    if (task == Task.Tool1) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Tool1);
    } else if (task == Task.Tool2) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Tool2);
    } else if (task == Task.Tool3) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Tool3);
    } else if (task == Task.Weapon1) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Weapon1);
    } else if (task == Task.Weapon2) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Weapon2);
    } else if (task == Task.Weapon3) {
      buildOrder =
          new BuildOrder(inventory: inventory, item: InventoryItemEnum.Weapon3);
    }

    startBuild();
  }

  void startMagicOrder() {}

  void startRaiding() {}

  void setWorkerTypeFromTask() {
    print('Worker Type is ' + workerType.toString());
    if (task == Task.Hunt || task == Task.Gather || task == Task.Dig) {
      workerType = WorkerType.Grunt;
    } else if (task == Task.Tool1 ||
        task == Task.Tool2 ||
        task == Task.Tool3 ||
        task == Task.Weapon1 ||
        task == Task.Weapon2 ||
        task == Task.Weapon3 ||
        task == Task.Workbench1) {
      workerType = WorkerType.Builder;
    } else if (task == Task.Potion1 ||
        task == Task.Powder1 ||
        task == Task.Potion2 ||
        task == Task.Powder2) {
      workerType = WorkerType.Shaman;
    } else if (task == Task.Raid) {
      workerType = WorkerType.Warrior;
    }
  }

  // Might not need this for now, if workertype gets set via task...
  void setWorkerType(WorkerType t) {
    if (workerType != t) {
      resetTask();
      workerType = t;
      notifyListeners();
    }

    if (workerType == WorkerType.Banished) {
      // TODO: Stop the timer to keep worker from contributing to inventory

    }
  }

  void setTaskFromString(String taskString) {
    Task t = Task.values.firstWhere((s) => describeEnum(s) == taskString);
    setTask(t);
  }

  void resetTask() {
    task = Task.None;
    buildTask = InventoryItemEnum.none;
  }

  String getRandomName() {
    int num = Random().nextInt(NAMES.length - 1);
    String randomName = NAMES[num];
    return randomName;
  }

  setStatus(String text, bool display) {
    String newStatus = name + text;
    if (status != newStatus) {
      status = newStatus;
      logStatus(status, true);
      //logStatus(status, display);
    }
  }

  void incrementTask1(double val) {
    task1 += val;
    notifyListeners();
  }

  doBuild() {
    if (buildOrder != null) {
      if (buildOrder.progress > 0) {
        doEquipTool();
        didToolBreak(7);

        int rand = Random().nextInt(100) + 1;
        double result;
        int val = 0;
        if (buildOrder.item == InventoryItemEnum.WorkbenchT1) {
          result = ((intelligence +
                  dexterity +
                  getStatModified(WorkerStatEnum.strength)) /
              3); // take an average of the three stats
        } else if (buildOrder.item == InventoryItemEnum.Tool1) {
          result = ((dexterity + intelligence) / 2) + 7;
        } else if (buildOrder.item == InventoryItemEnum.Tool2) {
          result = ((dexterity + intelligence) / 2) + 3;
        } else if (buildOrder.item == InventoryItemEnum.Weapon1) {
          result = ((dexterity + intelligence) / 2) + 8;
        } else if (buildOrder.item == InventoryItemEnum.Weapon2) {
          result = ((dexterity + intelligence) / 2) + 3;
        } else if (buildOrder.item == InventoryItemEnum.WorkbenchW1) {
          result =
              ((getStatModified(WorkerStatEnum.strength) + constitution) / 2);
        } else if (buildOrder.item == InventoryItemEnum.WorkbenchA1) {
          result = ((getStatModified(WorkerStatEnum.strength) +
                  constitution +
                  dexterity) /
              3);
        }

        val = result.ceil();

        if (tool1Equipped) {
          val += 7; // add 7 and 18 for higher level tools
        } else if (tool2Equipped) {
          val += 18;
        }

        if (rand <= val) {
          buildOrder.makeProgress();
          doExperienceGain(20);
          setStatus(" has made progress on his work.", true);
          if (buildOrder.isOrderComplete()) {
            setStatus(" has completed building something!", true);
            buildOrder.finishWork();
            // for some items we destroy the buildorder object, but for others we want to keep building (tools/weapons, etc);

            if (buildOrder.item == InventoryItemEnum.Tool1) {
              buildOrder = new BuildOrder(
                  inventory: inventory, item: InventoryItemEnum.Tool1);
              startBuild();
            } else if (buildOrder.item == InventoryItemEnum.Weapon1) {
              buildOrder = new BuildOrder(
                  inventory: inventory, item: InventoryItemEnum.Weapon1);
              startBuild();
            } else if (buildOrder.item == InventoryItemEnum.Tool2) {
              buildOrder = new BuildOrder(
                  inventory: inventory, item: InventoryItemEnum.Tool2);
              startBuild();
            } else if (buildOrder.item == InventoryItemEnum.Weapon2) {
              buildOrder = new BuildOrder(
                  inventory: inventory, item: InventoryItemEnum.Weapon2);
              startBuild();
            } else {
              buildOrder = null;
            }
          }
        }
      } else {
        startBuild();
      }
    }
  }

  startBuild() {
    if (buildOrder != null) {
      //print(buildOrder.name);
      if (buildOrder.areMaterialsAvailable()) {
        buildOrder.startWork();
      } else {
        setStatus(" is waiting for materials to start building.", true);
      }
    }
  }

  stopBuild() {
    if (buildOrder != null) {
      buildOrder.cancelOrder();
      buildOrder = null;
    }
  }

  void modifyStat(WorkerStatEnum stat, int value) {
    if (stat == WorkerStatEnum.focus) {
      focus += value;
      if (focus < 0) {
        focus = 0;
      }
      if (focus > 50) {
        focus = 50;
      }
    } else if (stat == WorkerStatEnum.perception) {
      perception += value;
      if (perception < 0) {
        perception = 0;
      }
      if (perception > 50) {
        perception = 50;
      }
    } else if (stat == WorkerStatEnum.strength) {
      strength += value;
      if (strength < 0) {
        strength = 0;
      }
      if (strength > 50) {
        strength = 50;
      }
    } else if (stat == WorkerStatEnum.loyalty) {
      loyalty += value;
      if (loyalty < 0) {
        loyalty = 0;
      }
      if (loyalty > 50) {
        loyalty = 50;
      }
    } else if (stat == WorkerStatEnum.constitution) {
      constitution += value;
      if (constitution < 0) {
        constitution = 0;
      }
      if (constitution > 50) {
        constitution = 50;
      }
    } else if (stat == WorkerStatEnum.intelligence) {
      intelligence += value;
      if (intelligence < 0) {
        intelligence = 0;
      }
      if (intelligence > 50) {
        intelligence = 50;
      }
    } else if (stat == WorkerStatEnum.dexterity) {
      dexterity += value;
      if (dexterity < 0) {
        dexterity = 0;
      }
      if (dexterity > 50) {
        dexterity = 50;
      }
    } else if (stat == WorkerStatEnum.cunning) {
      cunning += value;
      if (cunning < 0) {
        cunning = 0;
      }
      if (cunning > 50) {
        cunning = 50;
      }
    } else if (stat == WorkerStatEnum.spirit) {
      spirit += value;
      if (spirit < 0) {
        spirit = 0;
      }
      if (spirit > 50) {
        spirit = 50;
      }
    } else if (stat == WorkerStatEnum.health) {
      health += value;
      if (health < 0) {
        health = 0;
      }
      if (health > healthMax) {
        health = healthMax;
      }
    }
  }

  void modifyStatTemp(WorkerStatEnum stat, int value) {
    if (stat == WorkerStatEnum.focus) {
      focusTemp += value;
      if (focusTemp < 0) {
        focusTemp = 0;
      }
      if (focusTemp > 40) {
        focusTemp = 40;
      }
    } else if (stat == WorkerStatEnum.perception) {
      perceptionTemp += value;
      if (perceptionTemp < 0) {
        perceptionTemp = 0;
      }
      if (perceptionTemp > 40) {
        perceptionTemp = 40;
      }
    } else if (stat == WorkerStatEnum.strength) {
      strengthTemp += value;
      if (strengthTemp < 0) {
        strengthTemp = 0;
      }
      if (strengthTemp > 40) {
        strengthTemp = 40;
      }
    } else if (stat == WorkerStatEnum.loyalty) {
      loyaltyTemp += value;
      if (loyaltyTemp < 0) {
        loyaltyTemp = 0;
      }
      if (loyaltyTemp > 40) {
        loyaltyTemp = 40;
      }
    } else if (stat == WorkerStatEnum.constitution) {
      constitutionTemp += value;
      if (constitutionTemp < 0) {
        constitutionTemp = 0;
      }
      if (constitutionTemp > 40) {
        constitutionTemp = 40;
      }
    } else if (stat == WorkerStatEnum.intelligence) {
      intelligenceTemp += value;
      if (intelligenceTemp < 0) {
        intelligenceTemp = 0;
      }
      if (intelligenceTemp > 40) {
        intelligenceTemp = 40;
      }
    } else if (stat == WorkerStatEnum.dexterity) {
      dexterityTemp += value;
      if (dexterityTemp < 0) {
        dexterityTemp = 0;
      }
      if (dexterityTemp > 40) {
        dexterityTemp = 40;
      }
    } else if (stat == WorkerStatEnum.cunning) {
      cunningTemp += value;
      if (cunningTemp < 0) {
        cunningTemp = 0;
      }
      if (cunningTemp > 40) {
        cunningTemp = 40;
      }
    } else if (stat == WorkerStatEnum.spirit) {
      spiritTemp += value;
      if (spiritTemp < 0) {
        spiritTemp = 0;
      }
      if (spiritTemp > 40) {
        spiritTemp = 40;
      }
    }
  }

  bool doStatCheck(WorkerStatEnum stat) {
    var rand = new Random().nextInt(100) + 1;
    var val = getStatModified(stat);

    if (isHungry) {
      val += 25;
    } // Hungry worker is more motivated

    if (rand <= val) {
      return true;
    } else {
      return false;
    }
  }

  int getStatModified(WorkerStatEnum stat) {
    if (stat == WorkerStatEnum.constitution) {
      return constitution + constitutionTemp;
    }
    if (stat == WorkerStatEnum.cunning) {
      return cunning + cunningTemp;
    }
    if (stat == WorkerStatEnum.dexterity) {
      return dexterity + dexterityTemp;
    }
    if (stat == WorkerStatEnum.focus) {
      return focus + focusTemp;
    }
    if (stat == WorkerStatEnum.intelligence) {
      return intelligence + intelligenceTemp;
    }
    if (stat == WorkerStatEnum.loyalty) {
      return loyalty + loyaltyTemp;
    }
    if (stat == WorkerStatEnum.perception) {
      return perception + perceptionTemp;
    }
    if (stat == WorkerStatEnum.spirit) {
      return spirit + spiritTemp;
    }
    if (stat == WorkerStatEnum.strength) {
      return strength + strengthTemp;
    }

    return 0;
  }

  bool injuredCheck() {
    if (health < 10) {
      return true;
    } else {
      return false;
    }
  }

  threaten() {
    if (inventory.inventoryItems[InventoryItemEnum.Stick.index] > 0) {
      // temp increase of focus and loyalty, but with a chance for a permanent loyalty drop
      modifyStatTemp(WorkerStatEnum.focus, Random().nextInt(30) + 1);
      modifyStatTemp(WorkerStatEnum.loyalty, Random().nextInt(20) + 1);

      int stickBreak = Random().nextInt(100) + 1;
      if (stickBreak <= 75) {
        inventory.updateInventoryItem(InventoryItemEnum.Stick, -1);
      }

      int loyaltyDrop = Random().nextInt(100) + 1;
      if (loyaltyDrop <= 65) {
        loyalty -= 2;
        if (loyalty < 0) {
          loyalty = 0;
        }
      }

      int focusGain = Random().nextInt(100) + 1;
      if (focusGain <= 15) {
        modifyStat(WorkerStatEnum.focus, 1);
      }
    }
    notifyListeners();
  }

  warn() {
    modifyStatTemp(WorkerStatEnum.focus, Random().nextInt(20) + 1);
    modifyStatTemp(WorkerStatEnum.loyalty, Random().nextInt(10) + 1);

    int loyaltyDrop = Random().nextInt(100) + 1;
    if (loyaltyDrop <= 25) {
      loyalty -= 1;
      if (loyalty < 0) {
        loyalty = 0;
      }
    }

    int focusGain = Random().nextInt(100) + 1;
    if (focusGain <= 5) {
      modifyStat(WorkerStatEnum.focus, 1);
    }
    notifyListeners();
  }

  giveFood() {
    if (inventory.inventoryItems[InventoryItemEnum.Food.index] > 0) {
      modifyStatTemp(WorkerStatEnum.loyalty, Random().nextInt(10) + 1);
      modifyStatTemp(WorkerStatEnum.strength, Random().nextInt(10) + 1);
      inventory.updateInventoryItem(InventoryItemEnum.Food, -1);
      hunger = 0;

      int loyaltyGain = Random().nextInt(100) + 1;
      if (loyaltyGain <= 50) {
        modifyStat(WorkerStatEnum.loyalty, 1);
      }
      int strengthGain = Random().nextInt(100) + 1;
      if (strengthGain <= 20) {
        modifyStat(WorkerStatEnum.strength, 1);
      }
      notifyListeners();
    }
  }

  giveShiny() {
    if (inventory.inventoryItems[InventoryItemEnum.Shiny.index] > 0) {
      modifyStatTemp(WorkerStatEnum.loyalty, Random().nextInt(20) + 5);
      inventory.updateInventoryItem(InventoryItemEnum.Shiny, -1);

      int statGain = Random().nextInt(100) + 1;
      if (statGain < 75) {
        modifyStat(WorkerStatEnum.loyalty, Random().nextInt(5) + 1);
        modifyStat(WorkerStatEnum.focus, Random().nextInt(2) + 1);
      }
    }
  }

  giveBadge() {
    if (inventory.inventoryItems[InventoryItemEnum.Badge.index] > 0) {
      inventory.updateInventoryItem(InventoryItemEnum.Badge, -1);
      badgeEquipped = true;
      loyalty += 10;
    }
  }

  // ********************************************
  // Gather methods
  //*********************************************

  gatherFood() {
    int wpnModifier = 0;
    int rand = Random().nextInt(100) + 1;

    setStatus(" is hunting for food.", false);

     doEquipWpn();
    // doEquipArmor();
     didWpnBreak(12);  // They can break the wpn even if they fail to gather any food
    // didArmorBreak();

    if (weapon3Equipped) {
      wpnModifier = 25;
    } else if (weapon2Equipped) {
      wpnModifier = 14;
    } else if (weapon1Equipped) {
      wpnModifier = 7;
    }

    // Could also do cunning divided by 5 or 6 to get a raw point value to add to the modifier...
    if (getStatModified(WorkerStatEnum.cunning) > 35) {
      wpnModifier += 3;
    }
    if (getStatModified(WorkerStatEnum.cunning) > 50) {
      wpnModifier += 6;
    }

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      wpnModifier += 2;
    }
    if (getStatModified(WorkerStatEnum.perception) > 50) {
      wpnModifier += 4;
    }

    if (rand < (50 + wpnModifier)) {
      inventory.updateInventoryItem(InventoryItemEnum.Food, 1);
      setStatus(" found some FOOD!***", true);
      totalGathered[InventoryItemEnum.Food.index] += 1;
      gatherFurs(15);
      gatherBones(15);
      gatherTeeth(10);
      doExperienceGain(5);
    }
    if (rand < (25 + wpnModifier)) {
      inventory.updateInventoryItem(InventoryItemEnum.Food, 1);
      setStatus(" found some extra FOOD!***", true);
      totalGathered[InventoryItemEnum.Food.index] += 1;
      gatherFurs(35);
      gatherBones(25);
      gatherTeeth(20);
      gatherEntrails(10);
      gatherBlood(10);
      doExperienceGain(5);
    }
    if (rand < (5 + wpnModifier)) {
      inventory.updateInventoryItem(InventoryItemEnum.Food, 1);
      setStatus(" found even more FOOD!***", true);
      gatherFurs(55);
      gatherBones(45);
      gatherTeeth(35);
      gatherBlood(25);
      totalGathered[InventoryItemEnum.Food.index] += 1;
      // do gather ichor/essence
      doExperienceGain(15);
    }
  }

  gatherFurs(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Fur, 1);
      setStatus(" found some FUR!***", true);
      totalGathered[InventoryItemEnum.Fur.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherClay(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Clay, 1);
      setStatus(" found some CLAY!***", true);
      totalGathered[InventoryItemEnum.Clay.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherBones(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Bone, 1);
      setStatus(" found some BONES!***", true);
      totalGathered[InventoryItemEnum.Bone.index] += 1;
      doExperienceGain(5);
    }
  }

  digRocks() {
    int rand = Random().nextInt(3) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 1;
    }
    if (getStatModified(WorkerStatEnum.strength) > 50) {
      mod += 2;
    }

    inventory.updateInventoryItem(InventoryItemEnum.Rock, rand + mod);
    setStatus(" dug up ROCKS!***", true);
    totalGathered[InventoryItemEnum.Rock.index] += rand + mod;
    doExperienceGain(10);
  }

  gatherRocks(int chance) {
    int rand = Random().nextInt(100) + 1;

    doEquipTool();
    didToolBreak(12);
    int mod = 0;

    if (getStatModified(WorkerStatEnum.dexterity) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }

    if (rand < (chance + mod)) {
      int num = 1;
      if (tool1Equipped) {
        num++;
      }
      if (tool2Equipped) {
        num++;
      }
      if (tool3Equipped) {
        num++;
      }
      inventory.updateInventoryItem(InventoryItemEnum.Rock, num);
      setStatus(" found ROCKS!***", true);
      totalGathered[InventoryItemEnum.Rock.index] += num;
      doExperienceGain(5);

      gatherOre(1);
    }
  }

  gatherOre(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    doEquipTool();
    didToolBreak(15);

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }

    if (rand < (chance + mod)) {
      int num = (tool1Equipped ? 2 : 1);
      inventory.updateInventoryItem(InventoryItemEnum.Ore1, num);
      setStatus(" found ORE!***", true);
      totalGathered[InventoryItemEnum.Ore1.index] += num;
      doExperienceGain(10);
    }
  }

  gatherShinies(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.perception) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Shiny, 1);
      setStatus(" found a SHINY!***", true);
      totalGathered[InventoryItemEnum.Shiny.index] += 1;
      doExperienceGain(10);
    }
  }

  gatherStraw(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.perception) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Straw, 1);
      setStatus(" found STRAW!***", true);
      totalGathered[InventoryItemEnum.Straw.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherTeeth(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.dexterity) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.strength) > 35) {
      mod += 2;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Teeth, 1);
      setStatus(" found TEETH!***", true);
      totalGathered[InventoryItemEnum.Teeth.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherWorms(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    if (getStatModified(WorkerStatEnum.dexterity) > 35) {
      mod += 5;
    }
    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 5;
    }

    if (rand < (chance + mod)) {
      inventory.updateInventoryItem(InventoryItemEnum.Worm, 1);
      setStatus(" found WORMS!***", true);
      totalGathered[InventoryItemEnum.Worm.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherBlood(int chance) {
    int rand = Random().nextInt(100) + 1;

    if (rand < chance) {
      inventory.updateInventoryItem(InventoryItemEnum.Blood, 1);
      setStatus(" found BLOOD!***", true);
      totalGathered[InventoryItemEnum.Blood.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherEntrails(int chance) {
    int rand = Random().nextInt(100) + 1;

    if (rand < chance) {
      inventory.updateInventoryItem(InventoryItemEnum.Entrails, 1);
      setStatus(" found ENTRAILS!***", true);
      totalGathered[InventoryItemEnum.Entrails.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherSpores(int chance) {
    int rand = Random().nextInt(100) + 1;

    if (rand < chance) {
      inventory.updateInventoryItem(InventoryItemEnum.Spore, 1);
      setStatus(" found SPORES!***", true);
      totalGathered[InventoryItemEnum.Spore.index] += 1;
      doExperienceGain(5);
    }
  }

  gatherSticks(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    doEquipTool();
    didToolBreak(5);

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.perception) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      int num = (tool1Equipped ? 2 : 1);
      inventory.updateInventoryItem(InventoryItemEnum.Stick, num);
      setStatus(" found a STICK!***", true);
      totalGathered[InventoryItemEnum.Stick.index] += num;
      doExperienceGain(5);
    }
  }

  gatherHerbs(int chance) {
    int rand = Random().nextInt(100) + 1;
    int mod = 0;

    doEquipTool();
    didToolBreak(2);

    if (getStatModified(WorkerStatEnum.perception) > 35) {
      mod += 2;
    }
    if (getStatModified(WorkerStatEnum.perception) > 50) {
      mod += 4;
    }

    if (rand < (chance + mod)) {
      int num = (tool1Equipped ? 2 : 1);
      inventory.updateInventoryItem(InventoryItemEnum.Herb, num);
      setStatus(" found HERBS!***", true);
      totalGathered[InventoryItemEnum.Herb.index] += num;
      doExperienceGain(5);
    }
  }

  doExperienceGain(int value) {
    int rand = Random().nextInt(7) + 1;
    if (rand == 1) {
      exp += value;
    }

    if (exp > 99) {
      exp = 0;
      skillPoint++;
      setStatus(" has gained a LEVEL!***", true);
      level++;

      if (level == 10) {
        starLevel = 1;
        setStatus(" has gained a STAR LEVEL!***", true);
        doStarLevelBonus();
      }
      if (level == 25) {
        starLevel = 2;
        setStatus(" has gained a STAR LEVEL!***", true);
        doStarLevelBonus();
      }
      if (level == 50) {
        starLevel = 3;
        setStatus(" has gained a STAR LEVEL!***", true);
        doStarLevelBonus();
      }
      if (level == 100) {
        starLevel = 4;
        setStatus(" has gained a STAR LEVEL!***", true);
        doStarLevelBonus();
      }
      if (level == 250) {
        starLevel = 5;
        setStatus(" has gained a STAR LEVEL!***", true);
        doStarLevelBonus();
      }
    }
  }

  doStarLevelBonus() {
    setStatus(" has gained points in all stats!", true);
    modifyStat(WorkerStatEnum.dexterity, 1);
    modifyStat(WorkerStatEnum.focus, 1);
    modifyStat(WorkerStatEnum.loyalty, 1);
    modifyStat(WorkerStatEnum.perception, 1);
    modifyStat(WorkerStatEnum.strength, 1);
    modifyStat(WorkerStatEnum.constitution, 1);
    modifyStat(WorkerStatEnum.cunning, 1);
    modifyStat(WorkerStatEnum.spirit, 1);
    modifyStat(WorkerStatEnum.intelligence, 1);
    healthMax += 5;
  }

      // *******************************
    // Tool, weapon and armor methods

    bool isToolEquipped() {
        if (tool1Equipped || tool2Equipped || tool3Equipped) {
            return true;
        } else {
            return false;
        }
    }
    bool isWeaponEquipped() {
        if (weapon1Equipped || weapon2Equipped || weapon3Equipped) {
            return true;
        } else {
            return false;
        }
    }
    bool isArmorEquipped() {
        if (armor1Equipped || armor2Equipped || armor3Equipped) {
            return true;
        } else {
            return false;
        }
    }

    void doEquipTool() {
        if (!isToolEquipped()) {
            if (inventory.inventoryItems[InventoryItemEnum.Tool2.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Tool2, -1);
                tool2Equipped = true;
                status = name + " grabbed a decent tool.";        // use 'nice' for level 3
                logStatus(status, true);
            } else if (inventory.inventoryItems[InventoryItemEnum.Tool1.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Tool1, -1);
                tool1Equipped = true;
                status = name + " grabbed a rough tool.";
                logStatus(this.status, true);
            }
        }
    }

    void doEquipWpn() {
        if (!isWeaponEquipped()) {
            if (inventory.inventoryItems[InventoryItemEnum.Weapon2.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Weapon2, -1);
                weapon2Equipped = true;
                status = name + " grabbed a decent weapon.";
                logStatus(status, true);
            } else if (inventory.inventoryItems[InventoryItemEnum.Weapon1.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Weapon1, -1);
                weapon1Equipped = true;
                status = name + " grabbed a rough weapon.";
                logStatus(status, true);
            }
        }
    }

    void doEquipArmor() {
        if (!isArmorEquipped()) {
            if (inventory.inventoryItems[InventoryItemEnum.Armor2.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Armor2, -1);
                armor2Equipped = true;
                status = name + " grabbed some decent armor.";
                logStatus(status, true);
            } else if (inventory.inventoryItems[InventoryItemEnum.Armor1.index] > 0) {
                inventory.updateInventoryItem(InventoryItemEnum.Armor1, -1);
                armor1Equipped = true;
                status = name + " grabbed some rough armor.";
                logStatus(status, true);
            }
        }
    }

    void didToolBreak(double chance) {
        if (isToolEquipped()) {
            int rand = Random().nextInt(100) + 1;

            if (getStatModified(WorkerStatEnum.dexterity) > 20) { chance *= 0.95; }
            if (getStatModified(WorkerStatEnum.dexterity) > 40) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.dexterity) > 60) { chance *= 0.80; }

            if (getStatModified(WorkerStatEnum.intelligence) > 20) { chance *= 0.95; }
            if (getStatModified(WorkerStatEnum.intelligence) > 40) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.intelligence) > 60) { chance *= 0.80; }

            if (getStatModified(WorkerStatEnum.focus) > 20) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.focus) > 40) { chance *= 0.80; }
            if (getStatModified(WorkerStatEnum.focus) > 60) { chance *= 0.70; }

            // The base percentage chance passed in assumes tool1
            if (this.tool2Equipped) {
                chance *= 0.95;
            } else if (this.tool3Equipped) {
                chance *= 0.8;
            }

            if (rand <= chance.floor()) {
                tool1Equipped = false;
                setStatus(" broke his tool!", true);
            }
        }
    }

  void didWpnBreak(double chance) {
        if (isWeaponEquipped()) {
            int rand = Random().nextInt(100) + 1;

            if (getStatModified(WorkerStatEnum.dexterity) > 20) { chance *= 0.95; }
            if (getStatModified(WorkerStatEnum.dexterity) > 40) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.dexterity) > 60) { chance *= 0.80; }

            if (getStatModified(WorkerStatEnum.strength) > 20) { chance *= 0.95; }
            if (getStatModified(WorkerStatEnum.strength) > 40) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.strength) > 60) { chance *= 0.80; }

            if (getStatModified(WorkerStatEnum.focus) > 20) { chance *= 0.90; }
            if (getStatModified(WorkerStatEnum.focus) > 40) { chance *= 0.80; }
            if (getStatModified(WorkerStatEnum.focus) > 60) { chance *= 0.70; }

            // The base percentage chance passed in assumes wpn1
            if (this.weapon2Equipped) {
                chance *= 0.95;
            } else if (this.weapon3Equipped) {
                chance *= 0.8;
            }

            if (rand <= chance.floor()) {
                this.weapon1Equipped = false;
                this.setStatus(" broke his weapon!", true);
            }
        }
    }

  void didArmorBreak() {
        // let rand = Math.floor((Math.random() * 100) + 1);

        // if (this.armor1Equipped) {
        //     if (rand <= 15) {
        //         this.armor1Equipped = false;
        //         this.setStatus(" broke his armor!", true);
        //     }
        // } else if (this.armor2Equipped) {
        //     if (rand <= 8) {
        //         this.armor2Equipped = false;
        //         this.setStatus(" broke his armor!", true);
        //     }
        // } else if (this.armor3Equipped) {
        //     if (rand <= 4) {
        //         this.armor3Equipped = false;
        //         this.setStatus(" broke his armor!", true);
        //     }
        // }
    }


  String getDistractedText() {
    int rand = Random().nextInt(10) + 1;
    if (rand == 1) {
      return " is distracted.";
    } else if (rand == 2) {
      return " is staring at a disgusting bug.";
    } else if (rand == 3) {
      return " is digging in his ear.";
    } else if (rand == 4) {
      return " is hopping after a butterfly.";
    } else if (rand == 5) {
      return " is laying on the ground, daydreaming.";
    } else if (rand == 6) {
      return " is picking grass.";
    } else if (rand == 7) {
      return " is staring at his reflection in a pond and making faces.";
    } else if (rand == 8) {
      return " is punching a tree.";
    } else if (rand == 9) {
      return " is skipping in a circle, singing to himself.";
    } else {
      return " is staring at the wall, thinking deep thoughts.";
    }
  }

  logStatus(String statusText, bool display) {
    //status = timerService.getStatusPrependText() + status;
    status = statusText;

    if (display) {
      workerStatusHistory.add(statusText);

      if (workerStatusHistory.length > 300) {
        workerStatusHistory.removeAt(0);
      }
      notifyListeners();
    }
  }
}

enum Task {
  None,
  Hunt,
  Gather,
  Dig,
  Tool1,
  Tool2,
  Tool3,
  Weapon1,
  Weapon2,
  Weapon3,
  Armor1,
  Armor2,
  Workbench1,
  Potion1,
  Potion2,
  Potion3,
  Powder1,
  Powder2,
  Powder3,
  Talisman,
  Ichor,
  Badge,
  Magic,
  Eat,
  Sleep,
  Craft,
  Raid,
  Injured,
}

enum WorkerType { None, Grunt, Builder, Shaman, Warrior, Banished }
