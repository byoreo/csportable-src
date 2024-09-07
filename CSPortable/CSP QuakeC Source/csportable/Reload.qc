void() player_reload1;
void() player_reloada1;
void() player_reloadb1;
void() player_reloadc1;
void() player_reloade1;
void() player_reloadf1;
void() player_reloadg1;
void() player_reloadh1;
void() player_reloadk1;
void() player_reloadz1;
void() player_sreloada1;
void() player_reloadx1;
void() player_reloady1;

//*********************************************************//
//**********************Automatic Reload ******************//
//*********************************************************//

Void () ReloadGlock =
{
if (self.weaponmodel == "progs/v_glock.mdl")
{
if (self.weaponframe = 15)
{
if (self.ammo_nails >= 1)
{
self.ammo_9mm = 20;
stuffcmd (self, "impulse 202\n");
self.ammo_nails = self.ammo_nails -1;	
sound (self, CHAN_AUTO, "weapons/glock/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadUsp =
{
if (self.weaponmodel == "progs/v_usp.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_40acp = 12;
stuffcmd (self, "impulse 203\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/usp/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadDeagle =
{
if (self.weaponmodel == "progs/v_deagle.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_50 = 7;
stuffcmd (self, "impulse 215\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/deagle/reload.wav", 1, ATTN_NORM);
}
}
}
};


Void () Reload228 =
{
if (self.weaponmodel == "progs/v_p228.mdl")
{
if (self.weaponframe = 12)
{
if (self.ammo_nails >= 1)
{
self.ammo_228 = 13;
stuffcmd (self, "impulse 220\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/p228/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadFS =
{
if (self.weaponmodel == "progs/v_fiveseven.mdl")
{
if (self.weaponframe = 8)
{
if (self.ammo_nails >= 1)
{
self.ammo_fs = 20;
stuffcmd (self, "impulse 218\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/fiveseven/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadAk =
{
if (self.weaponmodel == "progs/v_ak47.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_762 = 30;
stuffcmd (self, "impulse 205\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/ak47/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadAug =
{
if (self.weaponmodel == "progs/v_aug.mdl")
{
if (self.weaponframe = 16)
{
if (self.ammo_nails >= 1)
{
self.ammo_5562 = 35;
stuffcmd (self, "impulse 214\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/aug/reload.wav", 1, ATTN_NORM);
}
}
}
};


Void () ReloadAwp =
{
if (self.weaponmodel == "progs/v_awp.mdl")
{
if (self.weaponframe = 14)
{
if (self.ammo_nails >= 1)
{
self.ammo_50cal = 10;
stuffcmd (self, "impulse 206\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/sniper/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadGal =
{
if (self.weaponmodel == "progs/v_galil.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_gal = 35;
stuffcmd (self, "impulse 221\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/galil/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadG3 =
{
if (self.weaponmodel == "progs/v_g3sg1.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_g3 = 20;
stuffcmd (self, "impulse 222\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/g3sg1/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadM249 =
{
if (self.weaponmodel == "progs/v_m249.mdl")
{
if (self.weaponframe = 20)
{
if (self.ammo_nails >= 1)
{
self.ammo_mg = 100;
stuffcmd (self, "impulse 211\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/m249/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadM4A1 =
{
if (self.weaponmodel == "progs/v_m4a1.mdl")
{
if (self.weaponframe = 13)
{
if (self.ammo_nails >= 1)
{
self.ammo_556 = 30;
stuffcmd (self, "impulse 208\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/m4a1/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadFamas =
{
if (self.weaponmodel == "progs/v_famas.mdl")
{
if (self.weaponframe = 20)
{
if (self.ammo_nails >= 1)
{
self.ammo_5563 = 25;
stuffcmd (self, "impulse 217\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/famas/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadElite =
{
if (self.weaponmodel == "progs/v_elite.mdl")
{
if (self.weaponframe = 27)
{
if (self.ammo_nails >= 1)
{
self.ammo_dual = 30;
stuffcmd (self, "impulse 216\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/elite/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadMac10 =
{
if (self.weaponmodel == "progs/v_mac10.mdl")
{
if (self.weaponframe = 17)
{
if (self.ammo_nails >= 1)
{
self.ammo_mac = 30;
stuffcmd (self, "impulse 219\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/mac10/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadMp5 =
{
if (self.weaponmodel == "progs/v_mp5.mdl")
{
if (self.weaponframe = 17)
{
if (self.ammo_nails >= 1)
{
self.ammo_9mm2 = 30;
stuffcmd (self, "impulse 204\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/mp5/reload.wav", 1, ATTN_NORM);
}
}
}
};

Void () ReloadP90 =
{
if (self.weaponmodel == "progs/v_p90.mdl")
{
if (self.weaponframe = 17)
{
if (self.ammo_nails >= 1)
{
self.ammo_9mm3 = 30;
stuffcmd (self, "impulse 212\n");
self.ammo_nails = self.ammo_nails -1;
sound (self, CHAN_AUTO, "weapons/p90/reload.wav", 1, ATTN_NORM);
}
}
}
};


.float Zahl;
Void () ReloadM3 =
{
if (self.weaponmodel == "progs/v_m3.mdl")
{
if (self.ammo_nails >= 1)
{
self.ammo_nails = self.ammo_nails -1;

for (self.Zahl =1;self.Zahl <=8;self.Zahl++){
stuffcmd (self, "impulse 209\n");
self.ammo_cal122 = self.ammo_cal122 + 1;
player_reloady1;}

sound (self, CHAN_AUTO, "weapons/m3/reload.wav", 1, ATTN_NORM);

}
}
};


Void () Reload =
{


if (self.ammo_9mm == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadf1 ();
ReloadGlock ();
}
}
};

Void () Reload1 =
{

if (self.ammo_40acp == 0)
{
if (self.ammo_nails >= 1)
{
player_reloada1 ();
ReloadUsp ();
}
}
};

Void () Reload1s =   // Silenced USP
{

if (self.ammo_40acp == 0)
{
if (self.ammo_nails >= 1)
{
player_sreloada1 ();
ReloadUsp ();
}
}
};

Void () Reload2 =
{

if (self.ammo_50 == 0)
{
if (self.ammo_nails >= 1)
{
player_reload1 ();
ReloadDeagle ();
}
}
};

Void () Reload3 =
{

if (self.ammo_228 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadg1 ();
Reload228 ();
}
}
};

Void () Reload4 =
{

if (self.ammo_fs == 0)
{
if (self.ammo_nails >= 1)
{
player_reloade1 ();
ReloadFS ();
}
}
};

Void () Reload5 =
{

if (self.ammo_762 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadz1 ();
ReloadAk ();
}
}
};

Void () Reload6 =
{

if (self.ammo_5562 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadb1 ();
ReloadAug ();
}
}
};

Void () Reload7 =
{

if (self.ammo_50cal == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadh1 ();
ReloadAwp ();
}
}
};

Void () Reload8 =
{

if (self.ammo_gal == 0)
{
if (self.ammo_nails >= 1)
{
player_reloada1 ();
ReloadGal ();
}
}
};

Void () Reload9 =
{

if (self.ammo_g3 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloada1 ();
ReloadG3 ();
}
}
};

Void () Reload10 =
{

if (self.ammo_mg == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadc1 ();
ReloadM249 ();
}
}
};

Void () Reload11 =   // Unsilenced M4A1
{

if (self.ammo_556 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloada1 ();
ReloadM4A1 ();
}
}
};

Void () Reload11s =   // Silenced M4A1
{

if (self.ammo_556 == 0)
{
if (self.ammo_nails >= 1)
{
player_sreloada1 ();
ReloadM4A1 ();
}
}
};

Void () Reload12 =
{

if (self.ammo_5563 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadc1 ();
ReloadFamas ();
}
}
};

Void () Reload13 =
{

if (self.ammo_dual == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadk1 ();
ReloadElite ();
}
}
};

Void () Reload14 =
{

if (self.ammo_mac == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadb1 ();
ReloadMac10 ();
}
}
};

Void () Reload15 =
{

if (self.ammo_9mm2 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadb1 ();
ReloadMp5 ();
}
}
};

Void () Reload16 =
{

if (self.ammo_9mm3 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadb1 ();
ReloadP90 ();
}
}
};

Void () Reload17 =
{

if (self.ammo_cal122 == 0)
{
if (self.ammo_nails >= 1)
{
player_reloadx1 ();
ReloadM3 ();
}
}
};


//*********************************************************//
//**********************Manually Reload ******************//
//*********************************************************//


Void () ReloadManually =
{

if (self.weapon == IT_GLOCK)
{
if (self.ammo_9mm < 20)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_reloadf1 ();
ReloadGlock ();
}
}
}

if (self.weapon == IT_USP)
{
if (self.ammo_40acp < 12)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_reloada1 ();
ReloadUsp ();
}
}
}

if (self.silenced == 1)
{
if (self.weapon == IT_USP)
{
if (self.ammo_40acp < 12)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_sreloada1 ();
ReloadUsp ();
}
}
}
}

if (self.weapon == IT_DEAGLE)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_50 < 7)
{
self.attack_finished = time + 2;
player_reload1 ();
ReloadDeagle ();
}
}
}


if (self.weapon == IT_P228)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_228 < 13)
{
self.attack_finished = time + 1;
player_reloadg1 ();
Reload228 ();
}
}
}


if (self.weapon == IT_FIVESEVEN)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_fs < 20)
{
self.attack_finished = time + 1;
player_reloade1 ();
ReloadFS ();
}
}
}

if (self.weapon == IT_AK47)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_762 < 30)
{
self.attack_finished = time + 1;
player_reloadz1 ();
ReloadAk ();
}
}
}

if (self.weapon == IT_AUG)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_5562 < 30)
{
self.attack_finished = time + 1;
player_reloadb1 ();
ReloadAug ();
}
}
}

if (self.weapon == IT_M87)
{
if (self.ammo_50cal < 10)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_reloadh1 ();
ReloadAwp ();
}
}
}

if (self.weapon == IT_GALIL)
{
if (self.ammo_gal < 30)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_reloada1 ();
ReloadGal ();
}
}
}

if (self.weapon == IT_G3SG1)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_g3 < 20)
{
self.attack_finished = time + 1;
player_reloada1 ();
ReloadG3 ();
}
}
}

if (self.weapon == IT_M249)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_mg < 100)
{
self.attack_finished = time + 2;
player_reloadc1 ();
ReloadM249 ();
}
}
}


if (self.silenced == 1)
{
if (self.weapon == IT_M4A1)
{
if (self.ammo_556 < 30)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_sreloada1 ();
ReloadM4A1 ();
}
}
}
}

if (self.weapon == IT_M4A1)
{
if (self.ammo_556 < 30)
{
if (self.ammo_nails >= 1)
{
self.attack_finished = time + 1;
player_sreloada1 ();
ReloadM4A1 ();
}
}
}

if (self.weapon == IT_FAMAS)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_5563 < 25)
{
self.attack_finished = time + 2;
player_reloadc1 ();
ReloadFamas ();
}
}
}

if (self.weapon == IT_ELITE)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_dual < 30)
{
self.attack_finished = time + 2;
player_reloadk1 ();
ReloadElite ();
}
}
}

if (self.weapon == IT_MAC10)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_mac < 30)
{
self.attack_finished = time + 2;
player_reloadb1 ();
ReloadMac10 ();
}
}
}

if (self.weapon == IT_MP5)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_9mm2 < 30)
{
self.attack_finished = time + 2;
player_reloadb1 ();
ReloadMp5 ();
}
}
}


if (self.weapon == IT_P90)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_9mm3 < 30)
{
self.attack_finished = time + 2;
player_reloadb1 ();
ReloadP90 ();
}
}
}

if (self.weapon == IT_SUPER_SHOTGUN)
{
if (self.ammo_nails >= 1)
{
if (self.ammo_cal122 < 8)
{
self.attack_finished = time + 2;
player_reloadx1 ();
ReloadM3 ();
}
}
}

};