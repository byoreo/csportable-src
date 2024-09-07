float last_time;
vector start_org;
vector start_vel;
void (entity targ, entity inflictor, entity attacker, float damage) T_Damage;
void () player_run;
void(entity bomb, entity attacker, float rad, entity ignore) T_RadiusDamage;
void(vector org, vector vel, float damage) SpawnBlood;
void() SuperDamageSound;
void(vector, vector, entity) ThrowBloodSplat;
void() CCam;
void() BombThink;
void() eject_shell;
void() MuzzleFlash;
void(vector org) MuzzleFlash2;
void() SZoom;
void() Money;
void() AmmoClip;
void() Reload;
void() BecomeExplosion;
void() player_stand1;
void() player_crouch;
void() player_throw1;
void() player_crthrow1;
void() player_f1;
void() player_crf1;
void() player_axen1;
void() player_shotpump1;
void() player_craxen1;
void() respawn;
void() C4Load;
void() W_FireGrenade;
void() Func_Bomb_Target;
void() PlayerCount;
void(entity) CopyToBodyQue;

void() W_Precache =
{
	precache_sound ("weapons/knife/hitmeat.wav");
	precache_sound ("weapons/knife/hitwall.wav");
	precache_sound ("weapons/knife/hitair.wav");
	precache_sound ("weapons/sniper/m87.wav");
	precache_sound ("weapons/grenade.wav");	// grenade launcher
	precache_sound ("weapons/bounce.wav");		// grenade bounce
	precache_sound ("weapons/bullet/hitwall3.wav");
	precache_sound ("weapons/bullet/sshell3.wav");
	precache_sound ("misc/buy.wav");
	precache_sound ("weapons/glock/glock.wav");     
      precache_sound ("weapons/usp/usp.wav");
      precache_sound ("weapons/usp/usp-2.wav");
      precache_sound ("weapons/famas/famas.wav");
      precache_sound ("weapons/elite/elite.wav");
      precache_sound ("weapons/mp5/mp5.wav");
      precache_sound ("weapons/m249/m249.wav");
      precache_sound ("weapons/ak47/ak47.wav");
      precache_sound ("weapons/deagle/deagle.wav");
      precache_sound ("weapons/fiveseven/fiveseven.wav");
      precache_sound ("weapons/g3sg1/g3sg1.wav");
      precache_sound ("weapons/galil/galil.wav");
      precache_sound ("weapons/mac10/mac10.wav");
      precache_sound ("weapons/p228/p228.wav");
      precache_sound ("weapons/aug/aug.wav");
      precache_sound ("weapons/m4a1/m4a1.wav");
      precache_sound ("weapons/m4a1/m4a1-2.wav");
      precache_sound ("weapons/p90/p90.wav");
      precache_sound ("weapons/zoom.wav");
      precache_sound ("weapons/reload.wav");
      precache_sound ("weapons/xm1014/xm1014.wav");
      precache_sound ("weapons/m3/m3.wav");
	precache_model ("progs/shell.mdl"); 	
	precache_model ("progs/beam.mdl"); 	  					
	precache_model ("sprites/s_riple.spr");              
      precache_model ("progs/bullet.mdl");
      precache_model ("progs/muzzle.mdl");
      precache_model ("sprites/s_bubble.spr");
      precache_sound ("buttons/switch04.wav");
      precache_model ("progs/explode.mdl");
};

void() PlayerCount = //declares moneyamount
{
self.total_ents = CountEntities("player"); 
	local string s; //does something
	sprint (self, "Counted "); //prints you have
	s = ftos (self.total_ents); //pretty much binds the letter s in this moneyamount stuff to show money amount
	sprint (self,s); //tells it to say the money amount
	sprint (self, " players\n"); //says dollars
};

/*
================
wall crandom
================
*/

float() crandom =
{
	return 2*(random() - 0.5);
};

/*
================
wall velocity
================
*/
vector() wall_velocity =
{
	local vector	vel;
	
	vel = normalize (self.velocity);
	vel = normalize(vel + v_up*(random()- 0.5) + v_right*(random()- 0.5));
	vel = vel + 2*trace_plane_normal;
	vel = vel * 200;
	
	return vel;
};


/*
================
SpawnMeatSpray
================
*/
void(vector org, vector vel) SpawnMeatSpray =
{
	local	entity missile, mpuff;
	local	vector	org;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_BOUNCE;
	missile.solid = SOLID_NOT;

	makevectors (self.angles);

	missile.velocity = vel;
	missile.velocity_z = missile.velocity_z + 250 + 50*random();

	missile.avelocity = '3000 1000 2000';
	
// set missile duration
	missile.nextthink = time + 1;
	missile.think = SUB_Remove;

	setmodel (missile, "progs/bleed.mdl");
	setsize (missile, '0 0 0', '0 0 0');		
	setorigin (missile, org);
};

/*
================
SpawnBlood
================
*/
void(vector org, vector vel, float damage) SpawnBlood =
{
       particle (org, vel*0.1, 79, damage*1);
       particle (org, vel*0.25, 74, damage*5);
       particle (org, vel*0.15, 69, damage*2);
};

/*
================
spawn_touchblood
================
*/
void(float damage) spawn_touchblood =
{
	local vector	vel;

	vel = wall_velocity () * 0.2;
	SpawnBlood (self.origin + vel*0.01, vel, damage);
};

/*
================
SpawnChunk
================
*/
void(vector org, vector vel) SpawnChunk =
{
	particle (org, vel*0.02, 0, 130);
};

/*
==============================================================================

MULTI-DAMAGE
f
Collects multiple small damages into a single damage

==============================================================================
*/

entity	multi_ent;
float	multi_damage;

void() ClearMultiDamage =
{
	multi_ent = world;
	multi_damage = 0;
};

void() ApplyMultiDamage =
{
	if (!multi_ent)
		return;
	T_Damage (multi_ent, self, self, multi_damage);
};

void(entity hit, float damage) AddMultiDamage =
{
	if (!hit)
		return;
	
	if (hit != multi_ent)
	{
		ApplyMultiDamage ();
		multi_damage = damage;
		multi_ent = hit;
	}
	else
		multi_damage = multi_damage + damage;
};



/*
================
TraceAttack
================
*/


void(float damage, vector dir) TraceAttack =
{
local vector vel, org;
local float f_damage;

vel = normalize(dir + v_up*crandom() + v_right*crandom());
vel = vel + 2*trace_plane_normal;
vel = vel * 200;

org = trace_endpos - dir*4;

if (trace_ent.takedamage)
{
if(random() < 0.4) //only 2 in 5 times to prevent overflows
        ThrowBloodSplat(dir, trace_endpos, trace_ent); //throw blood splat in direction of shot


if (trace_fraction >= 1)
return;
if (trace_endpos_z > (trace_ent.origin_z + 15))
{
f_damage = damage * 1; // This is a head shot
stuffcmd (self, "play shot/headshot.wav\n");
}
else if (trace_endpos_z < trace_ent.origin_z)
{
f_damage = damage * 0.5; // This is a leg shot
}
else
{
f_damage = damage; // Anywhere else (torso)
}
SpawnBlood (org, vel*0.2, f_damage * 0.3);
AddMultiDamage (trace_ent, f_damage);
}
else
{
WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
WriteByte (MSG_BROADCAST, TE_GUNSHOT);
WriteCoord (MSG_BROADCAST, org_x);
WriteCoord (MSG_BROADCAST, org_y);
WriteCoord (MSG_BROADCAST, org_z);
}
};

