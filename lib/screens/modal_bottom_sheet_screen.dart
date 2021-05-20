import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:provider/provider.dart';

enum FilterType {
  AlbumWiseAscending,
  AlbumWiseDescending,
  Ascending,
  Descending
}

class ModalBottomSheetScreen extends StatefulWidget {
  @override
  _ModalBottomSheetScreenState createState() => _ModalBottomSheetScreenState();
}

class _ModalBottomSheetScreenState extends State<ModalBottomSheetScreen> {
  FilterType _filterType = FilterType.Ascending;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Filter by',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile(
              title: const Text('Ascending Order'),
              value: FilterType.Ascending,
              groupValue: _filterType,
              onChanged: (value) {
                setState(() {
                  _filterType = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Descending Order'),
              value: FilterType.Descending,
              groupValue: _filterType,
              onChanged: (value) {
                setState(() {
                  _filterType = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Album Wise (Ascending Order)'),
              value: FilterType.AlbumWiseAscending,
              groupValue: _filterType,
              onChanged: (value) {
                setState(() {
                  _filterType = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Album Wise (Descending Order)'),
              value: FilterType.AlbumWiseDescending,
              groupValue: _filterType,
              onChanged: (value) {
                setState(() {
                  _filterType = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                  onPressed: () {
                    print(_filterType);
                    Provider.of<Models>(context, listen: false)
                        .filter(_filterType);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'FILTER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
