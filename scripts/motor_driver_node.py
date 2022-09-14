#!/usr/bin/env python2

import rospy
from roboclaw import Roboclaw
from motor_driver.msg import MotorSpeed

# connect to the roboclaw using gpio pins
address = 0x80
baudrate = 38400
port = '/dev/ttyTHS1'
roboclaw = Roboclaw(port, rate=baudrate)
roboclaw.Open()
# temporary pid value from BasicMicroMotionStudio through USB
roboclaw.SetM1VelocityPID(address, 8.534317016601562, 2.279693603515625, 0.0, 1500)

def motor_driver():
    rospy.init_node('motor_driver')
    rospy.loginfo("Setting up motor driver")
    motor_vel_sub = rospy.Subscriber("/motor/vel", MotorSpeed, callback=spin_motors)
    rospy.loginfo("Connected to port: %s", port)
    rospy.loginfo("Baudrate: %d", baudrate)
    rospy.loginfo('Motor driver started')
    rospy.spin()
    roboclaw.ForwardBackwardM1(address, 64) # stop motor
    rospy.loginfo('Motor driver is exiting')


# Motor speed: 0-64 = backwards, 64 = stop, 64-127 = forwards
def spin_motors(msg):
    rospy.loginfo('Got the motor speed. M1=%d, M2=%d', msg.motor1, msg.motor2)
    try:
        roboclaw.ForwardBackwardM1(address, int(msg.motor1))
        roboclaw.ForwardBackwardM2(address, int(msg.motor2))
        # temporary
        print_motor_data()
    except Exception as e:
        rospy.loginfo(e)

# temporary logging
def print_motor_data():
    rospy.loginfo("Motor1 velocity pid:")
    rospy.loginfo(roboclaw.ReadM1VelocityPID(address))
    rospy.loginfo("Motor1 velocity pid:")
    rospy.loginfo(roboclaw.ReadEncM1(address))
    # rospy.loginfo(roboclaw.ReadM2PositionPID(address))
    # rospy.loginfo(roboclaw.ReadM2VelocityPID(address))

if __name__ == '__main__':
    motor_driver()
