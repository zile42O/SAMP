#include <a_samp>

#include <streamer>

#include <YSF>

#include <custom-label>


new bool:labelscreated = false;

public OnPlayerCommandText(playerid, cmdtext[])
{
	new idx;
	new cmd[256];
	cmd = strtok(cmdtext, idx);

	if(strcmp(cmd, "/createcustomlabels", true) == 0) 
	{
		if(labelscreated) return SendClientMessage(playerid, -1, "U can't create labels.. /deletecustomlabels.");
		new
			Float:x,
			Float:y,
			Float:z;

		GetPlayerPos(playerid, x, y, z);

		CreateCustom3DLabel("zile42O", 		TYPE_CUSTOMLABEL_BIL, 	x,    y-    0, 		z, 10);
		CreateCustom3DLabel("Kanada42O", 	TYPE_CUSTOMLABEL_BIL, 	x,    y+    2, 		z, 10);
		CreateCustom3DLabel("Ino42O",		TYPE_CUSTOMLABEL_BIL, 	x,    y-    4, 		z, 10);

		SendClientMessageToAll(0x00FF00FF, "THE LABELS CREATED!");
		labelscreated = true;
    	return 1;
	}
	if(strcmp(cmd, "/deletecustomlabels", true) == 0) 
	{
		if(!labelscreated) return SendClientMessage(playerid, -1, "U can't delete labels.. /createcustomlabels.");
		DestroyAllCustom3DLabels();
		SendClientMessageToAll(0x00FF00FF, "THE LABELS DELETED!");
		labelscreated = false;
    	return 1;
	}	

	return 0;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}


stock RandPosInArea( Float: minx, Float: miny, Float: maxx, Float: maxy, &Float:fDestX, &Float:fDestY )
{
    new
        iMin, iMax,
        Float:mul = floatpower(10.0, 4)
    ;

    iMin = floatround(minx * mul);
    iMax = floatround(maxx * mul);

    fDestX = float(random(iMax - iMin) + iMin) / mul;

    iMin = floatround(miny * mul);
    iMax = floatround(maxy * mul);

    fDestY = float(random(iMax - iMin) + iMin) / mul;

}