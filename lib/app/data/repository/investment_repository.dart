import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:task/app/data/models/invest_model.dart';

class InvestmentRepository {
  Future<List<InvestModel>> getInvestments() async {
    String json = await rootBundle.loadString('assets/json/investment_json.json');
    var data = await compute((message) => jsonDecode(json), 0);
    return List<InvestModel>.from(
        data.map((x) => InvestModel.fromMap(x)).toList());
  }
}