/*
================
FireBullets

Used by shotgun, super shotgun, and enemy soldier firing
Go to the trouble of combining multiple pellets into a single damage call.
================
*/
void(float shotcount, vector dir, vector spread) FireBullets = 
{

	local float r;
	local vector direction;
	local vector src;
	local float bullet;
	bullet = 0;
	makevectors(self.v_angle);
	src = self.origin + v_forward * MOVETYPE_BOUNCE;
	src_z = self.absmin_z + self.size_z * 0.7;
	ClearMultiDamage();

	local entity push;
	push = spawn ();
	push.owner = self;
	push.movetype = MOVETYPE_FLYMISSILE;
	push.solid = SOLID_BBOX;
	push.angles = vectoangles(dir);
	push.classname = "push";
	setorigin (push, src);

	while (shotcount > 0)
	{
		direction = dir + crandom() * spread_x * v_right + crandom() * spread_y * v_up;
		traceline(src, src + direction * FL_WATERJUMP, 0, self);
		if (trace_fraction != 1)
		{
			TraceAttack(MOVETYPE_STEP, direction);
		}
		if (!bullet && trace_ent == world)
		{

			placebullethole(trace_endpos);
			bullet = 1;
                  
                  
		}
		shotcount = shotcount - 1;
	}
	ApplyMultiDamage();


};



void() tpoints =
{
self.twin == self.twin +1;

};

void() BombExplode =
{


	T_RadiusDamage (self, self.owner, 1200, world);

	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_EXPLOSION);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);

	BecomeExplosion ();


self.nextthink = time + 3;
self.think = tpoints; 


};

void() BombThink =
{

self.nextthink = time + 30;
self.think = BombExplode;


};

void() destroy =
{



	if  (other.classname == "func_bomb_target")
	{
		BombThink();
		return;
	}
 
	sound (self, CHAN_WEAPON, "weapons/bounce.wav", 1, ATTN_NORM);	// bounce sound
	if (self.velocity == '0 0 0')
		self.avelocity = '0 0 0';

};



/*
================
W_FireAxe
================
*/
void() W_FireAxe =
{
	local	vector	source;
	local	vector	org;

	makevectors (self.v_angle);
	source = self.origin + '0 0 16';
	traceline (source, source + v_forward*64, FALSE, self);
	if (trace_fraction == 1.0)
		return;
	
	org = trace_endpos - v_forward*4;

	if (trace_ent.takedamage)
	{
		trace_ent.axhitme = 1;
		SpawnBlood (org, '0 0 0', 20);
		T_Damage (trace_ent, self, self, 20);

	}
	else
	{	// hit wall
            sound (self, CHAN_WEAPON, "weapons/knife/hitwall.wav", 1, ATTN_NORM);
		WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
		WriteByte (MSG_BROADCAST, TE_GUNSHOT);
		WriteCoord (MSG_BROADCAST, org_x);
		WriteCoord (MSG_BROADCAST, org_y);
		WriteCoord (MSG_BROADCAST, org_z);
	}
};

void() BombTouch =
{

	if  (other.classname == "func_bomb_target")
	{
		BombThink();
            //W_FireGrenade();
		return;
	}
	sound (self, CHAN_WEAPON, "weapons/bounce.wav", 1, ATTN_NORM);	// bounce sound
	if (self.velocity == '0 0 0')
		self.avelocity = '0 0 0';
};


void() PrepareBomb =
{

   if (self.button0 && self.plantable == 0)
   centerprint (self, "you can not plant bomb here\n");
   return;

};

void() C4Bar =
{

if(self.weapon == IT_C4){

       if(!self.button0)
            self.charge =0;

        if(self.button0 && self.plantable == 1)
          {
            self.charge = self.charge + 1; 
            if(self.charge > 190)
            self.charge =0;
          }

      ProgressBar();
      PrepareBomb();
}
};

/*
================
W_FireShotgun
================
*/
void() eject_shell;
void() W_FireShotgun =
{

    if (self.ammo_cal12 == 0) 
    { 
      Reload ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/xm1014/xm1014.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_cal12 = self.ammo_cal12 - 1;
      eject_shell ();
	MuzzleFlash ();
	dir = aim (self, 100000);


	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (5, dir, '0.04 0.04 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (5, dir, '0.1 0.1 0');
	}

if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 25);
}


};




/*
================
W_FireM249
================
*/
void() eject_shell;
void() W_FireM249 =
{
    if (self.ammo_mg == 0) 
    { 
      Reload10 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/m249/m249.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_mg = self.ammo_mg - 1;
      eject_shell ();
	MuzzleFlash ();
      Reload10 ();
	dir = aim (self, 100000);

	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.1 0.1 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.15 0.15 0');
	}

if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 9);
}

};



/*
================
W_FireM87
================
*/
void() eject_shell;
void() W_FireM87 =
{
    if (self.ammo_50cal == 0) 
    { 
      stuffcmd (self, "scr_zoom 0\n");
      Reload7 ();
      return; 
    }
	local vector dir;


	sound (self, CHAN_WEAPON, "weapons/sniper/m87.wav", 1, ATTN_NORM);	

   self.punchangle_x = -5;

	self.currentammo = self.ammo_50cal = self.ammo_50cal - 1;
      eject_shell ();
	MuzzleFlash ();
      Reload7 ();
	dir = aim (self, 100000);
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0 0 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.1 0.1 0');
	}
      T_Damage (trace_ent, self, self, 100);

};



/*
================
W_FireGlock
================
*/
void() eject_shell;
void() W_FireGlock =
{

    if (self.ammo_9mm == 0) 
    { 
      Reload ();
      return; 
    }


	local vector dir;
local entity barrel;


	sound (self, CHAN_WEAPON, "weapons/glock/glock.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_9mm = self.ammo_9mm - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload ();


	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 10);
}



};



/*
================
W_FireFiveSeven
================
*/
void() eject_shell;
void() W_FireFiveSeven =
{
    if (self.ammo_fs == 0) 
    { 
      Reload4 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/fiveseven/fiveseven.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_fs = self.ammo_fs - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload4 ();

	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 12);
}




};



/*
================
W_FireG3sg1
================
*/
void() eject_shell;
void() W_FireG3sg1 =
{
    if (self.ammo_g3 == 0) 
    { 
      stuffcmd (self, "scr_zoom 0\n");
      Reload9 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/g3sg1/g3sg1.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_g3 = self.ammo_g3 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload9 ();

	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0 0 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 30);
}




};



/*
================
W_FireGalil
================
*/
void() eject_shell;
void() W_FireGalil =
{
    if (self.ammo_gal == 0) 
    { 
      Reload8 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/galil/galil.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_gal = self.ammo_gal - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload8 ();

	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.05 0.08 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.09 0.1 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 19);
}




};



/*
================
W_FireMac10
================
*/
void() eject_shell;
void() W_FireMac10 =
{
    if (self.ammo_mac == 0) 
    { 
      Reload14 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/mac10/mac10.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_mac = self.ammo_mac - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload14 ();

	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.1 0.03 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.15 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 10);
}




};



/*
================
W_FireP228
================
*/
void() eject_shell;
void() W_FireP228 =
{
    if (self.ammo_228 == 0) 
    { 
      Reload3 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/p228/p228.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_228 = self.ammo_228 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload3 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 13);
}




};



