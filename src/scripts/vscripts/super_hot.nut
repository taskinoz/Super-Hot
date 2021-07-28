global function startthething

void function startwaiting()
{
	wait 2
	entity ent  = GetPlayerByIndex( 0 );
	printt("Start Watch")
	if ( IsValid(ent) ) {
		printt("Valid Ent")
		thread superHot(ent)
		//break
	}
	else {printt("nope"+GetPlayerByIndex( 0 ))}
	WaitFrame()

}

entity function superHot( entity ent )
{
	printt("Start Floorislava")
  while (true)
  {
    if ( ent != null && IsValid(ent) && ent.IsPlayer() ){
			float speed = Length( ent.GetVelocity() )
			float speedstep = (speed/3.00) / 100
			float speedtest = Length( ent.GetVelocity() ) * (1/243)
			printt("Speed: "+speed)
			printt("SpeedStep: "+speedstep)
			if ( speedstep >= 1) {
				ServerCommand("host_timescale 1")
				printt("Normal Speed")
			}
			else if ( speedstep <= 1 && speedstep >= 0.1) {
				ServerCommand("host_timescale "+speedstep)
				printt("Slowmo")
			}
			else {
				ServerCommand("host_timescale 0.1")
				printt("Slow")
			}
    }
    else{
      break
    }

    WaitFrame();
  }

}


void function startthething()
{
  thread startwaiting()
}
