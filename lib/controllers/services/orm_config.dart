/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sqfentity/sqfentity.dart';
import 'dart:convert'; // TODO: import this line for sqfentity generated
import 'package:http/http.dart'
    as http; // TODO: import this line for sqfentity generated

// TODO: after any edit do not forget to code in terminal:
// flutter pub run build_runner build --delete-conflicting-outputs
part 'orm_config.g.dart';

// This is where we define our tables
const SqfEntityTable todos = SqfEntityTable(
  tableName: 'todos',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField(
      'title',
      DbType.text,
    ),
    SqfEntityField(
      'dsc',
      DbType.text,
    ),
  ],
);

// This is where we define our sequence identity
const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

// This is where we define our database:
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MyAppDatabaseModel',
  databaseName: 'myapp-db.db',
  sequences: [seqIdentity],
  databaseTables: [todos],
);
