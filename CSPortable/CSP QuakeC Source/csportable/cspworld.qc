
void() InitBodyQue;


void() main =
{
	dprint ("main function\n");
	
// these are just commands the the prog compiler to copy these files

	precache_file ("progs.dat");
	precache_file ("gfx.wad");

//
// these are all of the lumps from the cached.ls files
//
	precache_file ("gfx/palette.lmp");
	precache_file ("gfx/colormap.lmp");

	precache_file2 ("gfx/pop.lmp");

	precache_file ("gfx/complete.lmp");
	precache_file ("gfx/inter.lmp");

	precache_file ("gfx/ranking.lmp");
	precache_file ("gfx/conback.lmp");

	precache_file ("gfx/menudot1.lmp");

	precache_file ("gfx/bigbox.lmp");
	precache_file ("gfx/dim_modm.lmp");
	precache_file ("gfx/dim_drct.lmp");
	precache_file ("gfx/dim_ipx.lmp");
	precache_file ("gfx/dim_tcp.lmp");
	precache_file ("gfx/dim_mult.lmp");
	precache_file ("gfx/mainmenu.lmp");
	
	precache_file ("gfx/box_tl.lmp");
	precache_file ("gfx/box_tm.lmp");
	precache_file ("gfx/box_tr.lmp");
	
	precache_file ("gfx/box_ml.lmp");
	precache_file ("gfx/box_mm.lmp");
	precache_file ("gfx/box_mm2.lmp");
	precache_file ("gfx/box_mr.lmp");
	
	precache_file ("gfx/box_bl.lmp");
	precache_file ("gfx/box_bm.lmp");
	precache_file ("gfx/box_br.lmp");
	
	precache_file ("gfx/sp_menu.lmp");
	precache_file ("gfx/ttl_sgl.lmp");
	precache_file ("gfx/ttl_main.lmp");
	
	precache_file ("gfx/mp_menu.lmp");
	
	precache_file ("gfx/netmen1.lmp");
	precache_file ("gfx/netmen2.lmp");
	precache_file ("gfx/netmen3.lmp");
	precache_file ("gfx/netmen4.lmp");
	precache_file ("gfx/netmen5.lmp");
	

	precache_file ("gfx/pause.lmp");
	precache_file ("gfx/loading.lmp");

	precache_file ("gfx/p_option.lmp");


// sounds loaded by C code
	precache_sound ("misc/menu1.wav");
	precache_sound ("misc/menu2.wav");
	precache_sound ("misc/menu3.wav");

	precache_sound ("ambience/water1.wav");
	precache_sound ("ambience/wind2.wav");


};


entity	lastspawn;

