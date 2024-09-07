float	modelindex_player, modelindex_eyes; //Stores your player model
void() respawn;


                void() terror1 =
                {  
                self.team = 1; 
		    PutClientInServer ();
                bprint (self.netname); 
                bprint (" is joining the Terrorist team\n"); 
                self.skin = 1; 
                modelindex_player = self.modelindex; 
                self.weaponmodel = "progs/v_knife.mdl"; 
                self.impulse = 70;      
                return;					               


                };

                void() terror2 =
                {  
                self.team = 1; 
		    PutClientInServer ();
                bprint (self.netname); 
                bprint (" is joining the Terrorist team\n");  
                self.skin = 2; 			    
                modelindex_player = self.modelindex; 
                self.weaponmodel = "progs/v_knife.mdl"; 
                self.impulse = 70;
                return;					                
                };

                void() terror3 =
                {   
                self.team = 1; 
		    PutClientInServer ();
                bprint (self.netname); 
                bprint (" is joining the Terrorist team\n"); 
                self.skin = 3; 			     
                modelindex_player = self.modelindex; 
                self.weaponmodel = "progs/v_knife.mdl"; 
                 self.impulse = 70;
                return;					
                };

                void() terror4 =
                {   
                self.team = 1; 
		    PutClientInServer ();
                bprint (self.netname); 
                bprint (" is joining the Terrorist team\n");  
                self.skin = 0; 			     
                modelindex_player = self.modelindex; 
                self.weaponmodel = "progs/v_knife.mdl"; 
                self.impulse = 70;
                return;					               
                };


