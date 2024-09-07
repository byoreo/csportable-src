void() set_suicide_frame;

// called by ClientKill and DeadThink
void() respawn =
{
	if (coop)
	{
		// make a copy of the dead body for appearances sake
		CopyToBodyQue (self);
		// get the spawn parms as they were at level start
		setspawnparms (self);
		// respawn		
		PutClientInServer ();
           self.impulse = 201; // Weapon Bug Fix
	}
	else if (deathmatch)
	{
		// make a copy of the dead body for appearances sake
		CopyToBodyQue (self);
		// set default spawn parms
		SetNewParms ();
		// respawn		
		PutClientInServer ();
           self.impulse = 201; // Weapon Bug Fix
	}
	else
	{	// restart the entire server
		localcmd ("restart\n");
	}
};


/////SPAWNPOINTS//////

/*
============
SelectSpawnPoint  FIX!!!!

Returns the entity to spawn at
============
*/
entity() SelectSpawnPoint =
{
	local	entity spot;
	local	entity thing;
	local	float  pcount;


	
// testinfo_player_start is only found in regioned levels
	spot = find (world, classname, "testplayerstart");
	if (spot)
		return spot;
		
// choose a info_player_deathmatch point
	if (coop)
	{
		lastspawn = find(lastspawn, classname, "info_player_coop");
		if (lastspawn == world)
			lastspawn = find (lastspawn, classname, "info_player_start");
		if (lastspawn != world)
			return lastspawn;
	}
	else if (deathmatch)
	{
		spot = lastspawn;
		while (1)
		{
			spot = find(spot, classname, "info_player_deathmatch");
			if (spot != world)
			{
				if (spot == lastspawn)
					return lastspawn;
				pcount = 0;
				thing = findradius(spot.origin, 32);
				while(thing)
				{
					if (thing.classname == "player")
						pcount = pcount + 1;
					thing = thing.chain;
				}
				if (pcount == 0)
				{
					lastspawn = spot;
					return spot;
				}
			}
		}
	}

	if (serverflags)
	{	// return with a rune to start
		spot = find (world, classname, "info_player_start2");
		if (spot)
			return spot;
	}
	
	spot = find (world, classname, "info_player_start");
	if (!spot)
		error ("PutClientInServer: no info_player_start on level");
	
	return spot;
};


/*
===========
PutClientInServer
Koolio, CS Bomb mission
Makes you an observer if you don't have a team or spawns you if you selected one
called each time a player is spawned
============
*/
void() DecodeLevelParms;
void() PlayerDie;

void() PutObserverInServer; //Koolio,Declare observer mode before it's being used
				    //It's located in src/cs-bomb/observer.qc



