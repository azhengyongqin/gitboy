import 'package:flutter/material.dart';
import '../utils/screen.dart';
import '../values/values.dart';

// ignore: must_be_immutable
class RadioRroup extends StatefulWidget {
  List<String> lables;
  List<dynamic> values;
  int crossAxisCount;

  dynamic defaultSelected;
  dynamic _selectedValue;
  ValueChanged onChanged;

  RadioRroup({
    @required this.lables,
    @required this.values,
    this.crossAxisCount = 3,
    this.defaultSelected,
    this.onChanged,
  });

  @override
  _RadioRroupState createState() => _RadioRroupState();
}

class _RadioRroupState extends State<RadioRroup> {
  @override
  void initState() {
    // TODO: implement initState
    if (widget.lables.length != widget.values.length) {
      throw 'lables.length:${widget.lables.length} !=values.length:${widget.values.length}';
    }
    widget._selectedValue = widget.defaultSelected;
    super.initState();
  }

  onChengedValue(value) {
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
    setState(() {
      widget._selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _builRadio(),
    );
  }

  List<Widget> _builRadio() {
    List<Widget> Rows = new List();
    var index = 0;
    var rowLength = widget.values.length / widget.crossAxisCount;

    for (var i = 0; i < rowLength.ceil(); i++) {
      List<Widget> items = new List();
      for (var j = 0; j < widget.crossAxisCount; j++) {
        if (index < widget.values.length) {
          var value = widget.values[index];
          var label = widget.lables[index];

          items.add(Expanded(
            child: Container(
              child: _builButton(value, label),
            ),
          ));
        } else {
          items.add(Expanded(
            child: Container(
              child: SizedBox(),
            ),
          ));
        }
        if (widget.crossAxisCount > 1 && j < widget.crossAxisCount - 1) {
          items.add(
            SizedBox(
              width: 8,
            ),
          );
        }
        index++;
      }

      Rows.add(Row(
        children: items,
      ));
    }
    return Rows;
  }

  _builButton(value, String label) {
    return value == widget._selectedValue
        ? RaisedButton(
            elevation: 0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () => onChengedValue(null),
            child: Text(
              label,
              style: TextStyle(fontSize: duSetFontSize(13)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: Radii.k6pxRadius,
            ),
          )
        : OutlineButton(
            textColor: Color(0xffffaaaaaa),
            onPressed: () => onChengedValue(value),
            child: Text(
              label,
              style: TextStyle(fontSize: duSetFontSize(13)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: Radii.k6pxRadius,
            ),
          );
  }
}
