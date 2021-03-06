import 'package:elbiserwis/Client.dart';
import 'package:flutter/material.dart';
import 'package:elbiserwis/styles/MyColors.dart';

class MonthSummary extends StatelessWidget {
  String name;
  Client client;
  MonthSummary(this.name, this.client);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new MonthSummaryWidget(name, client),
    );
  }
}

class MonthSummaryWidget extends StatefulWidget {
  String name;
  Client client;
  MonthSummaryWidget(this.name, this.client);
  @override
  MonthSummaryState createState() => new MonthSummaryState(name, client);
}

class MonthSummaryState extends State<MonthSummaryWidget> {
  String name;
  Client client;
  MonthSummaryState(this.name, this.client);

  double getPriceOfAddCopies() {
    int bwCopies = getOverCopies();
    int colorCopies = getOverColorCopies();
    var bwPrice = bwCopies * client.pagePrice;
    var colorPrice = colorCopies * client.colorPagePrice;
    return bwPrice + colorPrice;
  }

  int getOverCopies() {
    int copies =
        ((client.newCopyCount - client.prevCopyCount) - client.freeCopies);
    return (copies <= 0) ? 0 : copies;
  }

  int getOverColorCopies() {
    int copies = ((client.newColorCopyCount - client.prevColorCopyCount) -
        client.colorFreeCopies);
    return (copies <= 0) ? 0 : copies;
  }

  String dateToString(DateTime date) {
    String readable = date.day.toString() +
        "." +
        date.month.toString() +
        "." +
        date.year.toString();
    return readable;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyColors.tabBar,
        title: new Text(name),
      ),
      backgroundColor: MyColors.background,
      body: new Center(
          child: new ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(5.0),
            child: new Card(
                color: MyColors.card,
                child: new Container(
                  padding: EdgeInsets.all(5.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "Informacje o umowie",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Klient: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            name,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Data ostatniego rozliczenia: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            dateToString(DateTime.parse(client.lastDate)),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Planowana data kolejnego rozliczenia: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            dateToString(DateTime.parse(client.nextDate)),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Początkowy stan licznika (cz-b): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.initialCopies.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Początkowy stan licznika (kolor): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.initialColorCopies.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
                      new Text(
                        "Liczniki",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Poprzedni stan licznika (cz-b): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.prevCopyCount.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Poprzedni stan licznika (kolor): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.prevColorCopyCount.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Aktualny stan licznika (cz-b): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.newCopyCount.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Aktualny stan licznika (kolor): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.newColorCopyCount.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Darmowe kopie czarno-białe: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.freeCopies.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text("szt.")
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Darmowe kopie kolorowe: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.colorFreeCopies.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text("szt.")
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
                      new Text(
                        "Rozliczenie",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Liczba cz-b kopii powyżej limitu: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            getOverCopies().toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Liczba kolorowych kopii powyżej limitu: "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            getOverColorCopies().toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Cena za stronę (cz-b): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.pagePrice.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text("zł"),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Cena za stronę (kolor): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.colorPagePrice.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text("zł")
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Opłata za kopie powyej limitu (netto): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            getPriceOfAddCopies().toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            "zł",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Opłata za ryczałt (netto): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            client.rate.toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            "zł",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
                      new Row(
                        children: <Widget>[
                          new Text("Razem do zapłaty (netto): "),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            (client.rate+getPriceOfAddCopies()).toString(),
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Padding(padding: new EdgeInsets.only(left: 5.0)),
                          new Text(
                            "zł",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
