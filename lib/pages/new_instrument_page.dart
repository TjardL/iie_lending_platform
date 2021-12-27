import 'package:flutter/material.dart';
import 'package:iieproject/styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NewInstrumentPage extends StatefulWidget {
  const NewInstrumentPage({Key? key}) : super(key: key);

  @override
  _NewInstrumentPageState createState() => _NewInstrumentPageState();
}

class _NewInstrumentPageState extends State<NewInstrumentPage> {
  bool _alwaysAvailable = true;
  bool _openToSell = false;
  bool _flexibleDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: (Icon(
            Icons.close,
            color: Colors.black87,
          )),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: (Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            )),
          ),
        ],
        title: Text(
          "New Listing",
          style: TextStyles.h3,
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      padding: EdgeInsets.all(24),
      children: [
        Text(
          "Basic Information",
          style: TextStyles.h3.copyWith(color: Colors.black87),
        ),
        SizedBox(height: 16),
        TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: new InputDecoration(
              labelText: 'Name of Instrument',
            )
            // icon: new Icon(
            //   Icons.label_outline,
            //   color: Colors.grey,
            // )),
            // validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
            // onSaved: (value) => _email = value.trim(),
            ),
        SizedBox(height: 16),
        TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
            labelText: 'Location of Pickup',
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 130,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: new InputDecoration(
                  labelText: 'Price per Week',
                ),
              ),
            ),
            Text(
              "€",
              style: TextStyles.h3.copyWith(color: Colors.black54),
            )
          ],
        ),
        SizedBox(
          height: 24,
        ),
        TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: new InputDecoration(
              labelText: 'Description',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 1.0,
                ),
              ),
            )),
        SizedBox(height: 16),
        ElevatedButton(
            style: ButtonStyle(elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white10)),
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.upload,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Upload images",
                  style: TextStyles.link.copyWith(color: Colors.black54),
                )
              ],
            )),

        SizedBox(
          height: 32,
        ),
        Divider(),
        SizedBox(
          height: 8,
        ),
        Text(
          "Availability",
          style: TextStyles.h3.copyWith(color: Colors.black87),
        ),
        SizedBox(
          height: 8,
        ),
        CheckboxListTile(
            title: Text(
              "Always available if not rented",
              style: TextStyles.body.copyWith(color: Colors.black87),
            ),
            value: _alwaysAvailable,
            onChanged: (context) {
              setState(() {
                _alwaysAvailable = !_alwaysAvailable;
              });
            }),
        if (_alwaysAvailable == false)
          Container(
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings:
                  DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              //onSelectionChanged: (){},
              selectionMode: DateRangePickerSelectionMode.multiRange,
            ),
          ),
        SizedBox(
          height: 32,
        ),
        Divider(),
        SizedBox(
          height: 8,
        ),
        Text(
          "Extra information",
          style: TextStyles.h3.copyWith(color: Colors.black87),
        ),
        SizedBox(height: 8,),
        ListTile(
            leading: Icon(
              Icons.sell_outlined,
            ),
            title: Text(
              "Open to sell",
              style: TextStyles.h4,
            ),
            subtitle: Text(
              "I am willing to also sell my intrument",
              style: TextStyles.body,
            ),trailing: Checkbox(value: _openToSell,onChanged: (context) {
              setState(() {
                _openToSell = !_openToSell;
              });}),
          ),SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
            ),
            title: Text(
              "Flexible date",
              style: TextStyles.h4,
            ),
            subtitle: Text(
              "The rent time can be extended if needed",
              style: TextStyles.body,
            ),trailing: Checkbox(value: _flexibleDate,onChanged: (context) {
              setState(() {
                _flexibleDate = !_flexibleDate;
              });}),
          ),
      ],
    );
  }
}
