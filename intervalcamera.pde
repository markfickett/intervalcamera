/**
 * Interval Camera
 *
 * Repeatedely trigger a camera exposure.
 * Use a wired remote for a camera.
 */

#define PIN_STATUS	13
#define PIN_SHUTTER	12

// These must be in increasing duration: WAIT > STATUS > HIGH.
//	WAIT		interval between exposures
//	STATUS		duration of status LED on
//	HIGH		duration of shutter trigger high
#define INTERVAL_HIGH	5
#define INTERVAL_STATUS 200
#define INTERVAL_WAIT	5000

void setup() {
	pinMode(PIN_STATUS, OUTPUT);
	pinMode(PIN_SHUTTER, OUTPUT);
}

void loop() {
	digitalWrite(PIN_STATUS, HIGH);
	digitalWrite(PIN_SHUTTER, HIGH);
	delay(INTERVAL_HIGH);
	digitalWrite(PIN_SHUTTER, LOW);
	delay(INTERVAL_STATUS-INTERVAL_SHUTTER);
	digitalWrite(PIN_STATUS, LOW);
	delay(INTERVAL_WAIT-INTERVAL_STATUS);
}
