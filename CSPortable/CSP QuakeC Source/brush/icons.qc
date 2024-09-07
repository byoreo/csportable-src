void() func_noicon_touch =
{ 
	if (other.health <= 0)
		return;
	if (other.classname != "player")
		return;

stuffcmd (other, "buyicon 0 \n");
stuffcmd (other, "bombicon 0 \n");
other.plantable = 0;
other.buyable = 0;

};


void() func_noicon =
{    
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_noicon"; 
      self.touch = func_noicon_touch;
};