//=======================
/*QUAKED worldspawn (0 0 0) ?
Only used for the world entity.
Set message to the level name.
Set sounds to the cd track to play.

World Types:
0: medieval
1: metal
2: base
*/
//=======================
void() worldspawn =
{
	lastspawn = world;  
	InitBodyQue ();

// the area based ambient sounds MUST be the first precache_sounds

// player precaches	
	W_Precache ();			// get weapon precaches

// sounds used from C physics code


// setup precaches allways needed
	precache_sound ("player/jump/land/land.wav");			// player landing
	precache_sound ("player/jump/land/land2.wav");		// player hurt landing
	precache_sound ("player/jump/jump.wav");
	precache_sound ("player/jump/h2ojump.wav");
	precache_sound ("player/inh2o.wav");

	precache_sound ("misc/talk.wav");			// talk
	precache_sound ("weapons/lock4.wav");		// ammo pick up
	precache_sound ("weapons/pkup.wav");		// weapon up


// player pain sounds

	precache_sound ("player/pain/pain1.wav");
	precache_sound ("player/pain/pain2.wav");
	precache_sound ("player/pain/pain3.wav");
	precache_sound ("player/pain/pain4.wav");
	precache_sound ("player/pain/pain5.wav");
	precache_sound ("player/pain/pain6.wav");

// player death sounds
	precache_sound ("player/death/death1.wav");		
	precache_sound ("player/death/death2.wav");		
	precache_sound ("player/death/death3.wav");		
	precache_sound ("player/death/death4.wav");		
	precache_sound ("player/death/death5.wav");

// ax sounds	
	precache_sound ("weapons/knife/hitair.wav");		// knife hit nothing
	precache_sound ("weapons/knife/hitmeat.wav");		// knife hit meat
	precache_sound ("weapons/knife/hitwall.wav");		// knife hit wall


	precache_sound ("misc/outwater.wav");		// leaving water sound

	precache_sound ("misc/water1.wav");			// swimming
	precache_sound ("misc/water2.wav");			// swimming


      precache_sound ("player/foot1.wav");      
      precache_sound ("player/foot2.wav");      
      precache_sound ("player/foot3.wav");      
      precache_sound ("player/foot4.wav");


//C4 Bomb======================================
      precache_sound ("weapons/c4/c4_plant.wav");
//==========================================


//Radio======================================

      precache_sound ("radio/com_go.wav");      
      precache_sound ("radio/ct_backup.wav");      
      precache_sound ("radio/ct_affirm.wav");      
      precache_sound ("radio/enemydown.wav");
      precache_sound ("radio/ct_coverme.wav");
      precache_sound ("radio/followme.wav");
      precache_sound ("radio/negative.wav");
      precache_sound ("radio/position.wav");
      precache_sound ("radio/roger.wav");
      precache_sound ("radio/ct_fireinhole.wav");
      precache_sound ("radio/ct_enemys.wav");
      precache_sound ("radio/matedown.wav");

//==========================================
//Reload====================================
      precache_sound ("weapons/glock/reload.wav"); 
      precache_sound ("weapons/usp/reload.wav"); 
      precache_sound ("weapons/deagle/reload.wav"); 
      precache_sound ("weapons/p228/reload.wav"); 
      precache_sound ("weapons/elite/reload.wav");
      precache_sound ("weapons/fiveseven/reload.wav");  
      precache_sound ("weapons/ak47/reload.wav");
      precache_sound ("weapons/aug/reload.wav");
      precache_sound ("weapons/galil/reload.wav");
      precache_sound ("weapons/g3sg1/reload.wav");
      precache_sound ("weapons/m249/reload.wav");
      precache_sound ("weapons/m4a1/reload.wav");
      precache_sound ("weapons/famas/reload.wav");
      precache_sound ("weapons/mac10/reload.wav");
      precache_sound ("weapons/mp5/reload.wav");
      precache_sound ("weapons/p90/reload.wav");
      precache_sound ("weapons/sniper/reload.wav");


//==========================================

	precache_model ("progs/eyes.mdl");

	precache_model ("sprites/s_bubble.spr");	// drowning bubbles
	precache_model ("sprites/s_explod.spr");	// sprite explosion
      precache_model ("sprites/muzzleflash.spr");

//View Weapons

	precache_model ("progs/v_aug.mdl");
	precache_model ("progs/v_knife.mdl");
	precache_model ("progs/v_glock.mdl");
	precache_model ("progs/v_usp.mdl"); 
	precache_model ("progs/v_he.mdl");
	precache_model ("progs/v_mp5.mdl");
	precache_model ("progs/v_ak47.mdl");
	precache_model ("progs/v_awp.mdl");
	precache_model ("progs/v_m4a1.mdl");
	precache_model ("progs/v_m3.mdl");
	precache_model ("progs/v_xm1014.mdl");
	precache_model ("progs/v_m249.mdl");
	precache_model ("progs/v_p90.mdl");
	precache_model ("progs/v_c4.mdl");
	precache_model ("progs/v_deagle.mdl");
	precache_model ("progs/v_elite.mdl");
	precache_model ("progs/v_famas.mdl");
	precache_model ("progs/v_p228.mdl");
	precache_model ("progs/v_galil.mdl");
	precache_model ("progs/v_mac10.mdl");
	precache_model ("progs/v_g3sg1.mdl");
	precache_model ("progs/v_fiveseven.mdl");
//Player Models

	precache_model ("progs/player.mdl");

//World Weapons



      precache_sound ("weapons/pickup.wav"); 
	precache_model ("progs/grenade.mdl");
	precache_model ("progs/c4.mdl");
	precache_model ("progs/w_deagle.mdl");
	precache_model ("progs/w_glock.mdl");
	precache_model ("progs/w_ak47.mdl");
	precache_model ("progs/w_aug.mdl");
	precache_model ("progs/w_awp.mdl");
	precache_model ("progs/w_elite.mdl");
	precache_model ("progs/w_g3sg1.mdl");
	precache_model ("progs/w_m3.mdl");
	precache_model ("progs/w_mac10.mdl");
	precache_model ("progs/w_mp5.mdl");
	precache_model ("progs/w_p228.mdl");
	precache_model ("progs/w_p90.mdl");
	precache_model ("progs/w_usp.mdl");
	precache_model ("progs/w_xm1014.mdl");

//World Blood

	precache_model ("progs/bleed.mdl");


//
// Setup light animation tables. 'a' is total darkness, 'z' is maxbright.
//

	// 0 normal
	lightstyle(0, "m");
	
	// 1 FLICKER (first variety)
	lightstyle(1, "mmnmmommommnonmmonqnmmo");
	
	// 2 SLOW STRONG PULSE
	lightstyle(2, "abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba");
	
	// 3 CANDLE (first variety)
	lightstyle(3, "mmmmmaaaaammmmmaaaaaabcdefgabcdefg");
	
	// 4 FAST STROBE
	lightstyle(4, "mamamamamama");
	
	// 5 GENTLE PULSE 1
	lightstyle(5,"jklmnopqrstuvwxyzyxwvutsrqponmlkj");
	
	// 6 FLICKER (second variety)
	lightstyle(6, "nmonqnmomnmomomno");
	
	// 7 CANDLE (second variety)
	lightstyle(7, "mmmaaaabcdefgmmmmaaaammmaamm");
	
	// 8 CANDLE (third variety)
	lightstyle(8, "mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa");
	
	// 9 SLOW STROBE (fourth variety)
	lightstyle(9, "aaaaaaaazzzzzzzz");
	
	// 10 FLUORESCENT FLICKER
	lightstyle(10, "mmamammmmammamamaaamammma");

	// 11 SLOW PULSE NOT FADE TO BLACK
	lightstyle(11, "abcdefghijklmnopqrrqponmlkjihgfedcba");
	
	// styles 32-62 are assigned by the light program for switchable lights

	// 63 testing
	lightstyle(63, "a");
};

