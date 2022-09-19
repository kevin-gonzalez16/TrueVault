import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';

void main(){
  test('Template function creates a button for each database', (){
    List databases = ["Database 1","Database 2","Database 3"];
    final chooseButtons = databases.map((database) => chooseDatabaseTemplate(database)).toList();
    final deleteButtons = databases.map((database) => deleteDatabaseTemplate(database)).toList();
    expect(chooseButtons.length, 3);
    expect(deleteButtons.length, 3);

  });
}