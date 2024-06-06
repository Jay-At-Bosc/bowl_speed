
class Constants {
  /// Distance Constants
  static const double meterToKilometer = 0.001;
  static const double meterToMiles = 0.000621371;
  static const double meterToYard = 1.09361;
  static const double meterToNauticalMiles = 0.000539957;
  static const double kilometerToMiles = 0.621371;
  static const double kilometerToYard = 1093.61;
  static const double kilometerToNauticalMiles = 0.539957;
  static const double milesToYard = 1760.0;
  static const double milesToNauticalMiles = 0.868976;
  static const double yardToNauticalMiles = 0.000493737;

  /// Speed Constants
  static const double meterPerSecondToKilometerPerHour = 3.6;
  static const double meterPerSecondToMilesPerHour = 2.237;
  static const double meterPerSecondToNauticalMilesPerHour = 1.943;
  static const double kilometerPerHourToMilesPerHour = 0.621371;
  static const double kilometerPerHourToNauticalMilesPerHour = 0.539957;
  static const double milesPerHourToNauticalMilesPerHour = 0.8681;

  static const Map<String, double> distanceFactors = {
    "meterToKilometer": Constants.meterToKilometer,
    "meterToMiles": Constants.meterToMiles,
    "meterToYard": Constants.meterToYard,
    "meterToNauticalmiles": Constants.meterToNauticalMiles,
    "kilometerToMeter": 1 / Constants.meterToKilometer,
    "kilometerToMiles": Constants.kilometerToMiles,
    "kilometerToYard": Constants.kilometerToYard,
    "kilometerToNauticalmiles": Constants.kilometerToNauticalMiles,
    "milesToMeter": 1 / Constants.meterToMiles,
    "milesToKilometer": 1 / Constants.kilometerToMiles,
    "milesToYard": Constants.milesToYard,
    "milesToNauticalmiles": Constants.milesToNauticalMiles,
    "yardToMeter": 1 / Constants.meterToYard,
    "yardToKilometer": 1 / Constants.kilometerToYard,
    "yardToMiles": 1 / Constants.milesToYard,
    "yardToNauticalmiles": Constants.yardToNauticalMiles,
    "nauticalMilesToMeter": 1 / Constants.meterToNauticalMiles,
    "nauticalMilesToKilometer": 1 / Constants.kilometerToNauticalMiles,
    "nauticalMilesToMiles": 1 / Constants.milesToNauticalMiles,
    "nauticalMilesToYard": 1 / Constants.yardToNauticalMiles
  };

  static const Map<String, double> speedFactors = {
    "meterPerSecondTokilometerPerHour":
        Constants.meterPerSecondToKilometerPerHour,
    "meterPerSecondTomilesPerHour": Constants.meterPerSecondToMilesPerHour,
    "meterPerSecondTonauticalMilesPerHour":
        Constants.meterPerSecondToNauticalMilesPerHour,
    "kilometerPerHourTometerPerSecond":
        1 / Constants.meterPerSecondToKilometerPerHour,
    "kilometerPerHourTomilesPerHour": Constants.kilometerPerHourToMilesPerHour,
    "kilometerPerHourTonauticalMilesPerHour":
        Constants.kilometerPerHourToNauticalMilesPerHour,
    "milesPerHourTometerPerSecond": 1 / Constants.meterPerSecondToMilesPerHour,
    "milesPerHourTokilometerPerHour":
        1 / Constants.kilometerPerHourToMilesPerHour,
    "milesPerHourTonauticalMilesPerHour":
        Constants.milesPerHourToNauticalMilesPerHour,
    "nauticalMilesPerHourTometerPerSecond":
        1 / Constants.meterPerSecondToNauticalMilesPerHour,
    "nauticalMilesPerHourTokilometerPerHour":
        1 / Constants.kilometerPerHourToNauticalMilesPerHour,
    "nauticalMilesPerHourTomilesPerHour":
        1 / Constants.milesPerHourToNauticalMilesPerHour,
  };

} // Constants