/*
================
W_FireElite
================
*/
void() eject_shell;
void() W_FireElite =
{
    if (self.ammo_dual == 0) 
    { 
      Reload13 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/elite/elite.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_dual = self.ammo_dual - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload13 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.03 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 12);
}




};



/*
================
W_FireUSP
================
*/
void() eject_shell;
void() W_FireUsp =
{

    if (self.ammo_40acp == 0) 
    { 
      Reload1 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/usp/usp.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_40acp = self.ammo_40acp - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload1 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 15);
}

};



/*
================
W_FireUSPs
================
*/
void() eject_shell;
void() W_FireUsps =
{

    if (self.ammo_40acp == 0) 
    { 
      Reload1s ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/usp/usp-2.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_40acp = self.ammo_40acp - 1;
	dir = aim (self, 100000);
      eject_shell ();
      //MuzzleFlash ();
      Reload1s ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0 0 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 15);
}

};


/*
================
W_FireDeagle
================
*/
void() eject_shell;
void() W_FireDeagle =
{
    if (self.ammo_50 == 0) 
    { 
      Reload2 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/deagle/deagle.wav", 1, ATTN_NORM);	

	self.punchangle_x = -4;
	
	self.currentammo = self.ammo_50 = self.ammo_50 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload2 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.05 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.08 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 50);
}

};



/*

================
W_FireMP5
================
*/
void() eject_shell;
void() W_FireMp5 =
{
    if (self.ammo_9mm2 == 0) 
    { 
      Reload15 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/mp5/mp5.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_9mm2 = self.ammo_9mm2 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload15 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.03 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.06 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 12);
}

};
/*
================
W_FireP90
================
*/
void() eject_shell;
void() W_FireP90 =
{
    if (self.ammo_9mm3 == 0) 
    { 
      Reload16 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/p90/p90.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_9mm3 = self.ammo_9mm3 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload16 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.02 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.04 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 10);
}

};

/*
================
W_FireAK47
================
*/
void() eject_shell;
void() W_FireAk47 =
{
    if (self.ammo_762 == 0) 
    { 
      Reload5 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/ak47/ak47.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_762 = self.ammo_762 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload5 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.08 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 20);
}

};

/*
================
W_FireFamas
================
*/
void() eject_shell;
void() W_FireFamas =
{
    if (self.ammo_5563 == 0) 
    { 
      Reload12 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/famas/famas.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_5563 = self.ammo_5563 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload12 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.06 0.02 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.1 0.05 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 13);
}

};
/*
================
W_FireSteyrAug
================
*/
void() eject_shell;
void() W_FireAug =
{
    if (self.ammo_5562 == 0) 
    { 
      Reload6 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/aug/aug.wav", 1, ATTN_NORM);	

	self.punchangle_x = -2;
	
	self.currentammo = self.ammo_5562 = self.ammo_5562 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload6 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.08 0.08 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 16);
}

};

/*
================
W_FireM4A1
================
*/
void() eject_shell;
void() W_FireM4a1 =
{

    if (self.ammo_556 == 0) 
    { 
      Reload11 ();
      return; 
    }


	local vector dir;


	sound (self, CHAN_WEAPON, "weapons/m4a1/m4a1.wav", 1, ATTN_NORM);	
	self.punchangle_x = -2;

	
	self.currentammo = self.ammo_556 = self.ammo_556 - 1;
	dir = aim (self, 100000);
      eject_shell ();
      MuzzleFlash ();
      Reload11 ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.04 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.06 0.02 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 17);
}

};

/*
================
W_FireM4A1s
================
*/
void() eject_shell;
void() W_FireM4a1s =
{

    if (self.ammo_556 == 0) 
    { 
      Reload11s ();
      return; 
    }

	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/m4a1/m4a1-2.wav", 1, ATTN_NORM);	
	self.punchangle_x = -2;

	
	self.currentammo = self.ammo_556 = self.ammo_556 - 1;
	dir = aim (self, 100000);
      eject_shell ();
     // MuzzleFlash ();
      Reload11s ();
	if (!self.velocity_x && !self.velocity_y)
	{
			FireBullets (1, dir, '0.01 0.01 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      FireBullets (1, dir, '0.05 0.05 0');
	}



if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 17);
}

};


/*
================
W_FireSuperShotgun
================
*/
void() eject_shell;


void() W_FireSuperShotgun =
{
    if (self.ammo_cal122 == 0) 
    { 
      Reload17 ();
      return; 
    }
	local vector dir;

	sound (self, CHAN_WEAPON, "weapons/m3/m3.wav", 1, ATTN_NORM);	
	self.punchangle_x = -4;
	
	self.currentammo = self.ammo_cal122 = self.ammo_cal122 - 1; 
      if (self.weaponframe == 9)  { 
      eject_shell ();}
	MuzzleFlash ();
      Reload17 ();
	dir = aim (self, 100000);


	if (!self.velocity_x && !self.velocity_y)
	{
				FireBullets (5, dir, '0.14 0.08 0');
	}
      else if (self.velocity_x && self.velocity_y)
      {
		      	FireBullets (5, dir, '0.2 0.08 0');
	}


if (trace_endpos_z > (trace_ent.origin_z + 15))
{
      T_Damage (trace_ent, self, self, 100);
}
else
{
      T_Damage (trace_ent, self, self, 25);
}

};

//==========================================================
//==========================================================



///////////New Explode Anim////////////////

void()	m16_explode1	=	[0,		m16_explode2] {
            self.nextthink = time + 0.02;}
void()	m16_explode2	=	[1,		m16_explode3] {self.nextthink = time + 0.02;};
void()	m16_explode3	=	[2,		m16_explode4] {self.nextthink = time + 0.02;};
void()	m16_explode4	=	[3,		m16_explode5] {self.nextthink = time + 0.02;};
void()	m16_explode5	=	[4,		m16_explode6] {self.nextthink = time + 0.02;};
void()	m16_explode6	=	[5,		m16_explode7] {self.nextthink = time + 0.02;};
void()	m16_explode7	=	[6,		m16_explode8] {self.nextthink = time + 0.02;};
void()	m16_explode8	=	[7,		m16_explode9] {self.nextthink = time + 0.02;};
void()	m16_explode9	=	[8,		m16_explode10] {self.nextthink = time + 0.03;};
void()	m16_explode10     =     [9,		m16_explode11] {self.nextthink = time + 0.03;};
void()	m16_explode11	=	[10,		m16_explode12] {self.nextthink = time + 0.03;};
void()	m16_explode12	=	[11,	      m16_explode13] {self.nextthink = time + 0.03;};
void()	m16_explode13	=	[12,		m16_explode14] {self.nextthink = time + 0.03;};
void()	m16_explode14	=	[13,		m16_explode15] {self.nextthink = time + 0.03;};
void()	m16_explode15	=	[14,		m16_explode16] {self.nextthink = time + 0.03;};
void()	m16_explode16	=	[15,		m16_explode17] {self.nextthink = time + 0.03;};
void()	m16_explode17	=	[16,		SUB_Remove] {self.nextthink = time + 0.03;};

void() BecomeExplosion =
{
   
	self.movetype = MOVETYPE_NONE;
      self.angles = '0 0 0';
	self.velocity = '0 0 0';
	self.touch = SUB_Null;
	setmodel (self, "progs/explode.mdl");
	self.solid = SOLID_NOT;

m16_explode1 (); 

};


