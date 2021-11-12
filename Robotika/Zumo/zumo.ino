#include <ZumoShield.h>
#include <ZumoMotors.h>
#include <ZumoReflectanceSensorArray.h>
#include <Pushbutton.h>

unsigned int sensors[6];
int actualPosition;
int error;
int previousError;
ZumoMotors motors;
ZumoReflectanceSensorArray reflectanceSensors;
Pushbutton button(ZUMO_BUTTON);
int MAX_SPEED = 450;

void setup() {
  reflectanceSensors.init();
  button.waitForButton();
  delay(2000);
  
  // sensor calibration
  for (int i = 0; i < 80; i++) {
    if ((i > 10 && i <= 30) || (i > 50 && i <= 70))
      motors.setSpeeds(-200, 200);
    else
      motors.setSpeeds(200, -200);
    reflectanceSensors.calibrate();
    delay(20);
  }
  
  motors.setSpeeds(0,0);
  Serial.begin(9600);
  button.waitForButton();
  delay(1000);
}

void loop() {  
  actualPosition = reflectanceSensors.readLine(sensors);
  //
  // TODO: try different motor speeds; observe the readLine() result under different positions.
  //
  // TODO (line-following algorithm):
  // Calculate error as deviation from the center (value 2500).
  // Apply proportional correction to the coresponding motor.
  // *** BONUS: Apply PD/PID control. ***
}
