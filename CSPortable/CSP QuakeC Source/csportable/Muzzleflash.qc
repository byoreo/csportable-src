
/////////////////////////////////////
//////////Muzzleflash////////////////
/////////////////////////////////////

void() MuzzleFlash = 
{
	local vector vec;
	local vector org;
      local entity muzzle;
	//vec = normalize(vec);
	makevectors(self.angles);
	org = self.angles;
	muzzle = spawn();
	muzzle.movetype = MOVETYPE_NONE;
	setmodel(muzzle, "progs/muzzle.mdl");
	setsize(muzzle, '0 0 0', '0 0 0');
	makevectors(self.v_angle);
	muzzle.solid = SOLID_NOT;
	muzzle.effects = EF_MUZZLEFLASH;


		setorigin(muzzle,'0 0 16');

	
	muzzle.nextthink = time + 0.1;
	muzzle.think = SUB_Remove;
};

