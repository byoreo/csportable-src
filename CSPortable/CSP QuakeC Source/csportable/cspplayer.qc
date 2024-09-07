//Koolio, koolio@mdqnet.net
//Playerframes rewritten to contain the Q2 player frames instead of the Q1 ranger frames
//Also added the flipoff, crouch etc...
//If you use this, some credit would be nice
void() bubble_bob;
void()      VoicesDie;
void() player_taunt1;
void() player_point1;


/*
==============================================================================

PLAYER

==============================================================================
*/
//Unneeded
$cd id1/models/player_4
$origin 0 -6 24
$base base		
$skin skin

//
// Standing
//
$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8
$frame stand9 stand10 stand11 stand12 stand13 stand14 stand15
$frame stand16 stand17 stand18 stand19 stand20 stand21 stand22
$frame stand23 stand24 stand25 stand26 stand27 stand28 stand29
$frame stand30 stand31 stand32 stand33 stand34 stand35 stand36
$frame stand37 stand38 stand39 stand40
//Ugh, I'm bored already =)

// 
// Running
//
$frame run1 run2 run3 run4 run5 run6
//That wasn't so hard

//
// attacking
//
$frame attack1 attack2 attack3 attack4 attack5 attack6 attack7 attack8
//Still doable

//
// Pain
//

//sequence 1
$frame pain1 pain2 pain3 pain4
//sequence 2
$frame pain5 pain6 pain7 pain8
//sequence 3
$frame pain9 pain10 pain11 pain12
//Still doing it

//
// jump
//
$frame jump1 jump2 jump3 jump4 jump5 jump6
//Not even at the half

//
// flip-off
//

$frame flip1 flip2 flip3 flip4 flip5 flip6
$frame flip7 flip8 flip9 flip10 flip11 flip12
//Did you just give me the finger?

//
// Salute
//
$frame salute1 salute2 salute3 salute4 salute5 salute6
$frame salute7 salute8 salute9 salute10 salute11
//This is getting boring

//
// Taunt
//
$frame taunt1 taunt2 taunt3 taunt4 taunt5 taunt6 taunt7
$frame taunt8 taunt9 taunt10 taunt11 taunt12 taunt13
$frame taunt14 taunt15 taunt16 taunt17
//Make it stop

//
// wave
//
$frame wave1 wave2 wave3 wave4 wave5 wave6 wave7 wave8
$frame wave9 wave10 wave11
//When does it stop?

//
// Point
//
$frame point1 point2 point3 point4 point5 point6
$frame point7 point8 point9 point10 point11 point12
//Enough already

//
// Crouch Stand
//
$frame crstand1 crstand2 crstand3 crstand4 crstand5 crstand6 crstand7
$frame crstand8 crstand9 crstand10 crstand11 crstand12 crstand13 crstand14
$frame crstand15 crstand16 crstand17 crstand18 crstand19 
//I'm begining to hate frames now

//
// Crouch Walk
//
$frame crwalk1 crwalk2 crwalk3 crwalk4 crwalk5 crwalk6
//Here we are at frame 4572952 and still doing it

//
// Crouch Attack
//
$frame crattack1 crattack2 crattack3 crattack4 crattack5 crattack6
$frame crattack7 crattack8 crattack9
//I'm so bored I almost fall asleep

//
// Crouch Pain
//
$frame crpain1 crpain2 crpain3 crpain4
//Didley doo

//
//Crouch Death
//
$frame crdeath1 crdeath2 crdeath3 crdeath4 crdeath5
//.........

//
// Death
//
//sequence 1
$frame death1 death2 death3 death4 death5 death6
//sequence 2
$frame death7 death8 death9 death10 death11 death12
//sequence 3
$frame death13 death14 death15 death16 death17 death18 death19 death20
//Wow, I made it!



/*
==============================================================================
PLAYER
==============================================================================
*/

void() player_run;

//============================================================================
//		Player Crouching
//============================================================================
void()	player_crouch; //Declare for the crouch bit

void()	player_crrun =[	$crwalk1,	player_crrun	]
{



      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

  


	if (!self.velocity_x && !self.velocity_y)
	{
		self.walkframe=0;
		player_crouch();
		return;
	}
		if (self.walkframe >= 6)
			self.walkframe = 0;
		self.frame = self.frame + self.walkframe;

	self.walkframe = self.walkframe + 1;
};

void() player_crouch = [ $crstand1, player_crouch ]
{

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }



      

	if (self.velocity_x || self.velocity_y)
	{
		self.walkframe=0;
		player_crrun();
		return;
	}
	
	if (self.walkframe >= 18)
	self.walkframe = 0;
	self.frame = $crstand1 + self.walkframe;


self.walkframe = self.walkframe + 1;


};

void()	player_stand1 =[	$stand1,	player_stand1	]
{

//	if (self.crouch == 1)
	//{
//	player_crouch();
	//return;
//	}

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }



  
      

	if (self.velocity_x || self.velocity_y)
	{
		self.walkframe=0;
		player_run();
		return;
	}


		if (self.walkframe >= 39)
			self.walkframe = 0;
		self.frame = $stand1 + self.walkframe;

		self.walkframe = self.walkframe + 1;	
};

void(entity e) walksound ={ 

local float r;

r = rint(random() * 3); 
if (r == 0) 
sound (e, CHAN_AUTO, "player/foot1.wav", 0.5, ATTN_NORM); 
else if (r == 1) 
sound (e, CHAN_AUTO, "player/foot2.wav", 0.5, ATTN_NORM); 
else if (r == 2) 
sound (e, CHAN_AUTO, "player/foot3.wav", 0.5, ATTN_NORM); 
else 
sound (e, CHAN_AUTO, "player/foot4.wav", 0.5, ATTN_NORM);  

};

void()	player_run =[	$run1,	player_run	]
{


if (self.walkframe == 1 || self.walkframe == 4 ) 
if (self.waterlevel == 0) 
walksound (self);

if (self.waterlevel == 1)
{
 player_point1 ();
 return;
 }

if (self.waterlevel == 3)
		{ 
player_taunt1 ();
 return;
 }


      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_usp.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 0)
      {
	self.weaponframe=0;
   	}
      else
      self.weaponframe=0;
      }

      if (self.weaponmodel == "progs/v_m4a1.mdl")
      {
      if (self.silenced == 1)
      {
	self.weaponframe=15;
      }
      else
      self.weaponframe=0;
      }

  

	if (!self.velocity_x && !self.velocity_y)
	{
		self.walkframe=0;
		player_stand1();
		return;
	}
	
//		if (self.crouch == 1)
//	{
//	player_crrun();
//	return;
//	}
		if (self.walkframe >= 6)
			self.walkframe = 0;
		self.frame = self.frame + self.walkframe;

	self.walkframe = self.walkframe + 1;
};




