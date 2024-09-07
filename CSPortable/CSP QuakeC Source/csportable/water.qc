void()	ring1	=	[0,		ring2] {self.nextthink = time + 0.02;}
void()	ring2	=	[1,		ring3] {self.nextthink = time + 0.02;};
void()	ring3	=	[2,		ring4] {self.nextthink = time + 0.02;};
void()	ring4	=	[3,		ring5] {self.nextthink = time + 0.02;};
void()	ring5	=	[4,		ring6] {self.nextthink = time + 0.02;};
void()	ring6	=	[5,		SUB_Remove] {self.nextthink = time + 0.02;};




void () SpawnSplash =
{
}

void () SpawnRiple =
{

        local entity ring;

        ring = spawn();
        ring.movetype = MOVETYPE_FLY;
        ring.solid = SOLID_BBOX;

	
      //  ring.nextthink = time + 2;
      //  ring.think = SUB_Remove;

        setmodel (ring, "progs/ring.mdl");
        setsize (ring, '0 0 0', '0 0 0');     
        setorigin (ring, self.origin + v_up + '0 0 -10'); 

ring1(); 

};