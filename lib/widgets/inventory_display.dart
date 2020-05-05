import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:goblin_chief/models/inventory.dart';

class InventoryDisplay extends StatelessWidget {
  //final Inventory inventory = Inventory();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final inventory = Provider.of<Inventory>(context);

    return Container(
        child: Column(
      children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              width: width,
              child: Center(
                child: Text(
                  'Inventory Items',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            width: width,
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 14, color: Colors.black),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(25),
                  1: FixedColumnWidth(105),
                  2: FixedColumnWidth(50),
                  3: FixedColumnWidth(50),
                  4: FixedColumnWidth(50),
                  5: FixedColumnWidth(40),
                  5: FixedColumnWidth(30),
                },
                children: [
                  TableRow(children: [
                    Text(' '),
                    Text(
                      'Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                        'Qty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Used',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                          '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    
                    SizedBox(height: 24),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Food'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Food.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Food.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Food.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Center(child: Icon(Icons.arrow_upward, size: 20,)),
                    Center(child: Icon(Icons.help_outline, size: 20,)),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Shinies'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Shiny.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Shiny.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Shiny.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Sticks'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Stick.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Stick.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Stick.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Rocks'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Rock.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Rock.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Rock.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Straw'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Straw.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Straw.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Straw.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Clay'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Clay.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Clay.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Clay.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Ore'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Ore1.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Ore1.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Ore1.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Herbs'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Herb.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Herb.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Herb.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Furs'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Fur.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Fur.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Fur.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Bones'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Bone.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Bone.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Bone.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Entrails'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Entrails.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Entrails.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Entrails.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Blood'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Blood.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Blood.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Blood.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Teeth'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Teeth.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Teeth.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Teeth.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Spores'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Spore.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Spore.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Spore.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Worms'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Worm.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Worm.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Worm.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Rough Tools'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Tool1.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Tool1.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Tool1.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Decent Tools'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Tool2.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Tool2.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Tool2.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Good Tools'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Tool3.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Tool3.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Tool3.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text('Rough Weapons'),),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Weapon1.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Weapon1.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Weapon1.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text('Decent Weapons'),),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Weapon2.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Weapon2.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Weapon2.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                  TableRow(children: [
                    Text(''), // Will eventually be an icon for the specific item
                    Text('Good Weapons'),
                    Center(
                      child: Text(inventory.inventoryItems[InventoryItemEnum.Weapon3.index].toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700)),
                    ),
                    Center(
                      child: Text(inventory.inventoryTotals[InventoryItemEnum.Weapon3.index].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                    ),
                    Center(
                      child: Text(inventory.inventoryUsed[InventoryItemEnum.Weapon3.index].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                    ),
                    Icon(Icons.arrow_upward, size: 20,),
                    Icon(Icons.help_outline, size: 20,),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
