import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinInformation {
  final String pinPath;
  final String avatarPath;
  LatLng location;
  final String locationName;
  final Color labelColor;

  PinInformation(
      {this.pinPath = '',
      this.avatarPath = '',
      this.location = const LatLng(0, 0),
      this.locationName = '',
      this.labelColor = const Color(0xFF42A5F5)});
}