void() PutClientInServer =		//Koolio,The normal putclientinserver
{
if (self.team == 0) // if you don't have a team selected 
{ 
PutObserverInServer(); // Run the observer func 
return; // and forget the rest 
}

	local	entity spot;
local float r;


	spot = SelectSpawnPoint (0);



	self.classname = "player";
	self.health = 100;
      self.takedamage = DAMAGE_AIM;
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_WALK;
	self.show_hostile = 0;
	self.max_health = 100;
	self.flags = FL_CLIENT;
	self.air_finished = time + 12;
	self.dmg = 2;   		// initial water damage
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.invisible_finished = 0;
	self.invincible_finished = 0;
	self.effects = 0;
	self.invincible_time = 0;


if (respawn)                           
{                                      
if (self.team == 1)
{                    
stuffcmd (self, "impulse 54\n");       
self.items = self.items - ( 
             IT_SHOTGUN | IT_SUPER_SHOTGUN | IT_G3SG1 | IT_FAMAS
              | IT_M87 | IT_MP5 | IT_AK47 | IT_M4A1 | IT_M249 | IT_P90
              | IT_AUG | IT_DEAGLE | IT_GALIL | IT_P228 | IT_MAC10 | IT_FIVESEVEN| IT_USP);

self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
self.ammo_762 = 0;
self.ammo_40acp = 0;
self.ammo_50 = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_228 = 0;
}
}                                      
            
if (respawn)                           
{                         
if (self.team == 2)
{                     
stuffcmd (self, "impulse 50\n");      
self.items = self.items - ( 
             IT_SHOTGUN | IT_SUPER_SHOTGUN | IT_G3SG1 | IT_FAMAS
              | IT_M87 | IT_MP5 | IT_AK47 | IT_M4A1 | IT_M249 | IT_P90
              | IT_AUG | IT_DEAGLE | IT_GALIL | IT_P228 | IT_MAC10 | IT_FIVESEVEN| IT_GLOCK);

self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
self.ammo_762 = 0;
self.ammo_9mm = 0;
self.ammo_50 = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_228 = 0;
}                                      
}

if (self.team ==1)
self.tticket = +1;
if (self.team == 2)
self.ctticket = +1;

if (self.team == 1)
self.ammo_9mm = 20;
if (self.team == 1)
self.ammo_c4a = 1;

if (self.team == 2)
self.ammo_40acp = 14;

if (self.team == 2)
stuffcmd (self, "color 13 13\n");  // CT TEAM BLUE

if (self.team == 1)
stuffcmd (self, "color 4 4\n");    // T TEAM RED

self.items = self.items - ( 
             IT_SHOTGUN | IT_SUPER_SHOTGUN | IT_G3SG1 | IT_FAMAS
              | IT_M87 | IT_MP5 | IT_AK47 | IT_M4A1 | IT_M249 | IT_P90
              | IT_AUG | IT_DEAGLE | IT_GALIL | IT_P228 | IT_MAC10 | IT_FIVESEVEN); 


	DecodeLevelParms ();

	W_SetCurrentAmmo ();
   	if ( self.aflag )
	self.attack_finished = time;
	self.th_pain = player_pain;
	self.th_die = PlayerDie;
	
	self.deadflag = DEAD_NO;
// paustime is set by teleporters to keep the player from moving a while
	self.pausetime = 10;

//	spot = SelectSpawnPoint (0);

	self.origin = spot.origin + '0 0 1';
	self.angles = spot.angles;
	self.fixangle = TRUE;		// turn this way immediately




	setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);

	self.view_ofs = '0 0 22';

	player_stand1 ();

	if (deathmatch || coop)
	{
		makevectors(self.angles);
		spawn_tfog (self.origin + v_forward*20);
	}

	spawn_tdeath (self.origin, self);


};


/*
go to the next level for deathmatch
only called if a time or frag limit has expired
*/
void() NextLevel =
{
	local entity o;
	local float r;
	
	r = floor(random()*17);
	if (r == 0)
		mapname = "aim_glocker";
	if (r == 1)
		mapname = "aim_crazyjump4";
	if (r == 2)
		mapname = "surf";
	if (r == 3)
		mapname = "de_rockslide";
	if (r == 4)
		mapname = "aim_taliban";
	if (r == 5)
		mapname = "fy_iceworld";
	if (r == 6)
		mapname = "$2000$";
	if (r == 7)
		mapname = "cs_italy2";
	if (r == 8)
		mapname = "aim_usp";
	if (r == 9)
		mapname = "aim_aztec";
	if (r == 10)
		mapname = "fy_iceworld_xxl";
	if (r == 11)
		mapname = "aim_ak_colt";
	if (r == 12)
		mapname = "aim_ak_colt2_cz";
	if (r == 13)
		mapname = "fy_buzzkill";
	if (r == 14)
		mapname = "gg_mini_dust2";
	if (r == 15)
		mapname = "pubmasters_mini_dust";
	if (r == 16)
		mapname = "fy_iceworld";
	if (r == 17)
		mapname = "de_dust2_long";


	o = spawn();
	o.map = mapname;

	nextmap = o.map;
	gameover = TRUE;
	
	if (o.nextthink < time)
	{
		o.think = execute_changelevel;
		o.nextthink = time + 0.1;
	}
};