void() GrenadeExplode =
{
	T_RadiusDamage (self, self.owner, 150, world);

	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_EXPLOSION);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);
	T_Damage (trace_ent, self, self, 200);

	BecomeExplosion ();
};


void() GrenadeTouch =
{
	if (other == self.owner)
		return;		// don't explode on owner
	if ((other.takedamage == DAMAGE_AIM) && (self.classname != "hand_grenade"))
	{
		GrenadeExplode();
		return;
	}
	sound (self, CHAN_WEAPON, "weapons/bounce.wav", 1, ATTN_NORM);	// bounce sound
	if (self.velocity == '0 0 0')
		self.avelocity = '0 0 0';
};

/*
================
W_FireGrenade
================
*/
void() W_FireGrenade =
{
	local	entity missile, mpuff;
	
      missile.armed = 100;
	self.currentammo = self.ammo_c4a = self.ammo_c4a - 1;
	
	sound (self, CHAN_WEAPON, "weapons/grenade.wav", 1, ATTN_NORM);

	self.punchangle_x = -2;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_BOUNCE;
	missile.solid = SOLID_BBOX;
	missile.classname = "c4";
		

	missile.avelocity = '0 0 0';

	missile.angles = vectoangles(missile.velocity);
	
	missile.touch = BombTouch;

	
// set missile duration
if(missile.armed == 100){ 
	missile.nextthink = time + 30;
	missile.think = GrenadeExplode;
}
      missile.cansplash = TRUE;
	setmodel (missile, "progs/c4.mdl");
	setsize (missile, '0 0 0', '0 0 0');		
	setorigin (missile, self.origin);
};

/*
================
W_FireGranate
================
*/
void() W_FireGranate =
{
	local	entity missile, mpuff;
	
      self.charge = 0;
	self.currentammo = self.ammo_rockets = self.ammo_rockets - 1;
	
	sound (self, CHAN_WEAPON, "weapons/grenade.wav", 1, ATTN_NORM);

	self.punchangle_x = -2;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_BOUNCE;
	missile.solid = SOLID_BBOX;
	missile.classname = "grenade";
		

	missile.avelocity = '30 0 0';

	missile.angles = vectoangles(missile.velocity);
	
	missile.touch = GrenadeTouch;
	
// set missile duration
	missile.nextthink = time + 2;
	missile.think = GrenadeExplode;

      missile.cansplash = TRUE;
	setmodel (missile, "progs/grenade.mdl");
	setsize (missile, '0 0 0', '0 0 0');		
	setorigin (missile, self.origin);
};

/*
===============================================================================

PLAYER WEAPON USE

===============================================================================
*/

void() W_SetCurrentAmmo =
{

	player_run ();		// get out of any weapon firing states

	self.items = self.items - ( self.items & (IT_SHELLS | IT_NAILS | IT_C4A | IT_ROCKETS | IT_CELLS| IT_9MM| IT_50CAL |IT_50| IT_40ACP| IT_9MM2 | IT_9MM3 | IT_FS | IT_G3 | IT_GAL | IT_MAC | IT_228 | IT_762| IT_556 | IT_CAL12 | IT_CAL122| IT_MG| IT_5562| IT_5563 | IT_DUAL) );

	if (self.weapon == IT_AXE)
	{
		self.currentammo = 0;
		self.weaponmodel = "progs/v_knife.mdl";
		self.weaponframe = 0;
	}
	else if (self.weapon == IT_SHOTGUN)
	{
		self.currentammo = self.ammo_cal12;
		self.weaponmodel = "progs/v_xm1014.mdl";
		self.weaponframe = 0;
		self.items = self.items | IT_CAL12;
	}
	else if (self.weapon == IT_SUPER_SHOTGUN)
	{
		self.currentammo = self.ammo_cal122;
		self.weaponmodel = "progs/v_m3.mdl";
		self.weaponframe = 0;
		self.items = self.items | IT_CAL122;
	}
	else if (self.weapon == IT_GRENADE_LAUNCHER)
	{
		self.currentammo = self.ammo_rockets;
		self.weaponmodel = "progs/v_knife.mdl";
		self.weaponframe = 0;
		self.items = self.items | IT_ROCKETS;
	}
	else if (self.weapon == IT_GLOCK)
	{
		self.currentammo = self.ammo_9mm;
		self.weaponmodel = "progs/v_glock.mdl";
		self.weaponframe = 0;
		self.items = self.items | IT_9MM;
	}
	else if (self.weapon == IT_USP)
	{
		self.currentammo = self.ammo_40acp;
		self.weaponmodel = "progs/v_usp.mdl";
		//self.weaponframe = 0;
		self.items = self.items | IT_40ACP;
	}
	else if (self.weapon == IT_M87)
	{
		self.currentammo = self.ammo_50cal;
		self.weaponmodel = "progs/v_awp.mdl";
		self.weaponframe = 0;
		self.items = self.items | IT_50CAL;
	}
  else if (self.weapon == HAND_GRENADES) 
   { 
      self.currentammo = self.ammo_rockets; 
      self.weaponmodel = "progs/v_he.mdl"; 
      self.skin =0;
      self.weaponframe = 0; 
      self.items = self.items | IT_ROCKETS; 
   }
  else if (self.weapon == IT_MP5) 
   { 
      self.currentammo = self.ammo_9mm2; 
      self.weaponmodel = "progs/v_mp5.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_9MM2; 
   }
  else if (self.weapon == IT_AK47) 
   { 
      self.currentammo = self.ammo_762; 
      self.weaponmodel = "progs/v_ak47.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_762; 
   }
  else if (self.weapon == IT_M4A1) 
   { 
      self.currentammo = self.ammo_556; 
      self.weaponmodel = "progs/v_m4a1.mdl";
      self.items = self.items | IT_556; 
   }
  else if (self.weapon == IT_M249) 
   { 
      self.currentammo = self.ammo_mg;
      self.weaponmodel = "progs/v_m249.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_MG; 
   }
  else if (self.weapon == IT_P90) 
   { 
      self.currentammo = self.ammo_9mm3;
      self.weaponmodel = "progs/v_p90.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_9MM3; 
   }
  else if (self.weapon == IT_C4) 
   { 
      self.currentammo = self.ammo_c4a;
      self.weaponmodel = "progs/v_c4.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_C4A; 
   }
  else if (self.weapon == IT_AUG) 
   { 
      self.currentammo = self.ammo_5562;
      self.weaponmodel = "progs/v_aug.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_5562; 
   }
  else if (self.weapon == IT_DEAGLE) 
   { 
      self.currentammo = self.ammo_50;
      self.weaponmodel = "progs/v_deagle.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_50; 
   }
  else if (self.weapon == IT_ELITE) 
   { 
      self.currentammo = self.ammo_dual;
      self.weaponmodel = "progs/v_elite.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_DUAL; 
   }
  else if (self.weapon == IT_FAMAS) 
   { 
      self.currentammo = self.ammo_5563;
      self.weaponmodel = "progs/v_famas.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_5563; 
   }
  else if (self.weapon == IT_FIVESEVEN) 
   { 
      self.currentammo = self.ammo_fs;
      self.weaponmodel = "progs/v_fiveseven.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_FS; 
   }
  else if (self.weapon == IT_G3SG1) 
   { 
      self.currentammo = self.ammo_g3;
      self.weaponmodel = "progs/v_g3sg1.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_G3; 
   }
  else if (self.weapon == IT_GALIL) 
   { 
      self.currentammo = self.ammo_gal;
      self.weaponmodel = "progs/v_galil.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_GAL; 
   }
  else if (self.weapon == IT_MAC10) 
   { 
      self.currentammo = self.ammo_mac;
      self.weaponmodel = "progs/v_mac10.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_MAC; 
   }
  else if (self.weapon == IT_P228) 
   { 
      self.currentammo = self.ammo_228;
      self.weaponmodel = "progs/v_p228.mdl"; 
      self.weaponframe = 0; 
      self.items = self.items | IT_228; 
   }
};
//==============================================================

