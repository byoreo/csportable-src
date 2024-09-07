void() func_buyzone_touch =
{ 

	if (other.health <= 0)
		return;
	if (other.classname != "player")
		return;

if(func_buyzone_touch){
stuffcmd (other, "buyicon 1 \n");
other.buyable = 1;}


};


void() func_buyzone =
{    
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_buyzone"; 
      self.touch = func_buyzone_touch;
};


