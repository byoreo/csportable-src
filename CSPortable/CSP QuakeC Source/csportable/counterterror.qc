float	modelindex_player, modelindex_eyes; //Stores your player model
void() respawn;
void() PutClientInServer;


                void() counter1 =
                {   
                self.team = 2; 
		    PutClientInServer ();
                bprint (self.netname); 
                bprint (" is joining the Counter-Terrorist team\n");
                self.skin = 7; 			     
                modelindex_player = self.modelindex; 
                self.weaponmodel = "progs/v_knife.mdl"; 
                self.impulse = 70;
                return;					
                };

                void() counter2 =
                {
                self.team = 2; 
		    PutClientInServer ();
                bprint (self.netname);
                bprint (" is joining the Counter-Terrorist team\n");
                self.skin = 6;
                modelindex_player = self.modelindex;
                self.weaponmodel = "progs/v_knife.mdl";
                self.impulse = 70;  
                return;
                };

                void() counter3 =
                {
                self.team = 2; 
		    PutClientInServer ();
                bprint (self.netname);
                bprint (" is joining the Counter-Terrorist team\n");
                modelindex_player = self.modelindex;
                self.weaponmodel = "progs/v_knife.mdl";
                self.impulse = 70; 
                return;
                };

                void() counter4 =
                {
                self.team = 2;
		    PutClientInServer ();
                bprint (self.netname);
                bprint (" is joining the Counter-Terrorist team\n");
                self.skin = 5;
                modelindex_player = self.modelindex;
                self.weaponmodel = "progs/v_knife.mdl";
                self.impulse = 70;
                return;
                };
