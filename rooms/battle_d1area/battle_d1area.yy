{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "battle_d1area",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": null,
  "views": [
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":400,"hview":260,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances_1","instances":[],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Guide","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_583F0DCE_2","spriteId":{"name":"spr_guide","path":"sprites/spr_guide/spr_guide.yy",},"headPosition":0.0,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"animationSpeed":1.0,"colour":4294967295,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":0.0,"y":0.0,},
      ],"visible":false,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"UI_Base","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_583D6992_2","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":null,"objectId":{"name":"battle_menu_positioner","path":"objects/battle_menu_positioner/battle_menu_positioner.yy",},"value":"simulateInput(global.enemies)",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":null,"objectId":{"name":"battle_menu_positioner","path":"objects/battle_menu_positioner/battle_menu_positioner.yy",},"value":"Anchor.middle_center",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":null,"objectId":{"name":"_ui_parent","path":"objects/_ui_parent/_ui_parent.yy",},"value":"simulateInput(global.enemies)",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"anchor","path":"objects/_ui_parent/_ui_parent.yy",},"objectId":{"name":"_ui_parent","path":"objects/_ui_parent/_ui_parent.yy",},"value":"Anchor.bottom_left",},
          ],"isDnd":false,"objectId":{"name":"battle_menu_positioner","path":"objects/battle_menu_positioner/battle_menu_positioner.yy",},"inheritCode":false,"hasCreationCode":true,"colour":4294967295,"rotation":0.0,"scaleX":0.6117647,"scaleY":0.5625,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":0.0,"y":135.0,},
      ],"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":40,"gridY":45,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"UI_Targeting","instances":[],"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Backgrounds_1","spriteId":{"name":"spr_column_wide","path":"sprites/spr_column_wide/spr_column_wide.yy",},"colour":4224306316,"x":0,"y":-40,"htiled":true,"vtiled":false,"hspeed":-0.05,"vspeed":0.0,"stretch":true,"animationFPS":30.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Formercolumns","tilesetId":{"name":"til_dungeon1tiles_big_wide","path":"tilesets/til_dungeon1tiles_big_wide/til_dungeon1tiles_big_wide.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":20,"SerialiseHeight":12,"TileCompressedData":[
1,2,-7,-2147483648,4,0,-2147483648,0,2,-8,-2147483648,1,2,-7,-2147483648,4,0,-2147483648,0,2,
-8,-2147483648,1,2,-7,-2147483648,4,0,-2147483648,0,2,-8,-2147483648,1,2,-7,-2147483648,4,0,-2147483648,
0,2,-8,-2147483648,1,2,-7,-2147483648,4,0,-2147483648,0,2,-8,-2147483648,1,2,-7,-2147483648,-3,
0,1,2,-8,-2147483648,1,2,-7,-2147483648,5,0,-2147483648,0,2,0,-7,-2147483648,1,2,-7,
-2147483648,-3,0,1,2,-88,-2147483648,],},"visible":false,"depth":500,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Sequences","assets":[],"visible":true,"depth":600,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7B291EC0_2","properties":[],"isDnd":false,"objectId":{"name":"battle_manager","path":"objects/battle_manager/battle_manager.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":160.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_700558F4_2","properties":[],"isDnd":false,"objectId":{"name":"obj_camera","path":"objects/obj_camera/obj_camera.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":0.0,"y":128.0,},
      ],"visible":true,"depth":700,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Midground","instances":[],"visible":true,"depth":800,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"columns","tilesetId":{"name":"til_dungeon1tiles","path":"tilesets/til_dungeon1tiles/til_dungeon1tiles.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":40,"SerialiseHeight":23,"TileCompressedData":[
-2,-2147483648,1,2,-18,-2147483648,1,2,-20,-2147483648,1,2,-18,-2147483648,1,2,-20,-2147483648,1,2,-18,-2147483648,1,2,-20,-2147483648,1,2,-18,-2147483648,1,2,-20,-2147483648,1,2,-18,-2147483648,1,2,
-20,-2147483648,1,2,-18,-2147483648,1,2,-698,-2147483648,],},"visible":true,"depth":900,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_3","tilesetId":{"name":"til_dungeon1tiles","path":"tilesets/til_dungeon1tiles/til_dungeon1tiles.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":40,"SerialiseHeight":23,"TileCompressedData":[
-2,-2147483648,-2,39,-2,-2147483648,-4,39,-2,-2147483648,-2,39,-2,-2147483648,-8,39,-16,-2147483648,-2,44,-2,39,1,-2147483648,-5,39,1,-2147483648,-3,39,1,-2147483648,-9,39,1,-2147483648,-5,39,-10,-2147483648,
-2,39,4,0,23,39,39,-4,-2147483648,-8,39,-2,-2147483648,-10,39,-10,-2147483648,-6,39,-4,-2147483648,-8,39,-2,-2147483648,-10,39,-10,-2147483648,-30,39,-10,-2147483648,-30,39,-34,-2147483648,1,0,-4,
-2147483648,1,0,-650,-2147483648,],},"visible":true,"depth":1000,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_2","tilesetId":{"name":"til_dungeon1tiles_big_wide","path":"tilesets/til_dungeon1tiles_big_wide/til_dungeon1tiles_big_wide.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":20,"SerialiseHeight":12,"TileCompressedData":[
-2,-2147483648,6,122,-2147483648,-2147483648,122,-2147483648,122,-4,-2147483648,1,122,-10,-2147483648,2,195,151,-4,-2147483648,
1,151,-30,-2147483648,-15,47,-5,-2147483648,-15,47,-5,-2147483648,-15,47,-5,-2147483648,-15,47,-5,-2147483648,
-15,47,-85,-2147483648,],},"visible":true,"depth":1100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","tilesetId":{"name":"TileSetBaddle","path":"tilesets/TileSetBaddle/TileSetBaddle.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":20,"SerialiseHeight":12,"TileCompressedData":[
15,8,2,8,3,3,8,3,8,2,2,3,2,8,9,8,-5,-2147483648,15,2,
4,2,11,11,2,4,3,4,10,4,3,2,2,3,-5,-2147483648,1,3,-3,2,
-2,3,9,2,3,2,3,2,2,3,2,3,-5,-2147483648,-76,1,-4,-2147483648,-15,1,
-85,-2147483648,],},"visible":true,"depth":1200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":{"name":"cloudy_battle","path":"sprites/cloudy_battle/cloudy_battle.yy",},"colour":4291104680,"x":0,"y":-65,"htiled":true,"vtiled":true,"hspeed":0.9,"vspeed":-0.1,"stretch":false,"animationFPS":30.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":1300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "${project_dir}/rooms/battle_d1area/RoomCreationCode.gml",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_7B291EC0_2","path":"rooms/battle_d1area/battle_d1area.yy",},
    {"name":"inst_583D6992_2","path":"rooms/battle_d1area/battle_d1area.yy",},
    {"name":"inst_700558F4_2","path":"rooms/battle_d1area/battle_d1area.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 640,
    "Height": 360,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": false,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "dungeons",
    "path": "folders/Rooms/dungeons.yy",
  },
}