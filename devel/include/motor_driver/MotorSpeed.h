// Generated by gencpp from file motor_driver/MotorSpeed.msg
// DO NOT EDIT!


#ifndef MOTOR_DRIVER_MESSAGE_MOTORSPEED_H
#define MOTOR_DRIVER_MESSAGE_MOTORSPEED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace motor_driver
{
template <class ContainerAllocator>
struct MotorSpeed_
{
  typedef MotorSpeed_<ContainerAllocator> Type;

  MotorSpeed_()
    : motor1(0)
    , motor2(0)  {
    }
  MotorSpeed_(const ContainerAllocator& _alloc)
    : motor1(0)
    , motor2(0)  {
  (void)_alloc;
    }



   typedef int64_t _motor1_type;
  _motor1_type motor1;

   typedef int64_t _motor2_type;
  _motor2_type motor2;





  typedef boost::shared_ptr< ::motor_driver::MotorSpeed_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::motor_driver::MotorSpeed_<ContainerAllocator> const> ConstPtr;

}; // struct MotorSpeed_

typedef ::motor_driver::MotorSpeed_<std::allocator<void> > MotorSpeed;

typedef boost::shared_ptr< ::motor_driver::MotorSpeed > MotorSpeedPtr;
typedef boost::shared_ptr< ::motor_driver::MotorSpeed const> MotorSpeedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::motor_driver::MotorSpeed_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::motor_driver::MotorSpeed_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::motor_driver::MotorSpeed_<ContainerAllocator1> & lhs, const ::motor_driver::MotorSpeed_<ContainerAllocator2> & rhs)
{
  return lhs.motor1 == rhs.motor1 &&
    lhs.motor2 == rhs.motor2;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::motor_driver::MotorSpeed_<ContainerAllocator1> & lhs, const ::motor_driver::MotorSpeed_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace motor_driver

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::motor_driver::MotorSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::motor_driver::MotorSpeed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::motor_driver::MotorSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::motor_driver::MotorSpeed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor_driver::MotorSpeed_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor_driver::MotorSpeed_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::motor_driver::MotorSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "de01eb387e2d4e889acdbdc65ebb888d";
  }

  static const char* value(const ::motor_driver::MotorSpeed_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xde01eb387e2d4e88ULL;
  static const uint64_t static_value2 = 0x9acdbdc65ebb888dULL;
};

template<class ContainerAllocator>
struct DataType< ::motor_driver::MotorSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "motor_driver/MotorSpeed";
  }

  static const char* value(const ::motor_driver::MotorSpeed_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::motor_driver::MotorSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 motor1\n"
"int64 motor2\n"
;
  }

  static const char* value(const ::motor_driver::MotorSpeed_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::motor_driver::MotorSpeed_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.motor1);
      stream.next(m.motor2);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MotorSpeed_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::motor_driver::MotorSpeed_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::motor_driver::MotorSpeed_<ContainerAllocator>& v)
  {
    s << indent << "motor1: ";
    Printer<int64_t>::stream(s, indent + "  ", v.motor1);
    s << indent << "motor2: ";
    Printer<int64_t>::stream(s, indent + "  ", v.motor2);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOTOR_DRIVER_MESSAGE_MOTORSPEED_H