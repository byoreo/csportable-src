///////////////////////////////////////
////////////ZOOM///////////////////////
///////////////////////////////////////

void () MoveCamera =
{
    local vector newpos;

    makevectors(self.owner.v_angle);
    newpos = (self.owner.origin + (v_forward * 200) );
    setorigin(self,newpos);

  	msg_entity = self.owner;                         // target of message
	WriteByte (MSG_ONE, 5);
	WriteEntity (MSG_ONE, self);           // view port

};


void() Zoom =
{


if (self.weaponmodel == "progs/usp.mdl")
{
if (self.zoom == 1)
{
MoveCamera();
}}

if (self.weaponmodel == "progs/v_awp.mdl")
{
if (self.zoom == 1)
{
self.zoom = 2;
stuffcmd (self, "fov 40\n");
stuffcmd (self, "scr_zoom 1\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
else if (self.zoom == 0)
{
self.zoom = 1;
stuffcmd (self, "fov 90\n");
stuffcmd (self, "scr_zoom 0\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
else if (self.zoom == 2)
{
self.zoom = 0;
stuffcmd (self, "fov 20\n");
stuffcmd (self, "scr_zoom 2\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
}
if (self.weaponmodel == "progs/v_g3sg1.mdl")
{
if (self.zoom == 1)
{
self.zoom = 0;
stuffcmd (self, "fov 40\n");
stuffcmd (self, "scr_zoom 1\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
else if (self.zoom == 0)
{
self.zoom = 1;
stuffcmd (self, "fov 90\n");
stuffcmd (self, "scr_zoom 0\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
}

if (self.weaponmodel == "progs/v_aug.mdl")
{
if (self.zoom == 1)
{
self.zoom = 0;
stuffcmd (self, "fov 70\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
else if (self.zoom == 0)
{
self.zoom = 1;
stuffcmd (self, "fov 90\n");
sound (self, CHAN_AUTO, "weapons/zoom.wav", 1, ATTN_NORM);
}
}

};
