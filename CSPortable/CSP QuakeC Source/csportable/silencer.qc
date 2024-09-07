void() Silencer =
{

if (self.weaponmodel == "progs/v_usp.mdl")
{
if (self.silenced == 0)
{
        self.silenced = 1;
	  sprint (self, "Silenced\n");
        stuffcmd (self, "drawingame 0 \n");
}
else if (self.silenced == 1)
{
        self.silenced = 0;
	  sprint (self, "Unsilenced\n");
        stuffcmd (self, "drawingame 0 \n");
}
}



if (self.weaponmodel == "progs/v_m4a1.mdl")
{
if (self.silenced == 0)
{
        self.silenced = 1;
	  sprint (self, "Silenced\n");
        stuffcmd (self, "drawingame 0 \n");
}
else if (self.silenced == 1)
{
        self.silenced = 0;
	  sprint (self, "Unsilenced\n");
        stuffcmd (self, "drawingame 0 \n");
}
}

};
