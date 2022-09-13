#!/usr/bin/env python3

import rospy
from motor_driver.msg import MotorSpeed

def motor_console_controller():
    rospy.init_node("motor_console_controller")
    motor_vel_pub = rospy.Publisher("/motor/vel", MotorSpeed, queue_size=10)
    rospy.loginfo("Started motor console controller")
    rospy.loginfo("Input \'q\' to quit")
    rospy.loginfo("Usage: <motor1_velocity> <motor2_velocity>")

    while not rospy.is_shutdown():
        motor_vel = get_input()
    
        if (motor_vel == 'q'):
            rospy.loginfo("Closing motor controller node")
            rospy.signal_shutdown("Closing motor controller console")
        elif (motor_vel is None or len(motor_vel) != 2):
            rospy.logwarn("Incorrect number of arguments. Give only 2 integer arguments ranging from -100 to 100")
        else:
            range_conversion = 0.635
            motor_vel[0] = round((motor_vel[0] + 100) * range_conversion)
            motor_vel[1] = round((motor_vel[1] + 100) * range_conversion)
            motor_vel_pub.publish(motor_vel[0], motor_vel[1])
            rospy.loginfo("Publishing motor velocities m1=%d m2=%d", motor_vel[0], motor_vel[1])
    
    # on shutdown
    motor_vel_pub.publish(0, 0)

def get_input():
    user_input = input().split()

    # catch 'q' and check that every 
    if (len(user_input) == 1 and user_input[0] == 'q'):
        return 'q'
    elif (all(is_integer(element) for element in user_input) and len(user_input) == 2):
        user_input = list(map(int, user_input))
    else:
        rospy.logwarn('Invalid motor speeds, only give 2 integers from 0-100')
        return None

    # only allow integers from -100 to 100
    if (all((element <= 100.0 and element >= -100.0) for element in user_input)):
        return user_input
    else:
        rospy.logwarn('Invalid motor speeds, only give 2 integers from 0-100')

def is_integer(num: str):
    try:
        int(num)
        return True
    except:
        return False


if __name__ == "__main__":
    motor_console_controller()