////////////////////COUNT HEADHOTS////////////////

void () hscounter =
{

if (trace_endpos_z > (trace_ent.origin_z + 19))
self.headshot = +1;

};

float CountEntities (string name) = 
{ 
  local float total = 0; 
  local entity ent; 

  ent = find (world, classname, name); 
  while (ent != world) { 
    total = total + 1; 
    ent = find (ent, classname, name);
  } 

  return total; 
}