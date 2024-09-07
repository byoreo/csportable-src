void() InitBulletHoles = 
{
	precache_model("progs/bullet.mdl");
	bulletholes = nullentity;
	lastbullet = nullentity;
	numbulletholes = 0;
};

void() InitRocketMarks = 
{
	precache_model("sprites/s_railm.spr");
	rocketmarks = nullentity;
	lastmark = nullentity;
	numrocketmarks = 0;
};

void() remove_bullethole = 
{
	local entity ent;
	if (bulletholes == nullentity)
	{
		objerror("remove_bullethole: bulletholes == nullentity! ");
	}
	ent = bulletholes;
	if (ent.classname != "bullethole")
	{
		objerror("remove_bullethole: Tried to remove non-bullethole!");
	}
	bulletholes = bulletholes.lastvictim;
	remove(ent);
	if (lastbullet == ent)
	{
		lastbullet = nullentity;
	}
	numbulletholes = numbulletholes - 1;
};

void() remove_rocketmark = 
{
	local entity ent;
	if (rocketmarks == nullentity)
	{
		objerror("remove_rocketmark: rocketmarks == nullentity! ");
	}
	ent = rocketmarks;
	if (ent.classname != "rocketmark")
	{
		objerror("remove_rocketmark: Tried to remove non-bullethole!");
	}
	rocketmarks = rocketmarks.lastvictim;
	remove(ent);
	if (lastmark == ent)
	{
		lastmark = nullentity;
	}
	numrocketmarks = numrocketmarks - 1;
};

void(vector pos) placebullethole = 
{
	local entity new;
	local entity ent;
	local vector norm;
	new = spawn();
	new.owner = new;
	new.movetype = MOVETYPE_NONE;
	new.solid = SOLID_NOT;
	if (pointcontents(new.origin) == CONTENT_SKY)
	{
		remove(new);
		return;
	}
	new.classname = "bullethole";
	setmodel(new, "progs/bullet.mdl");
	setsize(new, VEC_ORIGIN, VEC_ORIGIN);
	norm = trace_plane_normal;
	norm_x = 0 - norm_x;
	norm_y = 0 - norm_y;
	new.angles = vectoangles(norm);
	makevectors(self.angles);
	setorigin(new, pos - v_forward * 0.2);
	new.think = remove_bullethole;
	new.nextthink = time + 300;
	numbulletholes = numbulletholes + 1;
	sound(trace_ent, CHAN_AUTO, "weapons/bullet/hitwall3.wav", 1, ATTN_NORM);
	if (numbulletholes > 10)
	{
		remove_bullethole();
	}
	if (lastbullet != nullentity)
	{
		lastbullet.lastvictim = new;
	}
	else
	{
		bulletholes = new;
	}
	new.lastvictim = nullentity;
	lastbullet = new;
};


void(vector pos) placerocketmark = 
{
	local entity new;
	local entity ent;
	local vector norm;
	new = spawn();
	new.owner = new;
	new.movetype = MOVETYPE_NONE;
	new.solid = SOLID_NOT;
	if (pointcontents(new.origin) == CONTENT_SKY)
	{
		remove(new);
		return;
	}
	new.classname = "rocketmark";
	setmodel(new, "sprites/s_railm.spr");
	setsize(new, VEC_ORIGIN, VEC_ORIGIN);
	norm = trace_plane_normal;
	norm_x = 0 - norm_x;
	norm_y = 0 - norm_y;
	new.angles = vectoangles(norm);
	makevectors(self.angles);
	setorigin(new, pos - v_forward * 0.2);
	new.think = remove_rocketmark;
	new.nextthink = time + 300;
	numrocketmarks = numrocketmarks + 1;
	if (numbulletholes > MOVETYPE_BOUNCE)
	{
		remove_bullethole();
	}
	if (lastmark != nullentity)
	{
		lastmark.lastvictim = new;
	}
	else
	{
		rocketmarks = new;
	}
	new.lastvictim = nullentity;
	lastmark = new;
};

void(vector pos) placewaterriple = 
{
	local entity new;
	local entity ent;
	local vector norm;
	new = spawn();
	new.owner = new;
	new.movetype = MOVETYPE_NONE;
	new.solid = SOLID_NOT;
	if (pointcontents(new.origin) == CONTENT_SKY)
	{
		remove(new);
		return;
	}
	new.classname = "riple";
	setmodel(new, "sprites/s_riple.spr");
	setsize(new, VEC_ORIGIN, VEC_ORIGIN);
	norm = trace_plane_normal;
	norm_x = 0 - norm_x;
	norm_y = 0 - norm_y;
	new.angles = vectoangles(norm);
	makevectors(self.angles);
	setorigin(new, pos - v_forward * 0.2);
	new.think = SUB_Remove;
	new.nextthink = time + 2;

};