float() W_BestWeapon =
{
	local	float	it;
	
	it = self.items;

	if (self.ammo_9mm >= 1 && (it & IT_GLOCK) )
			return IT_GLOCK;
	if(self.ammo_40acp >= 1 && (it & IT_USP) )
		return IT_USP;
	if(self.ammo_228 >= 1 && (it & IT_P228) )
		return IT_P228;
	if(self.ammo_50 >= 1 && (it & IT_DEAGLE) )
		return IT_DEAGLE;
	if(self.ammo_fs >= 1 && (it & IT_FIVESEVEN) )
		return IT_FIVESEVEN;
	if(self.ammo_dual >= 1 && (it & IT_ELITE) )
		return IT_ELITE;
	if(self.ammo_cal122 >= 1 && (it & IT_SUPER_SHOTGUN) )
		return IT_SUPER_SHOTGUN;
	if(self.ammo_cal12 >= 1 && (it & IT_SHOTGUN) )
		return IT_SHOTGUN;
	if(self.ammo_9mm2 >= 1 && (it & IT_MP5) )
		return IT_MP5;
	if(self.ammo_9mm3 >= 1 && (it & IT_P90) )
		return IT_P90;
	if(self.ammo_mac >= 1 && (it & IT_MAC10) )
		return IT_MAC10;
	if(self.ammo_5563 >= 1 && (it & IT_FAMAS) )
		return IT_FAMAS;
	if(self.ammo_gal >= 1 && (it & IT_GALIL) )
		return IT_GALIL;
	if(self.ammo_556 >= 1 && (it & IT_M4A1) )
		return IT_M4A1;
	if(self.ammo_762 >= 1 && (it & IT_AK47) )
		return IT_AK47;
	if(self.ammo_5562 >= 1 && (it & IT_AUG) )
		return IT_AUG;
	if(self.ammo_50cal >= 1 && (it & IT_M87) )
		return IT_M87;
	if(self.ammo_g3 >= 1 && (it & IT_G3SG1) )
		return IT_G3SG1;
	if(self.ammo_mg >= 1 && (it & IT_M249) )
		return IT_M249;
	if(self.ammo_rockets >= 1 && (it & HAND_GRENADES) )
		return HAND_GRENADES;
	return IT_AXE;
};

float() W_CheckNoAmmo =
{
	if (self.currentammo > 0)
		return TRUE;

	if (self.weapon == IT_AXE)
		return TRUE;

	
	//self.weapon = W_BestWeapon ();
	W_SetCurrentAmmo ();
	
// drop the weapon down
	return FALSE;
};

//========================================================

/*
============
W_Attack

An attack impulse can be triggered now
============
*/
void()	player_axe1;
void()	player_axeb1;
void()	player_axec1;
void()	player_axed1;
void()	player_shot1;
void()	player_nail1;
void()	player_light1;
void()	player_rocket1;
void()      player_crattack1;
void()      player_fi1
void()      player_fir1
void()      player_crfi1
void()      player_crfir1
void()      player_sf1
void()      player_scrf1

