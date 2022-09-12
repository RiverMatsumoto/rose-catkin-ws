#!/usr/bin/env python3

import rospy
from roboclaw import Roboclaw

# connect to the roboclaw using gpio pins
address = 0x80
baudrate = 38400
roboclaw = Roboclaw('/dev/ttyTHS1', rate=baudrate)
roboclaw.Open()

def motor_driver():
    rospy.init_node('motor_driver')
    rospy.loginfo('Motor Driver Started')
    rospy.loginfo('Input info: 0-50=backwards, 50=stop motor, 50-100=forwardsa')
    rospy.loginfo('Usage: <motor1_speed> <motor2_speed>. Enter \'q\' to quit')

    while not rospy.is_shutdown():
        motor_speeds = motor_input()
        if (motor_speeds is None or len(motor_speeds) < 1):
            continue
        elif (motor_speeds[0] == 'q'):
            # set the motor speeds to 0
            spin_motors(0.0, 0.0)
            rospy.signal_shutdown("Shutting Down Motor Controller");
        else:
            spin_motors(motor_speeds)
    
    rospy.loginfo('Motor driver is exiting')

def motor_input():
    user_input = input().split()

    if (len(user_input) == 1 and user_input[0] == 'q'):
        return user_input

    # validate inputs and try parse them as ints
    if (all(elements.isdigit() for elements in user_input) and len(user_input) == 2):
        user_input = list(map(float, user_input))
    else:
        return None

    if (all((elements <= 100 and elements >= 0) for elements in user_input)):
        rospy.loginfo(f'Motor1 Velocity = {user_input[0]}, Motor2 Velocity = {user_input[1]}')
    else:
        rospy.logwarn('Invalid motor speeds, only give 2 integers from 0-100')


# Motor speed: 0-64 = backwards, 64 = stop, 64-127 = forwards
def spin_motors(motor1: float, motor2: float):
    rospy.loginfo(f'Got the motor speed. M1={motor1}, M2={motor2}')
    motor1 *= 1.27 # convert speeds into roboclaw readable range
    motor2 *= 1.27
    roboclaw.ForwardBackwardM1(address, int(motor1))
    roboclaw.ForwardBackwardM2(address, int(motor2))

# temporary logging
def print_motor_data():
    rospy.logdebug(f'M1 Position PID{roboclaw.ReadM1PositionPID}')
    rospy.logdebug(f'M1 Velocity PID{roboclaw.ReadM1VelocityPID}')
    rospy.logdebug(f'M2 Position PID{roboclaw.ReadM2PositionPID}')
    rospy.logdebug(f'M2 Velocity PID{roboclaw.ReadM2VelocityPID}')

if __name__ == '__main__':
    motor_driver()
