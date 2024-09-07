/*
Sagdoll

This is the main qc file for the Sagdoll system, almost all of the non Gyro/Frikbot code is in here. I didn't bother commenting 
the Gyro or Frikbot changes, but a search should easily find them all.

Check out the death code in soldier.qc or player.qc for how to use.
*/

.float gravity;				// Corspes need a slightly lower gravity than normal to look better.
.float limb;				// Defines what limb type it is for the movement constraints.

.float remove_count;			// Used to track when to remove corpses.

.entity torso;				// The original torso from which a joint takes it's movement,

.entity joint1;				// Each sagdoll segment can be connected to a maximum of 5 others.
.entity joint2;				// For limbs, joint1 contains the 'parent' entity they are linked to
.entity joint3;				// and inherit motion from.
.entity joint4;
.entity joint5;

.vector rel_origin;			// origin relative to parent entity. This is not a standard origin, it's 
						// x is the v_forward, y is the v_right, and z is the v_up relative to 
					// the parent.

void() body_bounce;

void(entity one, entity two) create_joint =		// Creates a two way sagdoll joint between two entities.
{							// Currently only joint1 is used by the system to keep track
	if (one.joint1 == world)			// of the parent entity, but it should be useful for later 
		one.joint1 = two;			// versions to be able to link directly to all entities 
	else if (one.joint2 == world)			// linked to a torso etc.
		one.joint2 = two;			// If I don't end up needing this function I'll remove it.
	else if (one.joint3 == world)
		one.joint3 = two;
	else if (one.joint4 == world)
		one.joint5 = two;
	else if (one.joint1 == world)
		one.joint1 = two;

	if (two.joint1 == world)
		two.joint1 = one;
	else if (two.joint2 == world)
		two.joint2 = one;
	else if (two.joint3 == world)
		two.joint3 = one;
	else if (two.joint4 == world)
		two.joint4 = one;
	else if (two.joint5 == world)
		two.joint5 = one;
};