void()	player_axe1 =	[$attack1, player_axe2	] {self.weaponframe=1;};
void()	player_axe2 =	[$attack2, player_axe3	] {self.weaponframe=2;};
void()	player_axe3 =	[$attack3, player_axe4	] {self.weaponframe=3;W_FireAxe();};
void()	player_axe4 =	[$attack4, player_axe5	] {self.weaponframe=4;};
void()	player_axe5 =	[$attack5, player_axe6	] {self.weaponframe=5;};
void()	player_axe6 =	[$attack6, player_axe7	] {self.weaponframe=6;};
void()	player_axe7 =	[$attack7, player_axe8	] {self.weaponframe=7;};
void()	player_axe8 =	[$attack8, player_run	] {self.weaponframe=8;};

void()	player_axeb1 =	[$attack1, player_axeb2	] {self.weaponframe=1;};
void()	player_axeb2 =	[$attack2, player_axeb3	] {self.weaponframe=2;};
void()	player_axeb3 =	[$attack3, player_axeb4	] {self.weaponframe=3;W_FireAxe();};
void()	player_axeb4 =	[$attack4, player_axeb5	] {self.weaponframe=4;};
void()	player_axeb5 =	[$attack5, player_axeb6	] {self.weaponframe=5;};
void()	player_axeb6 =	[$attack6, player_axeb7	] {self.weaponframe=6;};
void()	player_axeb7 =	[$attack7, player_axeb8	] {self.weaponframe=7;};
void()	player_axeb8 =	[$attack8, player_run	] {self.weaponframe=8;};

void()	player_axec1 =	[$attack1, player_axec2	] {self.weaponframe=1;};
void()	player_axec2 =	[$attack2, player_axec3	] {self.weaponframe=2;};
void()	player_axec3 =	[$attack3, player_axec4	] {self.weaponframe=3;W_FireAxe();};
void()	player_axec4 =	[$attack4, player_axec5	] {self.weaponframe=4;};
void()	player_axec5 =	[$attack5, player_axec6	] {self.weaponframe=5;};
void()	player_axec6 =	[$attack6, player_axec7	] {self.weaponframe=6;};
void()	player_axec7 =	[$attack7, player_axec8	] {self.weaponframe=7;};
void()	player_axec8 =	[$attack8, player_run	] {self.weaponframe=8;};

void()	player_axed1 =	[$attack1, player_axed2	] {self.weaponframe=1;};
void()	player_axed2 =	[$attack2, player_axed3	] {self.weaponframe=2;};
void()	player_axed3 =	[$attack3, player_axed4	] {self.weaponframe=3;W_FireAxe();};
void()	player_axed4 =	[$attack4, player_axed5	] {self.weaponframe=4;};
void()	player_axed5 =	[$attack5, player_axed6	] {self.weaponframe=5;};
void()	player_axed6 =	[$attack6, player_axed7	] {self.weaponframe=6;};
void()	player_axed7 =	[$attack7, player_axed8	] {self.weaponframe=7;};
void()	player_axed8 =	[$attack8, player_run	] {self.weaponframe=8;};


//============================================================================

// attack
void()	player_shot1 =	[$attack1, player_shot2	] {self.weaponframe=1;
self.effects = self.effects | EF_MUZZLEFLASH;};
void()	player_shot2 =	[$attack2, player_shot3	] {self.weaponframe=2;};
void()	player_shot3 =	[$attack3, player_shot4	] {self.weaponframe=3;};
void()	player_shot4 =	[$attack4, player_shot5	] {self.weaponframe=4;};
void()	player_shot5 =	[$attack5, player_shot6	] {self.weaponframe=5;};
void()	player_shot6 =	[$attack6, player_shot7	] {self.weaponframe=6;};
void()	player_shot7 =	[$attack7, player_shot8	] {self.weaponframe=7;};
void()	player_shot8 =	[$attack8, player_run	] {self.weaponframe=8;};

// C4 grenade and knife

void()	player_throw1 =	[$attack1, player_throw2	] {self.weaponframe=1;};
void()	player_throw2 =	[$attack2, player_throw3	] {self.weaponframe=2;};
void()	player_throw3 =	[$attack3, player_throw4	] {self.weaponframe=3;};
void()	player_throw4 =	[$attack4, player_throw5	] {self.weaponframe=4;};
void()	player_throw5 =	[$attack5, player_throw6	] {self.weaponframe=5;};
void()	player_throw6 =	[$attack6, player_throw7	] {self.weaponframe=6;};
void()	player_throw7=	[$attack7, player_throw8	] {self.weaponframe=7;};
void()	player_throw8 =	[$attack8, player_throw9	] {self.weaponframe=8;};
void()	player_throw9 =	[$attack1, player_throw10     ] {self.weaponframe=9;};
void()	player_throw10 =	[$attack2, player_throw11     ] {self.weaponframe=10;W_FireGranate();};
void()	player_throw11 =	[$attack3, player_run	      ] {self.weaponframe=11;};

void()	player_crthrow1 =	[$crattack1, player_crthrow2	] {self.weaponframe=1;};
void()	player_crthrow2 =	[$crattack2, player_crthrow3	] {self.weaponframe=2;};
void()	player_crthrow3 =	[$crattack3, player_crthrow4	] {self.weaponframe=3;};
void()	player_crthrow4 =	[$crattack4, player_crthrow5	] {self.weaponframe=4;};
void()	player_crthrow5 =	[$crattack5, player_crthrow6	] {self.weaponframe=5;};
void()	player_crthrow6 =	[$crattack6, player_crthrow7	] {self.weaponframe=6;};
void()	player_crthrow7=	[$crattack7, player_crthrow8	] {self.weaponframe=7;};
void()	player_crthrow8 =	[$crattack8, player_crthrow9	] {self.weaponframe=8;};
void()	player_crthrow9 =	[$crattack1, player_crthrow10   ] {self.weaponframe=9;};
void()	player_crthrow10 =[$crattack2, player_crthrow11   ] {self.weaponframe=10;};
void()	player_crthrow11 =[$crattack3, player_crrun     ] {self.weaponframe=11;};


void()	player_axen1 =	[$attack1, player_axen2	] {self.weaponframe=1;};
void()	player_axen2 =	[$attack2, player_axen3	] {self.weaponframe=2;};
void()	player_axen3 =	[$attack3, player_axen4	] {self.weaponframe=3;W_FireAxe();};
void()	player_axen4 =	[$attack4, player_axen5	] {self.weaponframe=4;};
void()	player_axen5 =	[$attack5, player_axen6	] {self.weaponframe=5;};
void()	player_axen6 =	[$attack6, player_axen7	] {self.weaponframe=6;};
void()	player_axen7 =	[$attack7, player_axen8	] {self.weaponframe=7;};
void()	player_axen8 =	[$attack8, player_run	] {self.weaponframe=8;};

