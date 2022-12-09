double getSunOpacity(double weatherCondition) {
  if (weatherCondition < 0.4) {
    return 0;
  }

  return 5 / 3 * weatherCondition - 2 / 3;
}

double getCloudOpacity(double weatherCondition) {
  if (weatherCondition > 0.9) {
    return 0;
  }

  return -(10 / 9) * weatherCondition + 1;
}

double getDropsOpacity(double weatherCondition) {
  if (weatherCondition > 0.4) {
    return 0;
  }

  return -2.25 * weatherCondition + 1;
}

class OpacityCounter {}
