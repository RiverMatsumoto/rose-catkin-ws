#!/usr/bin/env python3

import rospy
import serial
import roboclaw

def motor_driver():
    rospy.init_node('motor_driver')
    rospy.loginfo('Motor Driver Started')
    rospy.loginfo('Usage: [motor_1_speed] [motor_2_speed]')

    while not rospy.is_shutdown():
        motor = input()
        motor.split(' ')
    
    rospy.on_shutdown()


def shutdown_driver():
    pass

if __name__ == '__main__':
    motor_driver()
