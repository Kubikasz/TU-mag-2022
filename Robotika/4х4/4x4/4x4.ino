// TODO: assign pin numbers

// front motors
const byte FRONT_LEFT_PLUS = 19;
const byte FRONT_LEFT_MINUS = 18;
const byte FRONT_LEFT_ENABLE = 2;
const byte FRONT_RIGHT_PLUS = 21;
const byte FRONT_RIGHT_MINUS = 20;
const byte FRONT_RIGHT_ENABLE = 3;

// rear motors                  
const byte BACK_LEFT_PLUS = 6;
const byte BACK_LEFT_MINUS = 7;
const byte BACK_LEFT_ENABLE = 8;
const byte BACK_RIGHT_PLUS = 5;
const byte BACK_RIGHT_MINUS = 4;
const byte BACK_RIGHT_ENABLE = 9;

const int MIN_SPEED = 0; 
const int MAX_SPEED = 255; 
 
// ultrasound sensors                      
const byte ECHO_L = 30; // echo pin of the left sensor
const byte TRIG_L = 31; // trigger pin of the left sensor
const byte ECHO_F = 10;
const byte TRIG_F = 11;

const int T = 0; // time factor in ms
 
void setup() {
  pinMode(FRONT_RIGHT_PLUS, OUTPUT);
  // TODO:
  // set the rest motor pins in OUTPUT mode
  // set the 2 trigger pins in OUTPUT mode
  // set the 2 echo pins in INPUT mode

  digitalWrite(TRIG_L, LOW);
  digitalWrite(TRIG_F, LOW);
  
//  Serial.begin(9600);
}

int rangeLeft = 0;
int rangeFront = 0;

void loop() {
  rangeFront = calculateDistance(TRIG_F, ECHO_F);
  delay(10);
  // TODO: calculate distance to left
  
  Serial.print(rangeFront);
  Serial.print("---");
  Serial.print(rangeFrontLeft);
  Serial.print("---");
  Serial.print(rangeLeft);
  Serial.println();


// TODO: Use the functions
// (forward, backward, left, sharpLeft, right, sharpRight, halt)
// to control the wall follower.
// After each turning, go forward for a certain time.

// decide by front distance
  if (rangeFront < 5) {
    // the wall is too close to make a turn, so go back (or just stop)
  } else if (rangeFront < 20) {
    // corner, turn ~90 degrees to the right
    
// decide by left distance
    if (rangeLeft <= 10) {
      // turn right
    } else if (rangeLeft < 15) {
      forward(T);
    } else if (rangeLeft < 20) {
      // turn left
    } else {
      // turn sharp left
    }
  }  
}

void forward(int duration) {   
  go(MAX_SPEED, MAX_SPEED);
  if (duration > 0) {
      delay(duration);
  }
}
void backward(int duration) {   
  // TODO
}
void left(int duration) {  
  go(0, MAX_SPEED);
  if (duration > 0) {
  delay(duration);
  }
}
void sharpLeft(int duration) {  
  go(-MAX_SPEED, MAX_SPEED);
  if (duration > 0) {
  delay(duration);
  }
}
void right(int duration) {
  // TODO
}
void sharpRight(int duration) { 
  // TODO
}
void halt(int duration) {
  // TODO
}

int calculateDistance(byte triggerPin, byte echoPin) {
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(5);
  digitalWrite(echoPin, LOW);
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(20);
  digitalWrite(triggerPin, LOW);
  int duration = pulseIn(echoPin, HIGH, 20000);
  int distance = duration / 59;
  if (distance <= 0) {
      distance = 5000;
  }
  return distance;
}

void go(int lSpeed, int rSpeed) {
  if (lSpeed < 0) {
    digitalWrite(FRONT_LEFT_PLUS, LOW);
    digitalWrite(FRONT_LEFT_MINUS, HIGH);
    digitalWrite(REAR_LEFT_PLUS, LOW);
    digitalWrite(REAR_LEFT_MINUS, HIGH);
  } else if (lSpeed == 0) {
    digitalWrite(FRONT_LEFT_PLUS, LOW);
    digitalWrite(FRONT_LEFT_MINUS, LOW);
    digitalWrite(REAR_LEFT_PLUS, LOW);
    digitalWrite(REAR_LEFT_MINUS, LOW);
  } else {
    digitalWrite(FRONT_LEFT_PLUS, HIGH);
    digitalWrite(FRONT_LEFT_MINUS, LOW);
    digitalWrite(REAR_LEFT_PLUS, HIGH);
    digitalWrite(REAR_LEFT_MINUS, LOW);
  }
  if (rSpeed < 0) {
    digitalWrite(FRONT_RIGHT_PLUS, LOW);
    digitalWrite(FRONT_RIGHT_MINUS, HIGH);
    digitalWrite(REAR_RIGHT_PLUS, LOW);
    digitalWrite(REAR_RIGHT_MINUS, HIGH);
  } else if (rSpeed == 0) {
    digitalWrite(FRONT_RIGHT_PLUS, LOW);
    digitalWrite(FRONT_RIGHT_MINUS, LOW);
    digitalWrite(REAR_RIGHT_PLUS, LOW);
    digitalWrite(REAR_RIGHT_MINUS, LOW);
  } else {
    digitalWrite(FRONT_RIGHT_PLUS, HIGH);
    digitalWrite(FRONT_RIGHT_MINUS, LOW);
    digitalWrite(REAR_RIGHT_PLUS, HIGH);
    digitalWrite(REAR_RIGHT_MINUS, LOW);
  }  
  int leftSpeed = arrange(abs(lSpeed));
  int rightSpeed = arrange(abs(rSpeed));
  analogWrite(FRONT_LEFT_ENABLE, leftSpeed);
  analogWrite(FRONT_RIGHT_ENABLE, rightSpeed);
  analogWrite(REAR_LEFT_ENABLE, leftSpeed);
  analogWrite(REAR_RIGHT_ENABLE, rightSpeed);
}

int arrange(int speed) {
  if (speed < MIN_SPEED) {
    speed = MIN_SPEED;
  } else if (speed > MAX_SPEED) {
    speed = MAX_SPEED;
  }
  return speed;
}