void() StartFrame =
{
	teamplay = cvar("teamplay");
	skill = cvar("skill");
	framecount = framecount + 1;
Gyro_Run();
};

/*
==============================================================================

BODY QUE

==============================================================================
*/

entity	bodyque_head;

void() bodyque =
{	// just here so spawn functions don't complain after the world
	// creates bodyques
};

void() InitBodyQue
{
 local entity e;
 local float i;
 
 e = spawn ();
 e.classname = "bodyque";
 bodyque_head = e;
 
 i = 0;
 while (i < (BODYQUE_SIZE - 1))
 {
  e.owner = spawn ();
  e.classname = "bodyque";
  e = e.owner;
 
  i = i + 1;
 }
 
 e.owner = bodyque_head;
}

// make a body que entry for the given ent so the ent can be
// respawned elsewhere
void(entity ent) CopyToBodyQue =
{
	bodyque_head.angles = ent.angles;
	bodyque_head.model = ent.model;
	bodyque_head.modelindex = ent.modelindex;
	bodyque_head.frame = ent.frame;
	bodyque_head.colormap = ent.colormap;
	bodyque_head.movetype = ent.movetype;
	bodyque_head.velocity = ent.velocity;
	bodyque_head.flags = 0;
 

	setorigin (bodyque_head, ent.origin);
	setsize (bodyque_head, ent.mins, ent.maxs);
	bodyque_head = bodyque_head.owner;
};


void () look_for_others = // TEST ROUNDS
{
local entity plr, last;
local float numct, numt;

	last = world;

	plr = nextent(world);
	while(plr)
		{
		if ((plr.classname == "player") && plr.health > 0)
            {
            if (plr.team == 1)
			{
			last = plr;
			numt = numt + 1;
			}}

		if ((plr.classname == "player") && plr.health > 0)
            {
            if (plr.team == 2)
			{
			last = plr;
			numct = numct + 1;
			}}

		if ((plr.classname == "player") && plr.health < 1)
            {
            if (plr.team == 1)
			{
			last = plr;
			numt = numt - 1;
			}}

		if ((plr.classname == "player") && plr.health < 1)
            {

			{
			last = plr;
			numct = numct - 1;
			}}

            if (numt == 0)
                respawn();

            if (numct == 0)
                respawn();

		plr = nextent(plr);
		}		

};

