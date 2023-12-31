import 'dart:math' as math;

double doubleInRange(math.Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
