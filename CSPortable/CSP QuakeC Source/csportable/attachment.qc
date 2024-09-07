

void() WeaponThink = 
{ 
  self.origin = self.owner.origin + '0 0 0';  
  self.angles = self.owner.v_angle; 
  self.angles_x = -self.angles_x; // silly Quake bug with angles and v_angle 
  self.velocity = self.owner.velocity; 

  // update again next frame 
  self.nextthink = time; 
  self.think = WeaponThink; 
}; 



void() attachment = 
{ 

local vector org; 
//local entity weapn; 
org = self.origin + '0 0 00'; 
newmis = spawn(); 
newmis.owner = self; 
newmis.movetype = MOVETYPE_NOCLIP; 
newmis.solid = SOLID_NOT; 
newmis.exteriormodeltoclient = self;
 

setsize(newmis, '0 0 0', '0 0 0'); 
setorigin(newmis, org); 
newmis.velocity = self.velocity; 
newmis.angles = self.v_angle; 
newmis.angles_x = -newmis.angles_x; // silly Quake bug with angles and v_angle 

setmodel (newmis, "progs/w_ak47.mdl");
newmis.frame =1; 


newmis.nextthink = time; 
newmis.think = WeaponThink; 
};