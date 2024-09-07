void() Weaponremove;

///////////////////////////////////////////
/////////////Ammo/Armor/HE/Dummy///////////
///////////////////////////////////////////

void() BuyDummy =
{
	if (self.ammo_cells >= 0)
      {
		self.ammo_cells = self.ammo_cells - 0;           
            self.items = self.items |
            IT_AXE; 
            self.items = self.items |
            IT_GLOCK; 
            self.items = self.items |
            IT_MP5; 
		self.ammo_9mm = self.ammo_9mm+ 1;
		self.ammo_9mm = self.ammo_9mm- 1;
		self.ammo_9mm2 = self.ammo_9mm2+ 1;
		self.ammo_9mm2 = self.ammo_9mm2- 1;
                 return;

      }
};

void() BuyHe =
{
	if (self.ammo_cells >= 30)
      {


		self.ammo_cells = self.ammo_cells - 30;
            self.items = self.items |
            HAND_GRENADES; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought a He Grenade\n");
		self.ammo_rockets = self.ammo_rockets+ 1;
             
      } 
      else if (self.ammo_cells <= 29)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_rockets >= 1)
{
self.ammo_rockets = 1;
}

};


void() BuyAmmo =
{
	if (self.ammo_cells >= 30)
      {

		self.ammo_cells = self.ammo_cells - 30;            
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought Ammo\n");
		self.ammo_nails = self.ammo_nails + 2;
                
      } 
      else if (self.ammo_cells < 30)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

       

if (self.ammo_nails >= 8)
{
self.ammo_nails = 8; 
}

};


void() BuyArmor =
{
	if (self.ammo_cells >= 20)
      {
		self.ammo_cells = self.ammo_cells - 20;           
            self.items = self.items |
            IT_ARMOR1; 



            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought a Kevlar west\n");
		self.armortype = 0.4;
		self.armorvalue = self.armorvalue+ 100;
                
      } 
      else if (self.ammo_cells < 20)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

       

if (self.armorvalue >= 100)
{
self.armorvalue = 100;
}

};

//////////////////////////////////////////////
//////////////Weapons/////////////////////////
//////////////////////////////////////////////

void() BuyAk47 =
{
	if (self.ammo_cells >= 60)
      {
      if(self.team == 1)
      {
            self.akbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 60;
            self.items = self.items |
            IT_AK47; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the AK47\n");
		self.ammo_762 = self.ammo_762+ 30;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      }} 

      else if (self.ammo_cells < 60) {
      centerprint (self, "NOT ENOUGH MONEY\n");}

if (self.ammo_762 >= 30){
self.ammo_762 = 30;}

};


void() BuyAug =
{
	if (self.ammo_cells >= 70)
      {
            self.augbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 70;
            self.items = self.items |
            IT_AUG; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Steyr Aug\n");
		self.ammo_5562 = self.ammo_5562+ 35;
            self.akbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 70)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_5562 >= 35)
{
self.ammo_5562 = 35; 
}

};

void() BuyDeagle =
{
	if (self.ammo_cells >= 40)
      {
            self.deaglebought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 40;
            self.items = self.items |
            IT_DEAGLE; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Desert Eagle\n");
		self.ammo_50 = self.ammo_50+ 7;
            self.glockbought = 0;
            self.uspbought = 0;
            self.elitebought = 0;
            self.fivesevenbought = 0;
            self.p228bought = 0;

      } 
      else if (self.ammo_cells < 40)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_50 >= 7)
{
self.ammo_50 = 7;
}

};



void() BuyElite =
{
	if (self.ammo_cells >= 60)
      {
            self.elitebought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 60;
            self.items = self.items |
            IT_ELITE; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Dual Elite\n");
		self.ammo_dual = self.ammo_dual+ 30;
            self.deaglebought = 0;
            self.glockbought = 0;
            self.uspbought = 0;
            self.fivesevenbought = 0;
            self.p228bought = 0;
      } 
      else if (self.ammo_cells < 20)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_40acp >= 12)
{
self.ammo_40acp = 12;
}


};

void() BuyFamas =
{
	if (self.ammo_cells >= 50)
      {
            self.famasbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 50;
            self.items = self.items |
            IT_FAMAS; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Famas\n");
		self.ammo_5563 = self.ammo_5563+ 25;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 50)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }


if (self.ammo_5562 >= 25)
{
self.ammo_5562 = 25;
}

};


void() BuyGlock =
{
	if (self.ammo_cells >= 10)
      {
            self.glockbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 10;           
            self.items = self.items |
            IT_GLOCK; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Glock 23\n");
		self.ammo_9mm = self.ammo_9mm+ 20;  
            self.deaglebought = 0;
            self.uspbought = 0;
            self.elitebought = 0;
            self.fivesevenbought = 0;
            self.p228bought = 0;
      } 
      else if (self.ammo_cells < 10)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_9mm >= 20)
{
self.ammo_9mm = 20;
}

};

void() BuyM3 =
{
	if (self.ammo_cells >= 30)
      {
            self.m3bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 30;           
            self.items = self.items |
            IT_SUPER_SHOTGUN; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the M3 Super 90\n");
		self.ammo_cal122 = self.ammo_cal122+ 8;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 30)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_cal122 >= 8)
{  
self.ammo_cal122 = 8;
}


};

void() BuyM4a1 =
{
	if (self.ammo_cells >= 50)
      {
            self.m3bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 50;
            self.items = self.items |
            IT_AK47; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the M4A1\n");
		self.ammo_556 = self.ammo_556+ 30;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 56)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_556 >= 30)
{
self.ammo_556 = 30;
}
 
};

