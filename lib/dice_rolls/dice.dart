import 'dart:developer';
import 'dart:math' as m;

int rollD20() {
  int result = m.Random().nextInt(20) + 1;
  log(result.toString());
  return result;
}

int rollD12() {
  int result = m.Random().nextInt(12) + 1;
  log(result.toString());
  return result;
}

int rollD10() {
  int result = m.Random().nextInt(10) + 1;
  log(result.toString());
  return result;
}

int rollD8() {
  int result = m.Random().nextInt(8) + 1;
  log(result.toString());
  return result;
}

int rollD6() {
  int result = m.Random().nextInt(6) + 1;
  log(result.toString());
  return result;
}

int rollD4() {
  int result = m.Random().nextInt(4) + 1;
  log(result.toString());
  return result;
}