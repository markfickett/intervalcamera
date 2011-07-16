/**
 * Interval Camera: Pair
 *
 * Repeatedely trigger a pair of cameras to take exposures.
 * Use a wired remote for a camera.
 *
 * The intent is for one camera to take exposures of the other's shutter action,
 * with a very specific delay after the shutter action starts, to produce a
 * stop motion sequence of a shutter action.
 */

#define PIN_STATUS			13
#define PIN_SHUTTER_RECORDER		12
#define PIN_SHUTTER_SUBJECT		8

#define INTERVAL_HIGH			10
#define INTERVAL_STATUS 		200
#define INTERVAL_WAIT			5000
#define DELAY_RECORDER_INCREMENT	1

#define START_BEFORE			30
#define END_AFTER			160

void setup() {
	pinMode(PIN_STATUS, OUTPUT);
	pinMode(PIN_SHUTTER_RECORDER, OUTPUT);
	pinMode(PIN_SHUTTER_SUBJECT, OUTPUT);
	blinkSome();
}

void loop() {
	for(int i = -START_BEFORE; i <= END_AFTER;
		i += DELAY_RECORDER_INCREMENT)
	{
		digitalWrite(PIN_STATUS, HIGH);

		if (i < 0) {
			unsigned long d = (unsigned long)(-i);
			digitalWrite(PIN_SHUTTER_RECORDER, HIGH);
			delay(d);
			digitalWrite(PIN_SHUTTER_SUBJECT, HIGH);
			delay(INTERVAL_HIGH);
			digitalWrite(PIN_SHUTTER_RECORDER, LOW);
			digitalWrite(PIN_SHUTTER_SUBJECT, LOW);
		} else {
			unsigned long d = (unsigned long)i;
			digitalWrite(PIN_SHUTTER_SUBJECT, HIGH);
			delay(d);
			digitalWrite(PIN_SHUTTER_RECORDER, HIGH);
			delay(INTERVAL_HIGH);
			digitalWrite(PIN_SHUTTER_SUBJECT, LOW);
			digitalWrite(PIN_SHUTTER_RECORDER, LOW);
		}

		delay(INTERVAL_STATUS);
		digitalWrite(PIN_STATUS, LOW);

		delay(INTERVAL_WAIT);
	}
	while(true) {
		blinkSome();
	}
}

void blinkSome() {
	for(int i = 0; i < 10; i++) {
		digitalWrite(PIN_STATUS, HIGH);
		delay(INTERVAL_STATUS);
		digitalWrite(PIN_STATUS, LOW);
		delay(INTERVAL_STATUS);
	}
}

