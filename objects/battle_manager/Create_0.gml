/// @description Prepare for battle
// You can write your code in this editor

obj_player.paused = true;//lock it in place
randomize();
enum phase{
	init,
	startTurn,
	wait,
	process,
	checkFinish,
	endTurn,
	win,
	lose,
	escape,
	postWin
}
lvBreaks = [0,200,600,1400,3000,6200,10000,30000,600000,
1600000,6400000,11600000,111600000,222600000,333600000,444600000,644600000,794600000,
1000000000,1500000000,2000000001,3000000002,4000000003,5000000004,5000000005,
5000000006,5500000006,5600000007,5700000008,5800000009,5900000010,
6000000006,6100000006,6200000007,6300000008,6400000009,6500000010,
6600000006,6700000007,6800000008,6900000009,
7000000006,7100000006,7200000007,7300000008,7400000009,7500000010,
7600000006,7700000007,7800000008,7900000009,7990000010,
8000000006,8100000006,8200000007,8300000008,8400000009,8500000010,
8600000006,8700000007,8800000008,8900000009,8990000010,
9000000006,9100000006,9200000007,9300000008,9400000009,9500000010,
9600000006,9700000007,9800000008,9900000009,
10000000006,10100000006,10200000007,10300000008,10400000009,10500000010,
10600000006,10700000007,10800000008,10900000009,
11400000006,12100000007,13400000008,14850000009,
16000000006,16030000010,16070000006,
16100000006,16200000007,16300000008,16400000009,16500000010,
16600000006,16700000007,16800000008,16900000009,16990000010
];//temporarily putting here till we globalize somehow
combatPhase = phase.init;
unitsFinished = 0;//FUNBOX REMNANT
totalUnits = 0;//FUNBOX REMNANT
selectedFinished = false;
processFinished = false;
allowInput = false;
solicitInput = false;
expEarned = 0;
cashEarned = 0;
goldEarned = 0;

function curPhaseName(){
	switch(combatPhase){
		case phase.init: return "init";
		case phase.startTurn: return "startTurn";
		case phase.wait: return "wait";
		case phase.process: return "process";
		case phase.checkFinish: return "checkFinish";
		case phase.endTurn: return "endTurn";
		case phase.win: return "win";
		case phase.lose: return "lose";
		case phase.escape: return "escape";
		case phase.postWin: return "postWin";
	}
}

global.units = ds_list_create(); //only used for selector options
global.allies = ds_list_create();
global.enemies = ds_list_create();
pq = [[noone,noone,noone,noone,noone,noone,noone,noone,
	   noone,noone,noone,noone,noone,noone,noone],
	  [999,999,999,999,999,999,999,999,999,999,999,999,999,999,999]];
pqSize = 0;
//pq = ds_priority_create();//only battle managers needs to see this

global.selectedUnit = noone;
global.targets = [noone];
global.P_System = part_system_create_layer("UI_Targeting",false);//special fx!
global.Particle1 = part_type_create();

function getWait(u){
	return 100-u.current[SPD];
}
function trickleUp(initial){
	var cur = initial;
	var parent = floor(cur/2);
	while (pq[1][cur]<pq[1][parent]){
		var tempZero = pq[0][parent];
		var tempOne = pq[1][parent];
		pq[0][parent] = pq[0][cur];
		pq[1][parent] = pq[1][cur];
		pq[0][cur] = tempZero;
		pq[1][cur] = tempOne;
		cur = parent;
		parent = floor(cur/2);
	}
}

