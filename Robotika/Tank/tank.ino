const byte LEFT_PLUS = 7;
const byte LEFT_MINUS = 8;
const byte RIGHT_PLUS = 12;
const byte RIGHT_MINUS = 13;
const byte LEFT_ENABLE = 6;  // must support PWM~
const byte RIGHT_ENABLE = 11;  // must support PWM~
const int MIN_SPEED = 0;
const int MAX_SPEED = 0;

// pins and distances for sensors
const byte TRIGGER = 10;
const byte ECHO = 9;
const byte IRPin = 5;
const int CLOSE = 7;  // in centimeters
const int FAR = 13;  // in centimeters
const int TOO_FAR = 15;  // in centimeters

const int T = 50;  // movement duration in milliseconds
const int TURNING_SPEED = 120;
const int FORWARD_SPEED = 100; 
void setup() {
// TODO: set OUTPUT mode for all motor pins
  
  pinMode(TRIGGER, OUTPUT);
  pinMode(ECHO, INPUT);
  digitalWrite(TRIGGER, LOW);

  // start the forward movement
  moveForward(FORWARD_SPEED);
}

int rangeLeft = 0;

void loop() {

// WHEEL MOVEMENTS:

// To set polarity, use digitalWrite(PIN_NAME, LEVEL), where 
// LEVEL = LOW (negative) or HIGH (positive)

// To set PWM, use analogWrite(PIN_NAME, VALUE), where 
// PIN_NAME = PWM-supporting pin,
// VALUE = 0 to 255

//***********************************************************
// WALL FOLLOWING:
  rangeLeft = calculateDistance(TRIGGER, ECHO);
  delay(5);
  if (rangeLeft <= CLOSE) {
    moveRight(T,TURNING_SPEED);
  } else if (rangeLeft < FAR) {
  moveForward(FORWARD_SPEED);
  } else if (rangeLeft < TOO_FAR) {
  moveLeft(T,TURNING_SPEED);
  } else {
  // TODO: complete algorith
  }  
} 

void moveRight(int duration, int speed) {
  analogWrite(RIGHT_ENABLE, speed);
  delay(duration);
  moveForward(FORWARD_SPEED);
}

void moveLeft(int duration, int speed){
  analogWrite(LEFT_ENABLE, speed);
  delay(duration);
  moveForward(FORWARD_SPEED);
}

void moveForward(int speed){
  // write the digital pins to move forward
  // right wheel
  digitalWrite(RIGHT_PLUS,HIGH);
  digitalWrite(RIGHT_MINUS,LOW);
  // left wheel
  digitalWrite(LEFT_PLUS,HIGH);
  digitalWrite(LEFT_MINUS,LOW);

  //start movement forward
   analogWrite(LEFT_ENABLE, speed);
   analogWrite(RIGHT_ENABLE, speed);
}


int calculateDistance(byte TRIGGER, byte ECHO) {
  // TODO: set LOW level to the digital trigger pin
  delayMicroseconds(5);
  // TODO: set HIGH level to the digital trigger pin
  delayMicroseconds(20);
  // TODO: set LOW level to the digital trigger pin
  int duration = pulseIn(ECHO, HIGH, 20000);
  int distance = duration / 59;
  if (distance <= 0) {
      distance = 5000;
  }
  return distance;
}
