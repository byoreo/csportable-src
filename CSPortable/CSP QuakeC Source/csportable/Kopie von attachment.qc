
void() attachment = 
{
	local vector vec;
	local vector org;
      local entity weapon;
	makevectors(self.angles);
	org = self.angles;
	weapon = spawn();
	weapon.movetype = MOVETYPE_NONE;
	setmodel(weapon, "progs/w_ak47.mdl");
	setsize(weapon, '0 0 0', '0 0 0');
      setorigin(weapon, self.origin);
	makevectors(self.view_ofs);
	weapon.solid = SOLID_NOT;
      weapon.frame =1;

	weapon.nextthink = time + 0.05;
	weapon.think = SUB_Remove;
};