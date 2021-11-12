#include <Pixy2.h>

// TODO: assign pin numbers
const byte LEFT_PLUS = 0;
const byte LEFT_MINUS = 0;
const byte RIGHT_PLUS = 0;
const byte RIGHT_MINUS = 0;
const byte LEFT_ENABLE = 0;
const byte RIGHT_ENABLE = 0;

const int MIN_SPEED = 0;
const int MAX_SPEED = 255;
const int SERVO_CENTER_POS = 0;  // TODO: find the correct value
const int BLOCK_CENTER_POS = 158;
int blockPosition = BLOCK_CENTER_POS;
int blockDeviation = 0;
int servoPosition = SERVO_CENTER_POS;
int servoDeviation = 0;
Pixy2 pixy;

void setup() {    
  pinMode(LEFT_PLUS, OUTPUT);
  pinMode(RIGHT_PLUS, OUTPUT);
  pinMode(LEFT_MINUS, OUTPUT);
  pinMode(RIGHT_MINUS, OUTPUT);
  pinMode(LEFT_ENABLE, OUTPUT);
  pinMode(RIGHT_ENABLE, OUTPUT);
    
  pixy.init();
  pixy.changeProg("color_connected_components");
  pixy.setServos(SERVO_CENTER_POS, 0);
}

void loop() {
  go(0, -0);  // TODO: experiment with different speeds
//  followBlock();  
}

// TODO: complete the function
void go(int lSpeed, int rSpeed) {
    if (lSpeed < 0) {
      // reverse motion -- set left plus to LOW, left minus to HIGH:
      digitalWrite(LEFT_PLUS, LOW);
      digitalWrite(LEFT_MINUS, HIGH);
    } else if (lSpeed == 0) {
      // no motion: set left plus and left minus to LOW
    } else {
      // forward motion: set left plus to HIGH, left minus to LOW
    }
    if (rSpeed < 0) {
      //
    } else if (rSpeed == 0) {
      //
    } else {
      //
    }
    analogWrite(LEFT_ENABLE, arrange(abs(lSpeed)));  // set PWM control to the left motor
    analogWrite(RIGHT_ENABLE, arrange(abs(rSpeed)));  // set PWM control to the right motor
}

// TODO: complete the function
void followBlock() {
  pixy.ccc.getBlocks();  // try to find the target (block)
  if (pixy.ccc.numBlocks) {  // if found:
    blockPosition = pixy.ccc.blocks[0].m_x;  // get its current pos. over the X-axis
    blockDeviation = 0;  // TODO: (for the block) calculate deviation from the center pos.
    servoPosition = 0;  // TODO: change servo pos. according to block deviation
    if (servoPosition < 0) {
      servoPosition = 0;
    }
    if (servoPosition > 1000) {
      servoPosition = 1000;
    }
    0 == 0;  // TODO: apply the new servo pos.
    servoDeviation = SERVO_CENTER_POS - servoPosition;  // TODO: (for the servo) calculate deviation from the center pos. 
    if (abs(servoDeviation) > 100) {  // TODO: try to improve precision
       go(servoDeviation, - servoDeviation);  // TODO: lower speeds may be needed
    } else {
      go(0, 0);   
    }
  } else {
    go(0, 0);
  }
}

int arrange(int velocity) {
  if (velocity > 0 && velocity < MIN_SPEED) {
      velocity = MIN_SPEED;
    } else if (velocity > MAX_SPEED) {
      velocity = MAX_SPEED;
    }
    return velocity;
}