void() W_Attack =
{
	local	float	r;
        local   entity  head;

	if (!W_CheckNoAmmo ())
		return;

if (!self.team)
return;
if (self.frags <= 0 && cvar("deathmatch") == 5)
		return;

	makevectors	(self.v_angle);			// calculate forward angle for velocity
	self.show_hostile = time + 1;	// wake monsters up


	if (self.weapon == IT_AXE)
	{

            if (self.duck == 0)
            {
			player_axen1 ();

            }
            else if  (self.duck == 1)
            {
            player_craxen1 ();
            }

		sound (self, CHAN_WEAPON, "weapons/knife/hitair.wav", 1, ATTN_NORM);

		self.attack_finished = time + 0.5;
	}
	else if (self.weapon == IT_SHOTGUN)
	{
        if(!self.semi){

            if (self.duck == 0)
            {
		player_shot1 ();
            }
            else if  (self.duck == 1)
            {
            player_crattack1 ();
            }

		W_FireShotgun ();
            self.semi = 1;
            if (self.ammo_cal12 == 0)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_cal12 >= 1)
            {
		self.attack_finished = time + 0.2;
            }
	}
		}
	else if (self.weapon == IT_SUPER_SHOTGUN)
	{
        if(!self.semi){
            if (self.duck == 0)
            {
		player_shotpump1 ();
            }
            else if  (self.duck == 1)
            {
            player_crattack1 ();
            }

		W_FireSuperShotgun ();
            self.semi = 1;
            if (self.ammo_cal122 <=1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_cal122 >= 1)
            {
		self.attack_finished = time + 0.5;
            }
	}
	}
	else if (self.weapon == IT_GRENADE_LAUNCHER)
	{
		player_rocket1();
		W_FireGrenade();
		self.attack_finished = time + 0.6;
	}
	else if (self.weapon == IT_GLOCK)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }
            self.semi = 1; 
            if (self.ammo_9mm <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_9mm  >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireGlock ();

               }
	}
	else if (self.weapon == IT_USP)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
            if (self.silenced == 0)
            {
		player_f1 ();
            }
            }
            if (self.silenced == 0)
            {
            if  (self.duck == 1)
            {
            player_crf1 ();
            }
            }
            if (self.duck == 0)
            {
            if (self.silenced == 1)
            {
		player_sf1 ();
            }
            }
            if (self.silenced == 1)
            {
            if  (self.duck == 1)
            {
            player_scrf1 ();
            }
            }
            self.semi = 1; 

           if (self.ammo_40acp <= 1)
            { 
		self.attack_finished = time + 1;
             }
             else  if (self.ammo_40acp >= 1)
             {
		self.attack_finished = time + 0.2;
             }
            if (self.silenced == 0)
            {
		W_FireUsp ();
            }
            else if (self.silenced == 1)
            {
		W_FireUsps ();
            }

             }
	}
	else if (self.weapon == IT_DEAGLE)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }
            self.semi = 1; 

            if (self.ammo_50 <= 1)
            {
		self.attack_finished = time + 2;
            }
            else if (self.ammo_50 >= 1)
            {
		self.attack_finished = time + 0.45;
            }
		W_FireDeagle ();
               }
	}
	else if (self.weapon == IT_G3SG1)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            self.semi = 1; 
            if (self.ammo_g3 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_g3 >= 1)
            {
		self.attack_finished = time + 0.2;
            }

		W_FireG3sg1 ();
               }
	}
	else if (self.weapon == IT_FIVESEVEN)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            self.semi = 1; 
            if (self.ammo_fs <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_fs >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireFiveSeven ();
               }
	}
	else if (self.weapon == IT_P228)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }
            self.semi = 1; 
            if (self.ammo_228 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_228 >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireP228 ();
               }
	}
	else if (self.weapon == IT_ELITE)
	{
      if(!self.semi){

            if (self.duck == 0)
            {
		player_fi1 ();
            }
            else if  (self.duck == 1)
            {
		player_crfi1 ();
            }
            self.semi = 1; 
            if (self.ammo_dual <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_dual >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireElite ();
               }
	}
	else if (self.weapon == IT_M87)
	{
      if(!self.semi){
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            self.semi = 1; 
            if (self.ammo_50cal <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_50cal >= 1)
            {
		self.attack_finished = time + 1;
            }
		W_FireM87 ();
               }
	}
   else if (self.weapon == HAND_GRENADES) 
   {             
      player_throw1(); 
   }
	else if (self.weapon == IT_MP5)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

		W_FireMp5 ();

            if (self.ammo_9mm2 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_9mm2 >= 1)
            {
		self.attack_finished = time + 0.07;
            }
	}
	else if (self.weapon == IT_MAC10)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck <= 1)
            {
            player_crf1 ();
            }

		W_FireMac10 ();

            if (self.ammo_mac <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_mac >= 1)
            {
		self.attack_finished = time + 0.08;
            }
	}

	else if (self.weapon == IT_P90)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

		W_FireP90 ();

            if (self.ammo_9mm3 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_9mm3 >= 1)
            {
		self.attack_finished = time + 0.08;
            }
	}
	else if (self.weapon == IT_AK47)
	{
            if (self.duck == 0)
            {
		player_fi1 ();
            }
            else if  (self.duck == 1)
            {
            player_crfi1 ();
            }

            if (self.ammo_762 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_762 >= 1)
            {
		self.attack_finished = time + 0.15;
            }
		W_FireAk47 ();
	}
	else if (self.weapon == IT_GALIL)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            if (self.ammo_gal <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_gal >= 1)
            {
		self.attack_finished = time + 0.095;
            }
		W_FireGalil ();

	}
	else if (self.weapon == IT_FAMAS)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            if (self.ammo_5563 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_5563 >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireFamas ();

            
	}
	else if (self.weapon == IT_M4A1)
	{
            if (self.duck == 0)
            {
            if (self.silenced == 0)
            {
		player_f1 ();
            }
            }
            if (self.silenced == 0)
            {
            if  (self.duck == 1)
            {
            player_crf1 ();
            }
            }
            if (self.duck == 0)
            {
            if (self.silenced == 1)
            {
		player_sf1 ();
            }
            }
            if (self.silenced == 1)
            {
            if  (self.duck == 1)
            {
            player_scrf1 ();
            }
            }



            if (self.ammo_556 <= 1)
            {
		self.attack_finished = time + 1;
            }
            else if (self.ammo_556 >= 1)
            {
		self.attack_finished = time + 0.1;
            }
            if (self.silenced == 0)
            {
		W_FireM4a1 ();
            }
            else if (self.silenced == 1)
            {
		W_FireM4a1s ();
            }
	
	}
	else if (self.weapon == IT_M249)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            if (self.ammo_mg <= 1)
            {
		self.attack_finished = time + 1.5;
            }
            else if (self.ammo_mg >= 1)
            {
		self.attack_finished = time + 0.12;
            }
		W_FireM249 ();

	}
	else if (self.weapon == IT_AUG)
	{
            if (self.duck == 0)
            {
		player_f1 ();
            }
            else if  (self.duck == 1)
            {
            player_crf1 ();
            }

            if (self.ammo_5562 <= 1)
            {
		self.attack_finished = time + 1.2;
            }
            else if (self.ammo_5562 >= 1)
            {
		self.attack_finished = time + 0.1;
            }
		W_FireAug ();
	}
	else if (self.weapon == IT_C4)
	{
            if (self.duck == 0)
            {
            if (self.plantable == 1)
            {
		player_throw1 ();
            }}
            else if  (self.duck == 1)
            {
            player_crthrow1 ();
            }
             PrepareBomb();
		self.attack_finished = time + 0.1;
	}

};

//========================================================

/*
============
W_ChangeWeapon

============
*/
void() W_ChangeWeapon =
{
	local	float	it, am, fl;
	
	it = self.items;
	am = 0;
	
	if (self.impulse == 201)
	{
		fl = IT_AXE;
	}
	else if (self.impulse == 202)
	{
		fl = IT_GLOCK;
		if (self.ammo_9mm < 1)
			am = 1;
	}
	else if (self.impulse == 203)
	{
		fl = IT_USP;
		if (self.ammo_40acp < 1)
			am = 1;
	}		
	else if (self.impulse == 204)
	{
		fl = IT_MP5;
		if (self.ammo_9mm < 1)
			am = 1;
	}
	else if (self.impulse == 205)
	{
		fl = IT_AK47;
		if (self.ammo_762 < 1)
			am = 1;
	}
	else if (self.impulse == 206)
	{
		fl = IT_M87;
		if (self.ammo_50cal < 1)
			am = 1;
	}
	else if (self.impulse == 207)
	{
		fl = HAND_GRENADES;
		if (self.ammo_rockets < 1)
			am = 1;
	}
	else if (self.impulse == 208)
	{
		fl = IT_M4A1;
		if (self.ammo_556 < 1)
			am = 1;
	}
	else if (self.impulse == 209)
	{
		fl = IT_SHOTGUN;
		if (self.ammo_cal12 < 1)
			am = 1;
	}
	else if (self.impulse == 210)
	{
		fl = IT_SUPER_SHOTGUN;
		if (self.ammo_cal122 < 1)
			am = 1;
	}
	else if (self.impulse == 211)
	{
		fl = IT_M249;
		if (self.ammo_mg < 1)
			am = 1;
	}
	else if (self.impulse == 212)
	{
		fl = IT_P90;
		if (self.ammo_9mm3 < 1)
			am = 1;
	}
	else if (self.impulse == 213)
	{
		fl = IT_C4;
            self.charge = 0; 
		if (self.ammo_c4a < 1)
			am = 1;
	}
	else if (self.impulse == 214)
	{
		fl = IT_AUG;
		if (self.ammo_5562 < 1)
			am = 1;
	}
	else if (self.impulse == 215)
	{
		fl = IT_DEAGLE;
		if (self.ammo_50 < 1)
			am = 1;
	}
	else if (self.impulse == 216)
	{
		fl = IT_ELITE;
		if (self.ammo_dual < 1)
			am = 1;
	}
	else if (self.impulse == 217)
	{
		fl = IT_FAMAS;
		if (self.ammo_5563 < 1)
			am = 1;
	}
	else if (self.impulse == 218)
	{
		fl = IT_FIVESEVEN;
		if (self.ammo_fs < 1)
			am = 1;
	}
	else if (self.impulse == 219)
	{
		fl = IT_MAC10;
		if (self.ammo_mac < 1)
			am = 1;
	}
	else if (self.impulse == 220)
	{
		fl = IT_P228;
		if (self.ammo_228 < 1)
			am = 1;
	}
	else if (self.impulse == 221)
	{
		fl = IT_GALIL;
		if (self.ammo_gal < 1)
			am = 1;
	}
	else if (self.impulse == 222)
	{
		fl = IT_G3SG1;
		if (self.ammo_g3 < 1)
			am = 1;
	}

	self.impulse = 0;
	
	//if (!(self.items & fl))
	//{	// don't have the weapon or the ammo
	//	sprint (self, "no weapon.\n");
	//	return;
	//}
	
	if (am)
	{	// don't have the ammo
		sprint (self, "not enough ammo.\n");
		return;
	}

//
// set weapon, set ammo
//
	self.weapon = fl;		
	W_SetCurrentAmmo ();
};


