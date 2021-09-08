/*
  Copyright (c) 2009-2017 Andreas Göransson <andreas.goransson@gmail.com>
  Copyright (c) 2009-2017 Indrek Ardel <indrek@ardel.eu>

  This file is part of Call of Duty 4 Promod.

  Call of Duty 4 Promod is licensed under Promod Modder Ethical Public License.
  Terms of license can be found in LICENSE.md document bundled with the project.
*/

main()
{
	level endon( "restarting" );
	
	for(;;)
	{
		if ( getDvarInt( "sv_cheats" ) || isDefined( game["PROMOD_MATCH_MODE"] ) && game["PROMOD_MATCH_MODE"] == "strat" )
			break;

		forceDvar( "authServerName", "cod4master.activision.com" );
		forceDvar( "sv_disableClientConsole", "0" );
		forceDvar( "sv_fps", "20" );
		forceDvar( "sv_pure", "1" );
		forceDvar( "sv_maxrate", "25000" );
		forceDvar( "g_gravity", "800" );
		forceDvar( "g_speed", "190" );
		forceDvar( "g_knockback", "1000" );
		forceDvar( "g_playercollisionejectspeed", "25" );
		forceDvar( "g_dropforwardspeed", "10" );
		forceDvar( "g_drophorzspeedrand", "100" );
		forceDvar( "g_dropupspeedbase", "10" );
		forceDvar( "g_dropupspeedrand", "5" );
		forceDvar( "g_useholdtime", "0" );

		if( isDefined( game["PROMOD_MATCH_MODE"] ) && game["PROMOD_MATCH_MODE"] == "match" )
		{
			forceDvar( "g_maxdroppedweapons", "16" );

			if ( !game["LAN_MODE"] )
				forceDvar( "g_smoothclients", "1" );
		}
		wait 0.1;
	}
}

forceDvar(dvar, value)
{
	val = getDvar( dvar );
	if( val != value )
	{
		setDvar( dvar, value );
		iprintln("^3"+dvar+" has been changed back to '"+value+"' (was '"+val+"')");
	}
}