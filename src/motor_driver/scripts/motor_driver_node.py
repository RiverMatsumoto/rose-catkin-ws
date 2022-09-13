#!/usr/bin/env python3

import rospy
from roboclaw import Roboclaw
from motor_driver.msg import MotorSpeed

# connect to the roboclaw using gpio pins
address = 0x80
baudrate = 38400
port = '/dev/ttyTHS1'
roboclaw = Roboclaw(port, rate=baudrate)
roboclaw.Open()

def motor_driver():
    rospy.init_node('motor_driver')
    rospy.loginfo("Setting up motor driver")
    motor_vel_sub = rospy.Subscriber("/motor/vel", MotorSpeed, callback=spin_motors)
    rospy.loginfo("Connected to port: %s", port)
    rospy.loginfo("Baudrate: %d", baudrate)
    rospy.loginfo('Motor driver started')
    rospy.spin()
    rospy.loginfo('Motor driver is exiting')


# Motor speed: 0-64 = backwards, 64 = stop, 64-127 = forwards
def spin_motors(msg: MotorSpeed):
    rospy.loginfo(f'Got the motor speed. M1={msg.motor1}, M2={msg.motor2}')
    try:
        roboclaw.ForwardBackwardM1(address, int(msg.motor1))
        roboclaw.ForwardBackwardM2(address, int(msg.motor2))
    except Exception as e:
        rospy.loginfo(e)

# temporary logging
def print_motor_data():
    rospy.logdebug(f'M1 Position PID{roboclaw.ReadM1PositionPID}')
    rospy.logdebug(f'M1 Velocity PID{roboclaw.ReadM1VelocityPID}')
    rospy.logdebug(f'M2 Position PID{roboclaw.ReadM2PositionPID}')
    rospy.logdebug(f'M2 Velocity PID{roboclaw.ReadM2VelocityPID}')

if __name__ == '__main__':
    motor_driver()
