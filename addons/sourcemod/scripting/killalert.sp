#pragma semicolon 1

#include <sourcemod>
#include <pf2>
#include <sdktools>
#undef REQUIRE_PLUGIN

#define TEAM_RED 2
#define TEAM_BLUE 3

Handle hudsync;

public Plugin myinfo =
{
	name = "PF2 Kill Alerts",
	author = "blackletum",
	// original_author = "evilscout",
	description = "Informs all players on server when someone gets a unique kill.",
	version = "1.3",
	url = "lambdafortress.com"
};

public OnPluginStart() 
{
	hudsync = CreateHudSynchronizer();
	HookEvent("player_death", Event_player_death);
}

public Action:Event_player_death(Handle:event, const String:name[], bool:dontBroadcast) {
	char wep[64];
	char attackername[MAX_NAME_LENGTH+1];
	char victimname[MAX_NAME_LENGTH+1];
	int attacker;
	int victim;
	int idx;
	new customkill = GetEventInt(event, "customkill");
	
	GetEventString(event, "weapon", wep, sizeof(wep), "");
	
	if (
		StrContains(wep, "obj_d") == 0 ||
		StrContains(wep, "obj_t") == 0 ||
		StrContains(wep, "tele") == 0 ||
		StrContains(wep, "play") == 0 ||
		// grenades.
		StrContains(wep, "normal_projectile_b") == 0 ||
		StrContains(wep, "concussion_projectile_b") == 0 ||
		StrContains(wep, "nail_projectile_b") == 0 ||
		StrContains(wep, "napalm_projectile_b") == 0 ||
		StrContains(wep, "mirv_projectile_b") == 0 ||
		StrContains(wep, "emp_projectile_b") == 0 ||
		StrContains(wep, "heal_projectile_b") == 0 ||
		StrContains(wep, "gas_projectile_b") == 0
	) {
		victim = GetClientOfUserId(GetEventInt(event, "userid"));
		attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
		GetClientName(attacker, attackername, sizeof(attackername));
		GetClientName(victim, victimname, sizeof(victimname));
		for (idx = 1; idx <= MaxClients; idx++) {
			if (IsClientInGame(idx) && victim != attacker) {
				EmitGameSoundToClient(idx, "Achievement.Earned");
				
				if (GetClientTeam(attacker) == TEAM_RED)
				SetHudTextParams(-1.0, 0.09, 4.0, 220, 50, 50, 200, 2, 0.5, 0.03, 1.0);
				else
				SetHudTextParams(-1.0, 0.09, 4.0, 60, 95, 150, 200, 2, 0.5, 0.03, 1.0);
				
				if (StrContains(wep, "obj_d") == 0)
				ShowSyncHudText(idx, hudsync, "%N just killed %N with a DISPENSER EXPLOSION!", attacker, victim);
				else if (StrContains(wep, "obj_t") == 0)
				ShowSyncHudText(idx, hudsync, "%N just killed %N with a TELEPORTER EXPLOSION!", attacker, victim);
				else if (StrContains(wep, "tele") == 0)
				ShowSyncHudText(idx, hudsync, "%N just killed %N with a TELEFRAG!", attacker, victim);
				else if (StrContains(wep, "play") == 0)
				ShowSyncHudText(idx, hudsync, "%N just humiliated %N!", attacker, victim);
				else
				ShowSyncHudText(idx, hudsync, "%N just killed %N with a GRENADE BONK!", attacker, victim);
			}
		}
	}
}