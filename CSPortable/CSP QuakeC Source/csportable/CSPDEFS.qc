float	IT_GLOCK          		= 128;
float	IT_M87            		= 129;
float	IT_USP            		= 130;
float	IT_MP5             		= 131;
float	IT_AK47            		= 132;
float	IT_M4A1            		= 133;
float	IT_M249           		= 134;
float	IT_P90            		= 135;
float	IT_C4             		= 136;
float	IT_AUG             		= 137;
float	IT_DEAGLE             		= 138;
float	IT_ELITE            		= 139;
float	IT_FAMAS            		= 140;
float	IT_GALIL            		= 141;
float	IT_P228            		= 142;
float	IT_MAC10            		= 143;
float	IT_G3SG1            		= 144;
float	IT_FIVESEVEN           		= 145;

float IT_9MM                        = 2000;
float IT_50CAL                      = 2001;
float IT_40ACP                      = 2002;
float IT_9MM2                       = 2003;
float IT_762                        = 2004;
float IT_556                        = 2005;
float IT_CAL12                        = 2006;
float IT_CAL122                        = 2007;
float IT_MG                          = 2008;
float IT_9MM3                          = 2009;
float IT_C4A                          = 2010;
float IT_5562                          = 2011;
float IT_50                         = 2012;
float IT_DUAL                         = 2013;
float IT_5563                         = 2014;
float IT_GAL                         = 2015;
float IT_MAC                         = 2016;
float IT_G3                         = 2017;
float IT_FS                         = 2018;
float IT_228                         = 2019;


.float semi; // CHP - Semiauto 
.float zoomlevel;
.vector camview;
.float ammo_9mm;
.float ammo_9mm2;
.float ammo_9mm3;
.float ammo_50cal;
.float ammo_50;
.float ammo_dual;
.float ammo_cal12;
.float ammo_cal122;
.float ammo_40acp;
.float ammo_mg;
.float ammo_gal;
.float ammo_mac;
.float ammo_228;
.float ammo_fs;
.float ammo_g3;
.float ammo_762;
.float ammo_556;
.float ammo_5562;
.float ammo_5563;
.float ammo_c4a;
.float semi;
.float bleed;
entity nullentity;  // system
entity bulletholes;  // system
entity lastbullet;  // system
float numbulletholes;  // system
float numshells;  // system
entity nullshell;  // system
entity bulletshells;  // system
entity lastshell;  // system
entity rocketmarks;  // system
entity lastmark;  // system
float numrocketmarks;  // system
.entity lastvictim;
float DAMAGE_NORMAL;
float CLASS_BSP = 8;
entity muzzle;
//float SVC_UPDATECOLORS = 17;
float CLASS_WEAPON_SPOT = 5;
entity item;
float HAND_GRENADES = 3; 
.float charge;
.string	cmd
.float duck;
.float zoom;
.float lrange;
.float sight_active;
.float deaths;
.float twin;
.float ctwin;
.float deaglebought;
.float glockbought;
.float uspbought;
.float elitebought;
.float fivesevenbought;
.float p228bought;
.float akbought;
.float augbought;
.float galilbought;
.float famasbought;
.float g3bought;
.float mp5bought;
.float p90bought;
.float m249bought;
.float m4a1bought;
.float awpbought;
.float m3bought;
.float xmbought;
.float mac10bought;
.float tticket;
.float ctticket;
.float headshot;
.float silenced;
.float flash_flag; 
.entity flash;   
.float ingamemenu;
.float splashy;
.float cansplash;
.float plantable;
.float buyable;
float BODYQUE_SIZE = 2;
.float total_ents;
float ESCORTING = 5;
.float sky;
.float armed;