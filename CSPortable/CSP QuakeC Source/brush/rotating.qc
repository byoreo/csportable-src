void() func_door_rotating =
{
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_door_rotating";
	setsize (self, self.mins, self.maxs);
	
	if (!self.speed)
		self.speed = 100;

	if (self.spawnflags & 2) // reverse direction
		self.speed = 0 - self.speed;

	if (self.spawnflags & 64) // not solid
		self.solid = SOLID_NOT;
	
	if (self.spawnflags & 4)
	{
		self.avelocity_z = self.speed;
		self.avelocity_x = 0;
		self.avelocity_y = 0;
	}
	else if (self.spawnflags & 8)
	{
		self.avelocity_z = 0;
		self.avelocity_x = self.speed;
		self.avelocity_y = 0;
	}
	else
	{
		self.avelocity_z = 0;
		self.avelocity_x = 0;
		self.avelocity_y = self.speed;
	}
};