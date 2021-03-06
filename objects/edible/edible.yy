{
  "spriteId": null,
  "solid": false,
  "visible": false,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "item_abstract",
    "path": "objects/item_abstract/item_abstract.yy",
  },
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
    {"isDnD":false,"eventNum":10,"eventType":7,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":3,"value":"True","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"fixedRecovery","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"HPdelta","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"MPdelta","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"1","rangeEnabled":true,"rangeMin":0.0,"rangeMax":2.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"targetAll","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"numOwned","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"-1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"specialProperties","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"description","path":"objects/item_abstract/item_abstract.yy",},"objectId":{"name":"item_abstract","path":"objects/item_abstract/item_abstract.yy",},"value":"(Archetype) The base form of 'consumable' (single-use) items. Can be used outside of battle, but not (directly) in battle.  Applied to one or more targets.","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"usable","path":"objects/item_abstract/item_abstract.yy",},"objectId":{"name":"item_abstract","path":"objects/item_abstract/item_abstract.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "abstract",
    "path": "folders/Objects/items/abstract.yy",
  },
  "resourceVersion": "1.0",
  "name": "edible",
  "tags": [],
  "resourceType": "GMObject",
}