void() update_bodypart =						// Used by any sagdoll entity which isn't a torso.
{
	local vector rel_org, jointang, oldorg, inertia_ang, limits, direc;
	local float flo;
	local string str;
	
	self.think = update_bodypart;					// This function is called by bodyparts every frame.
	self.nextthink = time;
	
	jointang = self.joint1.angles;
	jointang_x = jointang_x * -1;					// Usual Quake problem of upside-down _x angles.

	makevectors(jointang);

	rel_org = self.joint1.origin;					// The parent entity's origin.

	oldorg = self.origin;

	rel_org = rel_org + v_forward * self.rel_origin_x;		// Recalculate where the bodypart should be this frame...
	rel_org = rel_org + v_right * self.rel_origin_y;
	rel_org = rel_org + v_up * self.rel_origin_z;
	setorigin(self, rel_org);					// ...and move there.

	inertia_ang = vectoangles(oldorg - self.origin);		// Points at where the bodypart was last frame.

									// This is the "physics" code :p
	limits = inertia_ang - self.joint1.angles;

	while(limits_x > 180)						// Just to check that all values are between -180 and 180.
		limits_x = limits_x - 360;
	while(limits_y > 180)
		limits_y = limits_y - 360;
	while(limits_z > 180)
		limits_z = limits_z - 360;
	while(limits_x < -180)
		limits_x = limits_x + 360;
	while(limits_y < -180)
		limits_y = limits_y + 360;
	while(limits_z < -180)
		limits_z = limits_z + 360;

	if (self.limb == 1)				// Head movement constraints.
	{						// All these should be restructured as vectors
		if (limits_x > 25)			// in the spawn fuctions.
			limits_x = 25;
		if (limits_x < -25)
			limits_x = -25;
		if (limits_z > 25)
			limits_z = 25;
		if (limits_z < -25)
			limits_z = -25;
		limits_y = limits_z;
	}
	else if (self.limb == 2)			// Left upper arm movement constraints.
	{
		if (limits_x > 45)
			limits_x = 45;
		if (limits_x < -180)
			limits_x = -180;
		if (limits_z < 0)
			limits_z = 0;
		if (limits_z > 90)
			limits_z = 90;
		limits_y = limits_z;
	}
	else if (self.limb == 3)			// Right upper arm movement constraints.
	{
		if (limits_x > 45)
			limits_x = 45;
		if (limits_x < -180)
			limits_x = -180;
		if (limits_z > 0)
			limits_z = 0;
		if (limits_z < -90)
			limits_z = -90;
		limits_y = limits_z;
	}
	else if (self.limb == 4)			// Left thigh movement constraints.
	{
		if (limits_x > 60)
			limits_x = 60;
		if (limits_x < -30)
			limits_x = -30;
		if (limits_z < 0)
			limits_z = 0;
		if (limits_z > 45)
			limits_z = 45;
		limits_y = limits_z;
	}
	else if (self.limb == 5)			// Right thigh movement constraints.
	{
		if (limits_x > 60)
			limits_x = 60;
		if (limits_x < -30)
			limits_x = -30;
		if (limits_z > 0)
			limits_z = 0;
		if (limits_z < -45)
			limits_z = -45;
		limits_y = limits_z;
	}
	else if (self.limb == 6)			// Lower arm movement constraint.
	{
		limits = limits * 2;			// enhance movement for lower limbs

		if (limits_x > 150)
			limits_x = 150;
		if (limits_x < 0)
			limits_x = 0;
		limits_y = limits_z = 0;
	}
	else if (self.limb == 7)			// Lower leg movement constraint.
	{
		limits = limits * 2;

		if (limits_x < -100)
			limits_x = -100;
		if (limits_x > 0)
			limits_x = 0;
		limits_y = limits_z = 0;
	}
	
	if (self.torso.button0 == 1)						// If coming to rest
	{
		if ((self.limb == 2) || (self.limb == 3))			// Upper arm movement constraints.
		{								// These are stricter to make the body lay flat.
			if (limits_x > 10)
				limits_x = 10;
			else if (limits_x > -90)
				limits_x = -10;
			if (limits_x < -90)
				limits_x = -180;
		}
		else if ((self.limb == 4) || (self.limb == 5))			// Thigh movement constraints.
		{
			if (limits_x > 10)
				limits_x = 10;
			else if (limits_x < -10)
				limits_x = -10;
		}
		else if ((self.limb == 6) || (self.limb == 7))			// Lower limb movement constraint.
		{
			limits_x = limits_x / 2;
		}
	}


	inertia_ang = limits + self.joint1.angles;			// Recalculate aiming angle using constraints.

	if ((self.joint1.button1 == 1) && (oldorg != self.origin))	// If moving, aim at the calculated angle.
		self.avelocity =  (inertia_ang - self.angles) * 20;	// and avelocity towards it
};

