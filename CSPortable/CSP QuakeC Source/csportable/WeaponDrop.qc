
void() WeaponTouch =
{
	local string	s;
	local	float	best, old, new;
	local		entity	stemp;
	local	float	acount;
	
	if (other.classname != "player")
		return;
	if (other.health <= 0)
		return;

	acount = 0;
	sprint (other, "You get ");

	if (self.items)
		if ((other.items & self.items) == 0)
		{
			acount = 1;
			sprint (other, "the ");
			sprint (other, self.netname);
		}

// if the player was using his best weapon, change up to the new one if better		
	stemp = self;
	self = other;
	best = W_BestWeapon();
	self = stemp;


// change weapons

	other.ammo_50 = other.ammo_50 + self.ammo_50;
	other.ammo_9mm = other.ammo_9mm + self.ammo_9mm;
	other.ammo_40acp = other.ammo_40acp + self.ammo_40acp;
	other.ammo_fs = other.ammo_fs + self.ammo_fs;
	other.ammo_cal12 = other.ammo_cal12 + self.ammo_cal12;
	other.ammo_cal122 = other.ammo_cal122 + self.ammo_cal122;
	other.ammo_762 = other.ammo_762 + self.ammo_762;
	other.ammo_228 = other.ammo_228 + self.ammo_228;
	other.ammo_556 = other.ammo_556 + self.ammo_556;
	other.ammo_mac = other.ammo_mac + self.ammo_mac;
	other.ammo_gal = other.ammo_gal + self.ammo_gal;
	other.ammo_5562 = other.ammo_5562 + self.ammo_5562;
	other.ammo_5563 = other.ammo_5563 + self.ammo_5563;
	other.ammo_9mm2 = other.ammo_9mm2 + self.ammo_9mm2;
	other.ammo_9mm3 = other.ammo_9mm3 + self.ammo_9mm3;
	other.ammo_dual = other.ammo_dual + self.ammo_dual;
	other.ammo_g3 = other.ammo_g3 + self.ammo_g3;
	other.ammo_50cal = other.ammo_50cal + self.ammo_50cal;

	new = self.items;
	if (!new)
		new = other.weapon;
	old = other.items;
	other.items = other.items | new;
	
	bound_other_ammo ();

	if (self.ammo_50)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammo_50);
		sprint (other, s);
		sprint (other, " cal50");
	}
	if (self.ammo_9mm)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammo_9mm);
		sprint (other, s);
		sprint (other, " 9mm");
	}
	if (self.ammo_40acp)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammo_40acp);
		sprint (other, s);
		sprint (other, " 40acp");
	}
	if (self.ammo_fs)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammo_fs);
		sprint (other, s);
		sprint (other, " fs");
	}
	
	sprint (other, "\n");
// backpack touch sound
	sound (other, CHAN_ITEM, "weapons/pickup.wav", 1, ATTN_NORM);
	stuffcmd (other, "bf\n");

// remove the backpack, change self to the player
	remove(self);
	self = other;

// change to the weapon
	if (!deathmatch)
		self.weapon = new;
	else
		Deathmatch_Weapon (old, new);

	W_SetCurrentAmmo ();
};

/*
===============
DropWeapon
===============
*/
void() DropWeapon =
{
	local entity	item;

	item = spawn();
	//item.origin = self.owner.origin + '0 20 0';  
	setorigin(item, self.origin + v_forward * 50 + '0 0 40');

        item.velocity = v_forward*65 + v_up * 21.5 + crandom()*v_right*3 + crandom()*v_up*3;
        item.avelocity = '-50 -5 -5';
	
	item.items = self.weapon;
	if (item.items == IT_AXE)
		item.netname = "Knife";
	else if (item.items == IT_SHOTGUN)
		item.netname = "XM1014";
	else if (item.items == IT_SUPER_SHOTGUN)
		item.netname = "M3 Super 90";
	else if (item.items == IT_DEAGLE)
		item.netname = "Desert Eagle";
	else if (item.items == IT_GLOCK)
		item.netname = "Glock";
	else if (item.items == IT_USP)
		item.netname = "USP";
	else if (item.items == IT_P228)
		item.netname = "P228";
	else if (item.items == IT_FIVESEVEN)
		item.netname = "FiveSeven";
	else
		item.netname = "";

	item.ammo_50 = self.ammo_50;
	item.ammo_9mm = self.ammo_9mm;
	item.ammo_40acp = self.ammo_40acp;
	item.ammo_fs = self.ammo_fs;
	item.ammo_762 = self.ammo_762;
	item.ammo_556 = self.ammo_556;
	item.ammo_5562 = self.ammo_5562;
	item.ammo_5563 = self.ammo_5563;
	item.ammo_9mm2 = self.ammo_9mm2;
	item.ammo_9mm3 = self.ammo_9mm3;
	item.ammo_dual = self.ammo_dual;
	item.ammo_50cal = self.ammo_50cal;
	item.ammo_cal12 = self.ammo_cal12;
	item.ammo_cal122 = self.ammo_cal122;
	item.ammo_g3 = self.ammo_g3;
	item.ammo_mac = self.ammo_mac;


	item.velocity_z = 0;
	item.velocity_x = 0;
	item.velocity_y = 20;
	
	item.flags = FL_ITEM;
	item.solid = SOLID_TRIGGER;
	item.movetype = MOVETYPE_TOSS;

if (self.weapon == IT_DEAGLE)
{
	setmodel (item, "progs/w_deagle.mdl");
self.ammo_50 = 0;
}
else if (self.weapon == IT_GLOCK)
{
	setmodel (item, "progs/w_glock.mdl");
self.ammo_9mm = 0;
}
else if (self.weapon == IT_ELITE)
{
	setmodel (item, "progs/w_elite.mdl");
self.ammo_dual = 0;
}
else if (self.weapon == IT_AK47)
{
	setmodel (item, "progs/w_ak47.mdl");
self.ammo_762 = 0;
}
else if (self.weapon == IT_AUG)
{
	setmodel (item, "progs/w_aug.mdl");
self.ammo_5562 = 0;
}
else if (self.weapon == IT_M87)
{
	setmodel (item, "progs/w_awp.mdl");
self.ammo_50cal = 0;
}
else if (self.weapon == IT_G3SG1)
{
	setmodel (item, "progs/w_g3sg1.mdl");
self.ammo_g3 = 0;
}
else if (self.weapon == IT_SUPER_SHOTGUN)
{
	setmodel (item, "progs/w_m3.mdl");
}
else if (self.weapon == IT_MAC10)
{
	setmodel (item, "progs/w_mac10.mdl");
self.ammo_mac = 0;
}
else if (self.weapon == IT_MP5)
{
	setmodel (item, "progs/w_mp5.mdl");
self.ammo_9mm2 = 0;
}
else if (self.weapon == IT_P228)
{
	setmodel (item, "progs/w_p228.mdl");
self.ammo_228 = 0;
}
else if (self.weapon == IT_P90)
{
	setmodel (item, "progs/w_p90.mdl");
self.ammo_9mm3 = 0;
}
else if (self.weapon == IT_USP)
{
	setmodel (item, "progs/w_usp.mdl");
self.ammo_40acp = 0;
}
else if (self.weapon == IT_SHOTGUN)
{
	setmodel (item, "progs/w_xm1014.mdl");
}



	setsize (item, '0 0 0', '0 0 0');
	item.touch = WeaponTouch;
	
	item.nextthink = time + 30;	// remove after 2 minutes
	item.think = SUB_Remove;
};