function trickleDown(initial = 0){
	var cur = initial;
	//show_debug_message("Trickling down "+string(cur*2)+"("+string(pq[1][cur])+")");
	
	while (pq[0][cur]!=noone)&&((cur*2)<15)&&
	(pq[1][(cur*2)+1]<pq[1][cur]||
	pq[1][(cur+1)*2]<pq[1][cur]){
		if pq[1][(cur*2)+1] > pq[1][(cur+1)*2]{
			var small = (cur+1)*2;
			
			//show_debug_message(pq[1][small].title+" (lchild) is smaller");
			var tempZero = pq[0][small];
			var tempOne = pq[1][small];
			pq[0][small] = pq[0][cur];
			pq[1][small] = pq[1][cur];
			pq[0][cur] = tempZero;
			pq[1][cur] = tempOne;
			cur = small;
		}
		
		else{
			//show_debug_message(pq[1][(cur*2)+1)].title+" (rchild) is smaller");
			var small = (cur*2)+1;
			var tempZero = pq[0][small];
			var tempOne = pq[1][small];
			pq[0][small] = pq[0][cur];
			pq[1][small] = pq[1][cur];
			pq[0][cur] = tempZero;
			pq[1][cur] = tempOne;
			cur = small;
		}
	}
}
function dequeue(priority=pq){//automatically sets turn-haver and returns wait
		//need to prune before activating
		global.selectedUnit = priority[0][0];
		var wait = priority[1][0];
		//pqSize--; //normal mode                        
		if --pqSize<0 pqSize=0;//catching a weird error when you kill teammate in 2v1
		pq[0][0] = pq[0][pqSize];
		pq[1][0] = pq[1][pqSize];
		pq[0][pqSize] = noone;
		pq[1][pqSize] = 999;
		/*show_debug_message("Pretrickle: ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; "+string(pqSize));*/
		trickleDown();
		/*show_debug_message("Queue shrunk to: ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; size "+string(pqSize));*/
		return wait;
}
function remove(unit){//assumes only ONE of this instance is in queue.  not explicitly enforced, though logically to be expected
	    //show_debug_message("Considering "+unit.title+" removal");
		//need to prune before activating
		var i,wait = -1;
		for (i = 0 ; i<15; i++){
			if (pq[0][i]==unit){
				wait = pq[1][i];
				break;
			}
		}
		if (wait == -1) //cancel
			return;
	    show_debug_message("Removing "+unit.title+" (index "+string(i)+")");
		//global.selectedUnit = pq[0][0];//NO you do not need to do this are you insane
		pqSize--;
		//var level = floor(log2(i+1))+1;
		//var bottomLevel = floor(log2((pqSize--)+1))+1;
		//var leftLeaf;
		pq[0][i] = pq[0][pqSize];
		pq[1][i] = pq[1][pqSize];
		pq[0][pqSize] = noone;
		pq[1][pqSize] = 999;
		/*show_debug_message("Remover pretrickle: ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; "+string(pqSize));*/
		trickleDown(i);//actually this should work lol
		/*show_debug_message("Queue sprunk to: ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; "+string(pqSize));*/
		
		return wait;
}
function enqueue(u,wait=getWait(u)){
	remove(u);//should never double queue the same item
	if (u.current[HP]<1)return;
	//show_debug_message("Enqueueing "+u.title);
	pq[0][pqSize]=u;
	pq[1][pqSize]=wait;
	trickleUp(pqSize++);
	//initial pq[0][next] will only be noone if empty so ignore that case
	/*show_debug_message("Queue grew to: ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; "+string(pqSize));*/
}
function checkForReadiness(){//ALLY ONLY version;  if using mechanic for enemies, they'd need to check for battle_player instead!  since I got rid of isPlayer bool not trivial to do here
	/*show_debug_message("Checking ["+string(pq[1][0])+","+string(pq[1][1])+","+
						string(pq[1][2])+","+string(pq[1][3])+","+
						string(pq[1][4])+","+string(pq[1][5])+"]; "+string(pqSize));*/
	if (pq[0][0]==-4) return false;
	/* Top is ALWAYS first pick.  Only proceed if top is player but not teammate.*/
	if  (pq[0][0].isPlayer !=
		global.selectedUnit.isPlayer)
		return false;
	else if (pq[0][0] == global.selectedUnit.teammate) return true;
	else if (pqSize==1) return false; //shouldn't happen?
	else if (pqSize==2) //only two slots filled; first is not teammate
		return (pq[0][1] == global.selectedUnit.teammate);
	else {//neither child should be blank, so this comp should work
		var leftSmaller = pq[1][1]<=pq[1][2]; //assumes left-priority for equal keys
		//var rightSmaller = pq[1][1]>pq[1][2];
		if (pqSize==3)|| (pqSize < 6 && !leftSmaller){//no grandchildren, or grandchildren are bigger than uncle
			if (leftSmaller?pq[0][1]:pq[0][2])==global.selectedUnit.teammate
				return true;
			else if (leftSmaller?pq[0][1]:pq[0][2])==battle_enemy
				return false;
			else //lesser is also teammate
				return (leftSmaller?pq[0][2]:pq[0][1])==global.selectedUnit.teammate;
		}
		else if leftSmaller && pqSize > 3 {//implied leftSmaller. only need to check left-side grandchildren
			if pq[0][1]==global.selectedUnit.teammate
				return true;
			else if pq[0][1]==battle_enemy
				return false;
			else if (pqSize==4){
				if pq[1][3]<pq[1][2]
					return pq[0][3]==global.selectedUnit.teammate;
				else return pq[0][2]==global.selectedUnit.teammate;
			}
			else{//pqSize>=5, so two grandchildren to check
				if pq[1][3]<=pq[1][4]{
					return pq[1][3]<pq[1][2]?pq[0][3]==global.selectedUnit.teammate:pq[0][2]==global.selectedUnit.teammate;
				}
				else{
					return pq[1][4]<pq[1][2]?pq[0][4]==global.selectedUnit.teammate:pq[0][2]==global.selectedUnit.teammate;
				}
				
			}
		}
		else if !leftSmaller && pqSize > 5{//right grandchildren
			if (pqSize ==6){//one grandchild to check
				if pq[1][5]<pq[1][1]
					return pq[0][5]==global.selectedUnit.teammate;
				else return pq[0][1]==global.selectedUnit.teammate;
			}
			else{ //two grandchildren to check
				if pq[1][5]<=pq[1][6]{
					return pq[1][5]<pq[1][1]?pq[0][5]==global.selectedUnit.teammate:pq[0][1]==global.selectedUnit.teammate;
				}
				else{
					return pq[1][6]<pq[1][1]?pq[0][6]==global.selectedUnit.teammate:pq[0][1]==global.selectedUnit.teammate;
				}
			}
		}
		else return false;//idk when this would happen
	}	
}
function reduce(amt) {
    var i;
	for (i = 0; i < 15; i++) {
		if pq[0][i]==noone break;//revert to break; when working again
        else pq[1][i]-=amt;
    }
	//show_debug_message("After all reduction, pq size is "+string(i));
}
draw_set_font(Roses);
obj_player.visible = 0;//undoes debug crap
draw_set_colour(c_white);//to reset silly red thing
function drawQueue() {
    for (var i = 0; i < pqSize; i++) {
        var element = pq[0][i];
        var key = pq[1][i];
        if element==-4 continue;
		//func(element, key, i);
		draw_text_transformed(280,3+(i*13),((i==0)?"NEXT: ":"On level "+string(floor(log2(i))+1)+": ")+element.title+" ("+string(key)+" left)",.375,.375,0);
    }
}
/*function foreach_priority(priority) {
    var size = ds_priority_size(priority);
    
    for (var i = 0; i < size; i++) {
        var element = ds_priority_find_min(priority);
        var key = ds_priority_find_priority(priority, element);
        //func(element, key, i);
	    draw_text_transformed(280,2+(i*15),((i==0)?"NEXT: ":"In "+string(i)+" turn(s): ")+element.title+" ("+string(key)+" left)",.375,.375,0);
        ds_priority_delete_min(priority);
    }
}*/

animCounter = 0;
currentMessage = "";
futureMessages = ds_list_create();
//usingMouse = false;
alarm1s=0; atkBroadcasts=0; itmBroadcasts=0; hitMissBroadcasts=0; deathBroadcasts=0;
resultsRemaining=0;