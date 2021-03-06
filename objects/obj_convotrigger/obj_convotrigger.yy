{
  "spriteId": {
    "name": "spr_battleunit",
    "path": "sprites/spr_battleunit/spr_battleunit.yy",
  },
  "solid": false,
  "visible": false,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": null,
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":1,"value":"10","rangeEnabled":true,"rangeMin":-1.0,"rangeMax":255.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"correspondingFlag","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"correspondingFlag>-1 && global.flag[correspondingFlag]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"happened","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[0]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"lineNos","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[noone]","rangeEnabled":true,"rangeMin":0.0,"rangeMax":63.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"speakers","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[0]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"emotions","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":3,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"canWalk","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "story",
    "path": "folders/Objects/overworld/story.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_convotrigger",
  "tags": [],
  "resourceType": "GMObject",
}