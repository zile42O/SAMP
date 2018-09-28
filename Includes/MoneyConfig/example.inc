#include <a_samp>
#include <zcmd>
#include <money-config>

// U can edit resolution example how:
// if u want in default is `type - 1`

#if defined MC_RESOLUTION 
#undef MC_RESOLUTION
#define MC_RESOLUTION 1
#endif

// RESOLUTION TYPES:
// 1 - 1980 x 1080 x 16
// 2 - 1024 x 728 x 32
// 3 - 800 x 600 x 32 

/* WARNING: U cant edit the max or min limit here, check in inc file. */

public OnPlayerSpawn(playerid)
{
	GivePlayerMoney(playerid, 50000);
	return true;
}
CMD:money1(playerid)
{
	return GivePlayerMoney(playerid, 200);
}
CMD:money2(playerid)
{
	return GivePlayerMoney(playerid, -200);
}
CMD:money3(playerid)
{
	return GivePlayerMoney(playerid, 200 + 50);
}
CMD:color(playerid)
{
	return ChangeColorMoneyForPlayer(playerid, 0xDD8E11FF);
}
CMD:getmoney(playerid)
{
	new money = GetPlayerMoney(playerid);
	return printf("%d",money);
}