void()	player_craxen1 =	[$crattack1, player_craxen2	] {self.weaponframe=1;};
void()	player_craxen2 =	[$crattack2, player_craxen3	] {self.weaponframe=2;};
void()	player_craxen3 =	[$crattack3, player_craxen4	] {self.weaponframe=3;W_FireAxe();};
void()	player_craxen4 =	[$crattack4, player_craxen5	] {self.weaponframe=4;};
void()	player_craxen5 =	[$crattack5, player_craxen6	] {self.weaponframe=5;};
void()	player_craxen6 =	[$crattack6, player_craxen7	] {self.weaponframe=6;};
void()	player_craxen7 =	[$crattack7, player_craxen8	] {self.weaponframe=7;};
void()	player_craxen8 =	[$crattack8, player_run 	] {self.weaponframe=8;};

//C4 grenade and knife End


//NEW WEAPON SHOT ANIMATIONS + CR Sh00t


void()	player_f1 =	[$run1, player_f2 	] {self.weaponframe=1;};
void()	player_f2 =	[$run2, player_f3 	] {self.weaponframe=2;};
void()	player_f3 =	[$run3, player_f4 	]{};
void()	player_f4 =	[$run4, player_f5 	]{};
void()	player_f5 =	[$run5, player_f6 	]{};
void()	player_f6 =	[$run6, player_run 	]{};

void()	player_crf1 =	[$crattack1, player_crf2	] {self.weaponframe=1;};
void()	player_crf2 =	[$crattack2, player_crrun	] {self.weaponframe=2;};

//Silenced Shot & Silenced Shoot Crouch M4A1

void()	player_sf1 =	[$run1, player_sf2	] {self.weaponframe=15;};
void()	player_sf2 =	[$run2, player_run	] {self.weaponframe=16;};

void()	player_scrf1 =	[$crattack1, player_scrf2	] {self.weaponframe=15;};
void()	player_scrf2 =	[$crattack2, player_crrun	] {self.weaponframe=16;};


//Elite Shot

void()	player_fi1 =	[$attack1, player_fi2	] {self.weaponframe=1;};
void()	player_fi2 =	[$attack1, player_fi3	] {self.weaponframe=2;};
void()	player_fi3 =	[$attack1, player_fi4	] {self.weaponframe=3;};
void()	player_fi4 =	[$attack1, player_fi5	] {self.weaponframe=4;};
void()	player_fi5 =	[$attack2, player_run	] {self.weaponframe=5;};

void()	player_crfi1 =	[$crattack1, player_crfi2	] {self.weaponframe=1;};
void()	player_crfi2 =	[$crattack1, player_crfi3	] {self.weaponframe=2;};
void()	player_crfi3 =	[$crattack1, player_crfi4	] {self.weaponframe=3;};
void()	player_crfi4 =	[$crattack1, player_crfi5	] {self.weaponframe=4;};
void()	player_crfi5 =	[$crattack2, player_run	      ] {self.weaponframe=5;};

//Elite Shoot 2

void()	player_fir1 =	[$attack1, player_fir2	] {self.weaponframe=5;};
void()	player_fir2 =	[$attack1, player_fir3	] {self.weaponframe=6;};
void()	player_fir3 =	[$attack1, player_fir4	] {self.weaponframe=7;};
void()	player_fir4 =	[$attack1, player_fir5	] {self.weaponframe=8;};
void()	player_fir5 =	[$attack2, player_run	] {self.weaponframe=9;};

void()	player_crfir1 =	[$crattack1, player_crfir2	] {self.weaponframe=5;};
void()	player_crfir2 =	[$crattack1, player_crfir3	] {self.weaponframe=6;};
void()	player_crfir3 =	[$crattack1, player_crfir4	] {self.weaponframe=7;};
void()	player_crfir4 =	[$crattack1, player_crfir5	] {self.weaponframe=8;};
void()	player_crfir5 =	[$crattack2, player_run	      ] {self.weaponframe=9;};

//M3 Fire

void()	player_shotpump1 =	[$attack1, player_shotpump2	] {self.weaponframe=1;};
void()	player_shotpump2 =	[$attack1, player_shotpump3	] {self.weaponframe=2;};
void()	player_shotpump3 =	[$attack1, player_shotpump4	] {self.weaponframe=3;};
void()	player_shotpump4 =	[$attack1, player_shotpump5	] {self.weaponframe=4;};
void()	player_shotpump5 =	[$attack1, player_shotpump6	] {self.weaponframe=5;};
void()	player_shotpump6 =	[$attack1, player_shotpump7	] {self.weaponframe=6;};
void()	player_shotpump7 =	[$attack1, player_shotpump8	] {self.weaponframe=7;};
void()	player_shotpump8 =	[$attack1, player_shotpump9	] {self.weaponframe=8;};
void()	player_shotpump9 =	[$attack1, player_shotpump10	] {self.weaponframe=9;};
void()	player_shotpump10 =	[$attack2, player_run	      ] {self.weaponframe=10;};


//M3 Reload


void()	player_reloadx1	=	[	$attack1,	player_reloadx2	] {self.weaponframe=11;};
void()	player_reloadx2	=	[	$attack2,	player_reloadx3	] {self.weaponframe=12;};
void()	player_reloadx3	=	[	$attack1,	player_reloadx4	] {self.weaponframe=13;};
void()	player_reloadx4	=	[	$attack2,	player_reloadx5	] {self.weaponframe=14;};
void()	player_reloadx5	=	[	$attack1,	player_reloadx6	] {self.weaponframe=15;};
void()	player_reloadx6	=	[	$attack2,	player_reloadx7	] {self.weaponframe=16;};
void()	player_reloadx7	=	[	$attack1,	player_reloadx8	] {self.weaponframe=17;};
void()	player_reloadx8	=	[	$attack2,	player_reloadx9	] {self.weaponframe=18;};
void()	player_reloadx9	=	[	$attack1,	player_reloadx10	] {self.weaponframe=19;};
void()	player_reloadx10	=	[	$attack2,	player_reloadx11	] {self.weaponframe=20;};
void()	player_reloadx11	=	[	$attack1,	player_reloadx12	] {self.weaponframe=21;};
void()	player_reloadx12	=	[	$attack2,	player_reloadx13	] {self.weaponframe=22;};
void()	player_reloadx13	=	[	$attack1,	player_reloadx14	] {self.weaponframe=23;};
void()	player_reloadx14	=	[	$attack2,	player_reloadx15	] {self.weaponframe=24;};
void()	player_reloadx15	=	[	$attack1,	player_reloadx16	] {self.weaponframe=25;};
void()	player_reloadx16	=	[	$attack2,	player_reloadx17	] {self.weaponframe=26;};

