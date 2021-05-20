import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:frosh_link_task_1/screens/modal_bottom_sheet_screen.dart';
import 'package:frosh_link_task_1/widgets/models_gridview.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<Models>(context).fetchModels().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void filter(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return ModalBottomSheetScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        'App Home',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.sort_outlined),
            onPressed: () {
              filter(context);
            })
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ModelsGrid(),
    );
  }
}