void()  body_think =							// This is the think function for the torso.
{									// It checks if it has come to rest yet and if so 
	local float flat_ang, newang, floor_ang, tempang;		// aligns it with the floor.
	local entity ent, oldself;

	self.touch = body_bounce;

	traceline(self.origin, self.origin - '0 0 10000', TRUE, self);	// Fix for bodies falling out of the map crash.
	if (trace_fraction == 1)					// Still not 100% effective. FIXME
	{
		self.button1 = 2;
		self.remove_count = 1;
//		bprint("body fell out of map\n");
	}

	if (self.button1 == 2)							// If the body is still
	{									
		if (self.remove_count < time)					// If the body hasn't been moved for a minute,
		{								// remove it and its limbs.
			ent = find(world, classname, "bodypart");
			while(ent)
			{
				if ((ent.torso == self) && (ent != self))
				{
					ent.think = SUB_Remove;
					ent.nextthink = time;
				}
				ent = find(ent, classname, "bodypart");
			}
			self.think = SUB_Remove;
			self.nextthink = time;
			return;
		}

		if (self.origin != self.oldorigin)				// If the body has moved, start the limbs and body moving
		{
			T_Damage(self, self, self, 1);
//			self.avelocity_x = self.avelocity_x + crandom() * 300;
//			self.avelocity_y = self.avelocity_y + crandom() * 300;
//			self.avelocity_z = self.avelocity_z + crandom() * 300;
			
			if (vlen(self.avelocity) > 900)				// Fix for out of control spinning bug
				self.avelocity = normalize(self.avelocity) * 500;
			return;
		}
		self.oldorigin = self.origin;
	}		
	else if (vlen(self.velocity) < 100)					// If we're about to or have come to a halt...
	{
		self.button0 = 1;
		tempang = self.angles_x;
		while(tempang > 180)
		{
			floor_ang = floor_ang + 360;
			tempang = tempang - 360;
		}
		while(tempang <  -180)
		{
			floor_ang = floor_ang - 360;
			tempang = tempang + 360;
		}

		if (self.angles_x - floor_ang > 0)			// If the front of the body is closer to the floor
			flat_ang = floor_ang + 90;			// fall that way, if the back is closer fall the 
		else							// other way.	This section should be altered
			flat_ang = floor_ang - 90;			// to deal with landing on a slope. FIXME

		
		newang = flat_ang - self.angles_x;

		if  ((fabs(newang) < 5) && (self.velocity == '0 0 0'))		// If we're within 5 degrees of flat, and stopped, that'll do.
		{								// stop turning and tell the connected joints to stop 
			self.button1 = 2;					// updating for now too.
			self.button0 = 0;
			self.button2 = 0;
			self.touch = body_bounce;			
	
			self.remove_count = time + 60;				// Start the removal counter.
			
			ent = find(world, classname, "bodypart");

			while(ent)						// Stop the limbs updating
			{
				if (ent.torso == self)
				{
					ent.nextthink = time + 99999;
					ent.avelocity = '0 0 0';
				}
				ent = find(ent, classname, "bodypart");
			}
			self.oldorigin = self.origin;
			self.nextthink = time;

			return;							
		}

		self.button2 = self.button2 + 200 * frametime;		// Acceleration to make the body lie flat.
		
		if (newang > self.button2 * frametime)			// turn towards the ground based on frametime
			newang = self.button2 * frametime;			
		if (newang < self.button2 * frametime * -1)			
			newang = self.button2 * frametime * -1;			

		self.angles_x = self.angles_x + newang;
	}
	else
		self.button0 = 0;

	self.nextthink = time;
};

void() body_bounce =									// Touch function for the torso while bouncing.
{			
	local float flo;
	if (other == world)
	{
		if (vlen(self.velocity) > 400)						// Squelchy sound if we hit something hard
			sound (self, CHAN_WEAPON, "zombie/z_miss.wav", 1, ATTN_NORM);
		traceline(self.origin, self.origin - '0 0 25', FALSE, self);
		if (trace_fraction < 1)							// Check if we're bounced on the floor
		{
			self.button2 = vlen(self.avelocity);				// Set laying flat acceleration based on current speed
			self.button2 = self.button2 + vlen(self.velocity);

			self.velocity_z = self.velocity_z * 0.2;			// Only bounce on the floor when moving really fast.
			self.flags = self.flags - (self.flags & FL_ONGROUND);
	
			self.think = body_think;				
			self.nextthink = time;					
											
		}
		else									// If bouncing off a wall or ceiling, 
		{									// change the rotation.
			flo = vlen(self.avelocity);
			self.avelocity_x = self.avelocity_x + crandom() * flo;
			self.avelocity_y = self.avelocity_y + crandom() * flo;
			self.avelocity_z = self.avelocity_z + crandom() * flo;
		}
	}
	return;
};

float (float num) root =			// Very rough square root algorithm. Total hack to keep backwards compatibility.
{						// Should add a checkextension here. FIXME
	local float i, n;

	if (num == 0)
		return 0;

	num = fabs(num);

	n = num / 2;

	while (i < 20)
	{
		n = (n + num/n) / 2;
		i = i + 1;
	}

	return n;
};