//NEW WEAPON SHOOT ANIMATIONS  END

// RELOAD ANIMATIONS

//Deagle,p228, usp
void()	player_reload1 =	[$stand1, player_reload2	] {self.weaponframe=5;};
void()	player_reload2 =	[$stand2, player_reload3	] {self.weaponframe=6;};
void()	player_reload3 =	[$stand3, player_reload4	] {self.weaponframe=7;};
void()	player_reload4 =	[$stand4, player_reload5	] {self.weaponframe=8;};
void()	player_reload5 =	[$stand5, player_reload6	] {self.weaponframe=9;};
void()	player_reload6 =	[$stand6, player_reload7	] {self.weaponframe=10;};
void()	player_reload7=	[$stand7, player_reload8	] {self.weaponframe=11;};
void()	player_reload8 =	[$stand8, player_reload9	] {self.weaponframe=12;};
void()	player_reload9 =	[$stand10, player_run	      ] {self.weaponframe=13;};

//M4a1, ak47, g3sg1, galil,usp
void()	player_reloada1 =	[$stand1, player_reloada2	] {self.weaponframe=4;};
void()	player_reloada2 =	[$stand2, player_reloada3	] {self.weaponframe=5;};
void()	player_reloada3 =	[$stand3, player_reloada4	] {self.weaponframe=6;};
void()	player_reloada4 =	[$stand4, player_reloada5	] {self.weaponframe=7;};
void()	player_reloada5 =	[$stand5, player_reloada6	] {self.weaponframe=8;};
void()	player_reloada6 =	[$stand6, player_reloada7	] {self.weaponframe=9;};
void()	player_reloada7=	[$stand7, player_reloada8	] {self.weaponframe=10;};
void()	player_reloada8 =	[$stand8, player_reloada9	] {self.weaponframe=11;};
void()	player_reloada9 =	[$stand9, player_reloada10	] {self.weaponframe=12;};
void()	player_reloada10 =[$stand10, player_reloada11	] {self.weaponframe=13;};
void()	player_reloada11 =[$stand11, player_run	      ] {self.weaponframe=14;};

void()	player_reloadz1 =	[$stand1, player_reloadz2	] {self.weaponframe=6;};
void()	player_reloadz2 =	[$stand2, player_reloadz3	] {self.weaponframe=7;};
void()	player_reloadz3 =	[$stand3, player_reloadz4	] {self.weaponframe=8;};
void()	player_reloadz4 =	[$stand4, player_reloadz5	] {self.weaponframe=9;};
void()	player_reloadz5 =	[$stand5, player_reloadz6	] {self.weaponframe=10;};
void()	player_reloadz6 =	[$stand6, player_reloadz7	] {self.weaponframe=11;};
void()	player_reloadz7=	[$stand7, player_reloadz8	] {self.weaponframe=12;};
void()	player_reloadz8 =	[$stand8, player_reloadz9	] {self.weaponframe=13;};
void()	player_reloadz9 =	[$stand9, player_reloadz10	] {self.weaponframe=14;};
void()	player_reloadz10 =[$stand10, player_reloadz11	] {self.weaponframe=15;};
void()	player_reloadz11 =[$stand4, player_reloadz12	] {self.weaponframe=16;};
void()	player_reloadz12 =[$stand5, player_reloadz13	] {self.weaponframe=17;};
void()	player_reloadz13 =[$stand6, player_reloadz14	] {self.weaponframe=18;};
void()	player_reloadz14=	[$stand7, player_reloadz15	] {self.weaponframe=19;};
void()	player_reloadz15 =[$stand8, player_reloadz16	] {self.weaponframe=20;};
void()	player_reloadz16 =[$stand9, player_reloadz17    ] {self.weaponframe=21;};
void()	player_reloadz17 =[$stand10, player_reloadz18	] {self.weaponframe=22;};
void()	player_reloadz18 =[$stand4, player_reloadz19	] {self.weaponframe=23;};
void()	player_reloadz19 =[$stand5, player_reloadz20	] {self.weaponframe=24;};
void()	player_reloadz20 =[$stand6, player_reloadz21	] {self.weaponframe=25;};
void()	player_reloadz21=	[$stand7, player_reloadz22	] {self.weaponframe=26;};
void()	player_reloadz22 =[$stand8, player_reloadz23	] {self.weaponframe=27;};
void()	player_reloadz23 =[$stand9, player_reloadz24	] {self.weaponframe=28;};
void()	player_reloadz24 =[$stand10, player_reloadz25	] {self.weaponframe=29;};
void()	player_reloadz25 =[$stand10, player_reloadz26	] {self.weaponframe=30;};
void()	player_reloadz26 =[$stand11, player_run	      ] {self.weaponframe=31;};

//M4a1 & USP Silenced Reload
void()	player_sreloada1 =	[$stand1, player_sreloada2	] {self.weaponframe=18;};
void()	player_sreloada2 =	[$stand2, player_sreloada3	] {self.weaponframe=19;};
void()	player_sreloada3 =	[$stand3, player_sreloada4	] {self.weaponframe=20;};
void()	player_sreloada4 =	[$stand4, player_sreloada5	] {self.weaponframe=21;};
void()	player_sreloada5 =	[$stand5, player_sreloada6	] {self.weaponframe=22;};
void()	player_sreloada6 =	[$stand6, player_sreloada7	] {self.weaponframe=23;};
void()	player_sreloada7 =	[$stand7, player_sreloada8	] {self.weaponframe=24;};
void()	player_sreloada8 =	[$stand8, player_sreloada9	] {self.weaponframe=25;};
void()	player_sreloada9 =	[$stand9, player_sreloada10	] {self.weaponframe=26;};
void()	player_sreloada10 =     [$stand10, player_sreloada11	] {self.weaponframe=27;};
void()	player_sreloada11 =     [$stand11, player_run	      ] {self.weaponframe=28;};