//=======================================

/*
============
CycleWeaponCommand

Go to the next weapon with ammo
============
*/
void() CycleWeaponCommand =
{
	local	float	it, am;
	
	it = self.items;
	self.impulse = 0;
	
	while (1)
	{
		am = 0;
             BuyDummy ();
		if (self.weapon == IT_C4)
		{
              stuffcmd (self, "fov 90\n");
              self.weapon = IT_AXE;
              self.impulse = 60;
		}
		else if (self.weapon == IT_AXE)
		{
                   stuffcmd (self, "fov 90\n");
      		self.weapon = IT_GLOCK;
			if (self.ammo_9mm < 1)
				am = 1;
		}
		else if (self.weapon == IT_GLOCK)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_USP;
			if (self.ammo_40acp < 1)
				am = 1;
		}		
		else if (self.weapon == IT_USP)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_P228;
			if (self.ammo_228 < 1)
				am = 1;
		}
		else if (self.weapon == IT_P228)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_DEAGLE;
			if (self.ammo_50 < 1)
				am = 1;
		}
		else if (self.weapon == IT_DEAGLE)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_ELITE;
			if (self.ammo_dual < 1)
				am = 1;
		}
		else if (self.weapon == IT_ELITE)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_FIVESEVEN;
			if (self.ammo_fs < 1)
				am = 1;
		}
		else if (self.weapon == IT_FIVESEVEN)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_MP5;
			if (self.ammo_9mm2 < 1)
				am = 1;
		}
		else if (self.weapon == IT_MP5)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_MAC10;
			if (self.ammo_mac < 1)
				am = 1;
		}
		else if (self.weapon == IT_MAC10)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_P90;
			if (self.ammo_9mm3 < 1)
				am = 1;
		}
		else if (self.weapon == IT_P90)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_GALIL;
			if (self.ammo_gal < 1)
				am = 1;
		}
		else if (self.weapon == IT_GALIL)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_SHOTGUN;
			if (self.ammo_cal12 < 1)
				am = 1;
		}
		else if (self.weapon == IT_SHOTGUN)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_SUPER_SHOTGUN;
			if (self.ammo_cal122 < 1)
				am = 1;
		}
		else if (self.weapon == IT_SUPER_SHOTGUN)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_AK47;
			if (self.ammo_762 < 1)
				am = 1;
		}

		else if (self.weapon == IT_AK47)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_FAMAS;
			if (self.ammo_5563 < 1)
				am = 1;
		}
		else if (self.weapon == IT_FAMAS)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_M4A1;
			if (self.ammo_556 < 1)
				am = 1;
		}
		else if (self.weapon == IT_M4A1)
		{
			self.weapon = IT_AUG;
			if (self.ammo_5562 < 1)
				am = 1;
		}
		else if (self.weapon == IT_AUG)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_M249;
			if (self.ammo_mg < 1)
				am = 1;
		}
		else if (self.weapon == IT_M249)
		{
			self.weapon = IT_G3SG1;
			if (self.ammo_g3 < 1)
				am = 1;
		}
		else if (self.weapon == IT_G3SG1)
		{
			self.weapon = IT_M87;
			if (self.ammo_50cal < 1)
				am = 1;
		}
		else if (self.weapon == IT_M87)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = HAND_GRENADES;
			if (self.ammo_rockets < 1)
				am = 1;

		}
			else if (self.weapon == HAND_GRENADES)
		{
                   stuffcmd (self, "fov 90\n");
			self.weapon = IT_C4;
			if (self.ammo_c4a < 1)
				am = 1;

		}
	
		if ( (it & self.weapon) && am == 0)
		{
			W_SetCurrentAmmo ();
			return;

		}
	}

};

//========================================================================

/*
============
CycleWeaponReverseCommand

Go to the prev weapon with ammo
============
*/
void() CycleWeaponReverseCommand =
{
	local	float	it, am;
	
	it = self.items;
	self.impulse = 0;

	while (1)
	{
		am = 0;

		if (self.weapon == IT_C4)
		{
			self.weapon = HAND_GRENADES;
			if (self.ammo_rockets < 1)
				am = 1;
		}
		else if (self.weapon == HAND_GRENADES)
		{
			self.weapon = IT_M87;
			if (self.ammo_50cal < 1)
				am = 1;
		}
		else if (self.weapon == IT_M87)
		{
			self.weapon = IT_M249;
			if (self.ammo_mg < 1)
				am = 1;
		}
		else if (self.weapon == IT_M249)
		{
			self.weapon = IT_AUG;
			if (self.ammo_5562 < 1)
				am = 1;
		}
		else if (self.weapon == IT_AUG)
		{
			self.weapon = IT_M4A1;
			if (self.ammo_556 < 1)
				am = 1;
		}
		else if (self.weapon == IT_M4A1)
		{
			self.weapon = IT_FAMAS;
			if (self.ammo_5563 < 1)
				am = 1;
		}
		else if (self.weapon == IT_FAMAS)
		{
			self.weapon = IT_AK47;
			if (self.ammo_762 < 1)
				am = 1;
		}
		else if (self.weapon == IT_AK47)
		{
			self.weapon = IT_SUPER_SHOTGUN;
			if (self.ammo_cal122 < 1)
				am = 1;
		}
		else if (self.weapon == IT_SUPER_SHOTGUN)
		{
			self.weapon = IT_SHOTGUN;
			if (self.ammo_cal12 < 1)
				am = 1;
		}
		else if (self.weapon == IT_SHOTGUN)
		{
			self.weapon = IT_P90;
			if (self.ammo_9mm3 < 1)
				am = 1;
		}

		else if (self.weapon == IT_P90)
		{
			self.weapon = IT_MP5;
			if (self.ammo_9mm2 < 1)
				am = 1;
		}

		else if (self.weapon == IT_MP5)
		{
			self.weapon = IT_DEAGLE;
			if (self.ammo_50 < 1)
				am = 1;
		}
		else if (self.weapon == IT_DEAGLE)
		{
			self.weapon = IT_ELITE;
			if (self.ammo_dual < 1)
				am = 1;
		}
		else if (self.weapon == IT_ELITE)
		{
			self.weapon = IT_USP;

		}
		else if (self.weapon == IT_USP)
		{
			self.weapon = IT_GLOCK;

		}		
		else if (self.weapon == IT_GLOCK)
		{
                   stuffcmd (self, "fov 90\n");
                   self.weapon = IT_AXE;
		}
		else if (self.weapon == IT_AXE)
		{
                  stuffcmd (self, "fov 90\n");
			self.weapon = IT_C4;
			if (self.ammo_c4a < 1)
				am = 1;
		}
	
		if ( (it & self.weapon) && am == 0)
		{
			W_SetCurrentAmmo ();
			return;
		}
	}

};


//=================================================================

/*
============
ServerflagsCommand

Just for development
============
*/
void() ServerflagsCommand =
{
	serverflags = serverflags * 2 + 1;
};


//============================================================

/*
============
ImpulseCommands

============
*/


