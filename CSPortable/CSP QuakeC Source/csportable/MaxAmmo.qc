void () MaxAmmo =
{

if (self.ammo_rockets >= 1)
self.ammo_rockets = 1;

if (self.ammo_nails >= 8)
self.ammo_nails = 8; 

if (self.armorvalue >= 100)
self.armorvalue = 100;


if (self.ammo_762 >= 30)
self.ammo_762 = 30;

if (self.ammo_5562 >= 35)
self.ammo_5562 = 35; 

if (self.ammo_50 >= 7)
self.ammo_50 = 7;

if (self.ammo_40acp >= 12)
self.ammo_40acp = 12;

if (self.ammo_5562 >= 25)
self.ammo_5562 = 25;

if (self.ammo_9mm >= 20)
self.ammo_9mm = 20;

if (self.ammo_cal122 >= 8)
self.ammo_cal122 = 8;

if (self.ammo_556 >= 30)
self.ammo_556 = 30;

if (self.ammo_50cal >= 10)
self.ammo_50cal = 10;

if (self.ammo_mg >= 100)
self.ammo_mg = 100;

if (self.ammo_9mm2 >= 30)
self.ammo_9mm2 = 30;

if (self.ammo_9mm3 >= 30)
self.ammo_9mm3 = 30;

if (self.ammo_40acp >= 12)
self.ammo_40acp = 12;

if (self.ammo_cal12 >= 8)
self.ammo_cal12 = 8;

if (self.ammo_fs >= 20)
self.ammo_fs = 20;

if (self.ammo_mac >= 30)
self.ammo_mac = 30;

if (self.ammo_gal >= 30)
self.ammo_gal = 30;

if (self.ammo_g3 >= 20)
self.ammo_g3 = 20;

if (self.ammo_cells >= 250)
self.ammo_cells = 250;


};


void () Inventory =
{

if (self.ammo_762 >= 1)
{
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
}

if (self.ammo_5563 >= 1)
{
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_762 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
}

if (self.ammo_5562 >= 1)
{
self.ammo_762 = 0;
self.ammo_gal = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
}

if (self.ammo_gal >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_50cal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
}

if (self.ammo_50cal >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_mac = 0;
self.ammo_g3 = 0;
}

if (self.ammo_mac >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_9mm2 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_9mm3 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_cal12 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal122 = 0;
self.ammo_mg = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_cal122 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_mg = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_mg >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_50cal = 0;
self.ammo_g3 = 0;
}

if (self.ammo_g3 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_556 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_50cal = 0;
self.ammo_mg = 0;
}

if (self.ammo_556 >= 1)
{
self.ammo_762 = 0;
self.ammo_5562 = 0;
self.ammo_gal = 0;
self.ammo_g3 = 0;
self.ammo_5563 = 0; 
self.ammo_mac = 0;
self.ammo_9mm2 = 0;
self.ammo_9mm3 = 0;
self.ammo_cal12 = 0;
self.ammo_cal122 = 0;
self.ammo_50cal = 0;
self.ammo_mg = 0;
}

///////////////////////////
//////Pistols/////////////
//////////////////////////

if (self.ammo_40acp >= 1)
{
self.ammo_9mm = 0;
self.ammo_50 = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_228 = 0;
}

if (self.ammo_9mm >= 1)
{
self.ammo_40acp = 0;
self.ammo_50 = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_228 = 0;
}

if (self.ammo_50 >= 1)
{
self.ammo_9mm = 0;
self.ammo_40acp = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_228 = 0;
}

if (self.ammo_228 >= 1)
{
self.ammo_9mm = 0;
self.ammo_40acp = 0;
self.ammo_fs = 0;
self.ammo_dual = 0;
self.ammo_50 = 0;
}


if (self.ammo_fs >= 1)
{
self.ammo_9mm = 0;
self.ammo_40acp = 0;
self.ammo_dual = 0;
self.ammo_50 = 0;
self.ammo_228 = 0;
}

if (self.ammo_dual >= 1)
{
self.ammo_9mm = 0;
self.ammo_40acp = 0;
self.ammo_fs = 0;
self.ammo_50 = 0;
self.ammo_228 = 0;
}

};
