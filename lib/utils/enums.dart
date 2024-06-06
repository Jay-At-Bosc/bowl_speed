
import 'labels.dart';

abstract class Unit {
  String get getLabel;
}

enum SpeedUnits implements Unit {
  meterPerSecond,
  kilometerPerHour,
  milesPerHour,
  nauticalMilesPerHour;

  @override
  String get getLabel {
    switch (this) {
      case SpeedUnits.meterPerSecond:
        return Labels.meterPerSecond;
      case SpeedUnits.kilometerPerHour:
        return Labels.kilometerPerHour;
      case SpeedUnits.milesPerHour:
        return Labels.milesPerHour;
      case SpeedUnits.nauticalMilesPerHour:
        return Labels.nauticalMilesPerHour;
    }
  }
}

enum DistanceUnits implements Unit {
  meter,
  kilometer,
  miles,
  yard,
  nauticalMiles;

  @override
  String get getLabel {
    switch (this) {
      case DistanceUnits.meter:
        return Labels.meter;
      case DistanceUnits.kilometer:
        return Labels.kilometer;
      case DistanceUnits.miles:
        return Labels.miles;
      case DistanceUnits.yard:
        return Labels.yard;
      case DistanceUnits.nauticalMiles:
        return Labels.nauticalMiles;
    }
  }
}

enum Sport {
  cricket,
  baseBall;

  String getSportType(Sport sport) {
    return sport == Sport.cricket ? Labels.cricket : Labels.baseBall;
  }
}

enum MeasurementType {
  manualCalculator,
  standardCalculator;

   String getMeasurementType() {
    switch (this) {
      case MeasurementType.manualCalculator:
        return 'Manual Calculator';
      case MeasurementType.standardCalculator:
        return 'Standard Calculator';
      default:
        return '';
    }
  }
}