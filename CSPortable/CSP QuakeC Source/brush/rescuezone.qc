void() func_rescue_touch =
{ 

	if (other.health <= 0)
		return;
	if (other.classname != "player" && other.classname != "Hostage")
		return;

};


void() func_rescue =
{    
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_rescue"; 
      self.touch = func_rescue_touch;
};