//AUG, AWP, Mac10, Mp5, p90
void()	player_reloadb1 =	[$stand1, player_reloadb2	] {self.weaponframe=4;};
void()	player_reloadb2 =	[$stand2, player_reloadb3	] {self.weaponframe=5;};
void()	player_reloadb3 =	[$stand3, player_reloadb4	] {self.weaponframe=6;};
void()	player_reloadb4 =	[$stand4, player_reloadb5	] {self.weaponframe=7;};
void()	player_reloadb5 =	[$stand5, player_reloadb6	] {self.weaponframe=8;};
void()	player_reloadb6 =	[$stand6, player_reloadb7	] {self.weaponframe=9;};
void()	player_reloadb7=	[$stand7, player_reloadb8	] {self.weaponframe=10;};
void()	player_reloadb8 =	[$stand8, player_reloadb9	] {self.weaponframe=11;};
void()	player_reloadb9 =	[$stand9, player_reloadb10	] {self.weaponframe=12;};
void()	player_reloadb10 =[$stand10, player_reloadb11	] {self.weaponframe=13;};
void()	player_reloadb11 =[$stand11, player_reloadb12	] {self.weaponframe=14;};
void()	player_reloadb12 =[$stand12, player_reloadb13	] {self.weaponframe=15;};
void()	player_reloadb13 =[$stand13, player_reloadb14	] {self.weaponframe=16;};
void()	player_reloadb14 =[$stand14, player_run	      ] {self.weaponframe=17;};

//M249, FAMAS
void()	player_reloadc1 =	[$stand1, player_reloadc2	] {self.weaponframe=4;};
void()	player_reloadc2 =	[$stand2, player_reloadc3	] {self.weaponframe=5;};
void()	player_reloadc3 =	[$stand3, player_reloadc4	] {self.weaponframe=6;};
void()	player_reloadc4 =	[$stand4, player_reloadc5	] {self.weaponframe=7;};
void()	player_reloadc5 =	[$stand5, player_reloadc6	] {self.weaponframe=8;};
void()	player_reloadc6 =	[$stand6, player_reloadc7	] {self.weaponframe=9;};
void()	player_reloadc7=	[$stand7, player_reloadc8	] {self.weaponframe=10;};
void()	player_reloadc8 =	[$stand8, player_reloadc9	] {self.weaponframe=11;};
void()	player_reloadc9 =	[$stand9, player_reloadc10	] {self.weaponframe=12;};
void()	player_reloadc10 =[$stand10, player_reloadc11	] {self.weaponframe=13;};
void()	player_reloadc11 =[$stand11, player_reloadc12	] {self.weaponframe=14;};
void()	player_reloadc12 =[$stand12, player_reloadc13	] {self.weaponframe=15;};
void()	player_reloadc13 =[$stand13, player_reloadc14	] {self.weaponframe=16;};
void()	player_reloadc14 =[$stand14, player_reloadc15	] {self.weaponframe=17;};
void()	player_reloadc15 =[$stand15, player_reloadc16	] {self.weaponframe=18;};
void()	player_reloadc16 =[$stand16, player_reloadc17	] {self.weaponframe=19;};
void()	player_reloadc17 =[$stand17, player_reloadc18	] {self.weaponframe=20;};
void()	player_reloadc18 =[$stand19, player_run	      ] {self.weaponframe=21;};


//Fiveseven
void()	player_reloade1 =	[$stand1, player_reloade2	] {self.weaponframe=3;};
void()	player_reloade2 =	[$stand2, player_reloade3	] {self.weaponframe=4;};
void()	player_reloade3 =	[$stand3, player_reloade4	] {self.weaponframe=5;};
void()	player_reloade4 =	[$stand4, player_reloade5	] {self.weaponframe=6;};
void()	player_reloade5 =	[$stand5, player_reloade6	] {self.weaponframe=7;};
void()	player_reloade6 =	[$stand6, player_reloade7	] {self.weaponframe=8;};
void()	player_reloade7 =[$stand8, player_run	      ] {self.weaponframe=9;};

//P228
void()	player_reloadg1 =	[$stand1, player_reloadg2	] {self.weaponframe=3;};
void()	player_reloadg2 =	[$stand2, player_reloadg3	] {self.weaponframe=4;};
void()	player_reloadg3 =	[$stand3, player_reloadg4	] {self.weaponframe=5;};
void()	player_reloadg4 =	[$stand4, player_reloadg5	] {self.weaponframe=6;};
void()	player_reloadg5 =	[$stand5, player_reloadg6	] {self.weaponframe=7;};
void()	player_reloadg6 =	[$stand6, player_reloadg7	] {self.weaponframe=8;};
void()	player_reloadg7=	[$stand7, player_reloadg8	] {self.weaponframe=9;};
void()	player_reloadg8=	[$stand7, player_reloadg9	] {self.weaponframe=10;};
void()	player_reloadg9=	[$stand7, player_reloadg10	] {self.weaponframe=11;};
void()	player_reloadg10 =[$stand8, player_run	      ] {self.weaponframe=12;};

//Glock
void()	player_reloadf1 =	[$stand3, player_reloadf2	] {self.weaponframe=4;};
void()	player_reloadf2 =	[$stand4, player_reloadf3	] {self.weaponframe=5;};
void()	player_reloadf3 =	[$stand5, player_reloadf4	] {self.weaponframe=6;};
void()	player_reloadf4 =	[$stand6, player_reloadf5	] {self.weaponframe=7;};
void()	player_reloadf5=	[$stand7, player_reloadf6	] {self.weaponframe=8;};
void()	player_reloadf6 =	[$stand8, player_reloadf7	] {self.weaponframe=9;};
void()	player_reloadf7 =	[$stand9, player_reloadf8     ] {self.weaponframe=10;};
void()	player_reloadf8 =[$stand10, player_reloadf9	] {self.weaponframe=11;};
void()	player_reloadf9=[$stand11, player_reloadf10	] {self.weaponframe=12;};
void()	player_reloadf10 =[$stand12, player_reloadf11	] {self.weaponframe=13;};
void()	player_reloadf11 =[$stand13, player_reloadf12	] {self.weaponframe=14;};
void()	player_reloadf12 =[$stand14, player_reloadf13   ] {self.weaponframe=15;};
void()	player_reloadf13 =[$stand15, player_run	      ] {self.weaponframe=16;};

//AWP
void()	player_reloadh1 =	[$stand3, player_reloadh2	] {self.weaponframe=4;};
void()	player_reloadh2 =	[$stand4, player_reloadh3	] {self.weaponframe=5;};
void()	player_reloadh3 =	[$stand5, player_reloadh4	] {self.weaponframe=6;};
void()	player_reloadh4 =	[$stand6, player_reloadh5	] {self.weaponframe=7;};
void()	player_reloadh5=	[$stand7, player_reloadh6	] {self.weaponframe=8;};
void()	player_reloadh6 =	[$stand8, player_reloadh7	] {self.weaponframe=9;};
void()	player_reloadh7 =	[$stand9, player_reloadh8     ] {self.weaponframe=10;};
void()	player_reloadh8 =[$stand10, player_reloadh9	] {self.weaponframe=11;};
void()	player_reloadh9 =[$stand11, player_reloadh10	] {self.weaponframe=12;};
void()	player_reloadh10 =[$stand12, player_reloadh11	] {self.weaponframe=13;};
void()	player_reloadh11 =[$stand13, player_reloadh12	] {self.weaponframe=14;};
void()	player_reloadh12 =[$stand15, player_run	      ] {self.weaponframe=15;};

