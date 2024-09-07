void () VoicesDie = {

   local float rsnd;
   
   rsnd = ceil(random() * 2.0);   
   if (rsnd == 1.0)
      sound (self,CHAN_VOICE,"radio/matedown.wav",TRUE,ATTN_NONE );

};


void() kill_taunt =
{
	local float rs;

	rs = rint(random() * 6);

	self.noise = "";
	if (rs == 1)
		self.noise = "radio/enemydown.wav";
	else if (rs == 2)
		self.noise = "radio/ct_enemys.wav";


	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
};