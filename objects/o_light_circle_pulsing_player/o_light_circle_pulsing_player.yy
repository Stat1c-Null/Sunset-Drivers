{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "o_light_circle_pulsing_player",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "DayNightSystem",
    "path": "folders/Objects/DayNightSystem.yy",
  },
  "parentObjectId": {
    "name": "o_light_parent",
    "path": "objects/o_light_parent/o_light_parent.yy",
  },
  "persistent": true,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"scale_change_max","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.01","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"scale_charge_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"room_speed * 0.1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "s_circlelight2",
    "path": "sprites/s_circlelight2/s_circlelight2.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}