//Elite
void()	player_reloadk1 =	[$stand1, player_reloadc2	] {self.weaponframe=10;};
void()	player_reloadk2 =	[$stand2, player_reloadc3	] {self.weaponframe=11;};
void()	player_reloadk3 =	[$stand3, player_reloadc4	] {self.weaponframe=12;};
void()	player_reloadk4 =	[$stand4, player_reloadc5	] {self.weaponframe=13;};
void()	player_reloadk5 =	[$stand5, player_reloadc6	] {self.weaponframe=14;};
void()	player_reloadk6 =	[$stand6, player_reloadc7	] {self.weaponframe=15;};
void()	player_reloadk7=	[$stand7, player_reloadc8	] {self.weaponframe=16;};
void()	player_reloadk8 =	[$stand8, player_reloadc9	] {self.weaponframe=17;};
void()	player_reloadk9 =	[$stand9, player_reloadc10	] {self.weaponframe=18;};
void()	player_reloadk10 =[$stand10, player_reloadc11	] {self.weaponframe=19;};
void()	player_reloadk11 =[$stand11, player_reloadc12	] {self.weaponframe=20;};
void()	player_reloadk12 =[$stand12, player_reloadc13	] {self.weaponframe=21;};
void()	player_reloadk13 =[$stand13, player_reloadc14	] {self.weaponframe=22;};
void()	player_reloadk14 =[$stand14, player_reloadc15	] {self.weaponframe=23;};
void()	player_reloadk15 =[$stand15, player_reloadc16	] {self.weaponframe=24;};
void()	player_reloadk16 =[$stand16, player_reloadc17	] {self.weaponframe=25;};
void()	player_reloadk17 =[$stand17, player_reloadc18	] {self.weaponframe=26;};
void()	player_reloadk18 =[$stand18, player_reloadc19	] {self.weaponframe=27;};
void()	player_reloadk19 =[$stand19, player_run	      ] {self.weaponframe=28;};

// RELOAD ANIMATIONS END

//Crouch attack
void() player_crattack1 = [$crattack1, player_crattack2 ] {self.weaponframe = 1;
self.effects = self.effects | EF_MUZZLEFLASH;};
void() player_crattack2 = [$crattack2, player_crattack3 ] {self.weaponframe = 2;};
void() player_crattack3 = [$crattack3, player_crattack4 ] {self.weaponframe = 3;};
void() player_crattack4 = [$crattack4, player_crattack5 ] {self.weaponframe = 4;};
void() player_crattack5 = [$crattack5, player_crattack6 ] {self.weaponframe = 5;};
void() player_crattack6 = [$crattack6, player_crattack7 ] {self.weaponframe = 6;};
void() player_crattack7 = [$crattack7, player_crattack8 ] {self.weaponframe = 7;};
void() player_crattack8 = [$crattack8, player_crattack9 ] {self.weaponframe = 8;};
void() player_crattack9 = [$crattack9, player_crrun ] {self.weaponframe = 9;};



void() player_rocket1   =[$attack1, player_rocket2  ] {self.weaponframe=1;
self.effects = self.effects | EF_MUZZLEFLASH;};
void() player_rocket2   =[$attack2, player_rocket3  ] {self.weaponframe=2;};
void() player_rocket3   =[$attack3, player_rocket4  ] {self.weaponframe=3;};
void() player_rocket4   =[$attack4, player_rocket5  ] {self.weaponframe=4;};
void() player_rocket5   =[$attack5, player_rocket6  ] {self.weaponframe=5;};
void() player_rocket6   =[$attack6, player_rocket7  ] {self.weaponframe=6;};
void() player_rocket7   =[$attack7, player_rocket8  ] {self.weaponframe=7;};
void() player_rocket8   =[$attack8, player_run  ] {self.weaponframe=8;};

void(float num_bubbles) DeathBubbles;

void() PainSound =
{
local float		rs;

	if (self.health < 0)
		return;

	if (damage_attacker.classname == "teledeath")
	{
		sound (self, CHAN_VOICE, "player/teledth1.wav", 1, ATTN_NONE);
		return;
	}

// water pain sounds
	if (self.watertype == CONTENT_WATER && self.waterlevel == 3)
	{
		DeathBubbles(1);
		if (random() > 0.5)
			sound (self, CHAN_VOICE, "player/drown1.wav", 1, ATTN_NORM);
		else
			sound (self, CHAN_VOICE, "player/drown2.wav", 1, ATTN_NORM);
		return;
	}

// slime pain sounds
	if (self.watertype == CONTENT_SLIME)
	{
// FIX ME	put in some steam here
		if (random() > 0.5)
			sound (self, CHAN_VOICE, "player/lburn1.wav", 1, ATTN_NORM);
		else
			sound (self, CHAN_VOICE, "player/lburn2.wav", 1, ATTN_NORM);
		return;
	}

	if (self.watertype == CONTENT_LAVA)
	{
		if (random() > 0.5)
			sound (self, CHAN_VOICE, "player/lburn1.wav", 1, ATTN_NORM);
		else
			sound (self, CHAN_VOICE, "player/lburn2.wav", 1, ATTN_NORM);
		return;
	}

	if (self.pain_finished > time)
	{
		self.axhitme = 0;
		return;
	}
	self.pain_finished = time + 0.5;

// don't make multiple pain sounds right after each other

// ax pain sound
	if (self.axhitme == 1)
	{
		self.axhitme = 0;
		sound (self, CHAN_VOICE, "player/axhit1.wav", 1, ATTN_NORM);
		return;
	}
	

	rs = rint((random() * 5) + 1);

	self.noise = "";
	if (rs == 1)
		self.noise = "player/pain1.wav";
	else if (rs == 2)
		self.noise = "player/pain2.wav";
	else if (rs == 3)
		self.noise = "player/pain3.wav";
	else if (rs == 4)
		self.noise = "player/pain4.wav";
	else if (rs == 5)
		self.noise = "player/pain5.wav";
	else
		self.noise = "player/pain6.wav";
	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
	return;
};

void()	player_pain1 =	[	$pain1,	player_pain2	] {PainSound();self.weaponframe=0;};
void()	player_pain2 =	[	$pain2,	player_pain3	] {};
void()	player_pain3 =	[	$pain3,	player_pain4	] {};
void()	player_pain4 =	[	$pain4,	player_run	] {};

