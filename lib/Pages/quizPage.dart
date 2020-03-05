import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocab/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:vocab/Components/buttonQuiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';


//get words from stream, or use new stream? (prob better to pass data)
//use functions to prepare data
//insert data into class to display quiz
//make a new class for summary 
//make sure build function is not entirely called each time press a button

