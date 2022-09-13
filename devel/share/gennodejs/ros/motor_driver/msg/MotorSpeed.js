// Auto-generated. Do not edit!

// (in-package motor_driver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorSpeed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor1 = null;
      this.motor2 = null;
    }
    else {
      if (initObj.hasOwnProperty('motor1')) {
        this.motor1 = initObj.motor1
      }
      else {
        this.motor1 = 0;
      }
      if (initObj.hasOwnProperty('motor2')) {
        this.motor2 = initObj.motor2
      }
      else {
        this.motor2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorSpeed
    // Serialize message field [motor1]
    bufferOffset = _serializer.int64(obj.motor1, buffer, bufferOffset);
    // Serialize message field [motor2]
    bufferOffset = _serializer.int64(obj.motor2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorSpeed
    let len;
    let data = new MotorSpeed(null);
    // Deserialize message field [motor1]
    data.motor1 = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [motor2]
    data.motor2 = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_driver/MotorSpeed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de01eb387e2d4e889acdbdc65ebb888d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 motor1
    int64 motor2
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorSpeed(null);
    if (msg.motor1 !== undefined) {
      resolved.motor1 = msg.motor1;
    }
    else {
      resolved.motor1 = 0
    }

    if (msg.motor2 !== undefined) {
      resolved.motor2 = msg.motor2;
    }
    else {
      resolved.motor2 = 0
    }

    return resolved;
    }
};

module.exports = MotorSpeed;
