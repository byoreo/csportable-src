void() W_FireGrenade;

//============= 
//Progress bar 
//============= 
void() ProgressBar = 
{ 
   if (self.charge == 0) 
      sound (self, CHAN_WEAPON, "weapons/c4/c4_plant.wav", 0.5, ATTN_NORM); 

   if (self.charge == 0) 
   {  
      stuffcmd (self, "scr_drawgbar 0\n");
   }  
   if (self.charge == 1) 
   {  
      stuffcmd (self, "scr_drawgbar 1\n");
   } 
   if (self.charge == 2) 
   {  
      stuffcmd (self, "scr_drawgbar 2\n");
   }
   if (self.charge == 3) 
   {  
      stuffcmd (self, "scr_drawgbar 3\n");
   }
   if (self.charge == 4) 
   {  
      stuffcmd (self, "scr_drawgbar 4\n");
   }
   if (self.charge == 5) 
   {  
      stuffcmd (self, "scr_drawgbar 5\n");
   }
   if (self.charge == 6) 
   {  
      stuffcmd (self, "scr_drawgbar 6\n");
   }
   if (self.charge == 7) 
   {  
      stuffcmd (self, "scr_drawgbar 7\n");
   }
   if (self.charge == 8) 
   { 
      stuffcmd (self, "scr_drawgbar 8\n");
   } 
   if (self.charge == 9) 
   { 
      stuffcmd (self, "scr_drawgbar 9\n");
   } 
   if (self.charge == 10) 
   { 
      stuffcmd (self, "scr_drawgbar 10\n");
   } 
   if (self.charge == 11) 
   { 
      stuffcmd (self, "scr_drawgbar 11\n");
   } 
   if (self.charge == 12) 
   { 
      stuffcmd (self, "scr_drawgbar 12\n");
   } 
   if (self.charge == 13) 
   { 
      stuffcmd (self, "scr_drawgbar 13\n");
   } 
   if (self.charge == 14) 
   { 
      stuffcmd (self, "scr_drawgbar 14\n");
   } 
   if (self.charge == 15) 
   { 
      stuffcmd (self, "scr_drawgbar 15\n");
   } 
   if (self.charge == 16) 
   { 
      stuffcmd (self, "scr_drawgbar 16\n");
   } 
   if (self.charge == 17) 
   { 
      stuffcmd (self, "scr_drawgbar 17\n");
   } 
   if (self.charge == 18) 
   { 
      stuffcmd (self, "scr_drawgbar 18\n");
   } 
   if (self.charge == 19) 
   {  
      stuffcmd (self, "scr_drawgbar 19\n");
   } 
   if (self.charge == 20) 
   {  
      stuffcmd (self, "scr_drawgbar 20\n");
   }
   if (self.charge == 21) 
   {  
      stuffcmd (self, "scr_drawgbar 21\n");
   }
   if (self.charge == 22) 
   {  
      stuffcmd (self, "scr_drawgbar 22\n");
   }
   if (self.charge == 23) 
   {  
      stuffcmd (self, "scr_drawgbar 23\n");
   }
   if (self.charge == 24) 
   {  
      stuffcmd (self, "scr_drawgbar 24\n");
   }
   if (self.charge == 25) 
   {  
      stuffcmd (self, "scr_drawgbar 25\n");
   }
   if (self.charge == 26) 
   { 
      stuffcmd (self, "scr_drawgbar 26\n");
   } 
   if (self.charge == 27) 
   { 
      stuffcmd (self, "scr_drawgbar 27\n");
   } 
   if (self.charge == 28) 
   { 
      stuffcmd (self, "scr_drawgbar 28\n");
   } 
   if (self.charge == 29) 
   { 
      stuffcmd (self, "scr_drawgbar 29\n");
   } 
   if (self.charge == 30) 
   { 
      stuffcmd (self, "scr_drawgbar 30\n");
   } 
   if (self.charge == 31) 
   { 
      stuffcmd (self, "scr_drawgbar 31\n");
   } 
   if (self.charge == 32) 
   { 
      stuffcmd (self, "scr_drawgbar 32\n");
   } 
   if (self.charge == 33) 
   { 
      stuffcmd (self, "scr_drawgbar 33\n");
   } 
   if (self.charge == 34) 
   { 
      stuffcmd (self, "scr_drawgbar 34\n");
   } 
   if (self.charge == 35) 
   { 
      stuffcmd (self, "scr_drawgbar 35\n");
   } 
   if (self.charge == 36) 
   { 
      stuffcmd (self, "scr_drawgbar 36\n");
   } 
   if (self.charge == 37) 
   {  
      stuffcmd (self, "scr_drawgbar 37\n");
   } 
   if (self.charge == 38) 
   {  
      stuffcmd (self, "scr_drawgbar 38\n");
   }
   if (self.charge == 39) 
   {  
      stuffcmd (self, "scr_drawgbar 39\n");
   }
   if (self.charge == 40) 
   {  
      stuffcmd (self, "scr_drawgbar 40\n");
   }
   if (self.charge == 41) 
   {  
      stuffcmd (self, "scr_drawgbar 41\n");
   }
   if (self.charge == 42) 
   {  
      stuffcmd (self, "scr_drawgbar 42\n");
   }
   if (self.charge == 43) 
   {  
      stuffcmd (self, "scr_drawgbar 43\n");
   }
   if (self.charge == 44) 
   { 
      stuffcmd (self, "scr_drawgbar 44\n");
   } 
   if (self.charge == 45) 
   { 
      stuffcmd (self, "scr_drawgbar 45\n");
   } 
   if (self.charge == 46) 
   { 
      stuffcmd (self, "scr_drawgbar 46\n");
   } 
   if (self.charge == 47) 
   { 
      stuffcmd (self, "scr_drawgbar 47\n");
   } 
   if (self.charge == 48) 
   { 
      stuffcmd (self, "scr_drawgbar 48\n");
   } 
   if (self.charge == 49) 
   { 
      stuffcmd (self, "scr_drawgbar 49\n");
   } 
   if (self.charge == 50) 
   { 
      stuffcmd (self, "scr_drawgbar 50\n");
   } 
   if (self.charge == 51) 
   { 
      stuffcmd (self, "scr_drawgbar 51\n");
   } 
   if (self.charge == 52) 
   { 
      stuffcmd (self, "scr_drawgbar 52\n");
   } 
   if (self.charge == 53) 
   { 
      stuffcmd (self, "scr_drawgbar 53\n");
   } 
   if (self.charge == 54) 
   { 
      stuffcmd (self, "scr_drawgbar 54\n");
   } 
   if (self.charge == 55) 
   {  
      stuffcmd (self, "scr_drawgbar 55\n");
   } 
   if (self.charge == 56) 
   {  
      stuffcmd (self, "scr_drawgbar 56\n");
   }
   if (self.charge == 57) 
   {  
      stuffcmd (self, "scr_drawgbar 57\n");
   }
   if (self.charge == 58) 
   {  
      stuffcmd (self, "scr_drawgbar 58\n");
   }
   if (self.charge == 59) 
   {  
      stuffcmd (self, "scr_drawgbar 59\n");
   }
   if (self.charge == 60) 
   {  
      stuffcmd (self, "scr_drawgbar 60\n");
   }
   if (self.charge == 61) 
   {  
      stuffcmd (self, "scr_drawgbar 61\n");
   }
   if (self.charge == 62) 
   { 
      stuffcmd (self, "scr_drawgbar 62\n");
   } 
   if (self.charge == 63) 
   { 
      stuffcmd (self, "scr_drawgbar 63\n");
   } 
   if (self.charge == 64) 
   { 
      stuffcmd (self, "scr_drawgbar 64\n");
   } 
   if (self.charge == 65) 
   { 
      stuffcmd (self, "scr_drawgbar 65\n");
   } 
   if (self.charge == 66) 
   { 
      stuffcmd (self, "scr_drawgbar 66\n");
   } 
   if (self.charge == 67) 
   { 
      stuffcmd (self, "scr_drawgbar 67\n");
   } 
   if (self.charge == 68) 
   { 
      stuffcmd (self, "scr_drawgbar 68\n");
   } 
   if (self.charge == 69) 
   { 
      stuffcmd (self, "scr_drawgbar 69\n");
   } 
   if (self.charge == 70) 
   { 
      stuffcmd (self, "scr_drawgbar 70\n");
   } 
   if (self.charge == 71) 
   { 
      stuffcmd (self, "scr_drawgbar 71\n");
   } 
   if (self.charge == 72) 
   { 
      stuffcmd (self, "scr_drawgbar 72\n");
   } 
   if (self.charge == 73) 
   {  
      stuffcmd (self, "scr_drawgbar 73\n");
   } 
   if (self.charge == 74) 
   {  
      stuffcmd (self, "scr_drawgbar 74\n");
   }
   if (self.charge == 75) 
   {  
      stuffcmd (self, "scr_drawgbar 75\n");
   }
   if (self.charge == 76) 
   {  
      stuffcmd (self, "scr_drawgbar 76\n");
   }
   if (self.charge == 77) 
   {  
      stuffcmd (self, "scr_drawgbar 77\n");
   }
   if (self.charge == 78) 
   {  
      stuffcmd (self, "scr_drawgbar 78\n");
   }
   if (self.charge == 79) 
   {  
      stuffcmd (self, "scr_drawgbar 79\n");
   }
   if (self.charge == 80) 
   { 
      stuffcmd (self, "scr_drawgbar 80\n");
   } 
   if (self.charge == 81) 
   { 
      stuffcmd (self, "scr_drawgbar 81\n");
   } 
   if (self.charge == 82) 
   { 
      stuffcmd (self, "scr_drawgbar 82\n");
   } 
   if (self.charge == 83) 
   { 
      stuffcmd (self, "scr_drawgbar 83\n");
   } 
   if (self.charge == 84) 
   { 
      stuffcmd (self, "scr_drawgbar 84\n");
   } 
   if (self.charge == 85) 
   { 
      stuffcmd (self, "scr_drawgbar 85\n");
   } 
   if (self.charge == 86) 
   { 
      stuffcmd (self, "scr_drawgbar 86\n");
   } 
   if (self.charge == 87) 
   { 
      stuffcmd (self, "scr_drawgbar 87\n");
   } 
   if (self.charge == 88) 
   { 
      stuffcmd (self, "scr_drawgbar 88\n");
   } 
   if (self.charge == 89) 
   { 
      stuffcmd (self, "scr_drawgbar 89\n");
   } 
   if (self.charge == 90) 
   { 
      stuffcmd (self, "scr_drawgbar 90\n");
   } 
   if (self.charge == 91) 
   {  
      stuffcmd (self, "scr_drawgbar 91\n");
   } 
   if (self.charge == 92) 
   {  
      stuffcmd (self, "scr_drawgbar 92\n");
   }
   if (self.charge == 93) 
   {  
      stuffcmd (self, "scr_drawgbar 93\n");
   }
   if (self.charge == 94) 
   {  
      stuffcmd (self, "scr_drawgbar 94\n");
   }
   if (self.charge == 95) 
   {  
      stuffcmd (self, "scr_drawgbar 95\n");
   }
   if (self.charge == 96) 
   {  
      stuffcmd (self, "scr_drawgbar 96\n");
   }
   if (self.charge == 97) 
   {  
      stuffcmd (self, "scr_drawgbar 97\n");
   }
   if (self.charge == 98) 
   { 
      stuffcmd (self, "scr_drawgbar 98/n");
   } 
   if (self.charge == 99) 
   { 
      stuffcmd (self, "scr_drawgbar 99\n");
   } 
   if (self.charge == 100) 
   { 
      stuffcmd (self, "scr_drawgbar 100\n");
   } 
   if (self.charge == 101) 
   { 
      stuffcmd (self, "scr_drawgbar 101\n");
   } 
   if (self.charge == 102) 
   { 
      stuffcmd (self, "scr_drawgbar 102\n");
   } 
   if (self.charge == 103) 
   { 
      stuffcmd (self, "scr_drawgbar 103\n");
   } 
   if (self.charge == 104) 
   { 
      stuffcmd (self, "scr_drawgbar 104\n");
   } 
   if (self.charge == 105) 
   { 
      stuffcmd (self, "scr_drawgbar 105\n");
   } 
   if (self.charge == 106) 
   { 
      stuffcmd (self, "scr_drawgbar 106\n");
   } 
   if (self.charge == 107) 
   { 
      stuffcmd (self, "scr_drawgbar 107\n");
   } 
   if (self.charge == 108) 
   { 
      stuffcmd (self, "scr_drawgbar 108\n");
   } 
   if (self.charge == 109) 
   {  
      stuffcmd (self, "scr_drawgbar 109\n");
   } 
   if (self.charge == 110) 
   {  
      stuffcmd (self, "scr_drawgbar 110\n");
   }
   if (self.charge == 111) 
   {  
      stuffcmd (self, "scr_drawgbar 111\n");
   }
   if (self.charge == 112) 
   {  
      stuffcmd (self, "scr_drawgbar 112\n");
   }
   if (self.charge == 113) 
   {  
      stuffcmd (self, "scr_drawgbar 113\n");
   }
   if (self.charge == 114) 
   {  
      stuffcmd (self, "scr_drawgbar 114\n");
   }
   if (self.charge == 115) 
   {  
      stuffcmd (self, "scr_drawgbar 115\n");
   }
   if (self.charge == 116) 
   { 
      stuffcmd (self, "scr_drawgbar 116\n");
   } 
   if (self.charge == 117) 
   { 
      stuffcmd (self, "scr_drawgbar 117\n");
   } 
   if (self.charge == 118) 
   { 
      stuffcmd (self, "scr_drawgbar 118\n");
   } 
   if (self.charge == 119) 
   { 
      stuffcmd (self, "scr_drawgbar 119\n");
   } 
   if (self.charge == 120) 
   { 
      stuffcmd (self, "scr_drawgbar 120\n");
   } 
   if (self.charge == 121) 
   { 
      stuffcmd (self, "scr_drawgbar 121\n");
   } 
   if (self.charge == 122) 
   { 
      stuffcmd (self, "scr_drawgbar 122\n");
   } 
   if (self.charge == 123) 
   { 
      stuffcmd (self, "scr_drawgbar 123\n");
   } 
   if (self.charge == 124) 
   { 
      stuffcmd (self, "scr_drawgbar 124\n");
   } 
   if (self.charge == 125) 
   { 
      stuffcmd (self, "scr_drawgbar 125\n");
   } 
   if (self.charge == 126) 
   { 
      stuffcmd (self, "scr_drawgbar 126\n");
   } 
   if (self.charge == 127) 
   {  
      stuffcmd (self, "scr_drawgbar 127\n");
   } 
   if (self.charge == 128) 
   {  
      stuffcmd (self, "scr_drawgbar 128\n");
   }
   if (self.charge == 129) 
   {  
      stuffcmd (self, "scr_drawgbar 129\n");
   }
   if (self.charge == 130) 
   {  
      stuffcmd (self, "scr_drawgbar 130\n");
   }
   if (self.charge == 131) 
   {  
      stuffcmd (self, "scr_drawgbar 131\n");
   }
   if (self.charge == 132) 
   {  
      stuffcmd (self, "scr_drawgbar 132\n");
   }
   if (self.charge == 133) 
   {  
      stuffcmd (self, "scr_drawgbar 133\n");
   }
   if (self.charge == 134) 
   { 
      stuffcmd (self, "scr_drawgbar 134\n");
   } 
   if (self.charge == 135) 
   { 
      stuffcmd (self, "scr_drawgbar 135n");
   } 
   if (self.charge == 136) 
   { 
      stuffcmd (self, "scr_drawgbar 136\n");
   } 
   if (self.charge == 137) 
   { 
      stuffcmd (self, "scr_drawgbar 137\n");
   } 
   if (self.charge == 138) 
   { 
      stuffcmd (self, "scr_drawgbar 138\n");
   } 
   if (self.charge == 139) 
   { 
      stuffcmd (self, "scr_drawgbar 139\n");
   } 
   if (self.charge == 140) 
   { 
      stuffcmd (self, "scr_drawgbar 140\n");
   } 
   if (self.charge == 141) 
   { 
      stuffcmd (self, "scr_drawgbar 141\n");
   } 
   if (self.charge == 142) 
   { 
      stuffcmd (self, "scr_drawgbar 142\n");
   } 
   if (self.charge == 143) 
   { 
      stuffcmd (self, "scr_drawgbar 143\n");
   } 
   if (self.charge == 144) 
   { 
      stuffcmd (self, "scr_drawgbar 144\n");
   } 
   if (self.charge == 145) 
   {  
      stuffcmd (self, "scr_drawgbar 145\n");
   }
   if (self.charge == 146) 
   {  
      stuffcmd (self, "scr_drawgbar 146\n");
   }
   if (self.charge == 147) 
   {  
      stuffcmd (self, "scr_drawgbar 147\n");
   }
   if (self.charge == 148) 
   { 
      stuffcmd (self, "scr_drawgbar 148/n");
   } 
   if (self.charge == 149) 
   { 
      stuffcmd (self, "scr_drawgbar 149\n");
   } 
   if (self.charge == 150) 
   { 
      stuffcmd (self, "scr_drawgbar 150\n");
   } 
   if (self.charge == 151) 
   { 
      stuffcmd (self, "scr_drawgbar 151\n");
   } 
   if (self.charge == 152) 
   { 
      stuffcmd (self, "scr_drawgbar 152\n");
   } 
   if (self.charge == 153) 
   { 
      stuffcmd (self, "scr_drawgbar 153\n");
   } 
   if (self.charge == 154) 
   { 
      stuffcmd (self, "scr_drawgbar 154\n");
   } 
   if (self.charge == 155) 
   { 
      stuffcmd (self, "scr_drawgbar 155\n");
   } 
   if (self.charge == 156) 
   { 
      stuffcmd (self, "scr_drawgbar 156\n");
   } 
   if (self.charge == 157) 
   { 
      stuffcmd (self, "scr_drawgbar 157\n");
   } 
   if (self.charge == 158) 
   { 
      stuffcmd (self, "scr_drawgbar 158\n");
   } 
   if (self.charge == 159) 
   {  
      stuffcmd (self, "scr_drawgbar 159\n");
   } 
   if (self.charge == 160) 
   {  
      stuffcmd (self, "scr_drawgbar 160\n");
   }
   if (self.charge == 161) 
   {  
      stuffcmd (self, "scr_drawgbar 161\n");
   }
   if (self.charge == 162) 
   {  
      stuffcmd (self, "scr_drawgbar 162\n");
   }
   if (self.charge == 163) 
   {  
      stuffcmd (self, "scr_drawgbar 163\n");
   }
   if (self.charge == 164) 
   {  
      stuffcmd (self, "scr_drawgbar 164\n");
   }
   if (self.charge == 165) 
   {  
      stuffcmd (self, "scr_drawgbar 165\n");
   }
   if (self.charge == 166) 
   { 
      stuffcmd (self, "scr_drawgbar 166\n");
   } 
   if (self.charge == 167) 
   { 
      stuffcmd (self, "scr_drawgbar 167\n");
   } 
   if (self.charge == 168) 
   { 
      stuffcmd (self, "scr_drawgbar 168\n");
   } 
   if (self.charge == 169) 
   { 
      stuffcmd (self, "scr_drawgbar 169\n");
   } 
   if (self.charge == 170) 
   { 
      stuffcmd (self, "scr_drawgbar 170\n");
   } 
   if (self.charge == 171) 
   { 
      stuffcmd (self, "scr_drawgbar 171\n");
   } 
   if (self.charge == 172) 
   { 
      stuffcmd (self, "scr_drawgbar 172\n");
   } 
   if (self.charge == 173) 
   { 
      stuffcmd (self, "scr_drawgbar 173\n");
   } 
   if (self.charge == 174) 
   { 
      stuffcmd (self, "scr_drawgbar 174\n");
   } 
   if (self.charge == 175) 
   { 
      stuffcmd (self, "scr_drawgbar 175\n");
   } 
   if (self.charge == 176) 
   { 
      stuffcmd (self, "scr_drawgbar 176\n");
   } 
   if (self.charge == 177) 
   {  
      stuffcmd (self, "scr_drawgbar 177\n");
   } 
   if (self.charge == 178) 
   {  
      stuffcmd (self, "scr_drawgbar 178\n");
   }
   if (self.charge == 179) 
   {  
      stuffcmd (self, "scr_drawgbar 179\n");
   }
   if (self.charge == 180) 
   {  
      stuffcmd (self, "scr_drawgbar 180\n");
   }
   if (self.charge == 181) 
   {  
      stuffcmd (self, "scr_drawgbar 181\n");
   }
   if (self.charge == 182) 
   {  
      stuffcmd (self, "scr_drawgbar 182\n");
   }
   if (self.charge == 183) 
   {  
      stuffcmd (self, "scr_drawgbar 183\n");
   }
   if (self.charge == 184) 
   { 
      stuffcmd (self, "scr_drawgbar 184\n");
   } 
   if (self.charge == 185) 
   { 
      stuffcmd (self, "scr_drawgbar 185n");
   } 
   if (self.charge == 186) 
   { 
      stuffcmd (self, "scr_drawgbar 186\n");
   } 
   if (self.charge == 187) 
   { 
      stuffcmd (self, "scr_drawgbar 187\n");
   } 
   if (self.charge == 188) 
   { 
      stuffcmd (self, "scr_drawgbar 188\n");
   } 
   if (self.charge == 189) 
   { 
      stuffcmd (self, "scr_drawgbar 189\n");
   } 
   if (self.charge >= 190) 
   { 
            self.charge = 190;
            stuffcmd (self, "scr_drawgbar 190\n");

  if (self.plantable == 0)
   W_FireGrenade();
   } 
   else 
   { 
 //     self.charge = self.charge + 1; 

   } 
   self.attack_finished = time + 0.1; 
};