void() body_die =							// Begin sagdolling!
{
	local vector vec;
	local float flo;
	local entity ent;
	
	local float vert, horiz, dep, cross, rand;

	vec = self.angles;
	vec_x = vec_x * -1;						// Usual Quake angle_x inversion.
	makevectors(self.angles);

	flo = self.health * -1;
	flo = root(flo);						// Square root of health is used for vertical kick and rotation speed.

	self.velocity_z = self.velocity_z + 30 + (flo * 5);		// Slight vertical kick to deal with being stuck on the ground.

	self.gravity = 0.75;						// Standard quake gravity is too high to look good.
	self.movetype = MOVETYPE_BOUNCE;
	if (self.flags & FL_ONGROUND)					// If it's landed already, unland it.
		self.flags = self.flags - FL_ONGROUND;
	self.touch = body_bounce;
	self.think = body_think;
	self.nextthink = time + 0.5;
	self.button0 = 0;
	self.remove_count = time + 60;					// Start the remove timer

	self.avelocity_x = self.avelocity_x + crandom() * ((20 * flo) + 100);		// Spin that torso
	self.avelocity_y = self.avelocity_y + crandom() * ((20 * flo) + 100);
	self.avelocity_z = self.avelocity_z + crandom() * ((20 * flo) + 100);

	ent = find(world, classname, "bodypart");			// Tell all limbs to start updating
	while(ent)
	{
		if (ent.torso == self)
		{
			ent.nextthink = time;
			if (((ent.joint1 != self) && (ent != self)) || (ent.limb == 1))			// If it's a lower limb or head
			{										// it can be blown off!
				rand = random() * (self.health * -1);
				if (rand > 70)								// But only by very high damage
				{
					ent.think = SUB_Remove;
					ent.nextthink = time + 15;
					ent.frame = 1;							// Frame has to change to correct the rotation point
					ent.skin = 1;							// Get bloody!
					ent.joint1.skin = 1;
					ent.movetype = MOVETYPE_BOUNCE;					
													
					ent.avelocity_x = crandom() * 500;				
					ent.avelocity_y = crandom() * 500;
					ent.avelocity_z = crandom() * 500;

					ent.classname = "gib";
					ent.torso = self;

					setsize(ent, '0 0 0', '0 0 0');
					Gyro_ObjectMacro_Gib(ent, 200);					// Initialise as a Gyro physics object. It can be blown around
													// and float etc.
				}
			}
		}
		
		ent = find(ent, classname, "bodypart");
	}

	self.health = 1;					// Make him a shootable corpse
	self.button1 = TRUE;					// button1 means limbs should angle using "inertia".
	self.takedamage = DAMAGE_YES;				// We don't want to autoaim at corpses
	self.hitguy = '0 0 0';
	self.th_die = body_die;
};

entity(entity base, vector r_org, vector r_ang, string modl, float lim) create_bodypart =	// Spawn a Sagdoll entity
{
	local entity ent, tor;
	local vector vec;
	local float mass;

	if (base == world)				// If base is world then it's a torso.
	{
		self.solid = SOLID_BBOX;		// This has all been restructured a little because the torso is now 
		setorigin(self, r_org);			// the entity that was the guy killed. It's just a little more efficient
		self.think = body_die;			// this way.
		self.nextthink = time;
		self.torso = self;
		self.limb = lim;
		self.classname = "bodypart";
		setmodel(self, modl);

		mass = 1000;						// Make it a Gyro physics object.
		Gyro_Object_Activate(self, mass);			// The stats need fiddling with.
		Gyro_Object_SetBouyancy(self, mass*1.03);
		Gyro_Object_SetResistance(self, mass);
		Gyro_Object_SetAerodynamics(self, mass*0.1);
		Gyro_Object_SetTurbulence(self, mass*0.14, 0.95);
		Gyro_Object_SetGlobalTurb(self, mass*0.8, 0.95);

		return self;
	}
	else							// If not a torso then it's a limb part or head
	{

		ent = spawn();
		ent.classname = "bodypart";
		ent.owner = world;
		ent.movetype = MOVETYPE_FLY;

		create_joint(base, ent);			// Connect it to it's owner
		ent.solid = SOLID_NOT;				// If only quake had rotating bboxes...
		ent.rel_origin = r_org;
		ent.think = update_bodypart;
		ent.nextthink = time;
		ent.button1 = 1;				// For if it has joints following it.
		ent.angles = base.angles;

		tor = ent;

		while(tor.torso != tor		)		// Set up the main torso which 'owns' this limb
			tor = tor.joint1;

		ent.torso = tor;

		ent.colormap = ent.torso.colormap;		// I wish this worked for frikbots.

		makevectors(base.angles);		

		vec = base.origin;

		vec = vec + v_forward * r_org_x;		// tag it to the torso.
		vec = vec + v_right * r_org_y;
		vec = vec + v_up * r_org_z;

		setorigin(ent, vec);
	
		ent.limb = lim;					// Set limb type for constaints
		setmodel(ent, modl);
	}

	return ent;
};