void() BuyM87 =
{
	if (self.ammo_cells >= 80)
      {
            self.awpbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 80;
            self.items = self.items |
            IT_M87; 
	      sprint (self, "You bought the M87ELR Rifle\n");
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
		self.ammo_50cal = self.ammo_50cal+ 10;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 80)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      } 

if (self.ammo_50cal >= 10)
{
self.ammo_50cal = 10;
}

};

void() BuyM249 =
{
	if (self.ammo_cells >= 70)
      {
            self.m249bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 70;
            self.items = self.items |
            IT_M249; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the M249\n");
		self.ammo_mg = self.ammo_mg+ 100;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 70)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_mg >= 100)
{
self.ammo_mg = 100;
}

};

void() BuyMp5 =
{
	if (self.ammo_cells >= 40)
      {
            self.mp5bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 40;
            self.items = self.items |
            IT_MP5; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the H&K MP5\n");
		self.ammo_9mm2 = self.ammo_9mm2+ 30;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 40)
      {
      sprint (self, "NOT ENOUGH MONEY\n");
      } 

if (self.ammo_9mm2 >= 30)
{
self.ammo_9mm2 = 30;
}
 
};

void() BuyP90 =
{
	if (self.ammo_cells >= 40)
      {
            self.p90bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 40;
            self.items = self.items |
            IT_P90; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the P90\n");
		self.ammo_9mm3 = self.ammo_9mm3+ 30;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 40)
      {
      sprint (self, "NOT ENOUGH MONEY\n");
      } 


if (self.ammo_9mm3 >= 30)
{
self.ammo_9mm3 = 30;
}

};

void() BuyUSP =
{
	if (self.ammo_cells >= 20)
      {
            self.uspbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 20;
            self.items = self.items |
            IT_USP; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the USP\n");
		self.ammo_40acp = self.ammo_40acp+ 12;
            self.deaglebought = 0;
            self.glockbought = 0;
            self.elitebought = 0;
            self.p228bought = 0;
      } 
      else if (self.ammo_cells < 20)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_40acp >= 12){
self.ammo_40acp = 12;
}
};

void() BuyXm1014 =
{
	if (self.ammo_cells >= 40)
      {
            self.xmbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 40;           
            self.items = self.items |
            IT_SHOTGUN; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the XM1014\n");
		self.ammo_cal12 = self.ammo_cal12+ 8;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 30)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_cal12 >= 8)
{
self.ammo_cal12 = 8;
 } 

};

void() BuyP228 =
{
	if (self.ammo_cells >= 30)
      {
            self.p228bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 30;           
            self.items = self.items |
            IT_P228; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the P228\n");
		self.ammo_228 = self.ammo_228+ 13;
            self.deaglebought = 0;
            self.glockbought = 0;
            self.uspbought = 0;
            self.elitebought = 0;
            self.fivesevenbought = 0;
      } 
      else if (self.ammo_cells < 30)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_228 >= 13)
{
self.ammo_228 = 13;
}

};

void() BuyFiveSeven =
{
	if (self.ammo_cells >= 30)
      {
            self.fivesevenbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 30;           
            self.items = self.items |
            IT_FIVESEVEN; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the FiveSeven\n");
		self.ammo_fs = self.ammo_fs+ 20;
            self.deaglebought = 0;
            self.glockbought = 0;
            self.uspbought = 0;
            self.elitebought = 0;
            self.p228bought = 0;
      } 
      else if (self.ammo_cells < 30)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_fs >= 20){
self.ammo_fs = 20;
}


};

void() BuyMac10 =
{
	if (self.ammo_cells >= 40)
      {
            self.mac10bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 40;           
            self.items = self.items |
            IT_FIVESEVEN; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Mac10\n");
		self.ammo_mac = self.ammo_mac+ 30;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
      } 
      else if (self.ammo_cells < 40)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_mac >= 30){
self.ammo_mac = 30;
}

};


void() BuyGalil =
{
	if (self.ammo_cells >= 60)
      {
            self.galilbought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 60;           
            self.items = self.items |
            IT_GALIL; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the Galil\n");
		self.ammo_gal = self.ammo_gal+ 30;
            self.akbought = 0;
            self.augbought = 0;
            self.famasbought = 0;
            self.g3bought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 60)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_gal >= 30){
self.ammo_gal = 30;
}
};

void() BuyG3sg1 =
{
	if (self.ammo_cells >= 70)
      {
            self.g3bought = 1;
            Weaponremove();
		self.ammo_cells = self.ammo_cells - 70;           
            self.items = self.items |
            IT_G3SG1; 
            sound (self, CHAN_WEAPON, "misc/buy.wav", 1, ATTN_NORM);
	      sprint (self, "You bought the G3SG1\n");
		self.ammo_g3 = self.ammo_g3+ 20;
            self.akbought = 0;
            self.augbought = 0;
            self.galilbought = 0;
            self.famasbought = 0;
            self.mp5bought = 0;
            self.p90bought = 0;
            self.m249bought = 0;
            self.m4a1bought = 0;
            self.awpbought = 0;
            self.m3bought = 0;
            self.xmbought = 0;
            self.mac10bought = 0;
      } 
      else if (self.ammo_cells < 70)
      {
      centerprint (self, "NOT ENOUGH MONEY\n");
      }

if (self.ammo_g3 >= 20){
self.ammo_g3 = 20;
 }
};