void()	player_painb1 =	[	$pain5,	player_painb2	] {PainSound();self.weaponframe=0;};
void()	player_painb2 =	[	$pain6,	player_painb3	] {};
void()	player_painb3 =	[	$pain7,	player_painb4	] {};
void()	player_painb4 =	[	$pain8,	player_run	] {};

void()	player_painc1 =	[	$pain9,	player_painc2	] {PainSound();self.weaponframe=0;};
void()	player_painc2 =	[	$pain10,	player_painc3	] {};
void()	player_painc3 =	[	$pain11,	player_painc4	] {};
void()	player_painc4 =	[	$pain12,	player_run	] {};

//Crouch pain

void()	player_crpain1 =	[	$crpain1,	player_crpain2	] {PainSound();self.weaponframe=0;};
void()	player_crpain2 =	[	$crpain2,	player_crpain3	] {};
void()	player_crpain3 =	[	$crpain3,	player_crpain4	] {};
void()	player_crpain4 =	[	$crpain4,	player_crrun	] {};



void() player_pain =
{
local float		i;

	if (self.weaponframe)
		return;

	if (self.invisible_finished > time)
		return;		// eyes don't have pain frames

	/*
	if (random() < 1)
		player_painb1();
	else if (random() < 0.6)
		player_painc1();
	else
		player_pain1();
	*/
	i = cvar("temp1");
	if (!i)
		i = 1 + floor(random()*4);
	
	if (self.duck == 1)	//if I'm croucing
	player_crpain1();		//show crouch pain frames
	else if (i == 1)
		player_pain1();
	else if (i == 2)
		player_painb1();
	else 
		player_painc1();

PainSound ();
};


void() player_diea1;
void() player_dieb1;
void() player_diec1;

void() DeathBubblesSpawn =
{
local entity	bubble;
	if (self.owner.waterlevel != 3)
		return;
	bubble = spawn();
	setmodel (bubble, "sprites/s_bubble.spr");
	setorigin (bubble, self.owner.origin + '0 0 24');
	bubble.movetype = MOVETYPE_NOCLIP;
	bubble.solid = SOLID_NOT;
	bubble.velocity = '0 0 15';
	bubble.nextthink = time + 0.5;
	bubble.think = bubble_bob;
	bubble.classname = "bubble";
	bubble.frame = 0;
	bubble.cnt = 0;
	setsize (bubble, '-8 -8 -8', '8 8 8');
	self.nextthink = time + 0.1;
	self.think = DeathBubblesSpawn;
	self.air_finished = self.air_finished + 1;
	if (self.air_finished >= self.bubble_count)
		remove(self);
};

void(float num_bubbles) DeathBubbles =
{
local entity	bubble_spawner;
	
	bubble_spawner = spawn();
	setorigin (bubble_spawner, self.origin);
	bubble_spawner.movetype = MOVETYPE_NONE;
	bubble_spawner.solid = SOLID_NOT;
	bubble_spawner.nextthink = time + 0.1;
	bubble_spawner.think = DeathBubblesSpawn;
	bubble_spawner.air_finished = 0;
	bubble_spawner.owner = self;
	bubble_spawner.bubble_count = num_bubbles;
	return;
};


void() DeathSound =
{
local float		rs;

	// water death sounds
	if (self.waterlevel == 3)
	{
		DeathBubbles(20);
		sound (self, CHAN_VOICE, "player/h2odeath.wav", 1, ATTN_NONE);
		return;
	}
	
	rs = rint ((random() * 4) + 1);
	if (rs == 1)
		self.noise = "player/death/death1.wav";
	if (rs == 2)
		self.noise = "player/death/death2.wav";
	if (rs == 3)
		self.noise = "player/death/death3.wav";
	if (rs == 4)
		self.noise = "player/death/death4.wav";
	if (rs == 5)
		self.noise = "player/death/death5.wav";
VoicesDie ();

	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NONE);
	return;
};

void() PlayerDead =
{
		//player_diea1();
	self.nextthink = -1;
// allow respawn after a certain time
	self.movetype = MOVETYPE_TOSS;
	self.deadflag = DEAD_DEAD;
};

vector(float dm) VelocityForDamage =
{
	local vector v;

	v_x = 100 * crandom();
	v_y = 100 * crandom();
	v_z = 200 + 100 * random();

	if (dm > -50)
	{
//		dprint ("level 1\n");
		v = v * 0.7;
	}
	else if (dm > -200)
	{
//		dprint ("level 3\n");
		v = v * 2;
	}
	else
		v = v * 10;

	return v;
};




void() PlayerDie =
{
local float i;
	
	self.items = self.items - (self.items & IT_INVISIBILITY);
	self.invisible_finished = 0;	// don't die as eyes
	self.invincible_finished = 0;
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.modelindex = modelindex_player;	// don't use eyes

	if (deathmatch || coop)
		DropBackpack();
	
	self.weaponmodel="";
	self.view_ofs = '0 0 -8';
	self.deadflag = DEAD_DYING;
	self.solid = SOLID_NOT;


	//self.flags = self.flags - (self.flags & FL_ONGROUND);
      self.flags = self.flags - (self.flags & FL_FLY);
	self.movetype = MOVETYPE_BOUNCE;
	if (self.velocity_z < 10)
		self.velocity_z = self.velocity_z + random()*300;


	DeathSound();

//	self.spreecount = 0;		//Koolio, spree count reset to 0
//	self.spree = 0;			//Koolio, spree is reset
	
	self.angles_x = 0;
	self.angles_z = 0;
	
	//if (self.weapon == IT_AXE)
	//{
	//	player_die_ax1 ();
	//	return;
	//}



	i = cvar("temp1");
	if (!i)
		i = 1 + floor(random()*4);
	
	if (i == 1)
		player_diea1();
	else if (i == 2)
		player_dieb1();
	else
		player_diec1();

};

void() set_suicide_frame =
{	// used by kill command and disconnect command <-- Koolio, fixed typo's =)

	self.frame = $death6;
	self.solid = SOLID_NOT;
	self.movetype = MOVETYPE_TOSS;
	self.deadflag = DEAD_DEAD;
	self.nextthink = -1;
};


void()	player_diea1	=	[	$death1,	player_diea2	] {};
void()	player_diea2	=	[	$death2,	player_diea3	] {};
void()	player_diea3	=	[	$death3,	player_diea4	] {};
void()	player_diea4	=	[	$death4,	player_diea5	] {};
void()	player_diea5	=	[	$death5,	player_diea6	] {};
void()	player_diea6	=	[	$death6,	player_diea6	] {PlayerDead();};

