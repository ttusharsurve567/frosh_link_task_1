import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:provider/provider.dart';

class ModelDetailedScreen extends StatelessWidget {
  static const routeName = '/model_detailed';
  @override
  Widget build(BuildContext context) {
    final modelId = ModalRoute.of(context).settings.arguments as int;
    final loadedModel = Provider.of<Models>(context).findById(modelId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedModel.title),
      ),
      body: Center(
        child: Image.network(
          loadedModel.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
