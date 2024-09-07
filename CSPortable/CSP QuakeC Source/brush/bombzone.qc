
void() func_bomb_target_touch =
{ 
	if (other.health <= 0)
		return;
	if (other.classname != "player")
		return;

stuffcmd (other, "bombicon 1 \n");
other.plantable = 1;

};


void() func_bomb_target =
{    
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_bomb_target"; 
      self.touch = func_bomb_target_touch;
};





