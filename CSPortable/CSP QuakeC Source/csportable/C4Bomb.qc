void() BombTouch =
{
	if (other == self.owner)
		return;		// don't explode on owner
	if ((other.takedamage == DAMAGE_AIM) && (self.classname != "C4Bomb"))
	{
		GrenadeExplode();
		return;
	}
	sound (self, CHAN_WEAPON, "weapons/bounce.wav", 1, ATTN_NORM);	// bounce sound
	if (self.velocity == '0 0 0')
		self.avelocity = '0 0 0';
};


//============= 
//HAND GRENADES 
//============= 
void() PrimeBomb = 
{ 
   if (self.charge == 0) 
      sound (self, CHAN_WEAPON, "player/axhit2.wav", 0.5, ATTN_NORM); 
    
   if (self.charge >= 8) 
   { 
      self.charge = 8; 
   } 
   else 
   { 
      self.charge = self.charge + 1; 
      sprint (self, "*"); 
   } 
   self.attack_finished = time + 0.1; 
};

void() ThrowBomb = 
{ 
   local   entity missile, mpuff; 
    
   self.currentammo = self.ammo_c4a = self.ammo_c4a - 1; 
    
   sound (self, CHAN_BODY, "player/jump/jump.wav", 1, ATTN_NORM); 

   missile = spawn (); 
   missile.owner = self; 
   missile.movetype = MOVETYPE_BOUNCE; 
   missile.solid = SOLID_BBOX;    
       
// set missile speed    

   makevectors (self.v_angle); 
       
        missile.velocity = v_forward*65 + v_up * 21.5 + crandom()*v_right*3 + crandom()*v_up*3; 
   missile.velocity = missile.velocity; 
    
   missile.avelocity = '-50 -5 -5'; 
   missile.avelocity = missile.avelocity; 
    
   missile.angles = vectoangles(missile.velocity); 
    
   missile.classname = "C4Bomb"; 
   missile.touch = BombTouch; 
    
// set missile duration 
   missile.nextthink = time + 3; 
   missile.think = BombExplode; 
    
   setmodel (missile, "progs/c4.mdl"); 
   setsize (missile, '0 0 0', '0 0 0');       
   setorigin (missile, self.origin); 

   self.charge = 0; 
   sprint (self, "\n"); 
   self.attack_finished = time + 0.4;    
};

void() BombStick = 
{ 
   self.nextthink = time + 0.1; 
   self.ammo_cells = self.ammo_cells - 1; 
    
   if (self.ammo_cells < 1) 
        BombExplode(); 
    
   self.velocity = self.enemy.velocity; 
      self.angles = self.enemy.angles; 
      self.origin = self.enemy.origin; 
};

void(entity victim) PlaceBomb = 
{ 
   local   entity missile, mpuff;    

   self.currentammo = self.ammo_c4 = self.ammo_c4 - 1; 
    
   sound (victim, CHAN_BODY, "buttons/switch04.wav", 1, ATTN_NORM); 
    
   missile = spawn (); 
   missile.owner = self; 
   missile.movetype = MOVETYPE_NOCLIP; 
   missile.solid = SOLID_BBOX; 
    
   missile.classname = "C4Bomb"; 
       
// set missile duration 
   missile.nextthink = time + 0.1; 
   missile.ammo_cells = 30; 
   missile.think = BombStick; 
   missile.enemy = victim;    

   setmodel (missile, "progs/c4.mdl"); 
   setsize (missile, '0 0 0', '0 0 0');       
   setorigin (missile, victim.origin); 

   sprint (self, "\nIt's better to give than to recieve!\n"); 
   self.charge = 0;    
   self.attack_finished = time + 0.4;    
};

void() BombGrenade = 
{ 
   local   vector   source; 
   local   vector   org; 

   makevectors (self.v_angle); 
   source = self.origin + '0 0 16'; 
   traceline (source, source + v_forward*64, FALSE, self); 
   if (trace_fraction == 1.0) 
   {    
      ThrowBomb(); 
      return; 
   } 
   org = trace_endpos - v_forward*4;    

   if ((trace_ent.flags == trace_ent.flags | FL_MONSTER) || (trace_ent.classname == "player"))    
      PlaceGrenade(trace_ent); 
   else 
      ThrowBomb(); 
};