void() ImpulseCommands =
{


	if (self.impulse >= 201 && self.impulse <= 222)
		W_ChangeWeapon ();

      if (self.impulse == 104)
      {
      if (self.duck == 0)
      {
      self.duck = 1;
      self.ingamemenu = 1;
      stuffcmd (self, "drawingame 1\n");
      }
      else if (self.duck == 1)
      {
        self.duck = 2;
        setsize (self, '-32 -32 -24', '0 0 -8');
        self.view_ofs = '0 0 10';
        stuffcmd(self,"cl_forwardspeed 100 \n");
        stuffcmd(self,"cl_backspeed 90 \n");
        stuffcmd(self,"cl_sidespeed 100 \n");
        player_crouch ();
        stuffcmd (self, "drawingame 0 \n");
        self.ingamemenu = 0;
      }
      else if (self.duck == 2)
      {
      self.duck = 3;
      self.ingamemenu = 1;
      stuffcmd (self, "drawingame 1\n");
      }
      else if (self.duck == 3)
      {
        self.duck = 0;
        setsize (self, '-16 -16 -24', '16 16 32');
        self.view_ofs = '0 0 22';
        stuffcmd(self,"cl_forwardspeed 200 \n");
        stuffcmd(self,"cl_backspeed 200 \n");
        stuffcmd(self,"cl_sidespeed 200 \n");
	  player_stand1 ();
        stuffcmd (self, "drawingame 0 \n");
        self.ingamemenu = 0;
      }
    }


	 if (self.impulse == 10)
       {
       if (self.ingamemenu == 1)
       {
		flash_toggle ();

        self.ingamemenu = 0;
       }
       }

       if (self.impulse == 10)
       {
       if (self.weapon == IT_AUG)
       {
       if (self.ingamemenu == 0)
       {
       Zoom ();
        self.ingamemenu = 0;
       }
       }
      }

       if (self.impulse == 10)
       {
       if (self.weapon == IT_M87)
       {
       if (self.ingamemenu == 0)
       {
       Zoom ();
        self.ingamemenu = 0;
       }
       }
      }

       if (self.impulse == 10)
       {
       if (self.weapon == IT_G3SG1)
       {
       if (self.ingamemenu == 0)
       {
       Zoom ();
        self.ingamemenu = 0;
       }
       }
      }


    if (self.impulse == 10)
    {
       if (self.ingamemenu == 0)
       {
Silencer();
}}



    if (self.impulse == 120)
    {
       if (self.ingamemenu == 0)
       {
       stuffcmd (self, "menu_ingame \n");
        stuffcmd (self, "drawingame 0 \n");
        self.ingamemenu = 0;
}
else if (self.ingamemenu == 1)
{
       ReloadManually ();
        stuffcmd (self, "drawingame 0 \n");
        self.ingamemenu = 0;
}
}

    if (self.impulse == 121)
    {
       if (self.ingamemenu == 1)
       {
       DropWeapon ();
        stuffcmd (self, "drawingame 0 \n");

        self.ingamemenu = 0;
      }
}

    if (self.impulse == 121)
    {
       if (self.ingamemenu == 0)
       {
		CycleWeaponCommand ();
            BuyDummy ();
        stuffcmd (self, "drawingame 0 \n");

        self.ingamemenu = 0;
      }
}






	if (self.impulse == 11)
		ServerflagsCommand ();
	if (self.impulse == 12)
		CycleWeaponReverseCommand ();

     if (self.impulse == 105)
     {
     if (self.buyable == 1)
     {
     if (self.team == 1)
     {
     stuffcmd (self, "menu_buyct\n");
     }
     }
     }

     if (self.impulse == 105)
     {
     if (self.buyable == 1)
     {
     if (self.team == 2)
     {
        stuffcmd (self, "menu_buyt\n");
     }
     }
     }

if (self.impulse == 23)
	BuyGlock ();

if (self.impulse == 21)
	BuyM87 ();

if (self.impulse == 40)
	BuyUSP ();
if (self.impulse == 41)
	BuyHe ();

if (self.impulse == 42)
	BuyMp5 ();

if (self.impulse == 43)
	BuyAk47 ();

if (self.impulse == 44)
	BuyArmor ();

if (self.impulse == 62)
	BuyM3 ();

if (self.impulse == 63)
	BuyXm1014 ();

if (self.impulse == 64)
	BuyM249 ();

if (self.impulse == 65)
	BuyP90 ();

if (self.impulse == 82)
	BuyAug ();

if (self.impulse == 45)
	BuyM4a1 ();


if (self.impulse == 85)
	BuyDeagle ();

if (self.impulse == 83)
	BuyElite ();

if (self.impulse == 84)
	BuyFamas ();

if (self.impulse == 86)
	BuyP228 ();

if (self.impulse == 87)
	BuyFiveSeven ();

if (self.impulse == 88)
	BuyMac10 ();

if (self.impulse == 89)
	BuyGalil ();

if (self.impulse == 90)
	BuyG3sg1 ();


if (self.impulse == 255)
self.ammo_c4a = self.ammo_c4a + 1;
if (self.impulse == 254)
PlayerCount();


if (self.impulse == 94)
                counter1 ();
if (self.impulse == 95)
               counter2 ();
if (self.impulse == 96)
                counter3 ();
if (self.impulse == 97)
               counter4 ();
		
if (self.impulse == 54)
                terror1 ();
if (self.impulse == 55)
               terror2 ();
if (self.impulse == 56)
                terror3 ();
if (self.impulse == 57)
               terror4 ();


if (self.impulse == 60)
BuyDummy ();

if (self.impulse == 81)
BuyAmmo ();


if (self.impulse == 66)
self.ammo_cells = self.ammo_cells + 100;

if (self.ammo_cells >= 250)
self.ammo_cells = 250;


if (self.impulse == 70)
sound (self, CHAN_AUTO, "radio/com_go.wav", 1, ATTN_NORM);

if (self.impulse == 71)
sound (self, CHAN_AUTO, "radio/ct_backup.wav", 1, ATTN_NORM);

if (self.impulse == 72)
sound (self, CHAN_AUTO, "radio/ct_affirm.wav", 1, ATTN_NORM);

if (self.impulse == 73)
sound (self, CHAN_AUTO, "radio/ct_coverme.wav", 1, ATTN_NORM);

if (self.impulse == 74)
sound (self, CHAN_AUTO, "radio/ct_enemys.wav", 1, ATTN_NORM);

if (self.impulse == 75)
sound (self, CHAN_AUTO, "radio/ct_fireinhole.wav", 1, ATTN_NORM);

if (self.impulse == 76)
sound (self, CHAN_AUTO, "radio/enemydown.wav", 1, ATTN_NORM);

if (self.impulse == 77)
sound (self, CHAN_AUTO, "radio/followme.wav", 1, ATTN_NORM);

if (self.impulse == 78)
sound (self, CHAN_AUTO, "radio/negative.wav", 1, ATTN_NORM);

if (self.impulse == 79)
sound (self, CHAN_AUTO, "radio/position.wav", 1, ATTN_NORM);

if (self.impulse == 80)
sound (self, CHAN_AUTO, "radio/roger.wav", 1, ATTN_NORM);





	self.impulse = 0;




};


//====================================================================

/*
============
W_WeaponFrame

Called every frame so impulse events can be handled as well as possible
============
*/
void() W_WeaponFrame =
{
	if (time < self.attack_finished)
		return;

	ImpulseCommands ();
	

// check for attack


        if (!self.button0)
                self.semi = 0; // CHP - Semi Auto Trigger

	if (self.button0)
	{
		W_Attack ();
	}


};


//=================================================================== 