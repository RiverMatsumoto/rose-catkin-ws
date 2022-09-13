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
        args = input().split()
        result = parse_args(args)

        if (result == 'quit'):
            rospy.loginfo("Closing motor controller node")
            rospy.signal_shutdown("Closing motor controller console")
        elif (result == 'invalid'):
            rospy.logwarn("Incorrect number of arguments. Give only 2 integer arguments ranging from -100 to 100")
        else:
            range_conversion = 0.635
            result[0] = round((result[0] + 100) * range_conversion)
            result[1] = round((result[1] + 100) * range_conversion)
            motor_vel_pub.publish(result[0], result[1])
            rospy.loginfo("Publishing motor velocities m1=%d m2=%d", result[0], result[1])
    
    # on shutdown
    motor_vel_pub.publish(0, 0)


def parse_args(args: list):
    result = None

    if (all(is_integer(arg) for arg in args) and len(args) == 2):
        parsed_args = list(map(int, args))
        if (is_valid_range(parsed_args)):
            result = parsed_args
        else:
            result = 'invalid'
    elif (len(args) == 1 and args[0] == 'q'):
        result = 'quit'
    else:
        result = 'invalid'
    
    return result

def is_valid_range(args: list):
    return all((arg >= -100 and arg <= 100) for arg in args)

    
def is_integer(num: str):
    try:
        int(num)
        return True
    except:
        return False


if __name__ == "__main__":
    motor_console_controller()