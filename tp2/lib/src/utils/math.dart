// ignore: constant_identifier_names
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const PI = 3.14159265;

double deg2rad(double deg) => deg / 180.0 * PI;

Matrix4 _pmat(num pv) => Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );

Matrix4 perspective = _pmat(1.0);
