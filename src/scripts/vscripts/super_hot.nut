global function startthething

void function startwaiting()
{
	WaitFrame()
	ServerCommand("sv_cheats 1")
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

bool function CheckLevelFlags(entity player)
{
	bool flagResult = true
	switch ( GetMapName() ){
		case "sp_crashsite":
			if ((!Flag("og_final_words") && (!Flag("first_wallrun_completed") || !Flag("BuddyTitanFlyout"))) || ( Flag("og_final_words") && (Flag("first_wallrun_completed") || Flag("BuddyTitanFlyout")) ) ) {
				flagResult = true
			}
			else {
				flagResult = false
			}
		break
		case "sp_training":
			if ( Flag("PlayerSprinted") ) {
				flagResult = true
			}
			else {
				flagResult = false
			}
		break
	}
	return flagResult
}

entity function superHot( entity ent )
{
	/* ServerCommand("setinfo superhot_debug 0") */
	//ServerCommand("setinfo superhot_mod 1")
  while (true)
  {
    if ( ent != null && IsValid(ent) && ent.IsPlayer() ){
			if ( !ent.ContextAction_IsBusy() &&
					 !ent.GetCinematicEventFlags() &&
					 !ent.ContextAction_IsLeeching() &&
					 !ent.ContextAction_IsActive() &&
					 !ent.IsInvulnerable() &&
					 CheckLevelFlags(ent) &&
					 IsAlive( ent ) )
		 	{
				float speed = Length( ent.GetVelocity() )
				float speedstep = (speed/3.00) / 100
				if ( speedstep >= 1) {
					ServerCommand("host_timescale 1")
					/* if ( GetConVarInt("superhot_debug") == 1 )
						printt("Normal Speed") */
				}
				else if ( speedstep <= 1 && speedstep >= 0.1) {
					ServerCommand("host_timescale "+speedstep)
					/* if ( GetConVarInt("superhot_debug") == 1 )
						printt("Slowmo") */
				}
				else {
					ServerCommand("host_timescale 0.1")
					/* if ( GetConVarInt("superhot_debug") == 1 )
						printt("Slow") */
				}
			}
			else
			{
				ServerCommand("host_timescale 1")
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
