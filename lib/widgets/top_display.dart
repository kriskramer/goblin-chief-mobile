import 'package:flutter/material.dart';
import 'package:goblin_chief/models/inventory.dart';

class TopDisplay extends StatelessWidget {
  const TopDisplay({
    Key key,
    @required this.inventory,
  }) : super(key: key);

  final Inventory inventory;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          width: deviceWidth,
          color: Colors.green[700],
          child: Center(
            child: Text(
              'Goblin Chief',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        Center(
          child: Container(
            width: deviceWidth,
            height: 50,
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    child: Table(columnWidths: {
                      0: FixedColumnWidth(4),
                      1: FixedColumnWidth(35),
                      2: FixedColumnWidth(10),
                      3: FixedColumnWidth(5),
                      4: FixedColumnWidth(35),
                      5: FixedColumnWidth(10),
                      6: FixedColumnWidth(5),
                      7: FixedColumnWidth(45),
                      8: FixedColumnWidth(30),
                      9: FixedColumnWidth(2),
                      10: FixedColumnWidth(18),
                      11: FixedColumnWidth(30),
                      12: FixedColumnWidth(4),
                    },
                        //border: TableBorder(bottom: BorderSide(color: Colors.black, width: 1), top: BorderSide(color: Colors.black, width: 1), left: BorderSide(color: Colors.black, width: 1), right: BorderSide(color: Colors.black, width: 1), ),
                        children: [
                          TableRow(children: [
                            Text(''),
                            Text('Food'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Food.index]
                                .toString()),
                            SizedBox(width: 0, height: 15),
                            Text('Rocks'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Rock.index]
                                .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            Text('Tools'),
                            Text(inventory.inventoryItems[
                                        InventoryItemEnum.Tool1.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Tool2.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Tool3.index]
                                    .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            Text('Day:'),
                            Text('1'),
                            Text(''),
                          ]),
                          TableRow(children: [
                            Text(''),
                            Text('Shinies'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Shiny.index]
                                .toString()),
                            SizedBox(width: 0, height: 15),
                            Text('Sticks'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Stick.index]
                                .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            Text('Weapons'),
                            Text(inventory.inventoryItems[
                                        InventoryItemEnum.Weapon1.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Weapon2.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Weapon3.index]
                                    .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            FittedBox(fit: BoxFit.contain, child: Text('Time:')),
                            FittedBox(fit: BoxFit.contain, child: Text('Morning')),
                            Text(''),
                          ]),
                          TableRow(children: [
                            Text(''),
                            Text('Straw'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Straw.index]
                                .toString()),
                            SizedBox(width: 0, height: 15),
                            Text('Clay'),
                            Text(inventory
                                .inventoryItems[InventoryItemEnum.Clay.index]
                                .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            Text('Runes'),
                            Text(inventory.inventoryItems[
                                        InventoryItemEnum.Rune1.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Rune2.index]
                                    .toString() +
                                '/' +
                                inventory.inventoryItems[
                                        InventoryItemEnum.Rune3.index]
                                    .toString()),
                            SizedBox(
                              width: 0,
                            ),
                            Text(''),
                            Text(''),
                            Text(''),
                          ]),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(child: Icon(Icons.settings)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