void()	player_dieb1	=	[	$death7,	player_dieb2	] {};
void()	player_dieb2	=	[	$death8,	player_dieb3	] {};
void()	player_dieb3	=	[	$death9,	player_dieb4	] {};
void()	player_dieb4	=	[	$death10,	player_dieb5	] {};
void()	player_dieb5	=	[	$death11,	player_dieb6	] {};
void()	player_dieb6	=	[	$death12,	player_dieb6	] {PlayerDead();};

void()	player_diec1	=	[	$death13,	player_diec2	] {};
void()	player_diec2	=	[	$death14,	player_diec3	] {};
void()	player_diec3	=	[	$death15,	player_diec4	] {};
void()	player_diec4	=	[	$death16,	player_diec5	] {};
void()	player_diec5	=	[	$death17,	player_diec6	] {};
void()	player_diec6	=	[	$death18,	player_diec7	] {};
void()	player_diec7	=	[	$death19,	player_diec8	] {};
void()	player_diec8	=	[	$death20,	player_diec8	] {PlayerDead();};

//============================================================================
//		Player Taunts, Flipoffs etc
//============================================================================

// Flipoff
void() 	player_flipoff1		=	[	$flip1, player_flipoff2		] {};	
void() 	player_flipoff2		=	[	$flip2, player_flipoff3		] {};	
void() 	player_flipoff3		=	[	$flip3, player_flipoff4		] {};	
void() 	player_flipoff4		=	[	$flip4, player_flipoff5		] {};	
void() 	player_flipoff5		=	[	$flip5, player_flipoff6		] {};	
void() 	player_flipoff6		=	[	$flip6, player_flipoff7		] {};	
void() 	player_flipoff7		=	[	$flip7, player_flipoff8		] {};	
void() 	player_flipoff8		=	[	$flip8, player_flipoff9		] {};	
void() 	player_flipoff9		=	[	$flip9, player_flipoff10	] {};	
void() 	player_flipoff10		=	[	$flip10, player_flipoff11	] {};	
void() 	player_flipoff11		=	[	$flip11, player_flipoff12	] {};	
void() 	player_flipoff12		=	[	$flip12, player_run		] {};	

// Salute
void() 	player_salute1		=	[	$salute1, player_salute2		] {};	
void() 	player_salute2		=	[	$salute2, player_salute3		] {};	
void() 	player_salute3		=	[	$salute3, player_salute4		] {};	
void() 	player_salute4		=	[	$salute4, player_salute5		] {};	
void() 	player_salute5		=	[	$salute5, player_salute6		] {};	
void() 	player_salute6		=	[	$salute6, player_salute7		] {};	
void() 	player_salute7		=	[	$salute7, player_salute8		] {};	
void() 	player_salute8		=	[	$salute8, player_salute9		] {};	
void() 	player_salute9		=	[	$salute9, player_salute10		] {};	
void() 	player_salute10		=	[	$salute10, player_salute11	] {};	
void() 	player_salute11		=	[	$salute11, player_run		] {};	

// Taunt
void() 	player_taunt1		=	[	$taunt1, player_taunt2		] {};	
void() 	player_taunt2		=	[	$taunt2, player_taunt3		] {};	
void() 	player_taunt3		=	[	$taunt3, player_taunt4		] {};	
void() 	player_taunt4		=	[	$taunt4, player_taunt5		] {};	
void() 	player_taunt5		=	[	$taunt5, player_taunt6		] {};	
void() 	player_taunt6		=	[	$taunt6, player_taunt7		] {};	
void() 	player_taunt7		=	[	$taunt7, player_taunt8		] {};	
void() 	player_taunt8		=	[	$taunt8, player_taunt9		] {};	
void() 	player_taunt9		=	[	$taunt9, player_taunt10		] {};	
void() 	player_taunt10		=	[	$taunt10, player_taunt11		] {};	
void() 	player_taunt11		=	[	$taunt11, player_taunt12		] {};	
void() 	player_taunt12		=	[	$taunt12, player_taunt13		] {};	
void() 	player_taunt13		=	[	$taunt13, player_taunt14		] {};	
void() 	player_taunt14		=	[	$taunt14, player_taunt15		] {};	
void() 	player_taunt15		=	[	$taunt15, player_taunt16		] {};	
void() 	player_taunt16		=	[	$taunt16, player_taunt17		] {};	
void() 	player_taunt17		=	[	$taunt17, player_run		] {};	

// Wave
void() 	player_wave1		=	[	$wave1, player_wave2		] {};	
void() 	player_wave2		=	[	$wave2, player_wave3		] {};	
void() 	player_wave3		=	[	$wave3, player_wave4		] {};	
void() 	player_wave4		=	[	$wave4, player_wave5		] {};	
void() 	player_wave5		=	[	$wave5, player_wave6		] {};	
void() 	player_wave6		=	[	$wave6, player_wave7		] {};	
void() 	player_wave7		=	[	$wave7, player_wave8		] {};	
void() 	player_wave8		=	[	$wave8, player_wave9		] {};	
void() 	player_wave9		=	[	$wave9, player_wave10		] {};	
void() 	player_wave10		=	[	$wave10, player_wave11	] {};	
void() 	player_wave11		=	[	$wave11, player_run		] {};	

// Point
void() 	player_point1		=	[	$point1, player_point2		] {};	
void() 	player_point2		=	[	$point2, player_point3		] {};	
void() 	player_point3		=	[	$point3, player_point4		] {};	
void() 	player_point4		=	[	$point4, player_point5		] {};	
void() 	player_point5		=	[	$point5, player_point6		] {};	
void() 	player_point6		=	[	$point6, player_point7		] {};	
void() 	player_point7		=	[	$point7, player_point8		] {};	
void() 	player_point8		=	[	$point8, player_point9		] {};	
void() 	player_point9		=	[	$point9, player_point10		] {};	
void() 	player_point10		=	[	$point10, player_point11		] {};	
void() 	player_point11		=	[	$point11, player_point12		] {};	
void() 	player_point12		=	[	$point11, player_run		] {};	

//============================================================================
//		Player Jumping and Landing
//============================================================================

void()	player_jump1		=     [    $jump1, player_jump2		] {};
void()	player_jump2		=     [    $jump1, player_jump3		] {};
void()	player_jump3		=     [    $jump2, player_jump4		] {};
void()	player_jump4		=     [    $jump2, player_jump5		] {};
void()	player_jump5		=     [    $jump3, player_jump6		] {};
void()	player_jump6		=     [    $jump3, player_run		      ] {};

void()	player_land1		=     [    $jump4, player_land2		] {};
void()	player_land2		=     [    $jump5, player_land3		] {};
void()	player_land3		=     [    $jump6, player_run			] {};