data
export ctfStateNames
align 4
LABELV ctfStateNames
address $83
address $84
address $85
address $86
address $87
address $88
address $89
export ctfStateDescriptions
align 4
LABELV ctfStateDescriptions
address $90
address $91
address $92
address $93
address $94
address $95
export sagaStateDescriptions
align 4
LABELV sagaStateDescriptions
address $90
address $96
address $97
export teamplayStateDescriptions
align 4
LABELV teamplayStateDescriptions
address $90
address $98
address $99
address $100
export BotStraightTPOrderCheck
code
proc BotStraightTPOrderCheck 4 0
file "../ai_main.c"
line 123
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: * $Author: Mrelusive $ 
;11: * $Revision: 35 $
;12: * $Modtime: 6/06/01 1:11p $
;13: * $Date: 6/06/01 12:06p $
;14: *
;15: *****************************************************************************/
;16:
;17:
;18:#include "g_local.h"
;19:#include "q_shared.h"
;20:#include "botlib.h"		//bot lib interface
;21:#include "be_aas.h"
;22:#include "be_ea.h"
;23:#include "be_ai_char.h"
;24:#include "be_ai_chat.h"
;25:#include "be_ai_gen.h"
;26:#include "be_ai_goal.h"
;27:#include "be_ai_move.h"
;28:#include "be_ai_weap.h"
;29://
;30:#include "ai_main.h"
;31:#include "w_saber.h"
;32://
;33:#include "chars.h"
;34:#include "inv.h"
;35:#include "syn.h"
;36:
;37:/*
;38:#define BOT_CTF_DEBUG	1
;39:*/
;40:
;41:#define MAX_PATH		144
;42:
;43:#define BOT_THINK_TIME	0
;44:
;45://bot states
;46:bot_state_t	*botstates[MAX_CLIENTS];
;47://number of bots
;48:int numbots;
;49://floating point time
;50:float floattime;
;51://time to do a regular update
;52:float regularupdate_time;
;53://
;54:
;55://for saga:
;56:extern int rebel_attackers;
;57:extern int imperial_attackers;
;58:
;59:boteventtracker_t gBotEventTracker[MAX_CLIENTS];
;60:
;61://rww - new bot cvars..
;62:vmCvar_t bot_forcepowers;
;63:vmCvar_t bot_forgimmick;
;64:vmCvar_t bot_honorableduelacceptance;
;65:#ifdef _DEBUG
;66:vmCvar_t bot_nogoals;
;67:vmCvar_t bot_debugmessages;
;68:#endif
;69:
;70:vmCvar_t bot_attachments;
;71:vmCvar_t bot_camp;
;72:
;73:vmCvar_t bot_wp_info;
;74:vmCvar_t bot_wp_edit;
;75:vmCvar_t bot_wp_clearweight;
;76:vmCvar_t bot_wp_distconnect;
;77:vmCvar_t bot_wp_visconnect;
;78://end rww
;79:
;80:wpobject_t *flagRed;
;81:wpobject_t *oFlagRed;
;82:wpobject_t *flagBlue;
;83:wpobject_t *oFlagBlue;
;84:
;85:gentity_t *eFlagRed;
;86:gentity_t *droppedRedFlag;
;87:gentity_t *eFlagBlue;
;88:gentity_t *droppedBlueFlag;
;89:
;90:char *ctfStateNames[] = {
;91:	"CTFSTATE_NONE",
;92:	"CTFSTATE_ATTACKER",
;93:	"CTFSTATE_DEFENDER",
;94:	"CTFSTATE_RETRIEVAL",
;95:	"CTFSTATE_GUARDCARRIER",
;96:	"CTFSTATE_GETFLAGHOME",
;97:	"CTFSTATE_MAXCTFSTATES"
;98:};
;99:
;100:char *ctfStateDescriptions[] = {
;101:	"I'm not occupied",
;102:	"I'm attacking the enemy's base",
;103:	"I'm defending our base",
;104:	"I'm getting our flag back",
;105:	"I'm escorting our flag carrier",
;106:	"I've got the enemy's flag"
;107:};
;108:
;109:char *sagaStateDescriptions[] = {
;110:	"I'm not occupied",
;111:	"I'm attemtping to complete the current objective",
;112:	"I'm preventing the enemy from completing their objective"
;113:};
;114:
;115:char *teamplayStateDescriptions[] = {
;116:	"I'm not occupied",
;117:	"I'm following my squad commander",
;118:	"I'm assisting my commanding",
;119:	"I'm attempting to regroup and form a new squad"
;120:};
;121:
;122:void BotStraightTPOrderCheck(gentity_t *ent, int ordernum, bot_state_t *bs)
;123:{
line 124
;124:	switch (ordernum)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $104
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $108
ADDRGP4 $102
JUMPV
line 125
;125:	{
LABELV $104
line 127
;126:	case 0:
;127:		if (bs->squadLeader == ent)
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $103
line 128
;128:		{
line 129
;129:			bs->teamplayState = 0;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:			bs->squadLeader = NULL;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 131
;131:		}
line 132
;132:		break;
ADDRGP4 $103
JUMPV
LABELV $107
line 134
;133:	case TEAMPLAYSTATE_FOLLOWING:
;134:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 135
;135:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 136
;136:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 137
;137:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 138
;138:		break;
ADDRGP4 $103
JUMPV
LABELV $108
line 140
;139:	case TEAMPLAYSTATE_ASSISTING:
;140:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 141
;141:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 142
;142:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 143
;143:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 144
;144:		break;
ADDRGP4 $103
JUMPV
LABELV $102
line 146
;145:	default:
;146:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 147
;147:		break;
LABELV $103
line 149
;148:	}
;149:}
LABELV $101
endproc BotStraightTPOrderCheck 4 0
export BotSelectWeapon
proc BotSelectWeapon 0 8
line 152
;150:
;151:void BotSelectWeapon(int client, int weapon)
;152:{
line 153
;153:	if (weapon <= WP_NONE)
ADDRFP4 4
INDIRI4
CNSTI4 0
GTI4 $110
line 154
;154:	{
line 155
;155:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 157
;156:	}
;157:	trap_EA_SelectWeapon(client, weapon);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 158
;158:}
LABELV $109
endproc BotSelectWeapon 0 8
export BotReportStatus
proc BotReportStatus 4 8
line 161
;159:
;160:void BotReportStatus(bot_state_t *bs)
;161:{
line 162
;162:	if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $113
line 163
;163:	{
line 164
;164:		trap_EA_SayTeam(bs->client, teamplayStateDescriptions[bs->teamplayState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamplayStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 165
;165:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 166
;166:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $116
line 167
;167:	{
line 168
;168:		trap_EA_SayTeam(bs->client, sagaStateDescriptions[bs->sagaState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sagaStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 169
;169:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 170
;170:	else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $123
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $119
LABELV $123
line 171
;171:	{
line 172
;172:		trap_EA_SayTeam(bs->client, ctfStateDescriptions[bs->ctfState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 173
;173:	}
LABELV $119
LABELV $117
LABELV $114
line 174
;174:}
LABELV $112
endproc BotReportStatus 4 8
export BotOrder
proc BotOrder 52 12
line 177
;175:
;176:void BotOrder(gentity_t *ent, int clientnum, int ordernum)
;177:{
line 178
;178:	int stateMin = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 179
;179:	int stateMax = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 180
;180:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 182
;181:
;182:	if (!ent || !ent->client || !ent->client->sess.teamLeader)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $128
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $128
ADDRLP4 20
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 0
NEI4 $125
LABELV $128
line 183
;183:	{
line 184
;184:		return;
ADDRGP4 $124
JUMPV
LABELV $125
line 187
;185:	}
;186:
;187:	if (clientnum != -1 && !botstates[clientnum])
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 -1
EQI4 $129
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 188
;188:	{
line 189
;189:		return;
ADDRGP4 $124
JUMPV
LABELV $129
line 192
;190:	}
;191:
;192:	if (clientnum != -1 && !OnSameTeam(ent, &g_entities[clientnum]))
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $131
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $131
line 193
;193:	{
line 194
;194:		return;
ADDRGP4 $124
JUMPV
LABELV $131
line 197
;195:	}
;196:
;197:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY && g_gametype.integer != GT_SAGA &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $133
line 199
;198:		g_gametype.integer != GT_TEAM)
;199:	{
line 200
;200:		return;
ADDRGP4 $124
JUMPV
LABELV $133
line 203
;201:	}
;202:
;203:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $143
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $139
LABELV $143
line 204
;204:	{
line 205
;205:		stateMin = CTFSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 206
;206:		stateMax = CTFSTATE_MAXCTFSTATES;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 207
;207:	}
ADDRGP4 $140
JUMPV
LABELV $139
line 208
;208:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $144
line 209
;209:	{
line 210
;210:		stateMin = SAGASTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 211
;211:		stateMax = SAGASTATE_MAXSAGASTATES;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 212
;212:	}
ADDRGP4 $145
JUMPV
LABELV $144
line 213
;213:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $147
line 214
;214:	{
line 215
;215:		stateMin = TEAMPLAYSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 216
;216:		stateMax = TEAMPLAYSTATE_MAXTPSTATES;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 217
;217:	}
LABELV $147
LABELV $145
LABELV $140
line 219
;218:
;219:	if ((ordernum < stateMin && ordernum != -1) || ordernum >= stateMax)
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $153
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $152
LABELV $153
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $150
LABELV $152
line 220
;220:	{
line 221
;221:		return;
ADDRGP4 $124
JUMPV
LABELV $150
line 224
;222:	}
;223:
;224:	if (clientnum != -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
EQI4 $162
line 225
;225:	{
line 226
;226:		if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $156
line 227
;227:		{
line 228
;228:			BotReportStatus(botstates[clientnum]);
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 229
;229:		}
ADDRGP4 $155
JUMPV
LABELV $156
line 231
;230:		else
;231:		{
line 232
;232:			BotStraightTPOrderCheck(ent, ordernum, botstates[clientnum]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 233
;233:			botstates[clientnum]->state_Forced = ordernum;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 234
;234:			botstates[clientnum]->chatObject = ent;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 235
;235:			botstates[clientnum]->chatAltObject = NULL;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 236
;236:			if (BotDoChat(botstates[clientnum], "OrderAccepted", 1))
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $155
line 237
;237:			{
line 238
;238:				botstates[clientnum]->chatTeam = 1;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 239
;239:			}
line 240
;240:		}
line 241
;241:	}
ADDRGP4 $155
JUMPV
line 243
;242:	else
;243:	{
LABELV $161
line 245
;244:		while (i < MAX_CLIENTS)
;245:		{
line 246
;246:			if (botstates[i] && OnSameTeam(ent, &g_entities[i]))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $164
line 247
;247:			{
line 248
;248:				if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $166
line 249
;249:				{
line 250
;250:					BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 251
;251:				}
ADDRGP4 $167
JUMPV
LABELV $166
line 253
;252:				else
;253:				{
line 254
;254:					BotStraightTPOrderCheck(ent, ordernum, botstates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 255
;255:					botstates[i]->state_Forced = ordernum;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 256
;256:					botstates[i]->chatObject = ent;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 257
;257:					botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 258
;258:					if (BotDoChat(botstates[i], "OrderAccepted", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $168
line 259
;259:					{
line 260
;260:						botstates[i]->chatTeam = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 261
;261:					}
LABELV $168
line 262
;262:				}
LABELV $167
line 263
;263:			}
LABELV $164
line 265
;264:
;265:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 266
;266:		}
LABELV $162
line 244
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $161
line 267
;267:	}
LABELV $155
line 268
;268:}
LABELV $124
endproc BotOrder 52 12
export BotMindTricked
proc BotMindTricked 4 0
line 271
;269:
;270:int BotMindTricked(int botClient, int enemyClient)
;271:{
line 274
;272:	forcedata_t *fd;
;273:
;274:	if (!g_entities[enemyClient].client)
CNSTI4 828
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
line 275
;275:	{
line 276
;276:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $171
line 279
;277:	}
;278:	
;279:	fd = &g_entities[enemyClient].client->ps.fd;
ADDRLP4 0
CNSTI4 828
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
line 281
;280:
;281:	if (!fd)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 282
;282:	{
line 283
;283:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $175
line 286
;284:	}
;285:
;286:	if (botClient > 47)
ADDRFP4 0
INDIRI4
CNSTI4 47
LEI4 $177
line 287
;287:	{
line 288
;288:		if (fd->forceMindtrickTargetIndex4 & (1 << (botClient-48)))
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $178
line 289
;289:		{
line 290
;290:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 292
;291:		}
;292:	}
LABELV $177
line 293
;293:	else if (botClient > 31)
ADDRFP4 0
INDIRI4
CNSTI4 31
LEI4 $181
line 294
;294:	{
line 295
;295:		if (fd->forceMindtrickTargetIndex3 & (1 << (botClient-32)))
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $182
line 296
;296:		{
line 297
;297:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 299
;298:		}
;299:	}
LABELV $181
line 300
;300:	else if (botClient > 15)
ADDRFP4 0
INDIRI4
CNSTI4 15
LEI4 $185
line 301
;301:	{
line 302
;302:		if (fd->forceMindtrickTargetIndex2 & (1 << (botClient-16)))
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $186
line 303
;303:		{
line 304
;304:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 306
;305:		}
;306:	}
LABELV $185
line 308
;307:	else
;308:	{
line 309
;309:		if (fd->forceMindtrickTargetIndex & (1 << botClient))
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $189
line 310
;310:		{
line 311
;311:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $189
line 313
;312:		}
;313:	}
LABELV $186
LABELV $182
LABELV $178
line 315
;314:
;315:	return 0;
CNSTI4 0
RETI4
LABELV $170
endproc BotMindTricked 4 0
export BotAI_Print
proc BotAI_Print 0 0
line 323
;316:}
;317:
;318:int BotGetWeaponRange(bot_state_t *bs);
;319:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent);
;320:
;321:void ExitLevel( void );
;322:
;323:void QDECL BotAI_Print(int type, char *fmt, ...) { return; }
LABELV $191
endproc BotAI_Print 0 0
export IsTeamplay
proc IsTeamplay 0 0
line 328
;324:
;325:qboolean WP_ForcePowerUsable( gentity_t *self, forcePowers_t forcePower );
;326:
;327:int IsTeamplay(void)
;328:{
line 329
;329:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $193
line 330
;330:	{
line 331
;331:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $192
JUMPV
LABELV $193
line 334
;332:	}
;333:
;334:	return 1;
CNSTI4 1
RETI4
LABELV $192
endproc IsTeamplay 0 0
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 342
;335:}
;336:
;337:/*
;338:==================
;339:BotAI_GetClientState
;340:==================
;341:*/
;342:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 345
;343:	gentity_t	*ent;
;344:
;345:	ent = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 346
;346:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $197
line 347
;347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $196
JUMPV
LABELV $197
line 349
;348:	}
;349:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $199
line 350
;350:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $196
JUMPV
LABELV $199
line 353
;351:	}
;352:
;353:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 354
;354:	return qtrue;
CNSTI4 1
RETI4
LABELV $196
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 4 12
line 362
;355:}
;356:
;357:/*
;358:==================
;359:BotAI_GetEntityState
;360:==================
;361:*/
;362:int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 365
;363:	gentity_t	*ent;
;364:
;365:	ent = &g_entities[entityNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 366
;366:	memset( state, 0, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 367
;367:	if (!ent->inuse) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $202
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $202
line 368
;368:	if (!ent->r.linked) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
NEI4 $204
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $204
line 369
;369:	if (ent->r.svFlags & SVF_NOCLIENT) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $206
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $206
line 370
;370:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 296
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 371
;371:	return qtrue;
CNSTI4 1
RETI4
LABELV $201
endproc BotAI_GetEntityState 4 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 379
;372:}
;373:
;374:/*
;375:==================
;376:BotAI_GetSnapshotEntity
;377:==================
;378:*/
;379:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 382
;380:	int		entNum;
;381:
;382:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 383
;383:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $209
line 384
;384:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 385
;385:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $208
JUMPV
LABELV $209
line 388
;386:	}
;387:
;388:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 390
;389:
;390:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $208
endproc BotAI_GetSnapshotEntity 8 12
export BotEntityInfo
proc BotEntityInfo 0 8
line 398
;391:}
;392:
;393:/*
;394:==============
;395:BotEntityInfo
;396:==============
;397:*/
;398:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 399
;399:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 400
;400:}
LABELV $211
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 407
;401:
;402:/*
;403:==============
;404:NumBots
;405:==============
;406:*/
;407:int NumBots(void) {
line 408
;408:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $212
endproc NumBots 0 0
export AngleDifference
proc AngleDifference 4 0
line 416
;409:}
;410:
;411:/*
;412:==============
;413:AngleDifference
;414:==============
;415:*/
;416:float AngleDifference(float ang1, float ang2) {
line 419
;417:	float diff;
;418:
;419:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 420
;420:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $214
line 421
;421:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $215
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 422
;422:	}
ADDRGP4 $215
JUMPV
LABELV $214
line 423
;423:	else {
line 424
;424:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $218
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $218
line 425
;425:	}
LABELV $215
line 426
;426:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $213
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 434
;427:}
;428:
;429:/*
;430:==============
;431:BotChangeViewAngle
;432:==============
;433:*/
;434:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 437
;435:	float move;
;436:
;437:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 438
;438:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 439
;439:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $221
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $220
JUMPV
LABELV $221
line 440
;440:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 441
;441:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $223
line 442
;442:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $224
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 443
;443:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 444
;444:	else {
line 445
;445:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $227
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $227
line 446
;446:	}
LABELV $224
line 447
;447:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $229
line 448
;448:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $230
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 449
;449:	}
ADDRGP4 $230
JUMPV
LABELV $229
line 450
;450:	else {
line 451
;451:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $233
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $233
line 452
;452:	}
LABELV $230
line 453
;453:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $220
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 84 8
line 461
;454:}
;455:
;456:/*
;457:==============
;458:BotChangeViewAngles
;459:==============
;460:*/
;461:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 465
;462:	float diff, factor, maxchange, anglespeed, disired_speed;
;463:	int i;
;464:
;465:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $236
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $236
line 467
;466:	
;467:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $238
ADDRLP4 28
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 468
;468:	{
line 469
;469:		factor = bs->skills.turnspeed_combat*bs->settings.skill;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
CNSTI4 2328
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
MULF4
ASGNF4
line 470
;470:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 472
;471:	else
;472:	{
line 473
;473:		factor = bs->skills.turnspeed;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
INDIRF4
ASGNF4
line 474
;474:	}
LABELV $239
line 476
;475:
;476:	if (factor > 1)
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
LEF4 $240
line 477
;477:	{
line 478
;478:		factor = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 479
;479:	}
LABELV $240
line 480
;480:	if (factor < 0.001)
ADDRLP4 12
INDIRF4
CNSTF4 981668463
GEF4 $242
line 481
;481:	{
line 482
;482:		factor = 0.001f;
ADDRLP4 12
CNSTF4 981668463
ASGNF4
line 483
;483:	}
LABELV $242
line 485
;484:
;485:	maxchange = bs->skills.maxturn;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRF4
ASGNF4
line 488
;486:
;487:	//if (maxchange < 240) maxchange = 240;
;488:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 489
;489:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $244
line 490
;490:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRF4
ASGNF4
line 491
;491:		bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
line 492
;492:		diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 56
INDIRF4
ASGNF4
line 493
;493:		disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 494
;494:		bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 495
;495:		if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $248
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $248
line 496
;496:		if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $250
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $250
line 497
;497:		anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
ASGNF4
line 498
;498:		if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $252
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $252
line 499
;499:		if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $254
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $254
line 500
;500:		bs->viewangles[i] += anglespeed;
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 501
;501:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRF4
ASGNF4
line 502
;502:		bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTF4 1055286886
CNSTF4 1065353216
ADDRLP4 12
INDIRF4
SUBF4
MULF4
MULF4
ASGNF4
line 503
;503:	}
LABELV $245
line 489
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $244
line 504
;504:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $256
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $256
line 505
;505:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 506
;506:}
LABELV $235
endproc BotChangeViewAngles 84 8
export BotInputToUserCommand
proc BotInputToUserCommand 120 16
line 513
;507:
;508:/*
;509:==============
;510:BotInputToUserCommand
;511:==============
;512:*/
;513:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time, int useTime) {
line 519
;514:	vec3_t angles, forward, right;
;515:	short temp;
;516:	int j;
;517:
;518:	//clear the whole structure
;519:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 523
;520:	//
;521:	//Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;522:	//the duration for the user command in milli seconds
;523:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 525
;524:	//
;525:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $259
line 526
;526:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 527
;527:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 528
;528:	}
LABELV $259
line 530
;529:	//set the buttons
;530:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $261
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $261
line 531
;531:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $263
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $263
line 532
;532:	if (bi->actionflags & ACTION_ALT_ATTACK) ucmd->buttons |= BUTTON_ALT_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $265
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $265
line 534
;533://	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
;534:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $267
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $267
line 535
;535:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $269
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $269
line 536
;536:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $271
ADDRLP4 60
CNSTI4 16
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
BORI4
ASGNI4
LABELV $271
line 538
;537:
;538:	if (bi->actionflags & ACTION_FORCEPOWER) ucmd->buttons |= BUTTON_FORCEPOWER;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $273
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $273
line 540
;539:
;540:	if (useTime < level.time && Q_irand(1, 10) < 5)
ADDRFP4 16
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $275
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 5
GEI4 $275
line 541
;541:	{ //for now just hit use randomly in case there's something useable around
line 542
;542:		ucmd->buttons |= BUTTON_USE;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 543
;543:	}
LABELV $275
line 556
;544:#if 0
;545:// Here's an interesting bit.  The bots in TA used buttons to do additional gestures.
;546:// I ripped them out because I didn't want too many buttons given the fact that I was already adding some for JK2.
;547:// We can always add some back in if we want though.
;548:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
;549:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
;550:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
;551:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
;552:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
;553:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
;554:#endif //0
;555:
;556:	if (bi->weapon == WP_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $278
line 557
;557:	{
line 561
;558:#ifdef _DEBUG
;559://		Com_Printf("WARNING: Bot tried to use WP_NONE!\n");
;560:#endif
;561:		bi->weapon = WP_BRYAR_PISTOL;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 3
ASGNI4
line 562
;562:	}
LABELV $278
line 565
;563:
;564:	//
;565:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 568
;566:	//set the view angles
;567:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;568:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 569
;569:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 570
;570:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 572
;571:	//subtract the delta angles
;572:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $280
line 573
;573:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 574
;574:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 575
;575:	}
LABELV $281
line 572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $280
line 579
;576:	//NOTE: movement is relative to the REAL view angles
;577:	//get the horizontal forward and right vector
;578:	//get the pitch in the range [-180, 180]
;579:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $284
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $285
JUMPV
LABELV $284
line 580
;580:	else angles[PITCH] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
LABELV $285
line 581
;581:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 582
;582:	angles[ROLL] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 583
;583:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 20
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 585
;584:	//bot input speed is in the range [0, 400]
;585:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTF4 1123942400
ADDRLP4 76
INDIRP4
INDIRF4
MULF4
CNSTF4 1137180672
DIVF4
ASGNF4
line 587
;586:	//set the view independent movement
;587:	ucmd->forwardmove = DotProduct(forward, bi->dir) * bi->speed;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 588
;588:	ucmd->rightmove = DotProduct(right, bi->dir) * bi->speed;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ADDRLP4 32
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 589
;589:	ucmd->upmove = abs(forward[2]) * bi->dir[2] * bi->speed;
ADDRLP4 8+8
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 88
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDRLP4 92
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 591
;590:	//normal keyboard movement
;591:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $293
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $293
line 592
;592:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $295
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $295
line 593
;593:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $297
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $297
line 594
;594:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $299
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $299
line 596
;595:	//jump/moveup
;596:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $301
ADDRLP4 112
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $301
line 598
;597:	//crouch/movedown
;598:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $303
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $303
line 602
;599:	//
;600:	//Com_Printf("forward = %d right = %d up = %d\n", ucmd.forwardmove, ucmd.rightmove, ucmd.upmove);
;601:	//Com_Printf("ucmd->serverTime = %d\n", ucmd->serverTime);
;602:}
LABELV $258
endproc BotInputToUserCommand 120 16
export BotUpdateInput
proc BotUpdateInput 64 20
line 609
;603:
;604:/*
;605:==============
;606:BotUpdateInput
;607:==============
;608:*/
;609:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 614
;610:	bot_input_t bi;
;611:	int j;
;612:
;613:	//add the delta angles to the bot's current view angles
;614:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $306
line 615
;615:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 616
;616:	}
LABELV $307
line 614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $306
line 618
;617:	//change the bot view angles
;618:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 620
;619:	//retrieve the bot input
;620:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 622
;621:	//respawn hack
;622:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $310
line 623
;623:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $313
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $313
line 624
;624:	}
LABELV $310
line 626
;625:	//convert the bot input to a usercmd
;626:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time, bs->noUseTime);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 4800
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 628
;627:	//subtract the delta angles
;628:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $316
line 629
;629:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
line 630
;630:	}
LABELV $317
line 628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $316
line 631
;631:}
LABELV $305
endproc BotUpdateInput 64 20
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 638
;632:
;633:/*
;634:==============
;635:BotAIRegularUpdate
;636:==============
;637:*/
;638:void BotAIRegularUpdate(void) {
line 639
;639:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $321
line 640
;640:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 641
;641:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 642
;642:	}
LABELV $321
line 643
;643:}
LABELV $320
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 28 0
line 650
;644:
;645:/*
;646:==============
;647:RemoveColorEscapeSequences
;648:==============
;649:*/
;650:void RemoveColorEscapeSequences( char *text ) {
line 653
;651:	int i, l;
;652:
;653:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 654
;654:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $324
line 655
;655:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $328
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $328
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $328
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $328
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $328
line 656
;656:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 657
;657:			continue;
ADDRGP4 $325
JUMPV
LABELV $328
line 659
;658:		}
;659:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $330
line 660
;660:			continue;
ADDRGP4 $325
JUMPV
LABELV $330
line 661
;661:		text[l++] = text[i];
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 662
;662:	}
LABELV $325
line 654
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $327
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $324
line 663
;663:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 664
;664:}
LABELV $323
endproc RemoveColorEscapeSequences 28 0
export BotAI
proc BotAI 1080 12
line 672
;665:
;666:
;667:/*
;668:==============
;669:BotAI
;670:==============
;671:*/
;672:int BotAI(int client, float thinktime) {
line 681
;673:	bot_state_t *bs;
;674:	char buf[1024], *args;
;675:	int j;
;676:#ifdef _DEBUG
;677:	int start = 0;
;678:	int end = 0;
;679:#endif
;680:
;681:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 683
;682:	//
;683:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 684
;684:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $333
LABELV $335
line 685
;685:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $336
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 686
;686:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $332
JUMPV
LABELV $333
line 690
;687:	}
;688:
;689:	//retrieve the current client state
;690:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $338
JUMPV
LABELV $337
line 693
;691:
;692:	//retrieve any waiting server commands
;693:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 695
;694:		//have buf point to the command and args to the command arguments
;695:		args = strchr( buf, ' ');
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1040
INDIRP4
ASGNP4
line 696
;696:		if (!args) continue;
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $340
ADDRGP4 $338
JUMPV
LABELV $340
line 697
;697:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 700
;698:
;699:		//remove color espace sequences from the arguments
;700:		RemoveColorEscapeSequences( args );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 702
;701:
;702:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 8
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $342
line 703
;703:			{ /*CenterPrintf*/ }
ADDRGP4 $343
JUMPV
LABELV $342
line 704
;704:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 8
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $345
line 705
;705:			{ /*ConfigStringModified*/ }
ADDRGP4 $346
JUMPV
LABELV $345
line 706
;706:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 8
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $348
line 707
;707:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $349
JUMPV
LABELV $348
line 708
;708:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 8
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $351
line 709
;709:			{ /*ignore*/ }
LABELV $351
LABELV $349
LABELV $346
LABELV $343
line 710
;710:	}
LABELV $338
line 693
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $337
line 712
;711:	//add the delta angles to the bot's current view angles
;712:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $354
line 713
;713:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 1056
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1052
INDIRP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 714
;714:	}
LABELV $355
line 712
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $354
line 716
;715:	//increase the local time of the bot
;716:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 1760
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 718
;717:	//
;718:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 1716
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 720
;719:	//origin of the bot
;720:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 1720
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 722
;721:	//eye coordinates of the bot
;722:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 723
;723:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 1752
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 729
;724:	//get the area the bot is in
;725:
;726:#ifdef _DEBUG
;727:	start = trap_Milliseconds();
;728:#endif
;729:	StandardBotAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 StandardBotAI
CALLV
pop
line 742
;730:#ifdef _DEBUG
;731:	end = trap_Milliseconds();
;732:
;733:	trap_Cvar_Update(&bot_debugmessages);
;734:
;735:	if (bot_debugmessages.integer)
;736:	{
;737:		Com_Printf("Single AI frametime: %i\n", (end - start));
;738:	}
;739:#endif
;740:
;741:	//subtract the delta angles
;742:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $358
line 743
;743:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1064
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 1076
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1072
INDIRP4
ADDRLP4 1076
INDIRF4
ASGNF4
line 744
;744:	}
LABELV $359
line 742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $358
line 746
;745:	//everything was ok
;746:	return qtrue;
CNSTI4 1
RETI4
LABELV $332
endproc BotAI 1080 12
export BotScheduleBotThink
proc BotScheduleBotThink 12 0
line 754
;747:}
;748:
;749:/*
;750:==================
;751:BotScheduleBotThink
;752:==================
;753:*/
;754:void BotScheduleBotThink(void) {
line 757
;755:	int i, botnum;
;756:
;757:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 759
;758:
;759:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $363
line 760
;760:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $369
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $367
LABELV $369
line 761
;761:			continue;
ADDRGP4 $364
JUMPV
LABELV $367
line 764
;762:		}
;763:		//initialize the bot think residual time
;764:		botstates[i]->botthink_residual = BOT_THINK_TIME * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 765
;765:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 766
;766:	}
LABELV $364
line 759
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $363
line 767
;767:}
LABELV $362
endproc BotScheduleBotThink 12 0
export PlayersInGame
proc PlayersInGame 24 0
line 770
;768:
;769:int PlayersInGame(void)
;770:{
line 771
;771:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 773
;772:	gentity_t *ent;
;773:	int pl = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $372
JUMPV
LABELV $371
line 776
;774:
;775:	while (i < MAX_CLIENTS)
;776:	{
line 777
;777:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 779
;778:
;779:		if (ent && ent->client && ent->client->pers.connected == CON_CONNECTED)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $374
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $374
ADDRLP4 20
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $374
line 780
;780:		{
line 781
;781:			pl++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 782
;782:		}
LABELV $374
line 784
;783:
;784:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 785
;785:	}
LABELV $372
line 775
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $371
line 787
;786:
;787:	return pl;
ADDRLP4 8
INDIRI4
RETI4
LABELV $370
endproc PlayersInGame 24 0
export BotAISetupClient
proc BotAISetupClient 32 12
line 795
;788:}
;789:
;790:/*
;791:==============
;792:BotAISetupClient
;793:==============
;794:*/
;795:int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) {
line 798
;796:	bot_state_t *bs;
;797:
;798:	if (!botstates[client]) botstates[client] = B_Alloc(sizeof(bot_state_t)); //G_Alloc(sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
CNSTI4 4808
ARGI4
ADDRLP4 4
ADDRGP4 B_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $377
line 801
;799:																			  //rww - G_Alloc bad! B_Alloc good.
;800:
;801:	memset(botstates[client], 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 803
;802:
;803:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 805
;804:
;805:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $379
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $379
line 806
;806:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $381
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 807
;807:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $376
JUMPV
LABELV $379
line 810
;808:	}
;809:
;810:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 812
;811:
;812:	bs->client = client; //need to know the client number before doing personality stuff
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 815
;813:
;814:	//initialize weapon weight defaults..
;815:	bs->botWeaponWeights[WP_NONE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
CNSTF4 0
ASGNF4
line 816
;816:	bs->botWeaponWeights[WP_STUN_BATON] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
CNSTF4 1065353216
ASGNF4
line 817
;817:	bs->botWeaponWeights[WP_SABER] = 10;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1092616192
ASGNF4
line 818
;818:	bs->botWeaponWeights[WP_BRYAR_PISTOL] = 11;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTF4 1093664768
ASGNF4
line 819
;819:	bs->botWeaponWeights[WP_BLASTER] = 12;
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
CNSTF4 1094713344
ASGNF4
line 820
;820:	bs->botWeaponWeights[WP_DISRUPTOR] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
CNSTF4 1095761920
ASGNF4
line 821
;821:	bs->botWeaponWeights[WP_BOWCASTER] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
CNSTF4 1096810496
ASGNF4
line 822
;822:	bs->botWeaponWeights[WP_REPEATER] = 15;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
CNSTF4 1097859072
ASGNF4
line 823
;823:	bs->botWeaponWeights[WP_DEMP2] = 16;
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
CNSTF4 1098907648
ASGNF4
line 824
;824:	bs->botWeaponWeights[WP_FLECHETTE] = 17;
ADDRLP4 0
INDIRP4
CNSTI4 2660
ADDP4
CNSTF4 1099431936
ASGNF4
line 825
;825:	bs->botWeaponWeights[WP_ROCKET_LAUNCHER] = 18;
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
CNSTF4 1099956224
ASGNF4
line 826
;826:	bs->botWeaponWeights[WP_THERMAL] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2668
ADDP4
CNSTF4 1096810496
ASGNF4
line 827
;827:	bs->botWeaponWeights[WP_TRIP_MINE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTF4 0
ASGNF4
line 828
;828:	bs->botWeaponWeights[WP_DET_PACK] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
CNSTF4 0
ASGNF4
line 830
;829:
;830:	BotUtilizePersonality(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotUtilizePersonality
CALLV
pop
line 832
;831:
;832:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $382
line 833
;833:	{
line 834
;834:		bs->botWeaponWeights[WP_SABER] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1095761920
ASGNF4
line 835
;835:	}
LABELV $382
line 838
;836:
;837:	//allocate a goal state
;838:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 841
;839:
;840:	//allocate a weapon state
;841:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 16
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 843
;842:
;843:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 844
;844:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 845
;845:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 846
;846:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 847
;847:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 20
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 848
;848:	numbots++;
ADDRLP4 24
ADDRGP4 numbots
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 851
;849:
;850:	//NOTE: reschedule the bot thinking
;851:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 853
;852:
;853:	if (PlayersInGame())
ADDRLP4 28
ADDRGP4 PlayersInGame
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $385
line 854
;854:	{ //don't talk to yourself
line 855
;855:		BotDoChat(bs, "GeneralGreetings", 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 856
;856:	}
LABELV $385
line 858
;857:
;858:	return qtrue;
CNSTI4 1
RETI4
LABELV $376
endproc BotAISetupClient 32 12
export BotAIShutdownClient
proc BotAIShutdownClient 12 12
line 866
;859:}
;860:
;861:/*
;862:==============
;863:BotAIShutdownClient
;864:==============
;865:*/
;866:int BotAIShutdownClient(int client, qboolean restart) {
line 869
;867:	bot_state_t *bs;
;868:
;869:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 870
;870:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $391
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $389
LABELV $391
line 872
;871:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;872:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $388
JUMPV
LABELV $389
line 875
;873:	}
;874:
;875:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 877
;876:	//free the goal state`			
;877:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 879
;878:	//free the weapon weights
;879:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 882
;880:	//
;881:	//clear the bot state
;882:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 884
;883:	//set the inuse flag to qfalse
;884:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 886
;885:	//there's one bot less
;886:	numbots--;
ADDRLP4 8
ADDRGP4 numbots
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 888
;887:	//everything went ok
;888:	return qtrue;
CNSTI4 1
RETI4
LABELV $388
endproc BotAIShutdownClient 12 12
export BotResetState
proc BotResetState 1700 12
line 899
;889:}
;890:
;891:/*
;892:==============
;893:BotResetState
;894:
;895:called when a bot enters the intermission or observer mode and
;896:when the level is changed
;897:==============
;898:*/
;899:void BotResetState(bot_state_t *bs) {
line 907
;900:	int client, entitynum, inuse;
;901:	int movestate, goalstate, weaponstate;
;902:	bot_settings_t settings;
;903:	playerState_t ps;							//current player state
;904:	float entergame_time;
;905:
;906:	//save some things that should not be reset here
;907:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 908
;908:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 316
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 909
;909:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 910
;910:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 911
;911:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 912
;912:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ASGNI4
line 913
;913:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ASGNI4
line 914
;914:	weaponstate = bs->ws;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ASGNI4
line 915
;915:	entergame_time = bs->entergame_time;
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
INDIRF4
ASGNF4
line 917
;916:	//reset the whole state
;917:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 919
;918:	//copy back some state stuff that should not be reset
;919:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 920
;920:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 921
;921:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 922
;922:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 923
;923:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 924
;924:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 925
;925:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 926
;926:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 927
;927:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRLP4 1696
INDIRF4
ASGNF4
line 929
;928:	//reset several states
;929:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $393
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $393
line 930
;930:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $395
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $395
line 931
;931:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $397
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $397
line 932
;932:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $399
line 933
;933:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $401
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $401
line 934
;934:}
LABELV $392
endproc BotResetState 1700 12
export BotAILoadMap
proc BotAILoadMap 8 4
line 941
;935:
;936:/*
;937:==============
;938:BotAILoadMap
;939:==============
;940:*/
;941:int BotAILoadMap( int restart ) {
line 944
;942:	int			i;
;943:
;944:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $404
line 945
;945:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $408
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $408
line 946
;946:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 947
;947:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 948
;948:		}
LABELV $408
line 949
;949:	}
LABELV $405
line 944
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $404
line 951
;950:
;951:	return qtrue;
CNSTI4 1
RETI4
LABELV $403
endproc BotAILoadMap 8 4
export OrgVisible
proc OrgVisible 1084 28
line 956
;952:}
;953:
;954://rww - bot ai
;955:int OrgVisible(vec3_t org1, vec3_t org2, int ignore)
;956:{
line 959
;957:	trace_t tr;
;958:
;959:	trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
CNSTP4 0
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 961
;960:
;961:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $411
line 962
;962:	{
line 963
;963:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $410
JUMPV
LABELV $411
line 966
;964:	}
;965:
;966:	return 0;
CNSTI4 0
RETI4
LABELV $410
endproc OrgVisible 1084 28
export WPOrgVisible
proc WPOrgVisible 1104 28
line 970
;967:}
;968:
;969:int WPOrgVisible(gentity_t *bot, vec3_t org1, vec3_t org2, int ignore)
;970:{
line 974
;971:	trace_t tr;
;972:	gentity_t *ownent;
;973:
;974:	trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1084
CNSTP4 0
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 976
;975:
;976:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $415
line 977
;977:	{
line 978
;978:		trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1088
CNSTP4 0
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 980
;979:
;980:		if (tr.fraction != 1 && tr.entityNum != ENTITYNUM_NONE && g_entities[tr.entityNum].s.eType == ET_SPECIAL)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $418
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $418
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $418
line 981
;981:		{
line 982
;982:			if (g_entities[tr.entityNum].parent && g_entities[tr.entityNum].parent->client)
ADDRLP4 1092
CNSTI4 828
ASGNI4
ADDRLP4 1096
CNSTU4 0
ASGNU4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $424
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $424
line 983
;983:			{
line 984
;984:				ownent = g_entities[tr.entityNum].parent;
ADDRLP4 1080
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
ASGNP4
line 986
;985:
;986:				if (OnSameTeam(bot, ownent) || bot->s.number == ownent->s.number)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $434
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 1080
INDIRP4
INDIRI4
NEI4 $432
LABELV $434
line 987
;987:				{
line 988
;988:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $432
line 990
;989:				}
;990:			}
LABELV $424
line 991
;991:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $414
JUMPV
LABELV $418
line 994
;992:		}
;993:
;994:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $415
line 997
;995:	}
;996:
;997:	return 0;
CNSTI4 0
RETI4
LABELV $414
endproc WPOrgVisible 1104 28
export OrgVisibleBox
proc OrgVisibleBox 1084 28
line 1001
;998:}
;999:
;1000:int OrgVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore)
;1001:{
line 1004
;1002:	trace_t tr;
;1003:
;1004:	trap_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1006
;1005:
;1006:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $436
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $436
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $436
line 1007
;1007:	{
line 1008
;1008:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $435
JUMPV
LABELV $436
line 1011
;1009:	}
;1010:
;1011:	return 0;
CNSTI4 0
RETI4
LABELV $435
endproc OrgVisibleBox 1084 28
export CheckForFunc
proc CheckForFunc 1104 28
line 1015
;1012:}
;1013:
;1014:int CheckForFunc(vec3_t org, int ignore)
;1015:{
line 1020
;1016:	gentity_t *fent;
;1017:	vec3_t under;
;1018:	trace_t tr;
;1019:
;1020:	VectorCopy(org, under);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1022
;1021:
;1022:	under[2] -= 64;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1024
;1023:
;1024:	trap_Trace(&tr, org, NULL, NULL, under, ignore, MASK_SOLID);
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1096
CNSTP4 0
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1026
;1025:
;1026:	if (tr.fraction == 1)
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
NEF4 $442
line 1027
;1027:	{
line 1028
;1028:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $440
JUMPV
LABELV $442
line 1031
;1029:	}
;1030:
;1031:	fent = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1033
;1032:
;1033:	if (!fent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $446
line 1034
;1034:	{
line 1035
;1035:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $440
JUMPV
LABELV $446
line 1038
;1036:	}
;1037:
;1038:	if (strstr(fent->classname, "func_"))
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 1100
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
line 1039
;1039:	{
line 1040
;1040:		return 1; //there's a func brush here
CNSTI4 1
RETI4
ADDRGP4 $440
JUMPV
LABELV $448
line 1043
;1041:	}
;1042:
;1043:	return 0;
CNSTI4 0
RETI4
LABELV $440
endproc CheckForFunc 1104 28
export GetNearestVisibleWP
proc GetNearestVisibleWP 84 20
line 1047
;1044:}
;1045:
;1046:int GetNearestVisibleWP(vec3_t org, int ignore)
;1047:{
line 1054
;1048:	int i;
;1049:	float bestdist;
;1050:	float flLen;
;1051:	int bestindex;
;1052:	vec3_t a, mins, maxs;
;1053:
;1054:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1055
;1055:	bestdist = 800;//99999;
ADDRLP4 20
CNSTF4 1145569280
ASGNF4
line 1057
;1056:			   //don't trace over 800 units away to avoid GIANT HORRIBLE SPEED HITS ^_^
;1057:	bestindex = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 1059
;1058:
;1059:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 1060
;1060:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 1061
;1061:	mins[2] = -1;
ADDRLP4 24+8
CNSTF4 3212836864
ASGNF4
line 1062
;1062:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 1063
;1063:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 1064
;1064:	maxs[2] = 1;
ADDRLP4 36+8
CNSTF4 1065353216
ASGNF4
ADDRGP4 $457
JUMPV
LABELV $456
line 1067
;1065:
;1066:	while (i < gWPNum)
;1067:	{
line 1068
;1068:		if (gWPArray[i] && gWPArray[i]->inuse)
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $459
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 1069
;1069:		{
line 1070
;1070:			VectorSubtract(org, gWPArray[i]->origin, a);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 8
ASGNI4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1071
;1071:			flLen = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 72
INDIRF4
ASGNF4
line 1073
;1072:
;1073:			if (flLen < bestdist && trap_InPVS(org, gWPArray[i]->origin) && OrgVisibleBox(org, mins, maxs, gWPArray[i]->origin, ignore))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $463
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $463
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisibleBox
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $463
line 1074
;1074:			{
line 1075
;1075:				bestdist = flLen;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 1076
;1076:				bestindex = i;
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
line 1077
;1077:			}
LABELV $463
line 1078
;1078:		}
LABELV $459
line 1080
;1079:
;1080:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1081
;1081:	}
LABELV $457
line 1066
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $456
line 1083
;1082:
;1083:	return bestindex;
ADDRLP4 48
INDIRI4
RETI4
LABELV $451
endproc GetNearestVisibleWP 84 20
export PassWayCheck
proc PassWayCheck 32 0
line 1091
;1084:}
;1085:
;1086://wpDirection
;1087://0 == FORWARD
;1088://1 == BACKWARD
;1089:
;1090:int PassWayCheck(bot_state_t *bs, int windex)
;1091:{
line 1092
;1092:	if (!gWPArray[windex] || !gWPArray[windex]->inuse)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $468
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $466
LABELV $468
line 1093
;1093:	{
line 1094
;1094:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $466
line 1097
;1095:	}
;1096:
;1097:	if (bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_FWD))
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $469
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $469
line 1098
;1098:	{
line 1099
;1099:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $469
line 1101
;1100:	}
;1101:	else if (!bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_BACK))
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $471
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $471
line 1102
;1102:	{
line 1103
;1103:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $471
line 1106
;1104:	}
;1105:
;1106:	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
ADDRLP4 20
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $473
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
LEF4 $473
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $473
line 1109
;1107:		gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1108:		bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1109:	{
line 1110
;1110:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $473
line 1113
;1111:	}
;1112:
;1113:	return 1;
CNSTI4 1
RETI4
LABELV $465
endproc PassWayCheck 32 0
export TotalTrailDistance
proc TotalTrailDistance 40 0
line 1117
;1114:}
;1115:
;1116:float TotalTrailDistance(int start, int end, bot_state_t *bs)
;1117:{
line 1121
;1118:	int beginat;
;1119:	int endat;
;1120:	float distancetotal;
;1121:	float gdif = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1123
;1122:
;1123:	distancetotal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1125
;1124:
;1125:	if (start > end)
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $476
line 1126
;1126:	{
line 1127
;1127:		beginat = end;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1128
;1128:		endat = start;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
line 1129
;1129:	}
ADDRGP4 $479
JUMPV
LABELV $476
line 1131
;1130:	else
;1131:	{
line 1132
;1132:		beginat = start;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 1133
;1133:		endat = end;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1134
;1134:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 1137
;1135:
;1136:	while (beginat < endat)
;1137:	{
line 1138
;1138:		if (beginat >= gWPNum || !gWPArray[beginat] || !gWPArray[beginat]->inuse)
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $484
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $484
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $481
LABELV $484
line 1139
;1139:		{
line 1140
;1140:			return -1; //error
CNSTF4 3212836864
RETF4
ADDRGP4 $475
JUMPV
LABELV $481
line 1143
;1141:		}
;1142:
;1143:		if ((end > start && gWPArray[beginat]->flags & WPFLAG_ONEWAY_BACK) ||
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $488
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $487
LABELV $488
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $485
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $485
LABELV $487
line 1145
;1144:			(start > end && gWPArray[beginat]->flags & WPFLAG_ONEWAY_FWD))
;1145:		{
line 1146
;1146:			return -1;
CNSTF4 3212836864
RETF4
ADDRGP4 $475
JUMPV
LABELV $485
line 1149
;1147:		}
;1148:	
;1149:		if (gWPArray[beginat]->forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $489
line 1150
;1150:		{
line 1151
;1151:			if (gWPArray[beginat-1] && gWPArray[beginat-1]->origin[2]+64 < gWPArray[beginat]->origin[2])
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $491
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
GEF4 $491
line 1152
;1152:			{
line 1153
;1153:				gdif = gWPArray[beginat]->origin[2] - gWPArray[beginat-1]->origin[2];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1154
;1154:			}
LABELV $491
line 1156
;1155:
;1156:			if (gdif)
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $496
line 1157
;1157:			{
line 1162
;1158:			//	if (bs && bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[beginat]->forceJumpTo)
;1159:			//	{
;1160:			//		return -1;
;1161:			//	}
;1162:			}
LABELV $496
line 1163
;1163:		}
LABELV $489
line 1172
;1164:		
;1165:	/*	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
;1166:			gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1167:			bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1168:		{
;1169:			return -1;
;1170:		}*/
;1171:
;1172:		distancetotal += gWPArray[beginat]->disttonext;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1174
;1173:
;1174:		beginat++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1175
;1175:	}
LABELV $479
line 1136
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $478
line 1177
;1176:
;1177:	return distancetotal;
ADDRLP4 4
INDIRF4
RETF4
LABELV $475
endproc TotalTrailDistance 40 0
export CheckForShorterRoutes
proc CheckForShorterRoutes 40 12
line 1181
;1178:}
;1179:
;1180:void CheckForShorterRoutes(bot_state_t *bs, int newwpindex)
;1181:{
line 1188
;1182:	float bestlen;
;1183:	float checklen;
;1184:	int bestindex;
;1185:	int i;
;1186:	int fj;
;1187:
;1188:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1189
;1189:	fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1191
;1190:
;1191:	if (!bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
line 1192
;1192:	{
line 1193
;1193:		return;
ADDRGP4 $498
JUMPV
LABELV $499
line 1196
;1194:	}
;1195:
;1196:	if (newwpindex < bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
GEI4 $501
line 1197
;1197:	{
line 1198
;1198:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1199
;1199:	}
ADDRGP4 $502
JUMPV
LABELV $501
line 1200
;1200:	else if (newwpindex > bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LEI4 $503
line 1201
;1201:	{
line 1202
;1202:		bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1203
;1203:	}
LABELV $503
LABELV $502
line 1205
;1204:
;1205:	if (bs->wpSwitchTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $505
line 1206
;1206:	{
line 1207
;1207:		return;
ADDRGP4 $498
JUMPV
LABELV $505
line 1210
;1208:	}
;1209:
;1210:	if (!gWPArray[newwpindex]->neighbornum)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 0
NEI4 $508
line 1211
;1211:	{
line 1212
;1212:		return;
ADDRGP4 $498
JUMPV
LABELV $508
line 1215
;1213:	}
;1214:
;1215:	bestindex = newwpindex;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
line 1216
;1216:	bestlen = TotalTrailDistance(newwpindex, bs->wpDestination->index, bs);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRGP4 $511
JUMPV
LABELV $510
line 1219
;1217:
;1218:	while (i < gWPArray[newwpindex]->neighbornum)
;1219:	{
line 1220
;1220:		checklen = TotalTrailDistance(gWPArray[newwpindex]->neighbors[i].num, bs->wpDestination->index, bs);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 1222
;1221:
;1222:		if (checklen < bestlen-64 || bestlen == -1)
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1115684864
SUBF4
LTF4 $515
ADDRLP4 4
INDIRF4
CNSTF4 3212836864
NEF4 $513
LABELV $515
line 1223
;1223:		{
line 1224
;1224:			if (bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] >= gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $516
line 1225
;1225:			{
line 1226
;1226:				bestlen = checklen;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1227
;1227:				bestindex = gWPArray[newwpindex]->neighbors[i].num;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1229
;1228:
;1229:				if (gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
line 1230
;1230:				{
line 1231
;1231:					fj = gWPArray[newwpindex]->neighbors[i].forceJumpTo;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1232
;1232:				}
ADDRGP4 $519
JUMPV
LABELV $518
line 1234
;1233:				else
;1234:				{
line 1235
;1235:					fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1236
;1236:				}
LABELV $519
line 1237
;1237:			}
LABELV $516
line 1238
;1238:		}
LABELV $513
line 1240
;1239:
;1240:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1241
;1241:	}
LABELV $511
line 1218
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LTI4 $510
line 1243
;1242:
;1243:	if (bestindex != newwpindex && bestindex != -1)
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $520
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $520
line 1244
;1244:	{
line 1245
;1245:		bs->wpCurrent = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1246
;1246:		bs->wpSwitchTime = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
CVIF4 4
ASGNF4
line 1248
;1247:
;1248:		if (fj)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $523
line 1249
;1249:		{
line 1251
;1250:#ifndef FORCEJUMP_INSTANTMETHOD
;1251:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1252
;1252:			bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 1253
;1253:			bs->forceJumping = bs->forceJumpChargeTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 2024
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1260
;1254:#else
;1255:			bs->beStill = level.time + 500;
;1256:			bs->jumpTime = level.time + fj*1200;
;1257:			bs->jDelay = level.time + 200;
;1258:			bs->forceJumping = bs->jumpTime;
;1259:#endif
;1260:		}
LABELV $523
line 1261
;1261:	}
LABELV $520
line 1262
;1262:}
LABELV $498
endproc CheckForShorterRoutes 40 12
export WPConstantRoutine
proc WPConstantRoutine 24 0
line 1265
;1263:
;1264:void WPConstantRoutine(bot_state_t *bs)
;1265:{
line 1266
;1266:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $528
line 1267
;1267:	{
line 1268
;1268:		return;
ADDRGP4 $527
JUMPV
LABELV $528
line 1271
;1269:	}
;1270:
;1271:	if (bs->wpCurrent->flags & WPFLAG_DUCK)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $530
line 1272
;1272:	{
line 1273
;1273:		bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1274
;1274:	}
LABELV $530
line 1277
;1275:
;1276:#ifndef FORCEJUMP_INSTANTMETHOD
;1277:	if (bs->wpCurrent->flags & WPFLAG_JUMP)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $533
line 1278
;1278:	{
line 1279
;1279:		float heightDif = (bs->wpCurrent->origin[2] - bs->origin[2]+16);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1281
;1280:
;1281:		if (bs->origin[2]+16 >= bs->wpCurrent->origin[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LTF4 $535
line 1282
;1282:		{ //then why exactly would we be force jumping?
line 1283
;1283:			heightDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1284
;1284:		}
LABELV $535
line 1286
;1285:
;1286:		if (heightDif > 40 && (bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)) && (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100) || bs->cur_ps.groundEntityNum == ENTITYNUM_NONE))
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $537
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $537
ADDRLP4 12
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
LTF4 $539
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $537
LABELV $539
line 1287
;1287:		{
line 1288
;1288:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1289
;1289:			if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE && bs->jumpPrep < (level.time-300))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $541
ADDRLP4 20
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
SUBI4
CVIF4 4
GEF4 $541
line 1290
;1290:			{
line 1291
;1291:				bs->jumpPrep = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
CVIF4 4
ASGNF4
line 1292
;1292:			}
LABELV $541
line 1293
;1293:			bs->beStill = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
CVIF4 4
ASGNF4
line 1294
;1294:			bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 1296
;1295:
;1296:			if (bs->wpSeenTime < (level.time + 600))
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
GEF4 $538
line 1297
;1297:			{
line 1298
;1298:				bs->wpSeenTime = level.time + 600;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
ASGNF4
line 1299
;1299:			}
line 1300
;1300:		}
ADDRGP4 $538
JUMPV
LABELV $537
line 1301
;1301:		else if (heightDif > 64 && !(bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)))
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
LEF4 $550
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $550
line 1302
;1302:		{ //this point needs force jump to reach and we don't have it
line 1304
;1303:			//Kill the current point and turn around
;1304:			bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 1305
;1305:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $552
line 1306
;1306:			{
line 1307
;1307:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1308
;1308:			}
ADDRGP4 $527
JUMPV
LABELV $552
line 1310
;1309:			else
;1310:			{
line 1311
;1311:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1312
;1312:			}
line 1314
;1313:
;1314:			return;
ADDRGP4 $527
JUMPV
LABELV $550
LABELV $538
line 1316
;1315:		}
;1316:	}
LABELV $533
line 1319
;1317:#endif
;1318:
;1319:	if (bs->wpCurrent->forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $554
line 1320
;1320:	{
line 1327
;1321:#ifdef FORCEJUMP_INSTANTMETHOD
;1322:		if (bs->origin[2]+16 < bs->wpCurrent->origin[2])
;1323:		{
;1324:			bs->jumpTime = level.time + 100;
;1325:		}
;1326:#else
;1327:		float heightDif = (bs->wpCurrent->origin[2] - bs->origin[2]+16);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1329
;1328:
;1329:		if (bs->origin[2]+16 >= bs->wpCurrent->origin[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LTF4 $556
line 1330
;1330:		{ //then why exactly would we be force jumping?
line 1331
;1331:			heightDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1332
;1332:		}
LABELV $556
line 1334
;1333:
;1334:		if (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
GEF4 $558
line 1335
;1335:		{
line 1336
;1336:			bs->forceJumpChargeTime = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1337
;1337:		}
LABELV $558
line 1339
;1338:#endif
;1339:	}
LABELV $554
line 1340
;1340:}
LABELV $527
endproc WPConstantRoutine 24 0
export BotCTFGuardDuty
proc BotCTFGuardDuty 0 0
line 1343
;1341:
;1342:qboolean BotCTFGuardDuty(bot_state_t *bs)
;1343:{
line 1344
;1344:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $562
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $562
line 1346
;1345:		g_gametype.integer != GT_CTY)
;1346:	{
line 1347
;1347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $561
JUMPV
LABELV $562
line 1350
;1348:	}
;1349:
;1350:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $566
line 1351
;1351:	{
line 1352
;1352:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $561
JUMPV
LABELV $566
line 1355
;1353:	}
;1354:
;1355:	return qfalse;
CNSTI4 0
RETI4
LABELV $561
endproc BotCTFGuardDuty 0 0
export WPTouchRoutine
proc WPTouchRoutine 56 8
line 1359
;1356:}
;1357:
;1358:void WPTouchRoutine(bot_state_t *bs)
;1359:{
line 1362
;1360:	int lastNum;
;1361:
;1362:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $569
line 1363
;1363:	{
line 1364
;1364:		return;
ADDRGP4 $568
JUMPV
LABELV $569
line 1367
;1365:	}
;1366:
;1367:	bs->wpTravelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1369
;1368:
;1369:	if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $572
line 1370
;1370:	{
line 1371
;1371:		bs->noUseTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 1372
;1372:	}
LABELV $572
line 1381
;1373:
;1374:#ifdef FORCEJUMP_INSTANTMETHOD
;1375:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && bs->wpCurrent->forceJumpTo)
;1376:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
;1377:	  //handled elsewhere.
;1378:		bs->jumpTime = level.time + 100;
;1379:	}
;1380:#else
;1381:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && !bs->wpCurrent->forceJumpTo)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $575
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $575
line 1382
;1382:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
line 1384
;1383:	  //handled elsewhere.
;1384:		bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1385
;1385:	}
LABELV $575
line 1388
;1386:#endif
;1387:
;1388:	trap_Cvar_Update(&bot_camp);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1390
;1389:
;1390:	if (bs->isCamper && bot_camp.integer && (BotIsAChickenWuss(bs) || BotCTFGuardDuty(bs) || bs->isCamper == 2) && ((bs->wpCurrent->flags & WPFLAG_SNIPEORCAMP) || (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $578
ADDRGP4 bot_camp+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $578
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $582
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotCTFGuardDuty
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $582
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
NEI4 $578
LABELV $582
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $583
ADDRLP4 28
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $578
LABELV $583
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 2
EQI4 $578
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $578
line 1392
;1391:		bs->cur_ps.weapon != WP_SABER && bs->cur_ps.weapon != WP_STUN_BATON)
;1392:	{ //if we're a camper and a chicken then camp
line 1393
;1393:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $584
line 1394
;1394:		{
line 1395
;1395:			lastNum = bs->wpCurrent->index+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1396
;1396:		}
ADDRGP4 $585
JUMPV
LABELV $584
line 1398
;1397:		else
;1398:		{
line 1399
;1399:			lastNum = bs->wpCurrent->index-1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1400
;1400:		}
LABELV $585
line 1402
;1401:
;1402:		if (gWPArray[lastNum] && gWPArray[lastNum]->inuse && gWPArray[lastNum]->index && bs->isCamping < level.time)
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $579
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $579
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $579
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $579
line 1403
;1403:		{
line 1404
;1404:			bs->isCamping = level.time + rand()%15000 + 30000;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 15000
MODI4
ADDI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 1405
;1405:			bs->wpCamping = bs->wpCurrent;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 2068
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
line 1406
;1406:			bs->wpCampingTo = gWPArray[lastNum];
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1408
;1407:
;1408:			if (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $590
line 1409
;1409:			{
line 1410
;1410:				bs->campStanding = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 1
ASGNI4
line 1411
;1411:			}
ADDRGP4 $579
JUMPV
LABELV $590
line 1413
;1412:			else
;1413:			{
line 1414
;1414:				bs->campStanding = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 0
ASGNI4
line 1415
;1415:			}
line 1416
;1416:		}
line 1418
;1417:
;1418:	}
ADDRGP4 $579
JUMPV
LABELV $578
line 1419
;1419:	else if ((bs->cur_ps.weapon == WP_SABER || bs->cur_ps.weapon == WP_STUN_BATON) &&
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $595
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $592
LABELV $595
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $592
line 1421
;1420:		bs->isCamping > level.time)
;1421:	{
line 1422
;1422:		bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 1423
;1423:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 1424
;1424:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 1425
;1425:	}
LABELV $592
LABELV $579
line 1427
;1426:
;1427:	if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $596
line 1428
;1428:	{
line 1429
;1429:		if (bs->wpCurrent->index == bs->wpDestination->index)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 16
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $598
line 1430
;1430:		{
line 1431
;1431:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 1433
;1432:
;1433:			if (bs->runningLikeASissy)
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
INDIRI4
CNSTI4 0
EQI4 $600
line 1434
;1434:			{ //this obviously means we're scared and running, so we'll want to keep our navigational priorities less delayed
line 1435
;1435:				bs->destinationGrabTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 1436
;1436:			}
ADDRGP4 $599
JUMPV
LABELV $600
line 1438
;1437:			else
;1438:			{
line 1439
;1439:				bs->destinationGrabTime = level.time + 3500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3500
ADDI4
CVIF4 4
ASGNF4
line 1440
;1440:			}
line 1441
;1441:		}
ADDRGP4 $599
JUMPV
LABELV $598
line 1443
;1442:		else
;1443:		{
line 1444
;1444:			CheckForShorterRoutes(bs, bs->wpCurrent->index);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckForShorterRoutes
CALLV
pop
line 1445
;1445:		}
LABELV $599
line 1446
;1446:	}
LABELV $596
line 1447
;1447:}
LABELV $568
endproc WPTouchRoutine 56 8
export MoveTowardIdealAngles
proc MoveTowardIdealAngles 4 0
line 1450
;1448:
;1449:void MoveTowardIdealAngles(bot_state_t *bs)
;1450:{
line 1451
;1451:	VectorCopy(bs->goalAngles, bs->ideal_viewangles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 1452
;1452:}
LABELV $604
endproc MoveTowardIdealAngles 4 0
lit
align 4
LABELV $606
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $607
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export BotTrace_Strafe
code
proc BotTrace_Strafe 1200 28
line 1461
;1453:
;1454:#define BOT_STRAFE_AVOIDANCE
;1455:
;1456:#ifdef BOT_STRAFE_AVOIDANCE
;1457:#define STRAFEAROUND_RIGHT			1
;1458:#define STRAFEAROUND_LEFT			2
;1459:
;1460:int BotTrace_Strafe(bot_state_t *bs, vec3_t traceto)
;1461:{
line 1462
;1462:	vec3_t playerMins = {-15, -15, /*DEFAULT_MINS_2*/-8};
ADDRLP4 1140
ADDRGP4 $606
INDIRB
ASGNB 12
line 1463
;1463:	vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 1152
ADDRGP4 $607
INDIRB
ASGNB 12
line 1469
;1464:	vec3_t from, to;
;1465:	vec3_t dirAng, dirDif;
;1466:	vec3_t forward, right;
;1467:	trace_t tr;
;1468:
;1469:	if (bs->cur_ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $608
line 1470
;1470:	{ //don't do this in the air, it can be.. dangerous.
line 1471
;1471:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $608
line 1474
;1472:	}
;1473:
;1474:	VectorSubtract(traceto, bs->origin, dirAng);
ADDRLP4 1176
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 1176
INDIRP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 1176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1475
;1475:	VectorNormalize(dirAng);
ADDRLP4 36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1476
;1476:	vectoangles(dirAng, dirAng);
ADDRLP4 36
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1478
;1477:
;1478:	if (AngleDifference(bs->viewangles[YAW], dirAng[YAW]) > 60 ||
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1184
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1184
INDIRF4
CNSTF4 1114636288
GTF4 $616
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1188
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1188
INDIRF4
CNSTF4 3262119936
GEF4 $612
LABELV $616
line 1480
;1479:		AngleDifference(bs->viewangles[YAW], dirAng[YAW]) < -60)
;1480:	{ //If we aren't facing the direction we're going here, then we've got enough excuse to be too stupid to strafe around anyway
line 1481
;1481:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $612
line 1484
;1482:	}
;1483:
;1484:	VectorCopy(bs->origin, from);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1485
;1485:	VectorCopy(traceto, to);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1487
;1486:
;1487:	VectorSubtract(to, from, dirDif);
ADDRLP4 48
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1488
;1488:	VectorNormalize(dirDif);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1489
;1489:	vectoangles(dirDif, dirDif);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1491
;1490:
;1491:	AngleVectors(dirDif, forward, 0, 0);
ADDRLP4 48
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1493
;1492:
;1493:	to[0] = from[0] + forward[0]*32;
ADDRLP4 12
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164
INDIRF4
MULF4
ADDF4
ASGNF4
line 1494
;1494:	to[1] = from[1] + forward[1]*32;
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1495
;1495:	to[2] = from[2] + forward[2]*32;
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1497
;1496:
;1497:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1499
;1498:
;1499:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $629
line 1500
;1500:	{
line 1501
;1501:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $629
line 1504
;1502:	}
;1503:
;1504:	AngleVectors(dirAng, 0, right, 0);
ADDRLP4 36
ARGP4
ADDRLP4 1196
CNSTP4 0
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1506
;1505:
;1506:	from[0] += right[0]*32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1507
;1507:	from[1] += right[1]*32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1508
;1508:	from[2] += right[2]*16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1510
;1509:
;1510:	to[0] += right[0]*32;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1511
;1511:	to[1] += right[1]*32;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1512
;1512:	to[2] += right[2]*32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1514
;1513:
;1514:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1516
;1515:
;1516:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $640
line 1517
;1517:	{
line 1518
;1518:		return STRAFEAROUND_RIGHT;
CNSTI4 1
RETI4
ADDRGP4 $605
JUMPV
LABELV $640
line 1521
;1519:	}
;1520:
;1521:	from[0] -= right[0]*64;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1522
;1522:	from[1] -= right[1]*64;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1523
;1523:	from[2] -= right[2]*64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1525
;1524:
;1525:	to[0] -= right[0]*64;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1526
;1526:	to[1] -= right[1]*64;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1527
;1527:	to[2] -= right[2]*64;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1529
;1528:
;1529:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1531
;1530:
;1531:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $651
line 1532
;1532:	{
line 1533
;1533:		return STRAFEAROUND_LEFT;
CNSTI4 2
RETI4
ADDRGP4 $605
JUMPV
LABELV $651
line 1536
;1534:	}
;1535:
;1536:	return 0;
CNSTI4 0
RETI4
LABELV $605
endproc BotTrace_Strafe 1200 28
export BotTrace_Jump
proc BotTrace_Jump 1196 28
line 1541
;1537:}
;1538:#endif
;1539:
;1540:int BotTrace_Jump(bot_state_t *bs, vec3_t traceto)
;1541:{
line 1546
;1542:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1543:	trace_t tr;
;1544:	int orTr;
;1545:
;1546:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1156
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1156
INDIRP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1156
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1547
;1547:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1549
;1548:
;1549:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1164
CNSTP4 0
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1551
;1550:
;1551:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128
INDIRF4
MULF4
ADDF4
ASGNF4
line 1552
;1552:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1553
;1553:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1555
;1554:
;1555:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1556
;1556:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1557
;1557:	mins[2] = -18;
ADDRLP4 0+8
CNSTF4 3247439872
ASGNF4
line 1558
;1558:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1559
;1559:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1560
;1560:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1562
;1561:
;1562:	trap_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1564
;1563:
;1564:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $665
line 1565
;1565:	{
line 1566
;1566:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $665
line 1569
;1567:	}
;1568:
;1569:	orTr = tr.entityNum;
ADDRLP4 1140
ADDRLP4 48+52
INDIRI4
ASGNI4
line 1571
;1570:
;1571:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1573
;1572:
;1573:	tracefrom_mod[2] += 41;
ADDRLP4 1144+8
ADDRLP4 1144+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1574
;1574:	traceto_mod[2] += 41;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1576
;1575:
;1576:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1577
;1577:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1578
;1578:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1579
;1579:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1580
;1580:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1581
;1581:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1583
;1582:
;1583:	trap_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1585
;1584:
;1585:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $675
line 1586
;1586:	{
line 1587
;1587:		if (orTr >= 0 && orTr < MAX_CLIENTS && botstates[orTr] && botstates[orTr]->jumpTime > level.time)
ADDRLP4 1140
INDIRI4
CNSTI4 0
LTI4 $678
ADDRLP4 1140
INDIRI4
CNSTI4 32
GEI4 $678
ADDRLP4 1176
ADDRLP4 1140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $678
ADDRLP4 1176
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $678
line 1588
;1588:		{
line 1589
;1589:			return 0; //so bots don't try to jump over each other at the same time
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $678
line 1592
;1590:		}
;1591:
;1592:		if (bs->currentEnemy && bs->currentEnemy->s.number == orTr && (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER || BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE))
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1180
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $681
ADDRLP4 1184
INDIRP4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $681
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 4
EQI4 $683
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 1
NEI4 $681
LABELV $683
line 1593
;1593:		{
line 1594
;1594:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $681
line 1597
;1595:		}
;1596:
;1597:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $654
JUMPV
LABELV $675
line 1600
;1598:	}
;1599:
;1600:	return 0;
CNSTI4 0
RETI4
LABELV $654
endproc BotTrace_Jump 1196 28
export BotTrace_Duck
proc BotTrace_Duck 1168 28
line 1604
;1601:}
;1602:
;1603:int BotTrace_Duck(bot_state_t *bs, vec3_t traceto)
;1604:{
line 1608
;1605:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1606:	trace_t tr;
;1607:
;1608:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1152
INDIRP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1152
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1609
;1609:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1611
;1610:
;1611:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1613
;1612:
;1613:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 1614
;1614:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1615
;1615:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1617
;1616:
;1617:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1618
;1618:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1619
;1619:	mins[2] = -23;
ADDRLP4 0+8
CNSTF4 3250061312
ASGNF4
line 1620
;1620:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1621
;1621:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1622
;1622:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1624
;1623:
;1624:	trap_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1626
;1625:
;1626:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $695
line 1627
;1627:	{
line 1628
;1628:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $684
JUMPV
LABELV $695
line 1631
;1629:	}
;1630:
;1631:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1633
;1632:
;1633:	tracefrom_mod[2] += 31;//33;
ADDRLP4 1140+8
ADDRLP4 1140+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1634
;1634:	traceto_mod[2] += 31;//33;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1636
;1635:
;1636:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1637
;1637:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1638
;1638:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1639
;1639:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1640
;1640:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1641
;1641:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1643
;1642:
;1643:	trap_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1645
;1644:
;1645:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $704
line 1646
;1646:	{
line 1647
;1647:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $684
JUMPV
LABELV $704
line 1650
;1648:	}
;1649:
;1650:	return 0;
CNSTI4 0
RETI4
LABELV $684
endproc BotTrace_Duck 1168 28
export PassStandardEnemyChecks
proc PassStandardEnemyChecks 56 8
line 1654
;1651:}
;1652:
;1653:int PassStandardEnemyChecks(bot_state_t *bs, gentity_t *en)
;1654:{
line 1655
;1655:	if (!bs || !en)
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $710
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
NEU4 $708
LABELV $710
line 1656
;1656:	{
line 1657
;1657:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $708
line 1660
;1658:	}
;1659:
;1660:	if (!en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $711
line 1661
;1661:	{
line 1662
;1662:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $711
line 1665
;1663:	}
;1664:
;1665:	if (en->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $713
line 1666
;1666:	{
line 1667
;1667:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $713
line 1670
;1668:	}
;1669:
;1670:	if (!en->takedamage)
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $715
line 1671
;1671:	{
line 1672
;1672:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $715
line 1675
;1673:	}
;1674:
;1675:	if (bs->doingFallback &&
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $717
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $717
line 1677
;1676:		(gLevelFlags & LEVELFLAG_IGNOREINFALLBACK))
;1677:	{
line 1678
;1678:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $717
line 1681
;1679:	}
;1680:
;1681:	if (en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $719
line 1682
;1682:	{
line 1683
;1683:		if (en->client->ps.pm_type == PM_INTERMISSION ||
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
EQI4 $723
ADDRLP4 8
INDIRI4
CNSTI4 3
NEI4 $721
LABELV $723
line 1685
;1684:			en->client->ps.pm_type == PM_SPECTATOR)
;1685:		{
line 1686
;1686:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $721
line 1689
;1687:		}
;1688:
;1689:		if (en->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $724
line 1690
;1690:		{
line 1691
;1691:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $724
line 1694
;1692:		}
;1693:
;1694:		if (!en->client->pers.connected)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $726
line 1695
;1695:		{
line 1696
;1696:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $726
line 1698
;1697:		}
;1698:	}
LABELV $719
line 1700
;1699:
;1700:	if (!en->s.solid)
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $728
line 1701
;1701:	{
line 1702
;1702:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $728
line 1705
;1703:	}
;1704:
;1705:	if (bs->client == en->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $730
line 1706
;1706:	{
line 1707
;1707:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $730
line 1710
;1708:	}
;1709:
;1710:	if (OnSameTeam(&g_entities[bs->client], en))
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $732
line 1711
;1711:	{
line 1712
;1712:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $732
line 1715
;1713:	}
;1714:
;1715:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $734
line 1716
;1716:	{
line 1717
;1717:		if (bs->currentEnemy && bs->currentEnemy->s.number == en->s.number)
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $736
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $736
line 1718
;1718:		{
line 1720
;1719:			vec3_t vs;
;1720:			float vLen = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 1722
;1721:
;1722:			VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 36
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1723
;1723:			vLen = VectorLength(vs);
ADDRLP4 24
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1725
;1724:
;1725:			if (vLen > 256 && (level.time - en->client->dangerTime) > 150)
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
LEF4 $740
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $740
line 1726
;1726:			{
line 1727
;1727:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $740
line 1729
;1728:			}
;1729:		}
LABELV $736
line 1730
;1730:	}
LABELV $734
line 1732
;1731:
;1732:	if (en->client->ps.duelInProgress && en->client->ps.duelIndex != bs->client)
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $743
ADDRLP4 16
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $743
line 1733
;1733:	{
line 1734
;1734:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $743
line 1737
;1735:	}
;1736:
;1737:	if (bs->cur_ps.duelInProgress && en->s.number != bs->cur_ps.duelIndex)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $745
ADDRFP4 4
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
EQI4 $745
line 1738
;1738:	{
line 1739
;1739:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $745
line 1742
;1740:	}
;1741:
;1742:	if (g_gametype.integer == GT_JEDIMASTER && !en->client->ps.isJediMaster && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $747
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $747
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $747
line 1743
;1743:	{ //rules for attacking non-JM in JM mode
line 1745
;1744:		vec3_t vs;
;1745:		float vLen = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1747
;1746:
;1747:		if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $750
line 1748
;1748:		{ //can't harm non-JM in JM mode if FF is off
line 1749
;1749:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $750
line 1752
;1750:		}
;1751:
;1752:		VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1753
;1753:		vLen = VectorLength(vs);
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 1755
;1754:
;1755:		if (vLen > 350)
ADDRLP4 40
INDIRF4
CNSTF4 1135542272
LEF4 $755
line 1756
;1756:		{
line 1757
;1757:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $755
line 1759
;1758:		}
;1759:	}
LABELV $747
line 1768
;1760:
;1761:	/*
;1762:	if (en->client && en->client->pers.connected != CON_CONNECTED)
;1763:	{
;1764:		return 0;
;1765:	}
;1766:	*/
;1767:
;1768:	return 1;
CNSTI4 1
RETI4
LABELV $707
endproc PassStandardEnemyChecks 56 8
export BotDamageNotification
proc BotDamageNotification 28 8
line 1772
;1769:}
;1770:
;1771:void BotDamageNotification(gclient_t *bot, gentity_t *attacker)
;1772:{
line 1777
;1773:	bot_state_t *bs;
;1774:	bot_state_t *bs_a;
;1775:	int i;
;1776:
;1777:	if (!bot || !attacker || !attacker->client)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $761
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $761
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $758
LABELV $761
line 1778
;1778:	{
line 1779
;1779:		return;
ADDRGP4 $757
JUMPV
LABELV $758
line 1782
;1780:	}
;1781:
;1782:	bs_a = botstates[attacker->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1784
;1783:
;1784:	if (bs_a)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $762
line 1785
;1785:	{
line 1786
;1786:		bs_a->lastAttacked = &g_entities[bot->ps.clientNum];
ADDRLP4 4
INDIRP4
CNSTI4 1832
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1787
;1787:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $765
JUMPV
LABELV $764
line 1790
;1788:
;1789:		while (i < MAX_CLIENTS)
;1790:		{
line 1791
;1791:			if (botstates[i] &&
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $767
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $767
ADDRLP4 24
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $767
line 1794
;1792:				i != bs_a->client &&
;1793:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1794:			{
line 1795
;1795:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1796
;1796:			}
LABELV $767
line 1798
;1797:
;1798:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1799
;1799:		}
LABELV $765
line 1789
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $764
line 1800
;1800:	}
ADDRGP4 $763
JUMPV
LABELV $762
line 1802
;1801:	else //got attacked by a real client, so no one gets rights to lastAttacked
;1802:	{
line 1803
;1803:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $770
JUMPV
LABELV $769
line 1806
;1804:
;1805:		while (i < MAX_CLIENTS)
;1806:		{
line 1807
;1807:			if (botstates[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $772
ADDRLP4 20
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $772
line 1809
;1808:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1809:			{
line 1810
;1810:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1811
;1811:			}
LABELV $772
line 1813
;1812:
;1813:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1814
;1814:		}
LABELV $770
line 1805
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $769
line 1815
;1815:	}
LABELV $763
line 1817
;1816:
;1817:	bs = botstates[bot->ps.clientNum];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1819
;1818:
;1819:	if (!bs)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $774
line 1820
;1820:	{
line 1821
;1821:		return;
ADDRGP4 $757
JUMPV
LABELV $774
line 1824
;1822:	}
;1823:
;1824:	bs->lastHurt = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1828
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1826
;1825:
;1826:	if (bs->currentEnemy)
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $776
line 1827
;1827:	{
line 1828
;1828:		return;
ADDRGP4 $757
JUMPV
LABELV $776
line 1831
;1829:	}
;1830:
;1831:	if (!PassStandardEnemyChecks(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $778
line 1832
;1832:	{
line 1833
;1833:		return;
ADDRGP4 $757
JUMPV
LABELV $778
line 1836
;1834:	}
;1835:
;1836:	if (PassLovedOneCheck(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $780
line 1837
;1837:	{
line 1838
;1838:		bs->currentEnemy = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1839
;1839:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRLP4 8
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1840
;1840:	}
LABELV $780
line 1841
;1841:}
LABELV $757
endproc BotDamageNotification 28 8
export BotCanHear
proc BotCanHear 64 8
line 1844
;1842:
;1843:int BotCanHear(bot_state_t *bs, gentity_t *en, float endist)
;1844:{
line 1847
;1845:	float minlen;
;1846:
;1847:	if (!en || !en->client)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $786
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $784
LABELV $786
line 1848
;1848:	{
line 1849
;1849:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $783
JUMPV
LABELV $784
line 1852
;1850:	}
;1851:
;1852:	if (en && en->client && en->client->ps.otherSoundTime > level.time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $787
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $787
ADDRLP4 20
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $787
line 1853
;1853:	{
line 1854
;1854:		minlen = en->client->ps.otherSoundLen;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1280
ADDP4
INDIRF4
ASGNF4
line 1855
;1855:		goto checkStep;
ADDRGP4 $790
JUMPV
LABELV $787
line 1858
;1856:	}
;1857:
;1858:	if (en && en->client && en->client->ps.footstepTime > level.time)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $791
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $791
ADDRLP4 32
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $791
line 1859
;1859:	{
line 1860
;1860:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1861
;1861:		goto checkStep;
ADDRGP4 $790
JUMPV
LABELV $791
line 1864
;1862:	}
;1863:
;1864:	if (gBotEventTracker[en->s.number].eventTime < level.time)
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $794
line 1865
;1865:	{
line 1866
;1866:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $783
JUMPV
LABELV $794
line 1869
;1867:	}
;1868:
;1869:	switch(gBotEventTracker[en->s.number].events[gBotEventTracker[en->s.number].eventSequence & (MAX_PS_EVENTS-1)])
ADDRLP4 40
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker+4
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 24
EQI4 $803
ADDRLP4 36
INDIRI4
CNSTI4 25
EQI4 $803
ADDRLP4 48
CNSTI4 26
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $803
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $807
LABELV $806
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $798
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $798
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 $808-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $808
address $804
address $804
address $798
address $804
address $798
address $804
address $804
address $804
address $804
address $798
address $798
address $798
address $805
address $805
code
LABELV $807
ADDRLP4 36
INDIRI4
CNSTI4 67
EQI4 $802
ADDRGP4 $798
JUMPV
line 1870
;1870:	{
LABELV $802
line 1872
;1871:	case EV_GLOBAL_SOUND:
;1872:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1873
;1873:		break;
ADDRGP4 $799
JUMPV
LABELV $803
line 1877
;1874:	case EV_FIRE_WEAPON:
;1875:	case EV_ALT_FIRE:
;1876:	case EV_SABER_ATTACK:
;1877:		minlen = 512;
ADDRLP4 0
CNSTF4 1140850688
ASGNF4
line 1878
;1878:		break;
ADDRGP4 $799
JUMPV
LABELV $804
line 1886
;1879:	case EV_STEP_4:
;1880:	case EV_STEP_8:
;1881:	case EV_STEP_12:
;1882:	case EV_STEP_16:
;1883:	case EV_FOOTSTEP:
;1884:	case EV_FOOTSTEP_METAL:
;1885:	case EV_FOOTWADE:
;1886:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1887
;1887:		break;
ADDRGP4 $799
JUMPV
LABELV $805
line 1890
;1888:	case EV_JUMP:
;1889:	case EV_ROLL:
;1890:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1891
;1891:		break;
ADDRGP4 $799
JUMPV
LABELV $798
line 1893
;1892:	default:
;1893:		minlen = 999999;
ADDRLP4 0
CNSTF4 1232348144
ASGNF4
line 1894
;1894:		break;
LABELV $799
LABELV $790
line 1897
;1895:	}
;1896:checkStep:
;1897:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $810
line 1898
;1898:	{ //if mindtricked by this person, cut down on the minlen
line 1899
;1899:		minlen /= 4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
DIVF4
ASGNF4
line 1900
;1900:	}
LABELV $810
line 1902
;1901:
;1902:	if (endist <= minlen)
ADDRFP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $812
line 1903
;1903:	{
line 1904
;1904:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $783
JUMPV
LABELV $812
line 1907
;1905:	}
;1906:
;1907:	return 0;
CNSTI4 0
RETI4
LABELV $783
endproc BotCanHear 64 8
export UpdateEventTracker
proc UpdateEventTracker 20 0
line 1911
;1908:}
;1909:
;1910:void UpdateEventTracker(void)
;1911:{
line 1914
;1912:	int i;
;1913:
;1914:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $816
JUMPV
LABELV $815
line 1917
;1915:
;1916:	while (i < MAX_CLIENTS)
;1917:	{
line 1918
;1918:		if (gBotEventTracker[i].eventSequence != level.clients[i].ps.eventSequence)
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
EQI4 $818
line 1919
;1919:		{ //updated event
line 1920
;1920:			gBotEventTracker[i].eventSequence = level.clients[i].ps.eventSequence;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1921
;1921:			gBotEventTracker[i].events[0] = level.clients[i].ps.events[0];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4
ADDP4
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 1922
;1922:			gBotEventTracker[i].events[1] = level.clients[i].ps.events[1];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4+4
ADDP4
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 1923
;1923:			gBotEventTracker[i].eventTime = level.time + 0.5;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1924
;1924:		}
LABELV $818
line 1926
;1925:
;1926:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1927
;1927:	}
LABELV $816
line 1916
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $815
line 1928
;1928:}
LABELV $814
endproc UpdateEventTracker 20 0
export InFieldOfVision
proc InFieldOfVision 24 4
line 1931
;1929:
;1930:int InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;1931:{
line 1935
;1932:	int i;
;1933:	float diff, angle;
;1934:
;1935:	for (i = 0; i < 2; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $826
line 1936
;1936:	{
line 1937
;1937:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 1938
;1938:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1939
;1939:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1940
;1940:		if (angles[i] > angle)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $830
line 1941
;1941:		{
line 1942
;1942:			if (diff > 180.0)
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $831
line 1943
;1943:			{
line 1944
;1944:				diff -= 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 1945
;1945:			}
line 1946
;1946:		}
ADDRGP4 $831
JUMPV
LABELV $830
line 1948
;1947:		else
;1948:		{
line 1949
;1949:			if (diff < -180.0)
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $834
line 1950
;1950:			{
line 1951
;1951:				diff += 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1952
;1952:			}
LABELV $834
line 1953
;1953:		}
LABELV $831
line 1954
;1954:		if (diff > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $836
line 1955
;1955:		{
line 1956
;1956:			if (diff > fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $837
line 1957
;1957:			{
line 1958
;1958:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $825
JUMPV
line 1960
;1959:			}
;1960:		}
LABELV $836
line 1962
;1961:		else
;1962:		{
line 1963
;1963:			if (diff < -fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $840
line 1964
;1964:			{
line 1965
;1965:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $825
JUMPV
LABELV $840
line 1967
;1966:			}
;1967:		}
LABELV $837
line 1968
;1968:	}
LABELV $827
line 1935
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $826
line 1969
;1969:	return 1;
CNSTI4 1
RETI4
LABELV $825
endproc InFieldOfVision 24 4
export PassLovedOneCheck
proc PassLovedOneCheck 36 8
line 1973
;1970:}
;1971:
;1972:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent)
;1973:{
line 1977
;1974:	int i;
;1975:	bot_state_t *loved;
;1976:
;1977:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $843
line 1978
;1978:	{
line 1979
;1979:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $843
line 1982
;1980:	}
;1981:
;1982:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $845
line 1983
;1983:	{ //There is no love in 1-on-1
line 1984
;1984:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $845
line 1987
;1985:	}
;1986:
;1987:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1989
;1988:
;1989:	if (!botstates[ent->s.number])
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $848
line 1990
;1990:	{ //not a bot
line 1991
;1991:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $848
line 1994
;1992:	}
;1993:
;1994:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1996
;1995:
;1996:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $850
line 1997
;1997:	{
line 1998
;1998:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $850
line 2001
;1999:	}
;2000:
;2001:	loved = botstates[ent->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $854
JUMPV
LABELV $853
line 2004
;2002:
;2003:	while (i < bs->lovednum)
;2004:	{
line 2005
;2005:		if (strcmp(level.clients[loved->client].pers.netname, bs->loved[i].name) == 0)
CNSTI4 1800
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $856
line 2006
;2006:		{
line 2007
;2007:			if (!IsTeamplay() && bs->loved[i].level < 2)
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $858
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $858
line 2008
;2008:			{ //if FFA and level of love is not greater than 1, just don't care
line 2009
;2009:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $858
line 2011
;2010:			}
;2011:			else if (IsTeamplay() && !OnSameTeam(&g_entities[bs->client], &g_entities[loved->client]) && bs->loved[i].level < 2)
ADDRLP4 16
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $860
ADDRLP4 20
CNSTI4 828
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 28
ADDRGP4 g_entities
ASGNP4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $860
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $860
line 2012
;2012:			{ //is teamplay, but not on same team and level < 2
line 2013
;2013:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $842
JUMPV
LABELV $860
line 2016
;2014:			}
;2015:			else
;2016:			{
line 2017
;2017:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $856
line 2021
;2018:			}
;2019:		}
;2020:
;2021:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2022
;2022:	}
LABELV $854
line 2003
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $853
line 2024
;2023:
;2024:	return 1;
CNSTI4 1
RETI4
LABELV $842
endproc PassLovedOneCheck 36 8
export ScanForEnemies
proc ScanForEnemies 124 12
line 2030
;2025:}
;2026:
;2027:qboolean G_ThereIsAMaster(void);
;2028:
;2029:int ScanForEnemies(bot_state_t *bs)
;2030:{
line 2036
;2031:	vec3_t a;
;2032:	float distcheck;
;2033:	float closest;
;2034:	int bestindex;
;2035:	int i;
;2036:	float hasEnemyDist = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2037
;2037:	qboolean noAttackNonJM = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2039
;2038:
;2039:	closest = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 2040
;2040:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2041
;2041:	bestindex = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2043
;2042:
;2043:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $863
line 2044
;2044:	{
line 2045
;2045:		hasEnemyDist = bs->frame_Enemy_Len;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
line 2046
;2046:	}
LABELV $863
line 2048
;2047:
;2048:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $865
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $865
ADDRLP4 44
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $865
line 2050
;2049:		bs->currentEnemy->client->ps.isJediMaster)
;2050:	{ //The Jedi Master must die.
line 2051
;2051:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $862
JUMPV
LABELV $865
line 2054
;2052:	}
;2053:
;2054:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $876
line 2055
;2055:	{
line 2056
;2056:		if (G_ThereIsAMaster() && !bs->cur_ps.isJediMaster)
ADDRLP4 48
ADDRGP4 G_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $876
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $876
line 2057
;2057:		{
line 2058
;2058:			if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $872
line 2059
;2059:			{
line 2060
;2060:				noAttackNonJM = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 2061
;2061:			}
ADDRGP4 $876
JUMPV
LABELV $872
line 2063
;2062:			else
;2063:			{
line 2064
;2064:				closest = 128; //only get mad at people if they get close enough to you to anger you, or hurt you
ADDRLP4 20
CNSTF4 1124073472
ASGNF4
line 2065
;2065:			}
line 2066
;2066:		}
line 2067
;2067:	}
ADDRGP4 $876
JUMPV
LABELV $875
line 2070
;2068:
;2069:	while (i <= MAX_CLIENTS)
;2070:	{
line 2071
;2071:		if (i != bs->client && g_entities[i].client && !OnSameTeam(&g_entities[bs->client], &g_entities[i]) && PassStandardEnemyChecks(bs, &g_entities[i]) && trap_InPVS(g_entities[i].client->ps.origin, bs->eye) && PassLovedOneCheck(bs, &g_entities[i]))
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $878
ADDRLP4 56
CNSTI4 828
ASGNI4
ADDRLP4 60
ADDRLP4 56
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $878
ADDRLP4 64
ADDRGP4 g_entities
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
MULI4
ADDRLP4 64
INDIRP4
ADDP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRP4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $878
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $878
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $878
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $878
line 2072
;2072:		{
line 2073
;2073:			VectorSubtract(g_entities[i].client->ps.origin, bs->eye, a);
ADDRLP4 84
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2074
;2074:			distcheck = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 92
INDIRF4
ASGNF4
line 2075
;2075:			vectoangles(a, a);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2077
;2076:
;2077:			if (g_entities[i].client->ps.isJediMaster)
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $887
line 2078
;2078:			{ //make us think the Jedi Master is close so we'll attack him above all
line 2079
;2079:				distcheck = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 2080
;2080:			}
LABELV $887
line 2082
;2081:
;2082:			if (distcheck < closest && ((InFieldOfVision(bs->viewangles, 90, a) && !BotMindTricked(bs->client, i)) || BotCanHear(bs, &g_entities[i], distcheck)) && OrgVisible(bs->eye, g_entities[i].client->ps.origin, -1))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $890
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $894
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $893
LABELV $894
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 BotCanHear
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $890
LABELV $893
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 108
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $890
line 2083
;2083:			{
line 2084
;2084:				if (BotMindTricked(bs->client, i))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $895
line 2085
;2085:				{
line 2086
;2086:					if (distcheck < 256 || (level.time - g_entities[i].client->dangerTime) < 100)
ADDRLP4 16
INDIRF4
CNSTF4 1132462080
LTF4 $901
ADDRGP4 level+32
INDIRI4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
INDIRI4
SUBI4
CNSTI4 100
GEI4 $896
LABELV $901
line 2087
;2087:					{
line 2088
;2088:						if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $904
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $896
LABELV $904
line 2089
;2089:						{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2090
;2090:							if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $908
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $896
LABELV $908
line 2091
;2091:							{
line 2092
;2092:								closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2093
;2093:								bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2094
;2094:							}
line 2095
;2095:						}
line 2096
;2096:					}
line 2097
;2097:				}
ADDRGP4 $896
JUMPV
LABELV $895
line 2099
;2098:				else
;2099:				{
line 2100
;2100:					if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $911
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $909
LABELV $911
line 2101
;2101:					{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2102
;2102:						if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $915
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $912
LABELV $915
line 2103
;2103:						{
line 2104
;2104:							closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2105
;2105:							bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2106
;2106:						}
LABELV $912
line 2107
;2107:					}
LABELV $909
line 2108
;2108:				}
LABELV $896
line 2109
;2109:			}
LABELV $890
line 2110
;2110:		}
LABELV $878
line 2111
;2111:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2112
;2112:	}
LABELV $876
line 2069
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $875
line 2114
;2113:	
;2114:	return bestindex;
ADDRLP4 28
INDIRI4
RETI4
LABELV $862
endproc ScanForEnemies 124 12
export WaitingForNow
proc WaitingForNow 72 8
line 2118
;2115:}
;2116:
;2117:int WaitingForNow(bot_state_t *bs, vec3_t goalpos)
;2118:{ //checks if the bot is doing something along the lines of waiting for an elevator to raise up
line 2121
;2119:	vec3_t xybot, xywp, a;
;2120:
;2121:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $917
line 2122
;2122:	{
line 2123
;2123:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $916
JUMPV
LABELV $917
line 2126
;2124:	}
;2125:
;2126:	if ((int)goalpos[0] != (int)bs->wpCurrent->origin[0] ||
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
INDIRF4
CVFI4 4
NEI4 $922
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
NEI4 $922
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
EQI4 $919
LABELV $922
line 2129
;2127:		(int)goalpos[1] != (int)bs->wpCurrent->origin[1] ||
;2128:		(int)goalpos[2] != (int)bs->wpCurrent->origin[2])
;2129:	{
line 2130
;2130:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $916
JUMPV
LABELV $919
line 2133
;2131:	}
;2132:
;2133:	VectorCopy(bs->origin, xybot);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 2134
;2134:	VectorCopy(bs->wpCurrent->origin, xywp);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 2136
;2135:
;2136:	xybot[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2137
;2137:	xywp[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2139
;2138:
;2139:	VectorSubtract(xybot, xywp, a);
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2141
;2140:
;2141:	if (VectorLength(a) < 16 && bs->frame_Waypoint_Len > 100)
ADDRLP4 24
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1098907648
GEF4 $931
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $931
line 2142
;2142:	{
line 2143
;2143:		if (CheckForFunc(bs->origin, bs->client))
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $932
line 2144
;2144:		{
line 2145
;2145:			return 1; //we're probably standing on an elevator and riding up/down. Or at least we hope so.
CNSTI4 1
RETI4
ADDRGP4 $916
JUMPV
line 2147
;2146:		}
;2147:	}
LABELV $931
line 2148
;2148:	else if (VectorLength(a) < 64 && bs->frame_Waypoint_Len > 64 &&
ADDRLP4 24
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 60
CNSTF4 1115684864
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $935
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $935
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $935
line 2150
;2149:		CheckForFunc(bs->origin, bs->client))
;2150:	{
line 2151
;2151:		bs->noUseTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2152
;2152:	}
LABELV $935
LABELV $932
line 2154
;2153:
;2154:	return 0;
CNSTI4 0
RETI4
LABELV $916
endproc WaitingForNow 72 8
export BotGetWeaponRange
proc BotGetWeaponRange 8 0
line 2158
;2155:}
;2156:
;2157:int BotGetWeaponRange(bot_state_t *bs)
;2158:{
line 2159
;2159:	switch (bs->cur_ps.weapon)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $939
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $939
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $955-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $955
address $942
address $943
address $944
address $945
address $946
address $947
address $948
address $949
address $950
address $951
address $952
address $953
address $954
code
line 2160
;2160:	{
LABELV $942
line 2162
;2161:	case WP_STUN_BATON:
;2162:		return BWEAPONRANGE_MELEE;
CNSTI4 1
RETI4
ADDRGP4 $938
JUMPV
LABELV $943
line 2164
;2163:	case WP_SABER:
;2164:		return BWEAPONRANGE_SABER;
CNSTI4 4
RETI4
ADDRGP4 $938
JUMPV
LABELV $944
line 2166
;2165:	case WP_BRYAR_PISTOL:
;2166:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $938
JUMPV
LABELV $945
line 2168
;2167:	case WP_BLASTER:
;2168:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $938
JUMPV
LABELV $946
line 2170
;2169:	case WP_DISRUPTOR:
;2170:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $938
JUMPV
LABELV $947
line 2172
;2171:	case WP_BOWCASTER:
;2172:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $948
line 2174
;2173:	case WP_REPEATER:
;2174:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $938
JUMPV
LABELV $949
line 2176
;2175:	case WP_DEMP2:
;2176:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $950
line 2178
;2177:	case WP_FLECHETTE:
;2178:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $951
line 2180
;2179:	case WP_ROCKET_LAUNCHER:
;2180:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $952
line 2182
;2181:	case WP_THERMAL:
;2182:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $953
line 2184
;2183:	case WP_TRIP_MINE:
;2184:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $954
line 2186
;2185:	case WP_DET_PACK:
;2186:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $938
JUMPV
LABELV $939
line 2188
;2187:	default:
;2188:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
LABELV $938
endproc BotGetWeaponRange 8 0
export BotIsAChickenWuss
proc BotIsAChickenWuss 32 4
line 2193
;2189:	}
;2190:}
;2191:
;2192:int BotIsAChickenWuss(bot_state_t *bs)
;2193:{
line 2196
;2194:	int bWRange;
;2195:
;2196:	if (gLevelFlags & LEVELFLAG_IMUSTNTRUNAWAY)
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $958
line 2197
;2197:	{
line 2198
;2198:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $958
line 2201
;2199:	}
;2200:
;2201:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $960
line 2202
;2202:	{
line 2203
;2203:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $960
line 2206
;2204:	}
;2205:
;2206:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $963
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $963
line 2207
;2207:	{ //Then you may know no fear.
line 2209
;2208:		//Well, unless he's strong.
;2209:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $966
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $966
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $966
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 40
LEI4 $966
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
GEI4 $966
line 2213
;2210:			bs->currentEnemy->client->ps.isJediMaster &&
;2211:			bs->currentEnemy->health > 40 &&
;2212:			bs->cur_ps.weapon < WP_ROCKET_LAUNCHER)
;2213:		{ //explosive weapons are most effective against the Jedi Master
line 2214
;2214:			goto jmPass;
ADDRGP4 $968
JUMPV
LABELV $966
line 2216
;2215:		}
;2216:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $963
LABELV $968
line 2219
;2217:	}
;2218:jmPass:
;2219:	if (bs->chickenWussCalculationTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $969
line 2220
;2220:	{
line 2221
;2221:		return 2; //don't want to keep going between two points...
CNSTI4 2
RETI4
ADDRGP4 $957
JUMPV
LABELV $969
line 2224
;2222:	}
;2223:
;2224:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $972
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $972
line 2225
;2225:	{
line 2226
;2226:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $972
line 2229
;2227:	}
;2228:
;2229:	bs->chickenWussCalculationTime = level.time + MAX_CHICKENWUSS_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2231
;2230:
;2231:	if (g_entities[bs->client].health < BOT_RUN_HEALTH)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 40
GEI4 $976
line 2232
;2232:	{
line 2233
;2233:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $976
line 2236
;2234:	}
;2235:
;2236:	bWRange = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2238
;2237:
;2238:	if (bWRange == BWEAPONRANGE_MELEE || bWRange == BWEAPONRANGE_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $981
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $979
LABELV $981
line 2239
;2239:	{
line 2240
;2240:		if (bWRange != BWEAPONRANGE_SABER || !bs->saberSpecialist)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $984
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $982
LABELV $984
line 2241
;2241:		{
line 2242
;2242:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $982
line 2244
;2243:		}
;2244:	}
LABELV $979
line 2246
;2245:
;2246:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $985
line 2247
;2247:	{ //the bryar is a weak weapon, so just try to find a new one if it's what you're having to use
line 2248
;2248:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $985
line 2251
;2249:	}
;2250:
;2251:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $987
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $987
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $987
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $987
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $987
line 2254
;2252:		bs->currentEnemy->client->ps.weapon == WP_SABER &&
;2253:		bs->frame_Enemy_Len < 512 && bs->cur_ps.weapon != WP_SABER)
;2254:	{ //if close to an enemy with a saber and not using a saber, then try to back off
line 2255
;2255:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $987
line 2259
;2256:	}
;2257:
;2258:	//didn't run, reset the timer
;2259:	bs->chickenWussCalculationTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
CNSTF4 0
ASGNF4
line 2261
;2260:
;2261:	return 0;
CNSTI4 0
RETI4
LABELV $957
endproc BotIsAChickenWuss 32 4
export GetNearestBadThing
proc GetNearestBadThing 1224 28
line 2265
;2262:}
;2263:
;2264:gentity_t *GetNearestBadThing(bot_state_t *bs)
;2265:{
line 2266
;2266:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2269
;2267:	float glen;
;2268:	vec3_t hold;
;2269:	int bestindex = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
line 2270
;2270:	float bestdist = 800; //if not within a radius of 800, it's no threat anyway
ADDRLP4 1108
CNSTF4 1145569280
ASGNF4
line 2271
;2271:	int foundindex = 0;
ADDRLP4 1112
CNSTI4 0
ASGNI4
line 2272
;2272:	float factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRGP4 $991
JUMPV
LABELV $990
line 2277
;2273:	gentity_t *ent;
;2274:	trace_t tr;
;2275:
;2276:	while (i < MAX_GENTITIES)
;2277:	{
line 2278
;2278:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2280
;2279:
;2280:		if ( (ent &&
ADDRLP4 1124
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
EQU4 $1001
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
NEU4 $1001
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1001
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1001
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1001
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $996
LABELV $1001
ADDRLP4 1136
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $993
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 1000
NEI4 $993
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $993
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LEI4 $993
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1144
INDIRI4
ADDRLP4 1148
INDIRI4
EQI4 $993
ADDRLP4 1152
CNSTI4 828
ASGNI4
ADDRLP4 1156
ADDRLP4 1152
INDIRI4
ADDRLP4 1144
INDIRI4
MULI4
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $993
ADDRLP4 1160
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1152
INDIRI4
ADDRLP4 1148
INDIRI4
MULI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1156
INDIRI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1164
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $993
LABELV $996
line 2293
;2281:			!ent->client &&
;2282:			ent->inuse &&
;2283:			ent->damage &&
;2284:			/*(ent->s.weapon == WP_THERMAL || ent->s.weapon == WP_FLECHETTE)*/
;2285:			ent->s.weapon &&
;2286:			ent->splashDamage) ||
;2287:			(ent &&
;2288:			ent->bolt_Head == 1000 &&
;2289:			ent->inuse &&
;2290:			ent->health > 0 &&
;2291:			ent->boltpoint3 != bs->client &&
;2292:			g_entities[ent->boltpoint3].client && !OnSameTeam(&g_entities[bs->client], &g_entities[ent->boltpoint3])) )
;2293:		{ //try to escape from anything with a non-0 s.weapon and non-0 damage. This hopefully only means dangerous projectiles.
line 2295
;2294:		  //Or a sentry gun if bolt_Head == 1000. This is a terrible hack, yes.
;2295:			VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2296
;2296:			glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1176
INDIRF4
ASGNF4
line 2298
;2297:
;2298:			if (ent->s.weapon != WP_THERMAL && ent->s.weapon != WP_FLECHETTE &&
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 11
EQI4 $1004
ADDRLP4 1180
INDIRI4
CNSTI4 9
EQI4 $1004
ADDRLP4 1180
INDIRI4
CNSTI4 13
EQI4 $1004
ADDRLP4 1180
INDIRI4
CNSTI4 12
EQI4 $1004
line 2300
;2299:				ent->s.weapon != WP_DET_PACK && ent->s.weapon != WP_TRIP_MINE)
;2300:			{
line 2301
;2301:				factor = 0.5;
ADDRLP4 24
CNSTF4 1056964608
ASGNF4
line 2303
;2302:
;2303:				if (ent->s.weapon && glen <= 256 && bs->settings.skill > 2)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1005
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GTF4 $1005
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
CNSTF4 1073741824
LEF4 $1005
line 2304
;2304:				{ //it's a projectile so push it away
line 2305
;2305:					bs->doForcePush = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 4796
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2307
;2306:					//G_Printf("PUSH PROJECTILE\n");
;2307:				}
line 2308
;2308:			}
ADDRGP4 $1005
JUMPV
LABELV $1004
line 2310
;2309:			else
;2310:			{
line 2311
;2311:				factor = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 2312
;2312:			}
LABELV $1005
line 2314
;2313:
;2314:			if (ent->s.weapon == WP_ROCKET_LAUNCHER &&
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1009
ADDRLP4 1188
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1192
INDIRI4
EQI4 $1012
ADDRLP4 1188
INDIRI4
CNSTI4 0
LEI4 $1009
ADDRLP4 1188
INDIRI4
CNSTI4 32
GEI4 $1009
ADDRLP4 1196
CNSTI4 828
ASGNI4
ADDRLP4 1200
ADDRLP4 1196
INDIRI4
ADDRLP4 1188
INDIRI4
MULI4
ASGNI4
ADDRLP4 1200
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1009
ADDRLP4 1204
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1196
INDIRI4
ADDRLP4 1192
INDIRI4
MULI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1200
INDIRI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $1009
LABELV $1012
line 2318
;2315:				(ent->r.ownerNum == bs->client ||
;2316:				(ent->r.ownerNum > 0 && ent->r.ownerNum < MAX_CLIENTS &&
;2317:				g_entities[ent->r.ownerNum].client && OnSameTeam(&g_entities[bs->client], &g_entities[ent->r.ownerNum]))) )
;2318:			{ //don't be afraid of your own rockets or your teammates' rockets
line 2319
;2319:				factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2320
;2320:			}
LABELV $1009
line 2322
;2321:
;2322:			if (glen < bestdist*factor && trap_InPVS(bs->origin, ent->s.pos.trBase))
ADDRLP4 20
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
GEF4 $1013
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1212
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1013
line 2323
;2323:			{
line 2324
;2324:				trap_Trace(&tr, bs->origin, NULL, NULL, ent->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 28
ARGP4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1220
CNSTP4 0
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2326
;2325:
;2326:				if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
EQF4 $1019
ADDRLP4 28+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $1015
LABELV $1019
line 2327
;2327:				{
line 2328
;2328:					bestindex = i;
ADDRLP4 1116
ADDRLP4 4
INDIRI4
ASGNI4
line 2329
;2329:					bestdist = glen;
ADDRLP4 1108
ADDRLP4 20
INDIRF4
ASGNF4
line 2330
;2330:					foundindex = 1;
ADDRLP4 1112
CNSTI4 1
ASGNI4
line 2331
;2331:				}
LABELV $1015
line 2332
;2332:			}
LABELV $1013
line 2333
;2333:		}
LABELV $993
line 2335
;2334:
;2335:		if (ent && !ent->client && ent->inuse && ent->damage && ent->s.weapon && ent->r.ownerNum < MAX_CLIENTS && ent->r.ownerNum >= 0)
ADDRLP4 1172
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
EQU4 $1020
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
NEU4 $1020
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1020
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1020
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1020
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 32
GEI4 $1020
ADDRLP4 1180
INDIRI4
ADDRLP4 1176
INDIRI4
LTI4 $1020
line 2336
;2336:		{ //if we're in danger of a projectile belonging to someone and don't have an enemy, set the enemy to them
line 2337
;2337:			gentity_t *projOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 1184
CNSTI4 828
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2339
;2338:
;2339:			if (projOwner && projOwner->inuse && projOwner->client)
ADDRLP4 1192
CNSTU4 0
ASGNU4
ADDRLP4 1184
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1022
ADDRLP4 1184
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1022
ADDRLP4 1184
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1022
line 2340
;2340:			{
line 2341
;2341:				if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1024
line 2342
;2342:				{
line 2343
;2343:					if (PassStandardEnemyChecks(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $1026
line 2344
;2344:					{
line 2345
;2345:						if (PassLovedOneCheck(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $1028
line 2346
;2346:						{
line 2347
;2347:							VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1204
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1204
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2348
;2348:							glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1212
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1212
INDIRF4
ASGNF4
line 2350
;2349:
;2350:							if (glen < 512)
ADDRLP4 20
INDIRF4
CNSTF4 1140850688
GEF4 $1032
line 2351
;2351:							{
line 2352
;2352:								bs->currentEnemy = projOwner;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ADDRLP4 1184
INDIRP4
ASGNP4
line 2353
;2353:								bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2354
;2354:							}
LABELV $1032
line 2355
;2355:						}
LABELV $1028
line 2356
;2356:					}
LABELV $1026
line 2357
;2357:				}
LABELV $1024
line 2358
;2358:			}
LABELV $1022
line 2359
;2359:		}
LABELV $1020
line 2361
;2360:
;2361:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2362
;2362:	}
LABELV $991
line 2276
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $990
line 2364
;2363:
;2364:	if (foundindex)
ADDRLP4 1112
INDIRI4
CNSTI4 0
EQI4 $1035
line 2365
;2365:	{
line 2366
;2366:		bs->dontGoBack = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 2367
;2367:		return &g_entities[bestindex];
CNSTI4 828
ADDRLP4 1116
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $989
JUMPV
LABELV $1035
line 2370
;2368:	}
;2369:	else
;2370:	{
line 2371
;2371:		return NULL;
CNSTP4 0
RETP4
LABELV $989
endproc GetNearestBadThing 1224 28
export BotDefendFlag
proc BotDefendFlag 28 4
line 2376
;2372:	}
;2373:}
;2374:
;2375:int BotDefendFlag(bot_state_t *bs)
;2376:{
line 2380
;2377:	wpobject_t *flagPoint;
;2378:	vec3_t a;
;2379:
;2380:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1039
line 2381
;2381:	{
line 2382
;2382:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2383
;2383:	}
ADDRGP4 $1040
JUMPV
LABELV $1039
line 2384
;2384:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1041
line 2385
;2385:	{
line 2386
;2386:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2387
;2387:	}
ADDRGP4 $1042
JUMPV
LABELV $1041
line 2389
;2388:	else
;2389:	{
line 2390
;2390:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1038
JUMPV
LABELV $1042
LABELV $1040
line 2393
;2391:	}
;2392:
;2393:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1043
line 2394
;2394:	{
line 2395
;2395:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1038
JUMPV
LABELV $1043
line 2398
;2396:	}
;2397:
;2398:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2400
;2399:
;2400:	if (VectorLength(a) > BASE_GUARD_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1047
line 2401
;2401:	{
line 2402
;2402:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2403
;2403:	}
LABELV $1047
line 2405
;2404:
;2405:	return 1;
CNSTI4 1
RETI4
LABELV $1038
endproc BotDefendFlag 28 4
export BotGetEnemyFlag
proc BotGetEnemyFlag 28 4
line 2409
;2406:}
;2407:
;2408:int BotGetEnemyFlag(bot_state_t *bs)
;2409:{
line 2413
;2410:	wpobject_t *flagPoint;
;2411:	vec3_t a;
;2412:
;2413:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1050
line 2414
;2414:	{
line 2415
;2415:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2416
;2416:	}
ADDRGP4 $1051
JUMPV
LABELV $1050
line 2417
;2417:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1052
line 2418
;2418:	{
line 2419
;2419:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2420
;2420:	}
ADDRGP4 $1053
JUMPV
LABELV $1052
line 2422
;2421:	else
;2422:	{
line 2423
;2423:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1049
JUMPV
LABELV $1053
LABELV $1051
line 2426
;2424:	}
;2425:
;2426:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1054
line 2427
;2427:	{
line 2428
;2428:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1049
JUMPV
LABELV $1054
line 2431
;2429:	}
;2430:
;2431:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2433
;2432:
;2433:	if (VectorLength(a) > BASE_GETENEMYFLAG_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1058
line 2434
;2434:	{
line 2435
;2435:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2436
;2436:	}
LABELV $1058
line 2438
;2437:
;2438:	return 1;
CNSTI4 1
RETI4
LABELV $1049
endproc BotGetEnemyFlag 28 4
export BotGetFlagBack
proc BotGetFlagBack 52 12
line 2442
;2439:}
;2440:
;2441:int BotGetFlagBack(bot_state_t *bs)
;2442:{
line 2443
;2443:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2444
;2444:	int myFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2445
;2445:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2446
;2446:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2447
;2447:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2450
;2448:	vec3_t usethisvec;
;2449:
;2450:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1061
line 2451
;2451:	{
line 2452
;2452:		myFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2453
;2453:	}
ADDRGP4 $1064
JUMPV
LABELV $1061
line 2455
;2454:	else
;2455:	{
line 2456
;2456:		myFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2457
;2457:	}
ADDRGP4 $1064
JUMPV
LABELV $1063
line 2460
;2458:
;2459:	while (i < MAX_CLIENTS)
;2460:	{
line 2461
;2461:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2463
;2462:
;2463:		if (ent && ent->client && ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1066
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1066
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1066
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1066
line 2464
;2464:		{
line 2465
;2465:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2466
;2466:			break;
ADDRGP4 $1065
JUMPV
LABELV $1066
line 2469
;2467:		}
;2468:
;2469:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2470
;2470:	}
LABELV $1064
line 2459
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1063
LABELV $1065
line 2472
;2471:
;2472:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1068
line 2473
;2473:	{
line 2474
;2474:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1068
line 2477
;2475:	}
;2476:
;2477:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1070
line 2478
;2478:	{
line 2479
;2479:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1070
line 2482
;2480:	}
;2481:
;2482:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1072
line 2483
;2483:	{
line 2484
;2484:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1075
line 2485
;2485:		{
line 2486
;2486:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2487
;2487:		}
ADDRGP4 $1076
JUMPV
LABELV $1075
line 2489
;2488:		else
;2489:		{
line 2490
;2490:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2491
;2491:		}
LABELV $1076
line 2493
;2492:
;2493:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2495
;2494:
;2495:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1077
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1077
line 2496
;2496:		{
line 2497
;2497:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2498
;2498:			bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2499
;2499:		}
LABELV $1077
line 2500
;2500:	}
LABELV $1072
line 2502
;2501:
;2502:	return 1;
CNSTI4 1
RETI4
LABELV $1060
endproc BotGetFlagBack 52 12
export BotGuardFlagCarrier
proc BotGuardFlagCarrier 52 12
line 2506
;2503:}
;2504:
;2505:int BotGuardFlagCarrier(bot_state_t *bs)
;2506:{
line 2507
;2507:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2508
;2508:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2509
;2509:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2510
;2510:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2511
;2511:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2514
;2512:	vec3_t usethisvec;
;2513:
;2514:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1081
line 2515
;2515:	{
line 2516
;2516:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2517
;2517:	}
ADDRGP4 $1084
JUMPV
LABELV $1081
line 2519
;2518:	else
;2519:	{
line 2520
;2520:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2521
;2521:	}
ADDRGP4 $1084
JUMPV
LABELV $1083
line 2524
;2522:
;2523:	while (i < MAX_CLIENTS)
;2524:	{
line 2525
;2525:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2527
;2526:
;2527:		if (ent && ent->client && ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1086
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1086
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1086
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1086
line 2528
;2528:		{
line 2529
;2529:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2530
;2530:			break;
ADDRGP4 $1085
JUMPV
LABELV $1086
line 2533
;2531:		}
;2532:
;2533:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2534
;2534:	}
LABELV $1084
line 2523
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1083
LABELV $1085
line 2536
;2535:
;2536:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1088
line 2537
;2537:	{
line 2538
;2538:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1080
JUMPV
LABELV $1088
line 2541
;2539:	}
;2540:
;2541:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1090
line 2542
;2542:	{
line 2543
;2543:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1080
JUMPV
LABELV $1090
line 2546
;2544:	}
;2545:
;2546:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1092
line 2547
;2547:	{
line 2548
;2548:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1095
line 2549
;2549:		{
line 2550
;2550:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2551
;2551:		}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2553
;2552:		else
;2553:		{
line 2554
;2554:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2555
;2555:		}
LABELV $1096
line 2557
;2556:
;2557:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2559
;2558:
;2559:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1097
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1097
line 2560
;2560:		{
line 2561
;2561:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2562
;2562:			bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2563
;2563:		}
LABELV $1097
line 2564
;2564:	}
LABELV $1092
line 2566
;2565:
;2566:	return 1;
CNSTI4 1
RETI4
LABELV $1080
endproc BotGuardFlagCarrier 52 12
export BotGetFlagHome
proc BotGetFlagHome 28 4
line 2570
;2567:}
;2568:
;2569:int BotGetFlagHome(bot_state_t *bs)
;2570:{
line 2574
;2571:	wpobject_t *flagPoint;
;2572:	vec3_t a;
;2573:
;2574:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1101
line 2575
;2575:	{
line 2576
;2576:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2577
;2577:	}
ADDRGP4 $1102
JUMPV
LABELV $1101
line 2578
;2578:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1103
line 2579
;2579:	{
line 2580
;2580:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2581
;2581:	}
ADDRGP4 $1104
JUMPV
LABELV $1103
line 2583
;2582:	else
;2583:	{
line 2584
;2584:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1100
JUMPV
LABELV $1104
LABELV $1102
line 2587
;2585:	}
;2586:
;2587:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1105
line 2588
;2588:	{
line 2589
;2589:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1100
JUMPV
LABELV $1105
line 2592
;2590:	}
;2591:
;2592:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2594
;2593:
;2594:	if (VectorLength(a) > BASE_FLAGWAIT_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1109
line 2595
;2595:	{
line 2596
;2596:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2597
;2597:	}
LABELV $1109
line 2599
;2598:
;2599:	return 1;
CNSTI4 1
RETI4
LABELV $1100
endproc BotGetFlagHome 28 4
export GetNewFlagPoint
proc GetNewFlagPoint 1164 28
line 2603
;2600:}
;2601:
;2602:void GetNewFlagPoint(wpobject_t *wp, gentity_t *flagEnt, int team)
;2603:{ //get the nearest possible waypoint to the flag since it's not in its original position
line 2604
;2604:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2608
;2605:	vec3_t a, mins, maxs;
;2606:	float bestdist;
;2607:	float testdist;
;2608:	int bestindex = 0;
ADDRLP4 1132
CNSTI4 0
ASGNI4
line 2609
;2609:	int foundindex = 0;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 2612
;2610:	trace_t tr;
;2611:
;2612:	mins[0] = -15;
ADDRLP4 1104
CNSTF4 3245342720
ASGNF4
line 2613
;2613:	mins[1] = -15;
ADDRLP4 1104+4
CNSTF4 3245342720
ASGNF4
line 2614
;2614:	mins[2] = -5;
ADDRLP4 1104+8
CNSTF4 3231711232
ASGNF4
line 2615
;2615:	maxs[0] = 15;
ADDRLP4 1116
CNSTF4 1097859072
ASGNF4
line 2616
;2616:	maxs[1] = 15;
ADDRLP4 1116+4
CNSTF4 1097859072
ASGNF4
line 2617
;2617:	maxs[2] = 5;
ADDRLP4 1116+8
CNSTF4 1084227584
ASGNF4
line 2619
;2618:
;2619:	VectorSubtract(wp->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1136
INDIRP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1136
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2621
;2620:
;2621:	bestdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1144
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1144
INDIRF4
ASGNF4
line 2623
;2622:
;2623:	if (bestdist <= WP_KEEP_FLAG_DIST)
ADDRLP4 20
INDIRF4
CNSTF4 1124073472
GTF4 $1124
line 2624
;2624:	{
line 2625
;2625:		trap_Trace(&tr, wp->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1148
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2627
;2626:
;2627:		if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1124
line 2628
;2628:		{ //this point is good
line 2629
;2629:			return;
ADDRGP4 $1111
JUMPV
line 2631
;2630:		}
;2631:	}
LABELV $1123
line 2634
;2632:
;2633:	while (i < gWPNum)
;2634:	{
line 2635
;2635:		VectorSubtract(gWPArray[i]->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1148
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2636
;2636:		testdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 1156
INDIRF4
ASGNF4
line 2638
;2637:
;2638:		if (testdist < bestdist)
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $1128
line 2639
;2639:		{
line 2640
;2640:			trap_Trace(&tr, gWPArray[i]->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2642
;2641:
;2642:			if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1130
line 2643
;2643:			{
line 2644
;2644:				foundindex = 1;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 2645
;2645:				bestindex = i;
ADDRLP4 1132
ADDRLP4 0
INDIRI4
ASGNI4
line 2646
;2646:				bestdist = testdist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2647
;2647:			}
LABELV $1130
line 2648
;2648:		}
LABELV $1128
line 2650
;2649:
;2650:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2651
;2651:	}
LABELV $1124
line 2633
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1123
line 2653
;2652:
;2653:	if (foundindex)
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $1133
line 2654
;2654:	{
line 2655
;2655:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1135
line 2656
;2656:		{
line 2657
;2657:			flagRed = gWPArray[bestindex];
ADDRGP4 flagRed
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2658
;2658:		}
ADDRGP4 $1136
JUMPV
LABELV $1135
line 2660
;2659:		else
;2660:		{
line 2661
;2661:			flagBlue = gWPArray[bestindex];
ADDRGP4 flagBlue
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2662
;2662:		}
LABELV $1136
line 2663
;2663:	}
LABELV $1133
line 2664
;2664:}
LABELV $1111
endproc GetNewFlagPoint 1164 28
export CTFTakesPriority
proc CTFTakesPriority 124 12
line 2667
;2665:
;2666:int CTFTakesPriority(bot_state_t *bs)
;2667:{
line 2668
;2668:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2669
;2669:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2670
;2670:	int myFlag = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2671
;2671:	int enemyHasOurFlag = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2672
;2672:	int weHaveEnemyFlag = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2673
;2673:	int numOnMyTeam = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2674
;2674:	int numOnEnemyTeam = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 2675
;2675:	int numAttackers = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2676
;2676:	int numDefenders = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 2677
;2677:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2679
;2678:	int idleWP;
;2679:	int dosw = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 2680
;2680:	wpobject_t *dest_sw = NULL;
ADDRLP4 48
CNSTP4 0
ASGNP4
line 2687
;2681:#ifdef BOT_CTF_DEBUG
;2682:	vec3_t t;
;2683:
;2684:	G_Printf("CTFSTATE: %s\n", ctfStateNames[bs->ctfState]);
;2685:#endif
;2686:
;2687:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1138
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $1138
line 2688
;2688:	{
line 2689
;2689:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1138
line 2692
;2690:	}
;2691:
;2692:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1142
ADDRGP4 level+32
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1142
line 2694
;2693:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;2694:	{ //get the nearest weapon laying around base before heading off for battle
line 2695
;2695:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 56
INDIRI4
ASGNI4
line 2697
;2696:
;2697:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 60
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 -1
EQI4 $1143
ADDRLP4 64
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1143
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1143
line 2698
;2698:		{
line 2699
;2699:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1147
line 2700
;2700:			{
line 2701
;2701:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2702
;2702:			}
LABELV $1147
line 2703
;2703:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1137
JUMPV
line 2705
;2704:		}
;2705:	}
LABELV $1142
line 2706
;2706:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1150
ADDRGP4 level+32
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $1150
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1150
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1150
line 2709
;2707:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_CTF &&
;2708:		bs->wpDestination && bs->wpDestination->weight)
;2709:	{
line 2710
;2710:		dest_sw = bs->wpDestination;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 2711
;2711:		dosw = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 2712
;2712:	}
LABELV $1150
LABELV $1143
line 2714
;2713:
;2714:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1153
line 2715
;2715:	{
line 2716
;2716:		myFlag = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 2717
;2717:	}
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2719
;2718:	else
;2719:	{
line 2720
;2720:		myFlag = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 2721
;2721:	}
LABELV $1154
line 2723
;2722:
;2723:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1155
line 2724
;2724:	{
line 2725
;2725:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2726
;2726:	}
ADDRGP4 $1156
JUMPV
LABELV $1155
line 2728
;2727:	else
;2728:	{
line 2729
;2729:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2730
;2730:	}
LABELV $1156
line 2732
;2731:
;2732:	if (!flagRed || !flagBlue ||
ADDRLP4 64
ADDRGP4 flagRed
INDIRP4
ASGNP4
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1163
ADDRLP4 72
ADDRGP4 flagBlue
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1163
ADDRLP4 76
CNSTI4 12
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1163
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1163
ADDRGP4 eFlagRed
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1163
ADDRGP4 eFlagBlue
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $1157
LABELV $1163
line 2735
;2733:		!flagRed->inuse || !flagBlue->inuse ||
;2734:		!eFlagRed || !eFlagBlue)
;2735:	{
line 2736
;2736:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1157
line 2749
;2737:	}
;2738:
;2739:#ifdef BOT_CTF_DEBUG
;2740:	VectorCopy(flagRed->origin, t);
;2741:	t[2] += 128;
;2742:	G_TestLine(flagRed->origin, t, 0x0000ff, 500);
;2743:
;2744:	VectorCopy(flagBlue->origin, t);
;2745:	t[2] += 128;
;2746:	G_TestLine(flagBlue->origin, t, 0x0000ff, 500);
;2747:#endif
;2748:
;2749:	if (droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 84
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1164
ADDRLP4 84
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1164
line 2750
;2750:	{
line 2751
;2751:		GetNewFlagPoint(flagRed, droppedRedFlag, TEAM_RED);
ADDRGP4 flagRed
INDIRP4
ARGP4
ADDRGP4 droppedRedFlag
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2752
;2752:	}
ADDRGP4 $1165
JUMPV
LABELV $1164
line 2754
;2753:	else
;2754:	{
line 2755
;2755:		flagRed = oFlagRed;
ADDRGP4 flagRed
ADDRGP4 oFlagRed
INDIRP4
ASGNP4
line 2756
;2756:	}
LABELV $1165
line 2758
;2757:
;2758:	if (droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 88
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1166
ADDRLP4 88
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1166
line 2759
;2759:	{
line 2760
;2760:		GetNewFlagPoint(flagBlue, droppedBlueFlag, TEAM_BLUE);
ADDRGP4 flagBlue
INDIRP4
ARGP4
ADDRGP4 droppedBlueFlag
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2761
;2761:	}
ADDRGP4 $1167
JUMPV
LABELV $1166
line 2763
;2762:	else
;2763:	{
line 2764
;2764:		flagBlue = oFlagBlue;
ADDRGP4 flagBlue
ADDRGP4 oFlagBlue
INDIRP4
ASGNP4
line 2765
;2765:	}
LABELV $1167
line 2767
;2766:
;2767:	if (!bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1168
line 2768
;2768:	{
line 2769
;2769:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1168
line 2772
;2770:	}
;2771:
;2772:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1171
JUMPV
LABELV $1170
line 2775
;2773:
;2774:	while (i < MAX_CLIENTS)
;2775:	{
line 2776
;2776:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2778
;2777:
;2778:		if (ent && ent->client)
ADDRLP4 96
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $1173
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $1173
line 2779
;2779:		{
line 2780
;2780:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1175
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $1175
line 2781
;2781:			{
line 2782
;2782:				weHaveEnemyFlag = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 2783
;2783:			}
ADDRGP4 $1176
JUMPV
LABELV $1175
line 2784
;2784:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1177
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $1177
line 2785
;2785:			{
line 2786
;2786:				enemyHasOurFlag = 1;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 2787
;2787:			}
LABELV $1177
LABELV $1176
line 2789
;2788:
;2789:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $1179
line 2790
;2790:			{
line 2791
;2791:				numOnMyTeam++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2792
;2792:			}
ADDRGP4 $1180
JUMPV
LABELV $1179
line 2794
;2793:			else
;2794:			{
line 2795
;2795:				numOnEnemyTeam++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2796
;2796:			}
LABELV $1180
line 2798
;2797:
;2798:			if (botstates[ent->s.number])
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1181
line 2799
;2799:			{
line 2800
;2800:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 120
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 1
EQI4 $1185
ADDRLP4 120
INDIRI4
CNSTI4 3
NEI4 $1183
LABELV $1185
line 2802
;2801:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;2802:				{
line 2803
;2803:					numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2804
;2804:				}
ADDRGP4 $1182
JUMPV
LABELV $1183
line 2806
;2805:				else
;2806:				{
line 2807
;2807:					numDefenders++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2808
;2808:				}
line 2809
;2809:			}
ADDRGP4 $1182
JUMPV
LABELV $1181
line 2811
;2810:			else
;2811:			{ //assume real players to be attackers in our logic
line 2812
;2812:				numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2813
;2813:			}
LABELV $1182
line 2814
;2814:		}
LABELV $1173
line 2815
;2815:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2816
;2816:	}
LABELV $1171
line 2774
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1170
line 2818
;2817:
;2818:	if (bs->cur_ps.powerups[enemyFlag])
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1186
line 2819
;2819:	{
line 2820
;2820:		if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 20
INDIRI4
CNSTI4 2
LTI4 $1190
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1188
LABELV $1190
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1188
line 2821
;2821:		{
line 2822
;2822:			bs->ctfState = CTFSTATE_RETRIEVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 2823
;2823:		}
ADDRGP4 $1187
JUMPV
LABELV $1188
line 2825
;2824:		else
;2825:		{
line 2826
;2826:			bs->ctfState = CTFSTATE_GETFLAGHOME;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 5
ASGNI4
line 2827
;2827:		}
line 2828
;2828:	}
ADDRGP4 $1187
JUMPV
LABELV $1186
line 2829
;2829:	else if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1191
line 2830
;2830:	{
line 2831
;2831:		bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2832
;2832:	}
LABELV $1191
LABELV $1187
line 2834
;2833:
;2834:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1193
line 2835
;2835:	{
line 2836
;2836:		bs->ctfState = bs->state_Forced;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 2837
;2837:	}
LABELV $1193
line 2839
;2838:
;2839:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1195
line 2840
;2840:	{
line 2841
;2841:		if (BotDefendFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotDefendFlag
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1197
line 2842
;2842:		{
line 2843
;2843:			goto success;
ADDRGP4 $1199
JUMPV
LABELV $1197
line 2845
;2844:		}
;2845:	}
LABELV $1195
line 2847
;2846:
;2847:	if (bs->ctfState == CTFSTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1200
line 2848
;2848:	{
line 2849
;2849:		if (BotGetEnemyFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetEnemyFlag
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1202
line 2850
;2850:		{
line 2851
;2851:			goto success;
ADDRGP4 $1199
JUMPV
LABELV $1202
line 2853
;2852:		}
;2853:	}
LABELV $1200
line 2855
;2854:
;2855:	if (bs->ctfState == CTFSTATE_RETRIEVAL)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1204
line 2856
;2856:	{
line 2857
;2857:		if (BotGetFlagBack(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetFlagBack
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1206
line 2858
;2858:		{
line 2859
;2859:			goto success;
ADDRGP4 $1199
JUMPV
LABELV $1206
line 2862
;2860:		}
;2861:		else
;2862:		{ //can't find anyone on another team being a carrier, so ignore this priority
line 2863
;2863:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2864
;2864:		}
line 2865
;2865:	}
LABELV $1204
line 2867
;2866:
;2867:	if (bs->ctfState == CTFSTATE_GUARDCARRIER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1208
line 2868
;2868:	{
line 2869
;2869:		if (BotGuardFlagCarrier(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGuardFlagCarrier
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1210
line 2870
;2870:		{
line 2871
;2871:			goto success;
ADDRGP4 $1199
JUMPV
LABELV $1210
line 2874
;2872:		}
;2873:		else
;2874:		{ //can't find anyone on our team being a carrier, so ignore this priority
line 2875
;2875:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2876
;2876:		}
line 2877
;2877:	}
LABELV $1208
line 2879
;2878:
;2879:	if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1212
line 2880
;2880:	{
line 2881
;2881:		if (BotGetFlagHome(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetFlagHome
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1214
line 2882
;2882:		{
line 2883
;2883:			goto success;
ADDRGP4 $1199
JUMPV
LABELV $1214
line 2885
;2884:		}
;2885:	}
LABELV $1212
line 2887
;2886:
;2887:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1199
line 2890
;2888:
;2889:success:
;2890:	if (dosw)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1216
line 2891
;2891:	{ //allow ctf code to run, but if after a particular item then keep going after it
line 2892
;2892:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
line 2893
;2893:	}
LABELV $1216
line 2895
;2894:
;2895:	return 1;
CNSTI4 1
RETI4
LABELV $1137
endproc CTFTakesPriority 124 12
export EntityVisibleBox
proc EntityVisibleBox 1084 28
line 2899
;2896:}
;2897:
;2898:int EntityVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore, int ignore2)
;2899:{
line 2902
;2900:	trace_t tr;
;2901:
;2902:	trap_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2904
;2903:
;2904:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1219
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1219
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1219
line 2905
;2905:	{
line 2906
;2906:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1219
line 2908
;2907:	}
;2908:	else if (tr.entityNum != ENTITYNUM_NONE && tr.entityNum == ignore2)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $1223
ADDRLP4 0+52
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $1223
line 2909
;2909:	{
line 2910
;2910:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1218
JUMPV
LABELV $1223
line 2913
;2911:	}
;2912:
;2913:	return 0;
CNSTI4 0
RETI4
LABELV $1218
endproc EntityVisibleBox 1084 28
export Saga_TargetClosestObjective
proc Saga_TargetClosestObjective 132 24
line 2917
;2914:}
;2915:
;2916:int Saga_TargetClosestObjective(bot_state_t *bs, int flag)
;2917:{
line 2918
;2918:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2919
;2919:	int bestindex = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2920
;2920:	float testdistance = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 2921
;2921:	float bestdistance = 999999999;
ADDRLP4 24
CNSTF4 1315859240
ASGNF4
line 2926
;2922:	gentity_t *goalent;
;2923:	vec3_t a, dif;
;2924:	vec3_t mins, maxs;
;2925:
;2926:	mins[0] = -1;
ADDRLP4 44
CNSTF4 3212836864
ASGNF4
line 2927
;2927:	mins[1] = -1;
ADDRLP4 44+4
CNSTF4 3212836864
ASGNF4
line 2928
;2928:	mins[2] = -1;
ADDRLP4 44+8
CNSTF4 3212836864
ASGNF4
line 2930
;2929:
;2930:	maxs[0] = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 2931
;2931:	maxs[1] = 1;
ADDRLP4 56+4
CNSTF4 1065353216
ASGNF4
line 2932
;2932:	maxs[2] = 1;
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 2934
;2933:
;2934:	if ( bs->wpDestination && (bs->wpDestination->flags & flag) && bs->wpDestination->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1237
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1237
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1023
EQI4 $1237
ADDRLP4 80
CNSTI4 828
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1237
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+652
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1237
line 2936
;2935:		 &g_entities[bs->wpDestination->associated_entity] && g_entities[bs->wpDestination->associated_entity].use )
;2936:	{
line 2937
;2937:		goto hasPoint;
ADDRGP4 $1235
JUMPV
LABELV $1236
line 2941
;2938:	}
;2939:
;2940:	while (i < gWPNum)
;2941:	{
line 2942
;2942:		if ( gWPArray[i] && gWPArray[i]->inuse && (gWPArray[i]->flags & flag) && gWPArray[i]->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTU4 0
ASGNU4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1239
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1239
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $1239
ADDRLP4 96
ADDRLP4 84
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 1023
EQI4 $1239
ADDRLP4 100
CNSTI4 828
ADDRLP4 96
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1239
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities+652
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1239
line 2944
;2943:			 &g_entities[gWPArray[i]->associated_entity] && g_entities[gWPArray[i]->associated_entity].use )
;2944:		{
line 2945
;2945:			VectorSubtract(gWPArray[i]->origin, bs->origin, a);
ADDRLP4 104
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 104
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2946
;2946:			testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 112
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 112
INDIRF4
ASGNF4
line 2948
;2947:
;2948:			if (testdistance < bestdistance)
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1244
line 2949
;2949:			{
line 2950
;2950:				bestdistance = testdistance;
ADDRLP4 24
ADDRLP4 16
INDIRF4
ASGNF4
line 2951
;2951:				bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2952
;2952:			}
LABELV $1244
line 2953
;2953:		}
LABELV $1239
line 2955
;2954:
;2955:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2956
;2956:	}
LABELV $1237
line 2940
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1236
line 2958
;2957:
;2958:	if (bestindex != -1)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $1246
line 2959
;2959:	{
line 2960
;2960:		bs->wpDestination = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2961
;2961:	}
ADDRGP4 $1247
JUMPV
LABELV $1246
line 2963
;2962:	else
;2963:	{
line 2964
;2964:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1227
JUMPV
LABELV $1247
LABELV $1235
line 2967
;2965:	}
;2966:hasPoint:
;2967:	goalent = &g_entities[bs->wpDestination->associated_entity];
ADDRLP4 20
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2969
;2968:
;2969:	if (!goalent)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1248
line 2970
;2970:	{
line 2971
;2971:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1227
JUMPV
LABELV $1248
line 2974
;2972:	}
;2973:
;2974:	VectorSubtract(bs->origin, bs->wpDestination->origin, a);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 84
INDIRP4
CNSTI4 1888
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 92
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2976
;2975:
;2976:	testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 96
INDIRF4
ASGNF4
line 2978
;2977:
;2978:	dif[0] = (goalent->r.absmax[0]+goalent->r.absmin[0])/2;
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2979
;2979:	dif[1] = (goalent->r.absmax[1]+goalent->r.absmin[1])/2;
ADDRLP4 32+4
ADDRLP4 20
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2980
;2980:	dif[2] = (goalent->r.absmax[2]+goalent->r.absmin[2])/2;
ADDRLP4 32+8
ADDRLP4 20
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2983
;2981:	//brush models can have tricky origins, so this is our hacky method of getting the center point
;2982:
;2983:	if (goalent->takedamage && testdistance < BOT_MIN_SAGA_GOAL_SHOOT &&
ADDRLP4 20
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1254
ADDRLP4 16
INDIRF4
CNSTF4 1149239296
GEF4 $1254
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1254
line 2985
;2984:		EntityVisibleBox(bs->origin, mins, maxs, dif, bs->client, goalent->s.number))
;2985:	{
line 2986
;2986:		bs->shootGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 2987
;2987:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 2988
;2988:	}
ADDRGP4 $1255
JUMPV
LABELV $1254
line 2989
;2989:	else if (goalent->use && testdistance < BOT_MIN_SAGA_GOAL_TRAVEL)
ADDRLP4 20
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1256
ADDRLP4 16
INDIRF4
CNSTF4 1124073472
GEF4 $1256
line 2990
;2990:	{
line 2991
;2991:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 2992
;2992:		bs->touchGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 2993
;2993:	}
ADDRGP4 $1257
JUMPV
LABELV $1256
line 2995
;2994:	else
;2995:	{ //don't know how to handle this goal object!
line 2996
;2996:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 2997
;2997:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 2998
;2998:	}
LABELV $1257
LABELV $1255
line 3000
;2999:
;3000:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $1260
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 4
NEI4 $1258
LABELV $1260
line 3002
;3001:		BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
;3002:	{
line 3003
;3003:		bs->shootGoal = NULL; //too risky
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3004
;3004:	}
LABELV $1258
line 3006
;3005:
;3006:	if (bs->touchGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1261
line 3007
;3007:	{
line 3009
;3008:		//G_Printf("Please, master, let me touch it!\n");
;3009:		VectorCopy(dif, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 32
INDIRB
ASGNB 12
line 3010
;3010:	}
LABELV $1261
line 3012
;3011:
;3012:	return 1;
CNSTI4 1
RETI4
LABELV $1227
endproc Saga_TargetClosestObjective 132 24
export Saga_DefendFromAttackers
proc Saga_DefendFromAttackers 68 8
line 3016
;3013:}
;3014:
;3015:void Saga_DefendFromAttackers(bot_state_t *bs)
;3016:{ //this may be a little cheap, but the best way to find our defending point is probably
line 3019
;3017:  //to just find the nearest person on the opposing team since they'll most likely
;3018:  //be on offense in this situation
;3019:	int wpClose = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 3020
;3020:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3021
;3021:	float testdist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 3022
;3022:	int bestindex = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 3023
;3023:	float bestdist = 999999;
ADDRLP4 24
CNSTF4 1232348144
ASGNF4
ADDRGP4 $1265
JUMPV
LABELV $1264
line 3028
;3024:	gentity_t *ent;
;3025:	vec3_t a;
;3026:
;3027:	while (i < MAX_CLIENTS)
;3028:	{
line 3029
;3029:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3031
;3030:
;3031:		if (ent && ent->client && ent->client->sess.sessionTeam != g_entities[bs->client].client->sess.sessionTeam &&
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1267
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1267
ADDRLP4 48
CNSTI4 1532
ASGNI4
ADDRLP4 52
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
EQI4 $1267
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1267
ADDRLP4 52
INDIRI4
CNSTI4 3
EQI4 $1267
line 3033
;3032:			ent->health > 0 && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
;3033:		{
line 3034
;3034:			VectorSubtract(ent->client->ps.origin, bs->origin, a);
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3036
;3035:
;3036:			testdist = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 64
INDIRF4
ASGNF4
line 3038
;3037:
;3038:			if (testdist < bestdist)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1272
line 3039
;3039:			{
line 3040
;3040:				bestindex = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 3041
;3041:				bestdist = testdist;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
line 3042
;3042:			}
LABELV $1272
line 3043
;3043:		}
LABELV $1267
line 3045
;3044:
;3045:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3046
;3046:	}
LABELV $1265
line 3027
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1264
line 3048
;3047:
;3048:	if (bestindex == -1)
ADDRLP4 32
INDIRI4
CNSTI4 -1
NEI4 $1274
line 3049
;3049:	{
line 3050
;3050:		return;
ADDRGP4 $1263
JUMPV
LABELV $1274
line 3053
;3051:	}
;3052:
;3053:	wpClose = GetNearestVisibleWP(g_entities[bestindex].client->ps.origin, -1);	
CNSTI4 828
ADDRLP4 32
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 36
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 3055
;3054:
;3055:	if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $1277
ADDRLP4 44
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1277
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1277
line 3056
;3056:	{
line 3057
;3057:		bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3058
;3058:		bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 3059
;3059:	}
LABELV $1277
line 3060
;3060:}
LABELV $1263
endproc Saga_DefendFromAttackers 68 8
export Saga_CountDefenders
proc Saga_CountDefenders 28 0
line 3063
;3061:
;3062:int Saga_CountDefenders(bot_state_t *bs)
;3063:{
line 3064
;3064:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3065
;3065:	int num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1282
JUMPV
LABELV $1281
line 3070
;3066:	gentity_t *ent;
;3067:	bot_state_t *bot;
;3068:
;3069:	while (i < MAX_CLIENTS)
;3070:	{
line 3071
;3071:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3072
;3072:		bot = botstates[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3074
;3073:
;3074:		if (ent && ent->client && bot)
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1284
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1284
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1284
line 3075
;3075:		{
line 3076
;3076:			if (bot->sagaState == SAGASTATE_DEFENDER &&
ADDRLP4 8
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1286
ADDRLP4 24
CNSTI4 1532
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
NEI4 $1286
line 3078
;3077:				ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
;3078:			{
line 3079
;3079:				num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3080
;3080:			}
LABELV $1286
line 3081
;3081:		}
LABELV $1284
line 3083
;3082:
;3083:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3084
;3084:	}
LABELV $1282
line 3069
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1281
line 3086
;3085:
;3086:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $1280
endproc Saga_CountDefenders 28 0
export Saga_CountTeammates
proc Saga_CountTeammates 24 0
line 3090
;3087:}
;3088:
;3089:int Saga_CountTeammates(bot_state_t *bs)
;3090:{
line 3091
;3091:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3092
;3092:	int num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
line 3096
;3093:	gentity_t *ent;
;3094:
;3095:	while (i < MAX_CLIENTS)
;3096:	{
line 3097
;3097:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3099
;3098:
;3099:		if (ent && ent->client)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1293
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1293
line 3100
;3100:		{
line 3101
;3101:			if (ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
ADDRLP4 20
CNSTI4 1532
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
NEI4 $1295
line 3102
;3102:			{
line 3103
;3103:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3104
;3104:			}
LABELV $1295
line 3105
;3105:		}
LABELV $1293
line 3107
;3106:
;3107:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3108
;3108:	}
LABELV $1291
line 3095
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1290
line 3110
;3109:
;3110:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1289
endproc Saga_CountTeammates 24 0
export SagaTakesPriority
proc SagaTakesPriority 1168 28
line 3114
;3111:}
;3112:
;3113:int SagaTakesPriority(bot_state_t *bs)
;3114:{
line 3120
;3115:	int attacker;
;3116:	int flagForDefendableObjective;
;3117:	int flagForAttackableObjective;
;3118:	int defenders, teammates;
;3119:	int idleWP;
;3120:	wpobject_t *dest_sw = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 3121
;3121:	int dosw = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3126
;3122:	gclient_t *bcl;
;3123:	vec3_t dif;
;3124:	trace_t tr;
;3125:
;3126:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $1299
line 3127
;3127:	{
line 3128
;3128:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1298
JUMPV
LABELV $1299
line 3131
;3129:	}
;3130:
;3131:	bcl = g_entities[bs->client].client;
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 3133
;3132:
;3133:	if (!bcl)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1303
line 3134
;3134:	{
line 3135
;3135:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1298
JUMPV
LABELV $1303
line 3138
;3136:	}
;3137:
;3138:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1305
ADDRGP4 level+32
INDIRI4
ADDRLP4 1128
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1305
line 3140
;3139:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;3140:	{ //get the nearest weapon laying around base before heading off for battle
line 3141
;3141:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1132
INDIRI4
ASGNI4
line 3143
;3142:
;3143:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 1136
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 -1
EQI4 $1306
ADDRLP4 1140
ADDRLP4 1136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1306
ADDRLP4 1140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1306
line 3144
;3144:		{
line 3145
;3145:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1310
line 3146
;3146:			{
line 3147
;3147:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3148
;3148:			}
LABELV $1310
line 3149
;3149:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1298
JUMPV
line 3151
;3150:		}
;3151:	}
LABELV $1305
line 3152
;3152:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1313
ADDRGP4 level+32
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 15000
GEI4 $1313
ADDRLP4 1136
ADDRLP4 1132
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1313
ADDRLP4 1136
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1313
line 3155
;3153:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_TIME &&
;3154:		bs->wpDestination && bs->wpDestination->weight)
;3155:	{
line 3156
;3156:		dest_sw = bs->wpDestination;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3157
;3157:		dosw = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3158
;3158:	}
LABELV $1313
LABELV $1306
line 3160
;3159:
;3160:	if (bcl->sess.sessionTeam == SAGATEAM_IMPERIAL)
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1316
line 3161
;3161:	{
line 3162
;3162:		attacker = imperial_attackers;
ADDRLP4 12
ADDRGP4 imperial_attackers
INDIRI4
ASGNI4
line 3163
;3163:		flagForDefendableObjective = WPFLAG_SAGA_REBELOBJ;
ADDRLP4 40
CNSTI4 524288
ASGNI4
line 3164
;3164:		flagForAttackableObjective = WPFLAG_SAGA_IMPERIALOBJ;
ADDRLP4 16
CNSTI4 1048576
ASGNI4
line 3165
;3165:	}
ADDRGP4 $1317
JUMPV
LABELV $1316
line 3167
;3166:	else
;3167:	{
line 3168
;3168:		attacker = rebel_attackers;
ADDRLP4 12
ADDRGP4 rebel_attackers
INDIRI4
ASGNI4
line 3169
;3169:		flagForDefendableObjective = WPFLAG_SAGA_IMPERIALOBJ;
ADDRLP4 40
CNSTI4 1048576
ASGNI4
line 3170
;3170:		flagForAttackableObjective = WPFLAG_SAGA_REBELOBJ;
ADDRLP4 16
CNSTI4 524288
ASGNI4
line 3171
;3171:	}
LABELV $1317
line 3173
;3172:
;3173:	if (attacker)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1318
line 3174
;3174:	{
line 3175
;3175:		bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3176
;3176:	}
ADDRGP4 $1319
JUMPV
LABELV $1318
line 3178
;3177:	else
;3178:	{
line 3179
;3179:		bs->sagaState = SAGASTATE_DEFENDER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 2
ASGNI4
line 3180
;3180:		defenders = Saga_CountDefenders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 Saga_CountDefenders
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 1140
INDIRI4
ASGNI4
line 3181
;3181:		teammates = Saga_CountTeammates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 Saga_CountTeammates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 1144
INDIRI4
ASGNI4
line 3183
;3182:
;3183:		if (defenders > teammates/3 && teammates > 1)
ADDRLP4 1148
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 1148
INDIRI4
CNSTI4 3
DIVI4
LEI4 $1320
ADDRLP4 1148
INDIRI4
CNSTI4 1
LEI4 $1320
line 3184
;3184:		{ //devote around 1/4 of our team to completing our own side goals even if we're a defender.
line 3186
;3185:		  //If we have no side goals we will realize that later on and join the defenders
;3186:			bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3187
;3187:		}
LABELV $1320
line 3188
;3188:	}
LABELV $1319
line 3190
;3189:
;3190:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1322
line 3191
;3191:	{
line 3192
;3192:		bs->sagaState = bs->state_Forced;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 2692
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 3193
;3193:	}
LABELV $1322
line 3195
;3194:
;3195:	if (bs->sagaState == SAGASTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1324
line 3196
;3196:	{
line 3197
;3197:		if (!Saga_TargetClosestObjective(bs, flagForAttackableObjective))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 Saga_TargetClosestObjective
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1325
line 3198
;3198:		{ //looks like we have no goals other than to keep the other team from completing objectives
line 3199
;3199:			Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3200
;3200:			if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1325
line 3201
;3201:			{
line 3202
;3202:				dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1144
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3203
;3203:				dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1148
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3204
;3204:				dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1152
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1152
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3206
;3205:				
;3206:				if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1332
line 3207
;3207:				{
line 3208
;3208:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3209
;3209:				}
ADDRGP4 $1325
JUMPV
LABELV $1332
line 3211
;3210:				else
;3211:				{
line 3212
;3212:					trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1164
CNSTP4 0
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3214
;3213:
;3214:					if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1325
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1325
line 3215
;3215:					{
line 3216
;3216:						bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3217
;3217:					}
line 3218
;3218:				}
line 3219
;3219:			}
line 3220
;3220:		}
line 3221
;3221:	}
ADDRGP4 $1325
JUMPV
LABELV $1324
line 3222
;3222:	else if (bs->sagaState == SAGASTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1338
line 3223
;3223:	{
line 3224
;3224:		Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3225
;3225:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1339
line 3226
;3226:		{
line 3227
;3227:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1140
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3228
;3228:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1144
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3229
;3229:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1148
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3231
;3230:				
;3231:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1344
line 3232
;3232:			{
line 3233
;3233:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3234
;3234:			}
ADDRGP4 $1339
JUMPV
LABELV $1344
line 3236
;3235:			else
;3236:			{
line 3237
;3237:				trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3239
;3238:
;3239:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1339
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1339
line 3240
;3240:				{
line 3241
;3241:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3242
;3242:				}
line 3243
;3243:			}
line 3244
;3244:		}
line 3245
;3245:	}
ADDRGP4 $1339
JUMPV
LABELV $1338
line 3247
;3246:	else
;3247:	{ //get busy!
line 3248
;3248:		Saga_TargetClosestObjective(bs, flagForAttackableObjective);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 Saga_TargetClosestObjective
CALLI4
pop
line 3249
;3249:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1350
line 3250
;3250:		{
line 3251
;3251:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1140
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3252
;3252:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1144
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3253
;3253:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1148
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3255
;3254:				
;3255:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1354
line 3256
;3256:			{
line 3257
;3257:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3258
;3258:			}
ADDRGP4 $1355
JUMPV
LABELV $1354
line 3260
;3259:			else
;3260:			{
line 3261
;3261:				trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3263
;3262:
;3263:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1356
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1356
line 3264
;3264:				{
line 3265
;3265:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3266
;3266:				}
LABELV $1356
line 3267
;3267:			}
LABELV $1355
line 3268
;3268:		}
LABELV $1350
line 3269
;3269:	}
LABELV $1339
LABELV $1325
line 3271
;3270:
;3271:	if (dosw)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1360
line 3272
;3272:	{ //allow saga objective code to run, but if after a particular item then keep going after it
line 3273
;3273:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3274
;3274:	}
LABELV $1360
line 3276
;3275:
;3276:	return 1;
CNSTI4 1
RETI4
LABELV $1298
endproc SagaTakesPriority 1168 28
export JMTakesPriority
proc JMTakesPriority 24 8
line 3280
;3277:}
;3278:
;3279:int JMTakesPriority(bot_state_t *bs)
;3280:{
line 3281
;3281:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3282
;3282:	int wpClose = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 3283
;3283:	gentity_t *theImportantEntity = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 3285
;3284:
;3285:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $1363
line 3286
;3286:	{
line 3287
;3287:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1362
JUMPV
LABELV $1363
line 3290
;3288:	}
;3289:
;3290:	if (bs->cur_ps.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1366
line 3291
;3291:	{
line 3292
;3292:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1362
JUMPV
LABELV $1366
line 3297
;3293:	}
;3294:
;3295:	//jmState becomes the index for the one who carries the saber. If jmState is -1 then the saber is currently
;3296:	//without an owner
;3297:	bs->jmState = -1;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 -1
ASGNI4
ADDRGP4 $1369
JUMPV
LABELV $1368
line 3300
;3298:
;3299:	while (i < MAX_CLIENTS)
;3300:	{
line 3301
;3301:		if (g_entities[i].client && g_entities[i].inuse &&
ADDRLP4 12
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1371
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1371
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1371
line 3303
;3302:			g_entities[i].client->ps.isJediMaster)
;3303:		{
line 3304
;3304:			bs->jmState = i;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3305
;3305:			break;
ADDRGP4 $1370
JUMPV
LABELV $1371
line 3308
;3306:		}
;3307:
;3308:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3309
;3309:	}
LABELV $1369
line 3299
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1368
LABELV $1370
line 3311
;3310:
;3311:	if (bs->jmState != -1)
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1376
line 3312
;3312:	{
line 3313
;3313:		theImportantEntity = &g_entities[bs->jmState];
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3314
;3314:	}
ADDRGP4 $1377
JUMPV
LABELV $1376
line 3316
;3315:	else
;3316:	{
line 3317
;3317:		theImportantEntity = gJMSaberEnt;
ADDRLP4 4
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 3318
;3318:	}
LABELV $1377
line 3320
;3319:
;3320:	if (theImportantEntity && theImportantEntity->inuse && bs->destinationGrabTime < level.time)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1378
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1378
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1378
line 3321
;3321:	{
line 3322
;3322:		if (theImportantEntity->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1381
line 3323
;3323:		{
line 3324
;3324:			wpClose = GetNearestVisibleWP(theImportantEntity->client->ps.origin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3325
;3325:		}
ADDRGP4 $1382
JUMPV
LABELV $1381
line 3327
;3326:		else
;3327:		{
line 3328
;3328:			wpClose = GetNearestVisibleWP(theImportantEntity->r.currentOrigin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3329
;3329:		}
LABELV $1382
line 3331
;3330:
;3331:		if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1383
ADDRLP4 20
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1383
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1383
line 3332
;3332:		{
line 3345
;3333:			/*
;3334:			Com_Printf("BOT GRABBED IDEAL JM LOCATION\n");
;3335:			if (bs->wpDestination != gWPArray[wpClose])
;3336:			{
;3337:				Com_Printf("IDEAL WAS NOT ALREADY IDEAL\n");
;3338:
;3339:				if (!bs->wpDestination)
;3340:				{
;3341:					Com_Printf("IDEAL WAS NULL\n");
;3342:				}
;3343:			}
;3344:			*/
;3345:			bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3346
;3346:			bs->destinationGrabTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 3347
;3347:		}
LABELV $1383
line 3348
;3348:	}
LABELV $1378
line 3350
;3349:
;3350:	return 1;
CNSTI4 1
RETI4
LABELV $1362
endproc JMTakesPriority 24 8
export BotHasAssociated
proc BotHasAssociated 12 0
line 3354
;3351:}
;3352:
;3353:int BotHasAssociated(bot_state_t *bs, wpobject_t *wp)
;3354:{
line 3357
;3355:	gentity_t *as;
;3356:
;3357:	if (wp->associated_entity == ENTITYNUM_NONE)
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1387
line 3358
;3358:	{ //make it think this is an item we have so we don't go after nothing
line 3359
;3359:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1387
line 3362
;3360:	}
;3361:
;3362:	as = &g_entities[wp->associated_entity];
ADDRLP4 0
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3364
;3363:
;3364:	if (!as || !as->item)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1391
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $1389
LABELV $1391
line 3365
;3365:	{
line 3366
;3366:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1389
line 3369
;3367:	}
;3368:
;3369:	if (as->item->giType == IT_WEAPON)
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1392
line 3370
;3370:	{
line 3371
;3371:		if (bs->cur_ps.stats[STAT_WEAPONS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1394
line 3372
;3372:		{
line 3373
;3373:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1394
line 3376
;3374:		}
;3375:
;3376:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1392
line 3378
;3377:	}
;3378:	else if (as->item->giType == IT_HOLDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1396
line 3379
;3379:	{
line 3380
;3380:		if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1398
line 3381
;3381:		{
line 3382
;3382:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1398
line 3385
;3383:		}
;3384:
;3385:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1396
line 3387
;3386:	}
;3387:	else if (as->item->giType == IT_POWERUP)
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1400
line 3388
;3388:	{
line 3389
;3389:		if (bs->cur_ps.powerups[as->item->giTag])
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1402
line 3390
;3390:		{
line 3391
;3391:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1402
line 3394
;3392:		}
;3393:
;3394:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1400
line 3396
;3395:	}
;3396:	else if (as->item->giType == IT_AMMO)
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1404
line 3397
;3397:	{
line 3398
;3398:		if (bs->cur_ps.ammo[as->item->giTag] > 10) //hack
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1406
line 3399
;3399:		{
line 3400
;3400:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1406
line 3403
;3401:		}
;3402:
;3403:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1386
JUMPV
LABELV $1404
line 3406
;3404:	}
;3405:
;3406:	return 0;
CNSTI4 0
RETI4
LABELV $1386
endproc BotHasAssociated 12 0
export GetBestIdleGoal
proc GetBestIdleGoal 40 12
line 3410
;3407:}
;3408:
;3409:int GetBestIdleGoal(bot_state_t *bs)
;3410:{
line 3411
;3411:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3412
;3412:	int highestweight = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3413
;3413:	int desiredindex = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 3414
;3414:	int dist_to_weight = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3417
;3415:	int traildist;
;3416:
;3417:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1409
line 3418
;3418:	{
line 3419
;3419:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1408
JUMPV
LABELV $1409
line 3422
;3420:	}
;3421:
;3422:	if (bs->isCamper != 2)
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1411
line 3423
;3423:	{
line 3424
;3424:		if (bs->randomNavTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1413
line 3425
;3425:		{
line 3426
;3426:			if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
GEI4 $1416
line 3427
;3427:			{
line 3428
;3428:				bs->randomNav = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 1
ASGNI4
line 3429
;3429:			}
ADDRGP4 $1417
JUMPV
LABELV $1416
line 3431
;3430:			else
;3431:			{
line 3432
;3432:				bs->randomNav = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 0
ASGNI4
line 3433
;3433:			}
LABELV $1417
line 3435
;3434:			
;3435:			bs->randomNavTime = level.time + Q_irand(5000, 15000);
CNSTI4 5000
ARGI4
CNSTI4 15000
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 3436
;3436:		}
LABELV $1413
line 3437
;3437:	}
LABELV $1411
line 3439
;3438:
;3439:	if (bs->randomNav)
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1422
line 3440
;3440:	{ //stop looking for items and/or camping on them
line 3441
;3441:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1408
JUMPV
LABELV $1421
line 3445
;3442:	}
;3443:
;3444:	while (i < gWPNum)
;3445:	{
line 3446
;3446:		if (gWPArray[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1424
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1424
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $1424
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $1424
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BotHasAssociated
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1424
line 3451
;3447:			gWPArray[i]->inuse &&
;3448:			(gWPArray[i]->flags & WPFLAG_GOALPOINT) &&
;3449:			gWPArray[i]->weight > highestweight &&
;3450:			!BotHasAssociated(bs, gWPArray[i]))
;3451:		{
line 3452
;3452:			traildist = TotalTrailDistance(bs->wpCurrent->index, i, bs);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 3454
;3453:
;3454:			if (traildist != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1426
line 3455
;3455:			{
line 3456
;3456:				dist_to_weight = (int)traildist/10000;
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 10000
DIVI4
ASGNI4
line 3457
;3457:				dist_to_weight = (gWPArray[i]->weight)-dist_to_weight;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 3459
;3458:
;3459:				if (dist_to_weight > highestweight)
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1428
line 3460
;3460:				{
line 3461
;3461:					highestweight = dist_to_weight;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3462
;3462:					desiredindex = i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 3463
;3463:				}
LABELV $1428
line 3464
;3464:			}
LABELV $1426
line 3465
;3465:		}
LABELV $1424
line 3467
;3466:
;3467:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3468
;3468:	}
LABELV $1422
line 3444
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1421
line 3470
;3469:
;3470:	return desiredindex;
ADDRLP4 16
INDIRI4
RETI4
LABELV $1408
endproc GetBestIdleGoal 40 12
export GetIdealDestination
proc GetIdealDestination 160 12
line 3474
;3471:}
;3472:
;3473:void GetIdealDestination(bot_state_t *bs)
;3474:{
line 3489
;3475:	int tempInt, cWPIndex, bChicken, idleWP;
;3476:	float distChange, plusLen, minusLen;
;3477:	vec3_t usethisvec, a;
;3478:	gentity_t *badthing;
;3479:
;3480:#ifdef _DEBUG
;3481:	trap_Cvar_Update(&bot_nogoals);
;3482:
;3483:	if (bot_nogoals.integer)
;3484:	{
;3485:		return;
;3486:	}
;3487:#endif
;3488:
;3489:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1431
line 3490
;3490:	{
line 3491
;3491:		return;
ADDRGP4 $1430
JUMPV
LABELV $1431
line 3494
;3492:	}
;3493:
;3494:	if ((level.time - bs->escapeDirTime) > 4000)
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1433
line 3495
;3495:	{
line 3496
;3496:		badthing = GetNearestBadThing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetNearestBadThing
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 3497
;3497:	}
ADDRGP4 $1434
JUMPV
LABELV $1433
line 3499
;3498:	else
;3499:	{
line 3500
;3500:		badthing = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 3501
;3501:	}
LABELV $1434
line 3503
;3502:
;3503:	if (badthing && badthing->inuse &&
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1436
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1436
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $1436
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1436
line 3505
;3504:		badthing->health > 0 && badthing->takedamage)
;3505:	{
line 3506
;3506:		bs->dangerousObject = badthing;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3507
;3507:	}
ADDRGP4 $1437
JUMPV
LABELV $1436
line 3509
;3508:	else
;3509:	{
line 3510
;3510:		bs->dangerousObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
CNSTP4 0
ASGNP4
line 3511
;3511:	}
LABELV $1437
line 3513
;3512:
;3513:	if (!badthing && bs->wpDestIgnoreTime > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1438
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1438
line 3514
;3514:	{
line 3515
;3515:		return;
ADDRGP4 $1430
JUMPV
LABELV $1438
line 3518
;3516:	}
;3517:
;3518:	if (!badthing && bs->dontGoBack > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1441
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1441
line 3519
;3519:	{
line 3520
;3520:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1444
line 3521
;3521:		{
line 3522
;3522:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3523
;3523:		}
LABELV $1444
line 3524
;3524:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3525
;3525:		return;
ADDRGP4 $1430
JUMPV
LABELV $1441
line 3527
;3526:	}
;3527:	else if (!badthing && bs->wpStoreDest)
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $1446
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1446
line 3528
;3528:	{ //after we finish running away, switch back to our original destination
line 3529
;3529:		bs->wpDestination = bs->wpStoreDest;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
ASGNP4
line 3530
;3530:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 3531
;3531:	}
LABELV $1446
line 3533
;3532:
;3533:	if (badthing && bs->wpCamping)
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1448
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1448
line 3534
;3534:	{
line 3535
;3535:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 3536
;3536:	}
LABELV $1448
line 3538
;3537:
;3538:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1450
line 3539
;3539:	{
line 3540
;3540:		bs->wpDestination = bs->wpCamping;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
ASGNP4
line 3541
;3541:		return;
ADDRGP4 $1430
JUMPV
LABELV $1450
line 3544
;3542:	}
;3543:
;3544:	if (!badthing && CTFTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1452
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CTFTakesPriority
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1452
line 3545
;3545:	{
line 3546
;3546:		if (bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1430
line 3547
;3547:		{
line 3548
;3548:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3549
;3549:		}
line 3550
;3550:		return;
ADDRGP4 $1430
JUMPV
LABELV $1452
line 3552
;3551:	}
;3552:	else if (!badthing && SagaTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1456
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 SagaTakesPriority
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1456
line 3553
;3553:	{
line 3554
;3554:		if (bs->sagaState)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1430
line 3555
;3555:		{
line 3556
;3556:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3557
;3557:		}
line 3558
;3558:		return;
ADDRGP4 $1430
JUMPV
LABELV $1456
line 3560
;3559:	}
;3560:	else if (!badthing && JMTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1460
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 JMTakesPriority
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $1460
line 3561
;3561:	{
line 3562
;3562:		bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3563
;3563:	}
LABELV $1460
line 3565
;3564:
;3565:	if (badthing)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1462
line 3566
;3566:	{
line 3567
;3567:		bs->runningLikeASissy = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3569
;3568:
;3569:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1465
line 3570
;3570:		{
line 3571
;3571:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3572
;3572:		}
LABELV $1465
line 3573
;3573:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3575
;3574:
;3575:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1467
line 3576
;3576:		{
line 3577
;3577:			tempInt = bs->wpCurrent->index+1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3578
;3578:		}
ADDRGP4 $1468
JUMPV
LABELV $1467
line 3580
;3579:		else
;3580:		{
line 3581
;3581:			tempInt = bs->wpCurrent->index-1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3582
;3582:		}
LABELV $1468
line 3584
;3583:
;3584:		if (gWPArray[tempInt] && gWPArray[tempInt]->inuse && bs->escapeDirTime < level.time)
ADDRLP4 84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1430
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1430
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1430
line 3585
;3585:		{
line 3586
;3586:			VectorSubtract(badthing->s.pos.trBase, bs->wpCurrent->origin, a);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3587
;3587:			plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 96
INDIRF4
ASGNF4
line 3588
;3588:			VectorSubtract(badthing->s.pos.trBase, gWPArray[tempInt]->origin, a);
ADDRLP4 104
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3589
;3589:			minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 108
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 108
INDIRF4
ASGNF4
line 3591
;3590:
;3591:			if (plusLen < minusLen)
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $1430
line 3592
;3592:			{
line 3593
;3593:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1478
line 3594
;3594:				{
line 3595
;3595:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 3596
;3596:				}
ADDRGP4 $1479
JUMPV
LABELV $1478
line 3598
;3597:				else
;3598:				{
line 3599
;3599:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 3600
;3600:				}
LABELV $1479
line 3602
;3601:
;3602:				bs->wpCurrent = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3604
;3603:
;3604:				bs->escapeDirTime = level.time + Q_irand(500, 1000);//Q_irand(1000, 1400);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 112
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3607
;3605:
;3606:				//G_Printf("Escaping from scary bad thing [%s]\n", badthing->classname);
;3607:			}
line 3608
;3608:		}
line 3610
;3609:		//G_Printf("Run away run away run away!\n");
;3610:		return;
ADDRGP4 $1430
JUMPV
LABELV $1462
line 3613
;3611:	}
;3612:
;3613:	distChange = 0; //keep the compiler from complaining
ADDRLP4 24
CNSTF4 0
ASGNF4
line 3615
;3614:
;3615:	tempInt = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ASGNI4
line 3617
;3616:
;3617:	if (tempInt == BWEAPONRANGE_MELEE)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1481
line 3618
;3618:	{
line 3619
;3619:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3620
;3620:	}
ADDRGP4 $1482
JUMPV
LABELV $1481
line 3621
;3621:	else if (tempInt == BWEAPONRANGE_SABER)
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $1483
line 3622
;3622:	{
line 3623
;3623:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3624
;3624:	}
ADDRGP4 $1484
JUMPV
LABELV $1483
line 3625
;3625:	else if (tempInt == BWEAPONRANGE_MID)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1485
line 3626
;3626:	{
line 3627
;3627:		distChange = 128;
ADDRLP4 24
CNSTF4 1124073472
ASGNF4
line 3628
;3628:	}
ADDRGP4 $1486
JUMPV
LABELV $1485
line 3629
;3629:	else if (tempInt == BWEAPONRANGE_LONG)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1487
line 3630
;3630:	{
line 3631
;3631:		distChange = 300;
ADDRLP4 24
CNSTF4 1133903872
ASGNF4
line 3632
;3632:	}
LABELV $1487
LABELV $1486
LABELV $1484
LABELV $1482
line 3634
;3633:
;3634:	if (bs->revengeEnemy && bs->revengeEnemy->health > 0 &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 88
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1489
ADDRLP4 88
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1489
ADDRLP4 96
ADDRLP4 88
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1489
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 8
EQI4 $1491
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $1489
LABELV $1491
line 3636
;3635:		bs->revengeEnemy->client && (bs->revengeEnemy->client->pers.connected == CA_ACTIVE || bs->revengeEnemy->client->pers.connected == CA_AUTHORIZING))
;3636:	{ //if we hate someone, always try to get to them
line 3637
;3637:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1490
line 3638
;3638:		{
line 3639
;3639:			if (bs->revengeEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1495
line 3640
;3640:			{
line 3641
;3641:				VectorCopy(bs->revengeEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3642
;3642:			}
ADDRGP4 $1496
JUMPV
LABELV $1495
line 3644
;3643:			else
;3644:			{
line 3645
;3645:				VectorCopy(bs->revengeEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3646
;3646:			}
LABELV $1496
line 3648
;3647:
;3648:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 104
INDIRI4
ASGNI4
line 3650
;3649:
;3650:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1490
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
CNSTF4 3212836864
EQF4 $1490
line 3651
;3651:			{
line 3652
;3652:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3653
;3653:				bs->wpDestSwitchTime = level.time + Q_irand(5000, 10000);
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 120
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3654
;3654:			}
line 3655
;3655:		}
line 3656
;3656:	}
ADDRGP4 $1490
JUMPV
LABELV $1489
line 3657
;3657:	else if (bs->squadLeader && bs->squadLeader->health > 0 &&
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $1500
ADDRLP4 104
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1500
ADDRLP4 112
ADDRLP4 104
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $1500
ADDRLP4 116
ADDRLP4 112
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 8
EQI4 $1502
ADDRLP4 116
INDIRI4
CNSTI4 2
NEI4 $1500
LABELV $1502
line 3659
;3658:		bs->squadLeader->client && (bs->squadLeader->client->pers.connected == CA_ACTIVE || bs->squadLeader->client->pers.connected == CA_AUTHORIZING))
;3659:	{
line 3660
;3660:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1501
line 3661
;3661:		{
line 3662
;3662:			if (bs->squadLeader->client)
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1506
line 3663
;3663:			{
line 3664
;3664:				VectorCopy(bs->squadLeader->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3665
;3665:			}
ADDRGP4 $1507
JUMPV
LABELV $1506
line 3667
;3666:			else
;3667:			{
line 3668
;3668:				VectorCopy(bs->squadLeader->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3669
;3669:			}
LABELV $1507
line 3671
;3670:
;3671:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 120
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 120
INDIRI4
ASGNI4
line 3673
;3672:
;3673:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1501
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 3212836864
EQF4 $1501
line 3674
;3674:			{
line 3675
;3675:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3676
;3676:				bs->wpDestSwitchTime = level.time + Q_irand(5000, 10000);
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 136
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 136
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3677
;3677:			}
line 3678
;3678:		}
line 3679
;3679:	}
ADDRGP4 $1501
JUMPV
LABELV $1500
line 3680
;3680:	else if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1511
line 3681
;3681:	{
line 3682
;3682:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1513
line 3683
;3683:		{
line 3684
;3684:			VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3685
;3685:		}
ADDRGP4 $1514
JUMPV
LABELV $1513
line 3687
;3686:		else
;3687:		{
line 3688
;3688:			VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3689
;3689:		}
LABELV $1514
line 3691
;3690:
;3691:		bChicken = BotIsAChickenWuss(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
line 3692
;3692:		bs->runningToEscapeThreat = bChicken;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 3694
;3693:
;3694:		if (bs->frame_Enemy_Len < distChange || (bChicken && bChicken != 2))
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $1517
ADDRLP4 124
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $1515
ADDRLP4 124
INDIRI4
CNSTI4 2
EQI4 $1515
LABELV $1517
line 3695
;3695:		{
line 3696
;3696:			cWPIndex = bs->wpCurrent->index;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 3698
;3697:
;3698:			if (bs->frame_Enemy_Len > 400)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
LEF4 $1518
line 3699
;3699:			{ //good distance away, start running toward a good place for an item or powerup or whatever
line 3700
;3700:				idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 128
INDIRI4
ASGNI4
line 3702
;3701:
;3702:				if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 132
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 -1
EQI4 $1516
ADDRLP4 136
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1516
ADDRLP4 136
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1516
line 3703
;3703:				{
line 3704
;3704:					bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3705
;3705:				}
line 3706
;3706:			}
ADDRGP4 $1516
JUMPV
LABELV $1518
line 3707
;3707:			else if (gWPArray[cWPIndex-1] && gWPArray[cWPIndex-1]->inuse &&
ADDRLP4 128
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 132
CNSTU4 0
ASGNU4
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1516
ADDRLP4 136
CNSTI4 12
ASGNI4
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1516
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1516
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1516
line 3709
;3708:				gWPArray[cWPIndex+1] && gWPArray[cWPIndex+1]->inuse)
;3709:			{
line 3710
;3710:				VectorSubtract(gWPArray[cWPIndex+1]->origin, usethisvec, a);
ADDRLP4 144
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3711
;3711:				plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 148
INDIRF4
ASGNF4
line 3712
;3712:				VectorSubtract(gWPArray[cWPIndex-1]->origin, usethisvec, a);
ADDRLP4 152
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 152
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 152
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3713
;3713:				minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 156
INDIRF4
ASGNF4
line 3715
;3714:
;3715:				if (minusLen > plusLen)
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $1542
line 3716
;3716:				{
line 3717
;3717:					bs->wpDestination = gWPArray[cWPIndex-1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ASGNP4
line 3718
;3718:				}
ADDRGP4 $1516
JUMPV
LABELV $1542
line 3720
;3719:				else
;3720:				{
line 3721
;3721:					bs->wpDestination = gWPArray[cWPIndex+1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ASGNP4
line 3722
;3722:				}
line 3723
;3723:			}
line 3724
;3724:		}
ADDRGP4 $1516
JUMPV
LABELV $1515
line 3725
;3725:		else if (bChicken != 2 && bs->wpDestSwitchTime < level.time)
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1546
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1546
line 3726
;3726:		{
line 3727
;3727:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 128
INDIRI4
ASGNI4
line 3729
;3728:
;3729:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1549
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 3212836864
EQF4 $1549
line 3730
;3730:			{
line 3731
;3731:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3733
;3732:
;3733:				if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1551
line 3734
;3734:				{ //be more aggressive
line 3735
;3735:					bs->wpDestSwitchTime = level.time + Q_irand(300, 1000);
CNSTI4 300
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 144
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 144
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3736
;3736:				}
ADDRGP4 $1552
JUMPV
LABELV $1551
line 3738
;3737:				else
;3738:				{
line 3739
;3739:					bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 144
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 144
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3740
;3740:				}
LABELV $1552
line 3741
;3741:			}
LABELV $1549
line 3742
;3742:		}
LABELV $1546
LABELV $1516
line 3743
;3743:	}
LABELV $1511
LABELV $1501
LABELV $1490
line 3745
;3744:
;3745:	if (!bs->wpDestination && bs->wpDestSwitchTime < level.time)
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1556
ADDRLP4 120
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1556
line 3746
;3746:	{
line 3748
;3747:		//G_Printf("I need something to do\n");
;3748:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 124
INDIRI4
ASGNI4
line 3750
;3749:
;3750:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 128
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 -1
EQI4 $1559
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1559
ADDRLP4 132
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1559
line 3751
;3751:		{
line 3752
;3752:			bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3753
;3753:		}
LABELV $1559
line 3754
;3754:	}
LABELV $1556
line 3755
;3755:}
LABELV $1430
endproc GetIdealDestination 160 12
export CommanderBotCTFAI
proc CommanderBotCTFAI 216 8
line 3758
;3756:
;3757:void CommanderBotCTFAI(bot_state_t *bs)
;3758:{
line 3759
;3759:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3761
;3760:	gentity_t *ent;
;3761:	int squadmates = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 3763
;3762:	gentity_t *squad[MAX_CLIENTS];
;3763:	int defendAttackPriority = 0; //0 == attack, 1 == defend
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3764
;3764:	int guardDefendPriority = 0; //0 == defend, 1 == guard
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3765
;3765:	int attackRetrievePriority = 0; //0 == retrieve, 1 == attack
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3766
;3766:	int myFlag = 0;
ADDRLP4 164
CNSTI4 0
ASGNI4
line 3767
;3767:	int enemyFlag = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3768
;3768:	int enemyHasOurFlag = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 3769
;3769:	int weHaveEnemyFlag = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 3770
;3770:	int numOnMyTeam = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 3771
;3771:	int numOnEnemyTeam = 0;
ADDRLP4 168
CNSTI4 0
ASGNI4
line 3772
;3772:	int numAttackers = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3773
;3773:	int numDefenders = 0;
ADDRLP4 180
CNSTI4 0
ASGNI4
line 3775
;3774:
;3775:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1562
line 3776
;3776:	{
line 3777
;3777:		myFlag = PW_REDFLAG;
ADDRLP4 164
CNSTI4 4
ASGNI4
line 3778
;3778:	}
ADDRGP4 $1563
JUMPV
LABELV $1562
line 3780
;3779:	else
;3780:	{
line 3781
;3781:		myFlag = PW_BLUEFLAG;
ADDRLP4 164
CNSTI4 5
ASGNI4
line 3782
;3782:	}
LABELV $1563
line 3784
;3783:
;3784:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1564
line 3785
;3785:	{
line 3786
;3786:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 144
CNSTI4 5
ASGNI4
line 3787
;3787:	}
ADDRGP4 $1567
JUMPV
LABELV $1564
line 3789
;3788:	else
;3789:	{
line 3790
;3790:		enemyFlag = PW_REDFLAG;
ADDRLP4 144
CNSTI4 4
ASGNI4
line 3791
;3791:	}
ADDRGP4 $1567
JUMPV
LABELV $1566
line 3794
;3792:
;3793:	while (i < MAX_CLIENTS)
;3794:	{
line 3795
;3795:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3797
;3796:
;3797:		if (ent && ent->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1569
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1569
line 3798
;3798:		{
line 3799
;3799:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1571
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1571
line 3800
;3800:			{
line 3801
;3801:				weHaveEnemyFlag = 1;
ADDRLP4 160
CNSTI4 1
ASGNI4
line 3802
;3802:			}
ADDRGP4 $1572
JUMPV
LABELV $1571
line 3803
;3803:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 164
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1573
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
NEI4 $1573
line 3804
;3804:			{
line 3805
;3805:				enemyHasOurFlag = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 3806
;3806:			}
LABELV $1573
LABELV $1572
line 3808
;3807:
;3808:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $1575
line 3809
;3809:			{
line 3810
;3810:				numOnMyTeam++;
ADDRLP4 156
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3811
;3811:			}
ADDRGP4 $1576
JUMPV
LABELV $1575
line 3813
;3812:			else
;3813:			{
line 3814
;3814:				numOnEnemyTeam++;
ADDRLP4 168
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3815
;3815:			}
LABELV $1576
line 3817
;3816:
;3817:			if (botstates[ent->s.number])
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1577
line 3818
;3818:			{
line 3819
;3819:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 212
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 1
EQI4 $1581
ADDRLP4 212
INDIRI4
CNSTI4 3
NEI4 $1579
LABELV $1581
line 3821
;3820:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;3821:				{
line 3822
;3822:					numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3823
;3823:				}
ADDRGP4 $1578
JUMPV
LABELV $1579
line 3825
;3824:				else
;3825:				{
line 3826
;3826:					numDefenders++;
ADDRLP4 180
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3827
;3827:				}
line 3828
;3828:			}
ADDRGP4 $1578
JUMPV
LABELV $1577
line 3830
;3829:			else
;3830:			{ //assume real players to be attackers in our logic
line 3831
;3831:				numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3832
;3832:			}
LABELV $1578
line 3833
;3833:		}
LABELV $1569
line 3834
;3834:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3835
;3835:	}
LABELV $1567
line 3793
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1566
line 3837
;3836:
;3837:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1583
JUMPV
LABELV $1582
line 3840
;3838:
;3839:	while (i < MAX_CLIENTS)
;3840:	{
line 3841
;3841:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3843
;3842:
;3843:		if (ent && ent->client && botstates[i] && botstates[i]->squadLeader && botstates[i]->squadLeader->s.number == bs->client && i != bs->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1585
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1585
ADDRLP4 196
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1585
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1585
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
NEI4 $1585
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $1585
line 3844
;3844:		{
line 3845
;3845:			squad[squadmates] = ent;
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3846
;3846:			squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3847
;3847:		}
LABELV $1585
line 3849
;3848:
;3849:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3850
;3850:	}
LABELV $1583
line 3839
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1582
line 3852
;3851:
;3852:	squad[squadmates] = &g_entities[bs->client];
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3853
;3853:	squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3855
;3854:
;3855:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3857
;3856:
;3857:	if (enemyHasOurFlag && !weHaveEnemyFlag)
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $1590
ADDRLP4 160
INDIRI4
ADDRLP4 184
INDIRI4
NEI4 $1590
line 3858
;3858:	{ //start off with an attacker instead of a retriever if we don't have the enemy flag yet so that they can't capture it first.
line 3860
;3859:	  //after that we focus on getting our flag back.
;3860:		attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3861
;3861:	}
ADDRGP4 $1590
JUMPV
LABELV $1589
line 3864
;3862:
;3863:	while (i < squadmates)
;3864:	{
line 3865
;3865:		if (squad[i] && squad[i]->client && botstates[squad[i]->s.number])
ADDRLP4 188
CNSTI4 2
ASGNI4
ADDRLP4 192
ADDRLP4 0
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
CNSTU4 0
ASGNU4
ADDRLP4 192
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1592
ADDRLP4 192
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1592
ADDRLP4 192
INDIRP4
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1592
line 3866
;3866:		{
line 3867
;3867:			if (botstates[squad[i]->s.number]->ctfState != CTFSTATE_GETFLAGHOME)
ADDRLP4 200
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1594
line 3868
;3868:			{ //never tell a bot to stop trying to bring the flag to the base
line 3869
;3869:				if (defendAttackPriority)
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1596
line 3870
;3870:				{
line 3871
;3871:					if (weHaveEnemyFlag)
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1598
line 3872
;3872:					{
line 3873
;3873:						if (guardDefendPriority)
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1600
line 3874
;3874:						{
line 3875
;3875:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_GUARDCARRIER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 4
ASGNI4
line 3876
;3876:							guardDefendPriority = 0;
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3877
;3877:						}
ADDRGP4 $1599
JUMPV
LABELV $1600
line 3879
;3878:						else
;3879:						{
line 3880
;3880:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3881
;3881:							guardDefendPriority = 1;
ADDRLP4 176
CNSTI4 1
ASGNI4
line 3882
;3882:						}
line 3883
;3883:					}
ADDRGP4 $1599
JUMPV
LABELV $1598
line 3885
;3884:					else
;3885:					{
line 3886
;3886:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3887
;3887:					}
LABELV $1599
line 3888
;3888:					defendAttackPriority = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3889
;3889:				}
ADDRGP4 $1595
JUMPV
LABELV $1596
line 3891
;3890:				else
;3891:				{
line 3892
;3892:					if (enemyHasOurFlag)
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1602
line 3893
;3893:					{
line 3894
;3894:						if (attackRetrievePriority)
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1604
line 3895
;3895:						{
line 3896
;3896:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3897
;3897:							attackRetrievePriority = 0;
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3898
;3898:						}
ADDRGP4 $1603
JUMPV
LABELV $1604
line 3900
;3899:						else
;3900:						{
line 3901
;3901:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3902
;3902:							attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3903
;3903:						}
line 3904
;3904:					}
ADDRGP4 $1603
JUMPV
LABELV $1602
line 3906
;3905:					else
;3906:					{
line 3907
;3907:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3908
;3908:					}
LABELV $1603
line 3909
;3909:					defendAttackPriority = 1;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 3910
;3910:				}
line 3911
;3911:			}
ADDRGP4 $1595
JUMPV
LABELV $1594
line 3912
;3912:			else if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 156
INDIRI4
CNSTI4 2
LTI4 $1608
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1606
LABELV $1608
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1606
line 3913
;3913:			{ //I'm the only one on my team who will attack and the enemy has my flag, I have to go after him
line 3914
;3914:				botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3915
;3915:			}
LABELV $1606
LABELV $1595
line 3916
;3916:		}
LABELV $1592
line 3918
;3917:
;3918:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3919
;3919:	}
LABELV $1590
line 3863
ADDRLP4 0
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $1589
line 3920
;3920:}
LABELV $1561
endproc CommanderBotCTFAI 216 8
export CommanderBotSagaAI
proc CommanderBotSagaAI 180 8
line 3923
;3921:
;3922:void CommanderBotSagaAI(bot_state_t *bs)
;3923:{
line 3924
;3924:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3925
;3925:	int squadmates = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3926
;3926:	int commanded = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3927
;3927:	int teammates = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRGP4 $1611
JUMPV
LABELV $1610
line 3933
;3928:	gentity_t *squad[MAX_CLIENTS];
;3929:	gentity_t *ent;
;3930:	bot_state_t *bst;
;3931:
;3932:	while (i < MAX_CLIENTS)
;3933:	{
line 3934
;3934:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3936
;3935:
;3936:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 156
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1613
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1613
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1613
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1613
line 3937
;3937:		{
line 3938
;3938:			bst = botstates[ent->s.number];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3940
;3939:
;3940:			if (bst && !bst->isSquadLeader && !bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1615
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1615
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1615
line 3941
;3941:			{
line 3942
;3942:				squad[squadmates] = ent;
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3943
;3943:				squadmates++;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3944
;3944:			}
ADDRGP4 $1616
JUMPV
LABELV $1615
line 3945
;3945:			else if (bst && !bst->isSquadLeader && bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1617
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
NEI4 $1617
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1617
line 3946
;3946:			{ //count them as commanded
line 3947
;3947:				commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3948
;3948:			}
LABELV $1617
LABELV $1616
line 3949
;3949:		}
LABELV $1613
line 3951
;3950:
;3951:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1619
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1619
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1619
line 3952
;3952:		{
line 3953
;3953:			teammates++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3954
;3954:		}
LABELV $1619
line 3956
;3955:
;3956:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3957
;3957:	}
LABELV $1611
line 3932
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1610
line 3959
;3958:	
;3959:	if (!squadmates)
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1621
line 3960
;3960:	{
line 3961
;3961:		return;
ADDRGP4 $1609
JUMPV
LABELV $1621
line 3965
;3962:	}
;3963:
;3964:	//tell squad mates to do what I'm doing, up to half of team, let the other half make their own decisions
;3965:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1624
JUMPV
LABELV $1623
line 3968
;3966:
;3967:	while (i < squadmates && squad[i])
;3968:	{
line 3969
;3969:		bst = botstates[squad[i]->s.number];
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3971
;3970:
;3971:		if (commanded > teammates/2)
ADDRLP4 140
INDIRI4
ADDRLP4 148
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1626
line 3972
;3972:		{
line 3973
;3973:			break;
ADDRGP4 $1625
JUMPV
LABELV $1626
line 3976
;3974:		}
;3975:
;3976:		if (bst)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1628
line 3977
;3977:		{
line 3978
;3978:			bst->state_Forced = bs->sagaState;
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
ASGNI4
line 3979
;3979:			bst->sagaState = bs->sagaState;
ADDRLP4 156
CNSTI4 2692
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 3980
;3980:			commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3981
;3981:		}
LABELV $1628
line 3983
;3982:
;3983:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3984
;3984:	}
LABELV $1624
line 3967
ADDRLP4 4
INDIRI4
ADDRLP4 144
INDIRI4
GEI4 $1630
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1623
LABELV $1630
LABELV $1625
line 3985
;3985:}
LABELV $1609
endproc CommanderBotSagaAI 180 8
export BotDoTeamplayAI
proc BotDoTeamplayAI 4 0
line 3988
;3986:
;3987:void BotDoTeamplayAI(bot_state_t *bs)
;3988:{
line 3989
;3989:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1632
line 3990
;3990:	{
line 3991
;3991:		bs->teamplayState = bs->state_Forced;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 3992
;3992:	}
LABELV $1632
line 3994
;3993:
;3994:	if (bs->teamplayState == TEAMPLAYSTATE_REGROUP)
ADDRFP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1634
line 3995
;3995:	{ //force to find a new leader
line 3996
;3996:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 3997
;3997:		bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 3998
;3998:	}
LABELV $1634
line 3999
;3999:}
LABELV $1631
endproc BotDoTeamplayAI 4 0
export CommanderBotTeamplayAI
proc CommanderBotTeamplayAI 188 8
line 4002
;4000:
;4001:void CommanderBotTeamplayAI(bot_state_t *bs)
;4002:{
line 4003
;4003:	int i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4004
;4004:	int squadmates = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 4005
;4005:	int teammates = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 4006
;4006:	int teammate_indanger = -1;
ADDRLP4 144
CNSTI4 -1
ASGNI4
line 4007
;4007:	int teammate_helped = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 4008
;4008:	int foundsquadleader = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 4009
;4009:	int worsthealth = 50;
ADDRLP4 152
CNSTI4 50
ASGNI4
ADDRGP4 $1638
JUMPV
LABELV $1637
line 4015
;4010:	gentity_t *squad[MAX_CLIENTS];
;4011:	gentity_t *ent;
;4012:	bot_state_t *bst;
;4013:
;4014:	while (i < MAX_CLIENTS)
;4015:	{
line 4016
;4016:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4018
;4017:
;4018:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1640
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1640
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1640
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1640
line 4019
;4019:		{
line 4020
;4020:			bst = botstates[ent->s.number];
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4022
;4021:
;4022:			if (foundsquadleader && bst && bst->isSquadLeader)
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1642
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1642
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1642
line 4023
;4023:			{ //never more than one squad leader
line 4024
;4024:				bst->isSquadLeader = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4025
;4025:			}
LABELV $1642
line 4027
;4026:
;4027:			if (bst && !bst->isSquadLeader)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1644
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1644
line 4028
;4028:			{
line 4029
;4029:				squad[squadmates] = ent;
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4030
;4030:				squadmates++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4031
;4031:			}
ADDRGP4 $1645
JUMPV
LABELV $1644
line 4032
;4032:			else if (bst)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1646
line 4033
;4033:			{
line 4034
;4034:				foundsquadleader = 1;
ADDRLP4 156
CNSTI4 1
ASGNI4
line 4035
;4035:			}
LABELV $1646
LABELV $1645
line 4036
;4036:		}
LABELV $1640
line 4038
;4037:
;4038:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 180
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1648
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1648
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1648
line 4039
;4039:		{
line 4040
;4040:			teammates++;
ADDRLP4 160
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4042
;4041:
;4042:			if (ent->health < worsthealth)
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
GEI4 $1650
line 4043
;4043:			{
line 4044
;4044:				teammate_indanger = ent->s.number;
ADDRLP4 144
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4045
;4045:				worsthealth = ent->health;
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 4046
;4046:			}
LABELV $1650
line 4047
;4047:		}
LABELV $1648
line 4049
;4048:
;4049:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4050
;4050:	}
LABELV $1638
line 4014
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1637
line 4052
;4051:	
;4052:	if (!squadmates)
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1652
line 4053
;4053:	{
line 4054
;4054:		return;
ADDRGP4 $1636
JUMPV
LABELV $1652
line 4057
;4055:	}
;4056:
;4057:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1655
JUMPV
LABELV $1654
line 4060
;4058:
;4059:	while (i < squadmates && squad[i])
;4060:	{
line 4061
;4061:		bst = botstates[squad[i]->s.number];
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4063
;4062:
;4063:		if (bst && !bst->state_Forced)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1657
ADDRLP4 4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1657
line 4064
;4064:		{ //only order if this guy is not being ordered directly by the real player team leader
line 4065
;4065:			if (teammate_indanger >= 0 && !teammate_helped)
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 172
INDIRI4
LTI4 $1659
ADDRLP4 148
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $1659
line 4066
;4066:			{ //send someone out to help whoever needs help most at the moment
line 4067
;4067:				bst->teamplayState = TEAMPLAYSTATE_ASSISTING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 2
ASGNI4
line 4068
;4068:				bst->squadLeader = &g_entities[teammate_indanger];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 828
ADDRLP4 144
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4069
;4069:				teammate_helped = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 4070
;4070:			}
ADDRGP4 $1660
JUMPV
LABELV $1659
line 4071
;4071:			else if ((teammate_indanger == -1 || teammate_helped) && bst->teamplayState == TEAMPLAYSTATE_ASSISTING)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $1663
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1661
LABELV $1663
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1661
line 4072
;4072:			{ //no teammates need help badly, but this guy is trying to help them anyway, so stop
line 4073
;4073:				bst->teamplayState = TEAMPLAYSTATE_FOLLOWING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 4074
;4074:				bst->squadLeader = &g_entities[bs->client];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4075
;4075:			}
LABELV $1661
LABELV $1660
line 4077
;4076:
;4077:			if (bs->squadRegroupInterval < level.time && Q_irand(1, 10) < 5)
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1664
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 5
GEI4 $1664
line 4078
;4078:			{ //every so often tell the squad to regroup for the sake of variation
line 4079
;4079:				if (bst->teamplayState == TEAMPLAYSTATE_FOLLOWING)
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1667
line 4080
;4080:				{
line 4081
;4081:					bst->teamplayState = TEAMPLAYSTATE_REGROUP;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 3
ASGNI4
line 4082
;4082:				}
LABELV $1667
line 4084
;4083:
;4084:				bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4085
;4085:				bs->squadCannotLead = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1876
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4086
;4086:				bs->squadRegroupInterval = level.time + Q_irand(45000, 65000);
CNSTI4 45000
ARGI4
CNSTI4 65000
ARGI4
ADDRLP4 180
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ASGNI4
line 4087
;4087:			}
LABELV $1664
line 4088
;4088:		}
LABELV $1657
line 4090
;4089:
;4090:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4091
;4091:	}	
LABELV $1655
line 4059
ADDRLP4 8
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $1671
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1654
LABELV $1671
line 4092
;4092:}
LABELV $1636
endproc CommanderBotTeamplayAI 188 8
export CommanderBotAI
proc CommanderBotAI 0 4
line 4095
;4093:
;4094:void CommanderBotAI(bot_state_t *bs)
;4095:{
line 4096
;4096:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1677
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1673
LABELV $1677
line 4097
;4097:	{
line 4098
;4098:		CommanderBotCTFAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotCTFAI
CALLV
pop
line 4099
;4099:	}
ADDRGP4 $1674
JUMPV
LABELV $1673
line 4100
;4100:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $1678
line 4101
;4101:	{
line 4102
;4102:		CommanderBotSagaAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotSagaAI
CALLV
pop
line 4103
;4103:	}
ADDRGP4 $1679
JUMPV
LABELV $1678
line 4104
;4104:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $1681
line 4105
;4105:	{
line 4106
;4106:		CommanderBotTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotTeamplayAI
CALLV
pop
line 4107
;4107:	}
LABELV $1681
LABELV $1679
LABELV $1674
line 4108
;4108:}
LABELV $1672
endproc CommanderBotAI 0 4
export MeleeCombatHandling
proc MeleeCombatHandling 1200 28
line 4111
;4109:
;4110:void MeleeCombatHandling(bot_state_t *bs)
;4111:{
line 4123
;4112:	vec3_t usethisvec;
;4113:	vec3_t downvec;
;4114:	vec3_t midorg;
;4115:	vec3_t a;
;4116:	vec3_t fwd;
;4117:	vec3_t mins, maxs;
;4118:	trace_t tr;
;4119:	int en_down;
;4120:	int me_down;
;4121:	int mid_down;
;4122:
;4123:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1685
line 4124
;4124:	{
line 4125
;4125:		return;
ADDRGP4 $1684
JUMPV
LABELV $1685
line 4128
;4126:	}
;4127:
;4128:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1687
line 4129
;4129:	{
line 4130
;4130:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4131
;4131:	}
ADDRGP4 $1688
JUMPV
LABELV $1687
line 4133
;4132:	else
;4133:	{
line 4134
;4134:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4135
;4135:	}
LABELV $1688
line 4137
;4136:
;4137:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1689
line 4138
;4138:	{
line 4139
;4139:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1692
line 4140
;4140:		{
line 4141
;4141:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4142
;4142:		}
ADDRGP4 $1693
JUMPV
LABELV $1692
line 4144
;4143:		else
;4144:		{
line 4145
;4145:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4146
;4146:		}
LABELV $1693
line 4148
;4147:
;4148:		bs->meleeStrafeTime = level.time + Q_irand(500, 1800);
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4149
;4149:	}
LABELV $1689
line 4151
;4150:
;4151:	mins[0] = -15;
ADDRLP4 36
CNSTF4 3245342720
ASGNF4
line 4152
;4152:	mins[1] = -15;
ADDRLP4 36+4
CNSTF4 3245342720
ASGNF4
line 4153
;4153:	mins[2] = -24;
ADDRLP4 36+8
CNSTF4 3250585600
ASGNF4
line 4154
;4154:	maxs[0] = 15;
ADDRLP4 48
CNSTF4 1097859072
ASGNF4
line 4155
;4155:	maxs[1] = 15;
ADDRLP4 48+4
CNSTF4 1097859072
ASGNF4
line 4156
;4156:	maxs[2] = 32;
ADDRLP4 48+8
CNSTF4 1107296256
ASGNF4
line 4158
;4157:
;4158:	VectorCopy(usethisvec, downvec);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 4159
;4159:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4161
;4160:
;4161:	trap_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4163
;4162:
;4163:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4165
;4164:
;4165:	VectorCopy(bs->origin, downvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4166
;4166:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4168
;4167:
;4168:	trap_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4170
;4169:
;4170:	me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4172
;4171:
;4172:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4173
;4173:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4174
;4174:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1180
CNSTP4 0
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4176
;4175:
;4176:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1184
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4177
;4177:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1188
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4178
;4178:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1192
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4180
;4179:
;4180:	VectorCopy(midorg, downvec);
ADDRLP4 0
ADDRLP4 1140
INDIRB
ASGNB 12
line 4181
;4181:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4183
;4182:
;4183:	trap_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4185
;4184:
;4185:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4187
;4186:
;4187:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1716
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1716
line 4189
;4188:		en_down == mid_down)
;4189:	{
line 4190
;4190:		VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4191
;4191:	}
LABELV $1716
line 4192
;4192:}
LABELV $1684
endproc MeleeCombatHandling 1200 28
export SaberCombatHandling
proc SaberCombatHandling 1272 28
line 4195
;4193:
;4194:void SaberCombatHandling(bot_state_t *bs)
;4195:{
line 4207
;4196:	vec3_t usethisvec;
;4197:	vec3_t downvec;
;4198:	vec3_t midorg;
;4199:	vec3_t a;
;4200:	vec3_t fwd;
;4201:	vec3_t mins, maxs;
;4202:	trace_t tr;
;4203:	int en_down;
;4204:	int me_down;
;4205:	int mid_down;
;4206:
;4207:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1719
line 4208
;4208:	{
line 4209
;4209:		return;
ADDRGP4 $1718
JUMPV
LABELV $1719
line 4212
;4210:	}
;4211:
;4212:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1721
line 4213
;4213:	{
line 4214
;4214:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4215
;4215:	}
ADDRGP4 $1722
JUMPV
LABELV $1721
line 4217
;4216:	else
;4217:	{
line 4218
;4218:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4219
;4219:	}
LABELV $1722
line 4221
;4220:
;4221:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1723
line 4222
;4222:	{
line 4223
;4223:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1726
line 4224
;4224:		{
line 4225
;4225:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4226
;4226:		}
ADDRGP4 $1727
JUMPV
LABELV $1726
line 4228
;4227:		else
;4228:		{
line 4229
;4229:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4230
;4230:		}
LABELV $1727
line 4232
;4231:
;4232:		bs->meleeStrafeTime = level.time + Q_irand(500, 1800);
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4233
;4233:	}
LABELV $1723
line 4235
;4234:
;4235:	mins[0] = -15;
ADDRLP4 1116
CNSTF4 3245342720
ASGNF4
line 4236
;4236:	mins[1] = -15;
ADDRLP4 1116+4
CNSTF4 3245342720
ASGNF4
line 4237
;4237:	mins[2] = -24;
ADDRLP4 1116+8
CNSTF4 3250585600
ASGNF4
line 4238
;4238:	maxs[0] = 15;
ADDRLP4 1128
CNSTF4 1097859072
ASGNF4
line 4239
;4239:	maxs[1] = 15;
ADDRLP4 1128+4
CNSTF4 1097859072
ASGNF4
line 4240
;4240:	maxs[2] = 32;
ADDRLP4 1128+8
CNSTF4 1107296256
ASGNF4
line 4242
;4241:
;4242:	VectorCopy(usethisvec, downvec);
ADDRLP4 1080
ADDRLP4 1092
INDIRB
ASGNB 12
line 4243
;4243:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4245
;4244:
;4245:	trap_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4247
;4246:
;4247:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4249
;4248:
;4249:	if (tr.startsolid || tr.allsolid)
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1176
INDIRI4
NEI4 $1739
ADDRLP4 0
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1736
LABELV $1739
line 4250
;4250:	{
line 4251
;4251:		en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4252
;4252:		me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4253
;4253:	}
ADDRGP4 $1737
JUMPV
LABELV $1736
line 4255
;4254:	else
;4255:	{
line 4256
;4256:		VectorCopy(bs->origin, downvec);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4257
;4257:		downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4259
;4258:
;4259:		trap_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4261
;4260:
;4261:		me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4263
;4262:
;4263:		if (tr.startsolid || tr.allsolid)
ADDRLP4 1180
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1180
INDIRI4
NEI4 $1746
ADDRLP4 0
INDIRI4
ADDRLP4 1180
INDIRI4
EQI4 $1743
LABELV $1746
line 4264
;4264:		{
line 4265
;4265:			en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4266
;4266:			me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4267
;4267:		}
LABELV $1743
line 4268
;4268:	}
LABELV $1737
line 4270
;4269:
;4270:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1092
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1092+4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+8
ADDRLP4 1092+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4271
;4271:	vectoangles(a, a);
ADDRLP4 1104
ARGP4
ADDRLP4 1104
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4272
;4272:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4274
;4273:
;4274:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1188
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4275
;4275:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1192
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4276
;4276:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1196
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1196
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4278
;4277:
;4278:	VectorCopy(midorg, downvec);
ADDRLP4 1080
ADDRLP4 1140
INDIRB
ASGNB 12
line 4279
;4279:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4281
;4280:
;4281:	trap_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4283
;4282:
;4283:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4285
;4284:
;4285:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1758
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1758
line 4287
;4286:		en_down == mid_down)
;4287:	{
line 4288
;4288:		if (usethisvec[2] > (bs->origin[2]+32) &&
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
INDIRF4
ADDRLP4 1204
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDF4
LEF4 $1760
ADDRLP4 1208
ADDRLP4 1204
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1760
ADDRLP4 1208
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1760
line 4291
;4289:			bs->currentEnemy->client &&
;4290:			bs->currentEnemy->client->ps.groundEntityNum == ENTITYNUM_NONE)
;4291:		{
line 4292
;4292:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 4293
;4293:		}
LABELV $1760
line 4295
;4294:
;4295:		if (bs->frame_Enemy_Len > 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
LEF4 $1764
line 4296
;4296:		{ //be ready to attack
line 4297
;4297:			bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4298
;4298:			bs->saberDefendDecideTime = level.time + Q_irand(1000, 2000);
CNSTI4 1000
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4299
;4299:		}
ADDRGP4 $1765
JUMPV
LABELV $1764
line 4301
;4300:		else
;4301:		{
line 4302
;4302:			if (bs->saberDefendDecideTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1767
line 4303
;4303:			{
line 4304
;4304:				if (bs->saberDefending)
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1770
line 4305
;4305:				{
line 4306
;4306:					bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4307
;4307:				}
ADDRGP4 $1771
JUMPV
LABELV $1770
line 4309
;4308:				else
;4309:				{
line 4310
;4310:					bs->saberDefending = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 4311
;4311:				}
LABELV $1771
line 4313
;4312:
;4313:				bs->saberDefendDecideTime = level.time + Q_irand(500, 2000);
CNSTI4 500
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4314
;4314:			}
LABELV $1767
line 4315
;4315:		}
LABELV $1765
line 4317
;4316:
;4317:		if (bs->frame_Enemy_Len < 54)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113063424
GEF4 $1773
line 4318
;4318:		{
line 4319
;4319:			VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1212
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4320
;4320:			bs->saberBFTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 4321
;4321:		}
ADDRGP4 $1774
JUMPV
LABELV $1773
line 4323
;4322:		else
;4323:		{
line 4324
;4324:			VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4325
;4325:		}
LABELV $1774
line 4327
;4326:
;4327:		if (bs->frame_Enemy_Len > 90 && bs->saberBFTime > level.time && bs->saberBTime > level.time && bs->beStill < level.time && bs->saberSTime < level.time)
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1119092736
LEF4 $1775
ADDRLP4 1212
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1775
ADDRLP4 1212
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1775
ADDRLP4 1212
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1775
ADDRLP4 1212
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1775
line 4328
;4328:		{
line 4329
;4329:			bs->beStill = level.time + Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 1216
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1216
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4330
;4330:			bs->saberSTime = level.time + Q_irand(1200, 1800);
CNSTI4 1200
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2724
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1220
INDIRI4
ADDI4
ASGNI4
line 4331
;4331:		}
ADDRGP4 $1759
JUMPV
LABELV $1775
line 4332
;4332:		else if (bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len < 80 && (Q_irand(1, 10) < 8 && bs->saberBFTime < level.time) || bs->saberBTime > level.time)
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1790
ADDRLP4 1216
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $1790
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 8
GEI4 $1790
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1787
LABELV $1790
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1783
LABELV $1787
line 4333
;4333:		{
line 4337
;4334:			vec3_t vs;
;4335:			vec3_t groundcheck;
;4336:
;4337:			VectorSubtract(bs->origin, usethisvec, vs);
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
ADDRLP4 1248
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1092
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1224+4
ADDRLP4 1248
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1092+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1224+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1092+8
INDIRF4
SUBF4
ASGNF4
line 4338
;4338:			VectorNormalize(vs);
ADDRLP4 1224
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4340
;4339:
;4340:			bs->goalPosition[0] = bs->origin[0] + vs[0]*64;
ADDRLP4 1252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1252
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1252
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224
INDIRF4
MULF4
ADDF4
ASGNF4
line 4341
;4341:			bs->goalPosition[1] = bs->origin[1] + vs[1]*64;
ADDRLP4 1256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 1924
ADDP4
ADDRLP4 1256
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4342
;4342:			bs->goalPosition[2] = bs->origin[2] + vs[2]*64;
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CNSTI4 1928
ADDP4
ADDRLP4 1260
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4344
;4343:
;4344:			if (bs->saberBTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1797
line 4345
;4345:			{
line 4346
;4346:				bs->saberBFTime = level.time + Q_irand(900, 1300);
CNSTI4 900
ARGI4
CNSTI4 1300
ARGI4
ADDRLP4 1264
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1264
INDIRI4
ADDI4
ASGNI4
line 4347
;4347:				bs->saberBTime = level.time + Q_irand(300, 700);
CNSTI4 300
ARGI4
CNSTI4 700
ARGI4
ADDRLP4 1268
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1268
INDIRI4
ADDI4
ASGNI4
line 4348
;4348:			}
LABELV $1797
line 4350
;4349:
;4350:			VectorCopy(bs->goalPosition, groundcheck);
ADDRLP4 1236
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 4352
;4351:
;4352:			groundcheck[2] -= 64;
ADDRLP4 1236+8
ADDRLP4 1236+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 4354
;4353:
;4354:			trap_Trace(&tr, bs->goalPosition, NULL, NULL, groundcheck, bs->client, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 1268
CNSTP4 0
ASGNP4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRLP4 1236
ARGP4
ADDRLP4 1264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4356
;4355:			
;4356:			if (tr.fraction == 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1759
line 4357
;4357:			{ //don't back off of a ledge
line 4358
;4358:				VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4359
;4359:			}
line 4360
;4360:		}
ADDRGP4 $1759
JUMPV
LABELV $1783
line 4361
;4361:		else if (bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len >= 75)
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1759
ADDRLP4 1224
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117126656
LTF4 $1759
line 4362
;4362:		{
line 4363
;4363:			bs->saberBFTime = level.time + Q_irand(700, 1300);
CNSTI4 700
ARGI4
CNSTI4 1300
ARGI4
ADDRLP4 1228
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1228
INDIRI4
ADDI4
ASGNI4
line 4364
;4364:			bs->saberBTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 4365
;4365:		}
line 4381
;4366:
;4367:		/*AngleVectors(bs->viewangles, NULL, fwd, NULL);
;4368:
;4369:		if (bs->meleeStrafeDir)
;4370:		{
;4371:			bs->goalPosition[0] += fwd[0]*16;
;4372:			bs->goalPosition[1] += fwd[1]*16;
;4373:			bs->goalPosition[2] += fwd[2]*16;
;4374:		}
;4375:		else
;4376:		{
;4377:			bs->goalPosition[0] -= fwd[0]*16;
;4378:			bs->goalPosition[1] -= fwd[1]*16;
;4379:			bs->goalPosition[2] -= fwd[2]*16;
;4380:		}*/
;4381:	}
ADDRGP4 $1759
JUMPV
LABELV $1758
line 4382
;4382:	else if (bs->frame_Enemy_Len <= 56)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113587712
GTF4 $1809
line 4383
;4383:	{
line 4384
;4384:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4385
;4385:		bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4386
;4386:	}
LABELV $1809
LABELV $1759
line 4387
;4387:}
LABELV $1718
endproc SaberCombatHandling 1272 28
export BotWeaponCanLead
proc BotWeaponCanLead 4 0
line 4390
;4388:
;4389:float BotWeaponCanLead(bot_state_t *bs)
;4390:{
line 4391
;4391:	int weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4393
;4392:
;4393:	if (weap == WP_BRYAR_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1812
line 4394
;4394:	{
line 4395
;4395:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1812
line 4397
;4396:	}
;4397:	if (weap == WP_BLASTER)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1814
line 4398
;4398:	{
line 4399
;4399:		return 0.35;
CNSTF4 1051931443
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1814
line 4401
;4400:	}
;4401:	if (weap == WP_BOWCASTER)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1816
line 4402
;4402:	{
line 4403
;4403:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1816
line 4405
;4404:	}
;4405:	if (weap == WP_REPEATER)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1818
line 4406
;4406:	{
line 4407
;4407:		return 0.45;
CNSTF4 1055286886
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1818
line 4409
;4408:	}
;4409:	if (weap == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $1820
line 4410
;4410:	{
line 4411
;4411:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1820
line 4413
;4412:	}
;4413:	if (weap == WP_DEMP2)
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $1822
line 4414
;4414:	{
line 4415
;4415:		return 0.35;
CNSTF4 1051931443
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1822
line 4417
;4416:	}
;4417:	if (weap == WP_ROCKET_LAUNCHER)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1824
line 4418
;4418:	{
line 4419
;4419:		return 0.7;
CNSTF4 1060320051
RETF4
ADDRGP4 $1811
JUMPV
LABELV $1824
line 4422
;4420:	}
;4421:	
;4422:	return 0;
CNSTF4 0
RETF4
LABELV $1811
endproc BotWeaponCanLead 4 0
export BotAimLeading
proc BotAimLeading 68 8
line 4426
;4423:}
;4424:
;4425:void BotAimLeading(bot_state_t *bs, vec3_t headlevel, float leadAmount)
;4426:{
line 4433
;4427:	int x;
;4428:	vec3_t predictedSpot;
;4429:	vec3_t movementVector;
;4430:	vec3_t a, ang;
;4431:	float vtotal;
;4432:
;4433:	if (!bs->currentEnemy ||
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $1829
ADDRLP4 56
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
NEU4 $1827
LABELV $1829
line 4435
;4434:		!bs->currentEnemy->client)
;4435:	{
line 4436
;4436:		return;
ADDRGP4 $1826
JUMPV
LABELV $1827
line 4439
;4437:	}
;4438:
;4439:	if (!bs->frame_Enemy_Len)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1830
line 4440
;4440:	{
line 4441
;4441:		return;
ADDRGP4 $1826
JUMPV
LABELV $1830
line 4444
;4442:	}
;4443:
;4444:	vtotal = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4446
;4445:
;4446:	if (bs->currentEnemy->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1832
line 4447
;4447:	{
line 4448
;4448:		vtotal += -bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4449
;4449:	}
ADDRGP4 $1833
JUMPV
LABELV $1832
line 4451
;4450:	else
;4451:	{
line 4452
;4452:		vtotal += bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4453
;4453:	}
LABELV $1833
line 4455
;4454:
;4455:	if (bs->currentEnemy->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1834
line 4456
;4456:	{
line 4457
;4457:		vtotal += -bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4458
;4458:	}
ADDRGP4 $1835
JUMPV
LABELV $1834
line 4460
;4459:	else
;4460:	{
line 4461
;4461:		vtotal += bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4462
;4462:	}
LABELV $1835
line 4464
;4463:
;4464:	if (bs->currentEnemy->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1836
line 4465
;4465:	{
line 4466
;4466:		vtotal += -bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4467
;4467:	}
ADDRGP4 $1837
JUMPV
LABELV $1836
line 4469
;4468:	else
;4469:	{
line 4470
;4470:		vtotal += bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4471
;4471:	}
LABELV $1837
line 4475
;4472:
;4473:	//G_Printf("Leadin target with a velocity total of %f\n", vtotal);
;4474:
;4475:	VectorCopy(bs->currentEnemy->client->ps.velocity, movementVector);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 4477
;4476:
;4477:	VectorNormalize(movementVector);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4479
;4478:
;4479:	x = bs->frame_Enemy_Len*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4481
;4480:
;4481:	if (vtotal > 400)
ADDRLP4 0
INDIRF4
CNSTF4 1137180672
LEF4 $1838
line 4482
;4482:	{
line 4483
;4483:		vtotal = 400;
ADDRLP4 0
CNSTF4 1137180672
ASGNF4
line 4484
;4484:	}
LABELV $1838
line 4486
;4485:
;4486:	if (vtotal)
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1840
line 4487
;4487:	{
line 4488
;4488:		x = (bs->frame_Enemy_Len*0.9)*leadAmount*(vtotal*0.0012); //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 983386450
ADDRLP4 0
INDIRF4
MULF4
MULF4
CVFI4 4
ASGNI4
line 4489
;4489:	}
ADDRGP4 $1841
JUMPV
LABELV $1840
line 4491
;4490:	else
;4491:	{
line 4492
;4492:		x = (bs->frame_Enemy_Len*0.9)*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4493
;4493:	}
LABELV $1841
line 4495
;4494:
;4495:	predictedSpot[0] = headlevel[0] + (movementVector[0]*x);
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4496
;4496:	predictedSpot[1] = headlevel[1] + (movementVector[1]*x);
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4497
;4497:	predictedSpot[2] = headlevel[2] + (movementVector[2]*x);
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4499
;4498:
;4499:	VectorSubtract(predictedSpot, bs->eye, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4500
;4500:	vectoangles(a, ang);
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4501
;4501:	VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 44
INDIRB
ASGNB 12
line 4502
;4502:}
LABELV $1826
endproc BotAimLeading 68 8
export BotAimOffsetGoalAngles
proc BotAimOffsetGoalAngles 56 8
line 4505
;4503:
;4504:void BotAimOffsetGoalAngles(bot_state_t *bs)
;4505:{
line 4508
;4506:	int i;
;4507:	float accVal;
;4508:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4510
;4509:
;4510:	if (bs->skills.perfectaim)
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1851
line 4511
;4511:	{
line 4512
;4512:		return;
ADDRGP4 $1850
JUMPV
LABELV $1851
line 4515
;4513:	}
;4514:
;4515:	if (bs->aimOffsetTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1853
line 4516
;4516:	{
line 4517
;4517:		if (bs->aimOffsetAmtYaw)
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1856
line 4518
;4518:		{
line 4519
;4519:			bs->goalAngles[YAW] += bs->aimOffsetAmtYaw;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4520
;4520:		}
LABELV $1856
line 4522
;4521:
;4522:		if (bs->aimOffsetAmtPitch)
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1861
line 4523
;4523:		{
line 4524
;4524:			bs->goalAngles[PITCH] += bs->aimOffsetAmtPitch;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4525
;4525:		}
ADDRGP4 $1861
JUMPV
LABELV $1860
line 4528
;4526:		
;4527:		while (i <= 2)
;4528:		{
line 4529
;4529:			if (bs->goalAngles[i] > 360)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 1135869952
LEF4 $1863
line 4530
;4530:			{
line 4531
;4531:				bs->goalAngles[i] -= 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 4532
;4532:			}
LABELV $1863
line 4534
;4533:
;4534:			if (bs->goalAngles[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1865
line 4535
;4535:			{
line 4536
;4536:				bs->goalAngles[i] += 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 4537
;4537:			}
LABELV $1865
line 4539
;4538:
;4539:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4540
;4540:		}
LABELV $1861
line 4527
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $1860
line 4541
;4541:		return;
ADDRGP4 $1850
JUMPV
LABELV $1853
line 4544
;4542:	}
;4543:
;4544:	accVal = bs->skills.accuracy/bs->settings.skill;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 4546
;4545:
;4546:	if (bs->currentEnemy && BotMindTricked(bs->client, bs->currentEnemy->s.number))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1867
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1867
line 4547
;4547:	{ //having to judge where they are by hearing them, so we should be quite inaccurate here
line 4548
;4548:		accVal *= 7;
ADDRLP4 4
CNSTF4 1088421888
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 4550
;4549:
;4550:		if (accVal < 30)
ADDRLP4 4
INDIRF4
CNSTF4 1106247680
GEF4 $1869
line 4551
;4551:		{
line 4552
;4552:			accVal = 30;
ADDRLP4 4
CNSTF4 1106247680
ASGNF4
line 4553
;4553:		}
LABELV $1869
line 4554
;4554:	}
LABELV $1867
line 4556
;4555:
;4556:	if (bs->revengeEnemy && bs->revengeHateLevel &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $1871
ADDRLP4 24
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1871
ADDRLP4 24
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $1871
line 4558
;4557:		bs->currentEnemy == bs->revengeEnemy)
;4558:	{ //bot becomes more skilled as anger level raises
line 4559
;4559:		accVal = accVal/bs->revengeHateLevel;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 4560
;4560:	}
LABELV $1871
line 4562
;4561:
;4562:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1873
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1873
line 4563
;4563:	{ //assume our goal is aiming at the enemy, seeing as he's visible and all
line 4564
;4564:		if (!bs->currentEnemy->s.pos.trDelta[0] &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1875
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1875
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1875
line 4567
;4565:			!bs->currentEnemy->s.pos.trDelta[1] &&
;4566:			!bs->currentEnemy->s.pos.trDelta[2])
;4567:		{
line 4568
;4568:			accVal = 0; //he's not even moving, so he shouldn't really be hard to hit.
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4569
;4569:		}
ADDRGP4 $1876
JUMPV
LABELV $1875
line 4571
;4570:		else
;4571:		{
line 4572
;4572:			accVal += accVal*0.25; //if he's moving he's this much harder to hit
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1048576000
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4573
;4573:		}
LABELV $1876
line 4575
;4574:
;4575:		if (g_entities[bs->client].s.pos.trDelta[0] ||
ADDRLP4 44
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1888
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1888
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+8
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
EQF4 $1877
LABELV $1888
line 4578
;4576:			g_entities[bs->client].s.pos.trDelta[1] ||
;4577:			g_entities[bs->client].s.pos.trDelta[2])
;4578:		{
line 4579
;4579:			accVal += accVal*0.15; //make it somewhat harder to aim if we're moving also
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4580
;4580:		}
LABELV $1877
line 4581
;4581:	}
LABELV $1873
line 4583
;4582:
;4583:	if (accVal > 90)
ADDRLP4 4
INDIRF4
CNSTF4 1119092736
LEF4 $1889
line 4584
;4584:	{
line 4585
;4585:		accVal = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 4586
;4586:	}
LABELV $1889
line 4587
;4587:	if (accVal < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1891
line 4588
;4588:	{
line 4589
;4589:		accVal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4590
;4590:	}
LABELV $1891
line 4592
;4591:
;4592:	if (!accVal)
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1893
line 4593
;4593:	{
line 4594
;4594:		bs->aimOffsetAmtYaw = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
CNSTF4 0
ASGNF4
line 4595
;4595:		bs->aimOffsetAmtPitch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
CNSTF4 0
ASGNF4
line 4596
;4596:		return;
ADDRGP4 $1850
JUMPV
LABELV $1893
line 4599
;4597:	}
;4598:
;4599:	if (rand()%10 <= 5)
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1895
line 4600
;4600:	{
line 4601
;4601:		bs->aimOffsetAmtYaw = rand()%(int)accVal;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4602
;4602:	}
ADDRGP4 $1896
JUMPV
LABELV $1895
line 4604
;4603:	else
;4604:	{
line 4605
;4605:		bs->aimOffsetAmtYaw = -(rand()%(int)accVal);
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4606
;4606:	}
LABELV $1896
line 4608
;4607:
;4608:	if (rand()%10 <= 5)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1897
line 4609
;4609:	{
line 4610
;4610:		bs->aimOffsetAmtPitch = rand()%(int)accVal;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4611
;4611:	}
ADDRGP4 $1898
JUMPV
LABELV $1897
line 4613
;4612:	else
;4613:	{
line 4614
;4614:		bs->aimOffsetAmtPitch = -(rand()%(int)accVal);
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4615
;4615:	}
LABELV $1898
line 4617
;4616:
;4617:	bs->aimOffsetTime = level.time + rand()%500 + 200;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 500
MODI4
ADDI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 4618
;4618:}
LABELV $1850
endproc BotAimOffsetGoalAngles 56 8
export ShouldSecondaryFire
proc ShouldSecondaryFire 28 0
line 4621
;4619:
;4620:int ShouldSecondaryFire(bot_state_t *bs)
;4621:{
line 4626
;4622:	int weap;
;4623:	int dif;
;4624:	float rTime;
;4625:
;4626:	weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4628
;4627:
;4628:	if (bs->cur_ps.ammo[weaponData[weap].ammoIndex] < weaponData[weap].altEnergyPerShot)
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
GEI4 $1901
line 4629
;4629:	{
line 4630
;4630:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1901
line 4633
;4631:	}
;4632:
;4633:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT && bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1904
ADDRLP4 16
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1904
line 4634
;4634:	{
line 4635
;4635:		float heldTime = (level.time - bs->cur_ps.weaponChargeTime);
ADDRLP4 20
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4637
;4636:
;4637:		rTime = bs->cur_ps.rocketLockTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRF4
ASGNF4
line 4639
;4638:
;4639:		if (rTime < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1907
line 4640
;4640:		{
line 4641
;4641:			rTime = bs->cur_ps.rocketLastValidTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ASGNF4
line 4642
;4642:		}
LABELV $1907
line 4644
;4643:
;4644:		if (heldTime > 5000)
ADDRLP4 20
INDIRF4
CNSTF4 1167867904
LEF4 $1909
line 4645
;4645:		{ //just give up and release it if we can't manage a lock in 5 seconds
line 4646
;4646:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1909
line 4649
;4647:		}
;4648:
;4649:		if (rTime > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1911
line 4650
;4650:		{
line 4651
;4651:			dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 8
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 4653
;4652:			
;4653:			if (dif >= 10)
ADDRLP4 8
INDIRI4
CNSTI4 10
LTI4 $1914
line 4654
;4654:			{
line 4655
;4655:				return 2;
CNSTI4 2
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1914
line 4657
;4656:			}
;4657:			else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1905
line 4658
;4658:			{
line 4659
;4659:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
line 4661
;4660:			}
;4661:		}
LABELV $1911
line 4662
;4662:		else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1905
line 4663
;4663:		{
line 4664
;4664:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
line 4666
;4665:		}
;4666:	}
LABELV $1904
line 4667
;4667:	else if ((bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT) && (level.time - bs->cur_ps.weaponChargeTime) > bs->altChargeTime)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1920
ADDRGP4 level+32
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
ADDRLP4 20
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
LEI4 $1920
line 4668
;4668:	{
line 4669
;4669:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1920
line 4671
;4670:	}
;4671:	else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1923
line 4672
;4672:	{
line 4673
;4673:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1923
LABELV $1905
line 4676
;4674:	}
;4675:
;4676:	if (weap == WP_BRYAR_PISTOL && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1925
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1925
line 4677
;4677:	{
line 4678
;4678:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1925
line 4680
;4679:	}
;4680:	else if (weap == WP_BOWCASTER && bs->frame_Enemy_Len > 300)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1927
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $1927
line 4681
;4681:	{
line 4682
;4682:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1927
line 4684
;4683:	}
;4684:	else if (weap == WP_REPEATER && bs->frame_Enemy_Len < 600 && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1929
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1142292480
GEF4 $1929
ADDRLP4 24
INDIRF4
CNSTF4 1132068864
LEF4 $1929
line 4685
;4685:	{
line 4686
;4686:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1929
line 4688
;4687:	}
;4688:	else if (weap == WP_BLASTER && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1931
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1931
line 4689
;4689:	{
line 4690
;4690:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1931
line 4692
;4691:	}
;4692:	else if (weap == WP_ROCKET_LAUNCHER && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1933
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1933
line 4693
;4693:	{
line 4694
;4694:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1933
line 4697
;4695:	}
;4696:
;4697:	return 0;
CNSTI4 0
RETI4
LABELV $1900
endproc ShouldSecondaryFire 28 0
export CombatBotAI
proc CombatBotAI 80 12
line 4701
;4698:}
;4699:
;4700:int CombatBotAI(bot_state_t *bs, float thinktime)
;4701:{
line 4706
;4702:	vec3_t eorg, a;
;4703:	int secFire;
;4704:	float fovcheck;
;4705:
;4706:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1936
line 4707
;4707:	{
line 4708
;4708:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1935
JUMPV
LABELV $1936
line 4711
;4709:	}
;4710:
;4711:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1938
line 4712
;4712:	{
line 4713
;4713:		VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4714
;4714:	}
ADDRGP4 $1939
JUMPV
LABELV $1938
line 4716
;4715:	else
;4716:	{
line 4717
;4717:		VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4718
;4718:	}
LABELV $1939
line 4720
;4719:
;4720:	VectorSubtract(eorg, bs->eye, a);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4721
;4721:	vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4723
;4722:
;4723:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 4
NEI4 $1944
line 4724
;4724:	{
line 4725
;4725:		if (bs->frame_Enemy_Len <= SABER_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GTF4 $1945
line 4726
;4726:		{
line 4727
;4727:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4728
;4728:		}
line 4729
;4729:	}
ADDRGP4 $1945
JUMPV
LABELV $1944
line 4730
;4730:	else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $1948
line 4731
;4731:	{
line 4732
;4732:		if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $1949
line 4733
;4733:		{
line 4734
;4734:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4735
;4735:		}
line 4736
;4736:	}
ADDRGP4 $1949
JUMPV
LABELV $1948
line 4738
;4737:	else
;4738:	{
line 4739
;4739:		if (bs->cur_ps.weapon == WP_THERMAL || bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $1954
ADDRLP4 44
INDIRI4
CNSTI4 10
NEI4 $1952
LABELV $1954
line 4740
;4740:		{ //be careful with the hurty weapons
line 4741
;4741:			fovcheck = 40;
ADDRLP4 24
CNSTF4 1109393408
ASGNF4
line 4743
;4742:
;4743:			if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1953
ADDRLP4 48
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1953
line 4745
;4744:				bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
;4745:			{ //if we're charging the weapon up then we can hold fire down within a normal fov
line 4746
;4746:				fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4747
;4747:			}
line 4748
;4748:		}
ADDRGP4 $1953
JUMPV
LABELV $1952
line 4750
;4749:		else
;4750:		{
line 4751
;4751:			fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4752
;4752:		}
LABELV $1953
line 4754
;4753:
;4754:		if (bs->cur_ps.weaponstate == WEAPON_CHARGING ||
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 4
EQI4 $1959
ADDRLP4 48
INDIRI4
CNSTI4 5
NEI4 $1957
LABELV $1959
line 4756
;4755:			bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
;4756:		{
line 4757
;4757:			fovcheck = 160;
ADDRLP4 24
CNSTF4 1126170624
ASGNF4
line 4758
;4758:		}
LABELV $1957
line 4760
;4759:
;4760:		if (bs->frame_Enemy_Len < 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GEF4 $1960
line 4761
;4761:		{
line 4762
;4762:			fovcheck *= 2;
ADDRLP4 24
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 4763
;4763:		}
LABELV $1960
line 4765
;4764:
;4765:		if (InFieldOfVision(bs->viewangles, fovcheck, a))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1962
line 4766
;4766:		{
line 4767
;4767:			if (bs->cur_ps.weapon == WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1964
line 4768
;4768:			{
line 4769
;4769:				if (((level.time - bs->cur_ps.weaponChargeTime) < (bs->frame_Enemy_Len*2) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRGP4 level+32
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 64
INDIRF4
MULF4
GEF4 $1972
ADDRGP4 level+32
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CNSTI4 4000
GEI4 $1972
ADDRLP4 64
INDIRF4
CNSTF4 1115684864
GTF4 $1970
LABELV $1972
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $1965
ADDRLP4 68
INDIRI4
CNSTI4 5
EQI4 $1965
LABELV $1970
line 4774
;4770:					(level.time - bs->cur_ps.weaponChargeTime) < 4000 &&
;4771:					bs->frame_Enemy_Len > 64) ||
;4772:					(bs->cur_ps.weaponstate != WEAPON_CHARGING &&
;4773:					bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT))
;4774:				{
line 4775
;4775:					if (bs->cur_ps.weaponstate != WEAPON_CHARGING && bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT)
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 4
EQI4 $1973
ADDRLP4 72
INDIRI4
CNSTI4 5
EQI4 $1973
line 4776
;4776:					{
line 4777
;4777:						if (bs->frame_Enemy_Len > 512 && bs->frame_Enemy_Len < 800)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1140850688
LEF4 $1975
ADDRLP4 76
INDIRF4
CNSTF4 1145569280
GEF4 $1975
line 4778
;4778:						{
line 4779
;4779:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4781
;4780:							//bs->doAttack = 1;
;4781:						}
ADDRGP4 $1976
JUMPV
LABELV $1975
line 4783
;4782:						else
;4783:						{
line 4784
;4784:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4786
;4785:							//bs->doAltAttack = 1;
;4786:						}
LABELV $1976
line 4787
;4787:					}
LABELV $1973
line 4789
;4788:
;4789:					if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1977
line 4790
;4790:					{
line 4791
;4791:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4792
;4792:					}
ADDRGP4 $1965
JUMPV
LABELV $1977
line 4793
;4793:					else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1965
line 4794
;4794:					{
line 4795
;4795:						bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4796
;4796:					}
line 4797
;4797:				}
line 4798
;4798:			}
ADDRGP4 $1965
JUMPV
LABELV $1964
line 4800
;4799:			else
;4800:			{
line 4801
;4801:				secFire = ShouldSecondaryFire(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 ShouldSecondaryFire
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 4803
;4802:
;4803:				if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 5
EQI4 $1981
ADDRLP4 60
INDIRI4
CNSTI4 4
EQI4 $1981
line 4805
;4804:					bs->cur_ps.weaponstate != WEAPON_CHARGING)
;4805:				{
line 4806
;4806:					bs->altChargeTime = Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2264
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 4807
;4807:				}
LABELV $1981
line 4809
;4808:
;4809:				if (secFire == 1)
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $1983
line 4810
;4810:				{
line 4811
;4811:					bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4812
;4812:				}
ADDRGP4 $1984
JUMPV
LABELV $1983
line 4813
;4813:				else if (!secFire)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1985
line 4814
;4814:				{
line 4815
;4815:					if (bs->cur_ps.weapon != WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1987
line 4816
;4816:					{
line 4817
;4817:						if (bs->cur_ps.weaponstate != WEAPON_CHARGING ||
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1992
ADDRLP4 64
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
LEI4 $1988
LABELV $1992
line 4819
;4818:							bs->altChargeTime > (level.time - bs->cur_ps.weaponChargeTime))
;4819:						{
line 4820
;4820:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4821
;4821:						}
line 4822
;4822:					}
ADDRGP4 $1988
JUMPV
LABELV $1987
line 4824
;4823:					else
;4824:					{
line 4825
;4825:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4826
;4826:					}
LABELV $1988
line 4827
;4827:				}
LABELV $1985
LABELV $1984
line 4829
;4828:
;4829:				if (secFire == 2)
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $1993
line 4830
;4830:				{ //released a charge
line 4831
;4831:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $1935
JUMPV
LABELV $1993
line 4833
;4832:				}
;4833:			}
LABELV $1965
line 4834
;4834:		}
LABELV $1962
line 4835
;4835:	}
LABELV $1949
LABELV $1945
line 4837
;4836:
;4837:	return 0;
CNSTI4 0
RETI4
LABELV $1935
endproc CombatBotAI 80 12
export BotFallbackNavigation
proc BotFallbackNavigation 1152 28
line 4841
;4838:}
;4839:
;4840:int BotFallbackNavigation(bot_state_t *bs)
;4841:{
line 4845
;4842:	vec3_t b_angle, fwd, trto, mins, maxs;
;4843:	trace_t tr;
;4844:
;4845:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1996
ADDRLP4 1140
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1996
line 4846
;4846:	{
line 4847
;4847:		return 2; //we're busy
CNSTI4 2
RETI4
ADDRGP4 $1995
JUMPV
LABELV $1996
line 4850
;4848:	}
;4849:
;4850:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 4851
;4851:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 4852
;4852:	mins[2] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 4853
;4853:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 4854
;4854:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 4855
;4855:	maxs[2] = 32;
ADDRLP4 36+8
CNSTF4 1107296256
ASGNF4
line 4857
;4856:
;4857:	bs->goalAngles[PITCH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTF4 0
ASGNF4
line 4858
;4858:	bs->goalAngles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTF4 0
ASGNF4
line 4860
;4859:
;4860:	VectorCopy(bs->goalAngles, b_angle);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 4862
;4861:
;4862:	AngleVectors(b_angle, fwd, NULL, NULL);
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4864
;4863:
;4864:	trto[0] = bs->origin[0] + fwd[0]*16;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 4865
;4865:	trto[1] = bs->origin[1] + fwd[1]*16;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4866
;4866:	trto[2] = bs->origin[2] + fwd[2]*16;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4868
;4867:
;4868:	trap_Trace(&tr, bs->origin, mins, maxs, trto, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4870
;4869:
;4870:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $2006
line 4871
;4871:	{
line 4872
;4872:		VectorCopy(trto, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4873
;4873:		return 1; //success!
CNSTI4 1
RETI4
ADDRGP4 $1995
JUMPV
LABELV $2006
line 4876
;4874:	}
;4875:	else
;4876:	{
line 4877
;4877:		bs->goalAngles[YAW] = rand()%360;
ADDRLP4 1148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ADDRLP4 1148
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 4878
;4878:	}
line 4880
;4879:
;4880:	return 0;
CNSTI4 0
RETI4
LABELV $1995
endproc BotFallbackNavigation 1152 28
export BotTryAnotherWeapon
proc BotTryAnotherWeapon 16 8
line 4884
;4881:}
;4882:
;4883:int BotTryAnotherWeapon(bot_state_t *bs)
;4884:{ //out of ammo, resort to the first weapon we come across that has ammo
line 4887
;4885:	int i;
;4886:
;4887:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2011
JUMPV
LABELV $2010
line 4890
;4888:
;4889:	while (i < WP_NUM_WEAPONS)
;4890:	{
line 4891
;4891:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 8
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LEI4 $2013
ADDRLP4 12
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2013
line 4893
;4892:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4893:		{
line 4894
;4894:			bs->virtualWeapon = i;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4895
;4895:			BotSelectWeapon(bs->client, i);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4898
;4896:			//bs->cur_ps.weapon = i;
;4897:			//level.clients[bs->client].ps.weapon = i;
;4898:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $2009
JUMPV
LABELV $2013
line 4901
;4899:		}
;4900:
;4901:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4902
;4902:	}
LABELV $2011
line 4889
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2010
line 4904
;4903:
;4904:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2016
ADDRLP4 4
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2016
line 4905
;4905:	{ //should always have this.. shouldn't we?
line 4906
;4906:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 4907
;4907:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4910
;4908:		//bs->cur_ps.weapon = 1;
;4909:		//level.clients[bs->client].ps.weapon = 1;
;4910:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2009
JUMPV
LABELV $2016
line 4913
;4911:	}
;4912:
;4913:	return 0;
CNSTI4 0
RETI4
LABELV $2009
endproc BotTryAnotherWeapon 16 8
export BotWeaponSelectable
proc BotWeaponSelectable 12 0
line 4917
;4914:}
;4915:
;4916:qboolean BotWeaponSelectable(bot_state_t *bs, int weapon)
;4917:{
line 4918
;4918:	if (bs->cur_ps.ammo[weaponData[weapon].ammoIndex] >= weaponData[weapon].energyPerShot &&
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LTI4 $2019
ADDRLP4 8
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2019
line 4920
;4919:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << weapon)))
;4920:	{
line 4921
;4921:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2018
JUMPV
LABELV $2019
line 4924
;4922:	}
;4923:	
;4924:	return qfalse;
CNSTI4 0
RETI4
LABELV $2018
endproc BotWeaponSelectable 12 0
export BotSelectIdealWeapon
proc BotSelectIdealWeapon 64 8
line 4928
;4925:}
;4926:
;4927:int BotSelectIdealWeapon(bot_state_t *bs)
;4928:{
line 4930
;4929:	int i;
;4930:	int bestweight = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 4931
;4931:	int bestweapon = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4933
;4932:
;4933:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2024
JUMPV
LABELV $2023
line 4936
;4934:
;4935:	while (i < WP_NUM_WEAPONS)
;4936:	{
line 4937
;4937:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] >= weaponData[i].energyPerShot &&
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LTI4 $2026
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $2026
ADDRLP4 24
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2026
line 4940
;4938:			bs->botWeaponWeights[i] > bestweight &&
;4939:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4940:		{
line 4941
;4941:			if (i == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $2029
line 4942
;4942:			{ //special case..
line 4943
;4943:				if (bs->currentEnemy && bs->frame_Enemy_Len < 700)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2030
ADDRLP4 28
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1143930880
GEF4 $2030
line 4944
;4944:				{
line 4945
;4945:					bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4946
;4946:					bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4947
;4947:				}
line 4948
;4948:			}
ADDRGP4 $2030
JUMPV
LABELV $2029
line 4950
;4949:			else
;4950:			{
line 4951
;4951:				bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4952
;4952:				bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4953
;4953:			}
LABELV $2030
line 4954
;4954:		}
LABELV $2026
line 4956
;4955:
;4956:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4957
;4957:	}
LABELV $2024
line 4935
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2023
line 4959
;4958:
;4959:	if ( bs->currentEnemy && bs->frame_Enemy_Len < 300 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2033
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2033
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $2036
ADDRLP4 8
INDIRI4
CNSTI4 4
EQI4 $2036
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $2033
LABELV $2036
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2033
line 4962
;4960:		(bestweapon == WP_BRYAR_PISTOL || bestweapon == WP_BLASTER || bestweapon == WP_BOWCASTER) &&
;4961:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SABER)) )
;4962:	{
line 4963
;4963:		bestweapon = WP_SABER;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 4964
;4964:		bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4965
;4965:	}
LABELV $2033
line 4967
;4966:
;4967:	if ( bs->currentEnemy && bs->frame_Enemy_Len > 300 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2037
ADDRLP4 20
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $2037
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2037
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2037
ADDRLP4 8
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2037
line 4970
;4968:		bs->currentEnemy->client && bs->currentEnemy->client->ps.weapon != WP_SABER &&
;4969:		(bestweapon == WP_SABER) )
;4970:	{ //if the enemy is far away, and we have our saber selected, see if we have any good distance weapons instead
line 4971
;4971:		if (BotWeaponSelectable(bs, WP_DISRUPTOR))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 40
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2039
line 4972
;4972:		{
line 4973
;4973:			bestweapon = WP_DISRUPTOR;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 4974
;4974:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4975
;4975:		}
ADDRGP4 $2040
JUMPV
LABELV $2039
line 4976
;4976:		else if (BotWeaponSelectable(bs, WP_ROCKET_LAUNCHER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 44
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2041
line 4977
;4977:		{
line 4978
;4978:			bestweapon = WP_ROCKET_LAUNCHER;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 4979
;4979:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4980
;4980:		}
ADDRGP4 $2042
JUMPV
LABELV $2041
line 4981
;4981:		else if (BotWeaponSelectable(bs, WP_BOWCASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 48
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2043
line 4982
;4982:		{
line 4983
;4983:			bestweapon = WP_BOWCASTER;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 4984
;4984:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4985
;4985:		}
ADDRGP4 $2044
JUMPV
LABELV $2043
line 4986
;4986:		else if (BotWeaponSelectable(bs, WP_BLASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 52
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2045
line 4987
;4987:		{
line 4988
;4988:			bestweapon = WP_BLASTER;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 4989
;4989:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4990
;4990:		}
ADDRGP4 $2046
JUMPV
LABELV $2045
line 4991
;4991:		else if (BotWeaponSelectable(bs, WP_REPEATER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 56
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2047
line 4992
;4992:		{
line 4993
;4993:			bestweapon = WP_REPEATER;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 4994
;4994:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4995
;4995:		}
ADDRGP4 $2048
JUMPV
LABELV $2047
line 4996
;4996:		else if (BotWeaponSelectable(bs, WP_DEMP2))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2049
line 4997
;4997:		{
line 4998
;4998:			bestweapon = WP_DEMP2;
ADDRLP4 8
CNSTI4 8
ASGNI4
line 4999
;4999:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5000
;5000:		}
LABELV $2049
LABELV $2048
LABELV $2046
LABELV $2044
LABELV $2042
LABELV $2040
line 5001
;5001:	}
LABELV $2037
line 5003
;5002:
;5003:	if (bestweight != -1 && bs->cur_ps.weapon != bestweapon && bs->virtualWeapon != bestweapon)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $2051
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2051
ADDRLP4 40
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2051
line 5004
;5004:	{
line 5005
;5005:		bs->virtualWeapon = bestweapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5006
;5006:		BotSelectWeapon(bs->client, bestweapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5009
;5007:		//bs->cur_ps.weapon = bestweapon;
;5008:		//level.clients[bs->client].ps.weapon = bestweapon;
;5009:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2022
JUMPV
LABELV $2051
line 5012
;5010:	}
;5011:
;5012:	return 0;
CNSTI4 0
RETI4
LABELV $2022
endproc BotSelectIdealWeapon 64 8
export BotSelectChoiceWeapon
proc BotSelectChoiceWeapon 20 8
line 5016
;5013:}
;5014:
;5015:int BotSelectChoiceWeapon(bot_state_t *bs, int weapon, int doselection)
;5016:{ //if !doselection then bot will only check if he has the specified weapon and return 1 (yes) or 0 (no)
line 5018
;5017:	int i;
;5018:	int hasit = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5020
;5019:
;5020:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2055
JUMPV
LABELV $2054
line 5023
;5021:
;5022:	while (i < WP_NUM_WEAPONS)
;5023:	{
line 5024
;5024:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LEI4 $2057
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2057
ADDRLP4 16
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2057
line 5027
;5025:			i == weapon &&
;5026:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;5027:		{
line 5028
;5028:			hasit = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5029
;5029:			break;
ADDRGP4 $2056
JUMPV
LABELV $2057
line 5032
;5030:		}
;5031:
;5032:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5033
;5033:	}
LABELV $2055
line 5022
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2054
LABELV $2056
line 5035
;5034:
;5035:	if (hasit && bs->cur_ps.weapon != weapon && doselection && bs->virtualWeapon != weapon)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2060
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2060
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2060
ADDRLP4 12
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2060
line 5036
;5036:	{
line 5037
;5037:		bs->virtualWeapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 5038
;5038:		BotSelectWeapon(bs->client, weapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5041
;5039:		//bs->cur_ps.weapon = weapon;
;5040:		//level.clients[bs->client].ps.weapon = weapon;
;5041:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $2053
JUMPV
LABELV $2060
line 5044
;5042:	}
;5043:
;5044:	if (hasit)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2062
line 5045
;5045:	{
line 5046
;5046:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2053
JUMPV
LABELV $2062
line 5049
;5047:	}
;5048:
;5049:	return 0;
CNSTI4 0
RETI4
LABELV $2053
endproc BotSelectChoiceWeapon 20 8
export BotSelectMelee
proc BotSelectMelee 8 8
line 5053
;5050:}
;5051:
;5052:int BotSelectMelee(bot_state_t *bs)
;5053:{
line 5054
;5054:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2065
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2065
line 5055
;5055:	{
line 5056
;5056:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 5057
;5057:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5060
;5058:		//bs->cur_ps.weapon = 1;
;5059:		//level.clients[bs->client].ps.weapon = 1;
;5060:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2064
JUMPV
LABELV $2065
line 5063
;5061:	}
;5062:
;5063:	return 0;
CNSTI4 0
RETI4
LABELV $2064
endproc BotSelectMelee 8 8
export GetLoveLevel
proc GetLoveLevel 20 8
line 5067
;5064:}
;5065:
;5066:int GetLoveLevel(bot_state_t *bs, bot_state_t *love)
;5067:{
line 5068
;5068:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5069
;5069:	const char *lname = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5071
;5070:
;5071:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2068
line 5072
;5072:	{ //There is no love in 1-on-1
line 5073
;5073:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2068
line 5076
;5074:	}
;5075:
;5076:	if (!bs || !love || !g_entities[love->client].client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2075
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2075
CNSTI4 828
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $2071
LABELV $2075
line 5077
;5077:	{
line 5078
;5078:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2071
line 5081
;5079:	}
;5080:
;5081:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2076
line 5082
;5082:	{
line 5083
;5083:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2076
line 5086
;5084:	}
;5085:
;5086:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5088
;5087:
;5088:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2078
line 5089
;5089:	{
line 5090
;5090:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2078
line 5093
;5091:	}
;5092:
;5093:	lname = g_entities[love->client].client->pers.netname;
ADDRLP4 4
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ASGNP4
line 5095
;5094:
;5095:	if (!lname)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2085
line 5096
;5096:	{
line 5097
;5097:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2084
line 5101
;5098:	}
;5099:
;5100:	while (i < bs->lovednum)
;5101:	{
line 5102
;5102:		if (strcmp(bs->loved[i].name, lname) == 0)
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2087
line 5103
;5103:		{
line 5104
;5104:			return bs->loved[i].level;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $2067
JUMPV
LABELV $2087
line 5107
;5105:		}
;5106:
;5107:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5108
;5108:	}
LABELV $2085
line 5100
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2084
line 5110
;5109:
;5110:	return 0;
CNSTI4 0
RETI4
LABELV $2067
endproc GetLoveLevel 20 8
export BotLovedOneDied
proc BotLovedOneDied 40 12
line 5114
;5111:}
;5112:
;5113:void BotLovedOneDied(bot_state_t *bs, bot_state_t *loved, int lovelevel)
;5114:{
line 5115
;5115:	if (!loved->lastHurt || !loved->lastHurt->client ||
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2093
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2093
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2090
LABELV $2093
line 5117
;5116:		loved->lastHurt->s.number == loved->client)
;5117:	{
line 5118
;5118:		return;
ADDRGP4 $2089
JUMPV
LABELV $2090
line 5121
;5119:	}
;5120:
;5121:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2094
line 5122
;5122:	{ //There is no love in 1-on-1
line 5123
;5123:		return;
ADDRGP4 $2089
JUMPV
LABELV $2094
line 5126
;5124:	}
;5125:
;5126:	if (!IsTeamplay())
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2097
line 5127
;5127:	{
line 5128
;5128:		if (lovelevel < 2)
ADDRFP4 8
INDIRI4
CNSTI4 2
GEI4 $2098
line 5129
;5129:		{
line 5130
;5130:			return;
ADDRGP4 $2089
JUMPV
line 5132
;5131:		}
;5132:	}
LABELV $2097
line 5133
;5133:	else if (OnSameTeam(&g_entities[bs->client], loved->lastHurt))
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2101
line 5134
;5134:	{ //don't hate teammates no matter what
line 5135
;5135:		return;
ADDRGP4 $2089
JUMPV
LABELV $2101
LABELV $2098
line 5138
;5136:	}
;5137:
;5138:	if (loved->client == loved->lastHurt->s.number)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2103
line 5139
;5139:	{
line 5140
;5140:		return;
ADDRGP4 $2089
JUMPV
LABELV $2103
line 5143
;5141:	}
;5142:
;5143:	if (bs->client == loved->lastHurt->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2105
line 5144
;5144:	{ //oops!
line 5145
;5145:		return;
ADDRGP4 $2089
JUMPV
LABELV $2105
line 5148
;5146:	}
;5147:	
;5148:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5150
;5149:
;5150:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2107
line 5151
;5151:	{
line 5152
;5152:		return;
ADDRGP4 $2089
JUMPV
LABELV $2107
line 5155
;5153:	}
;5154:
;5155:	if (!PassLovedOneCheck(bs, loved->lastHurt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2110
line 5156
;5156:	{ //a loved one killed a loved one.. you cannot hate them
line 5157
;5157:		bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5158
;5158:		bs->chatAltObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5159
;5159:		BotDoChat(bs, "LovedOneKilledLovedOne", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2112
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5160
;5160:		return;
ADDRGP4 $2089
JUMPV
LABELV $2110
line 5163
;5161:	}
;5162:
;5163:	if (bs->revengeEnemy == loved->lastHurt)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
CVPU4 4
NEU4 $2113
line 5164
;5164:	{
line 5165
;5165:		if (bs->revengeHateLevel < bs->loved_death_thresh)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
GEI4 $2114
line 5166
;5166:		{
line 5167
;5167:			bs->revengeHateLevel++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5169
;5168:
;5169:			if (bs->revengeHateLevel == bs->loved_death_thresh)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
NEI4 $2114
line 5170
;5170:			{
line 5173
;5171:				//broke into the highest anger level
;5172:				//CHAT: Hatred section
;5173:				bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5174
;5174:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5175
;5175:				BotDoChat(bs, "Hatred", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2119
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5176
;5176:			}
line 5177
;5177:		}
line 5178
;5178:	}
ADDRGP4 $2114
JUMPV
LABELV $2113
line 5179
;5179:	else if (bs->revengeHateLevel < bs->loved_death_thresh-1)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $2120
line 5180
;5180:	{ //only switch hatred if we don't hate the existing revenge-enemy too much
line 5182
;5181:		//CHAT: BelovedKilled section
;5182:		bs->chatObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5183
;5183:		bs->chatAltObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5184
;5184:		BotDoChat(bs, "BelovedKilled", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2122
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5185
;5185:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5186
;5186:		bs->revengeEnemy = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5187
;5187:	}
LABELV $2120
LABELV $2114
line 5188
;5188:}
LABELV $2089
endproc BotLovedOneDied 40 12
export BotDeathNotify
proc BotDeathNotify 20 12
line 5191
;5189:
;5190:void BotDeathNotify(bot_state_t *bs)
;5191:{ //in case someone has an emotional attachment to us, we'll notify them
line 5192
;5192:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5193
;5193:	int ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2125
JUMPV
LABELV $2124
line 5196
;5194:
;5195:	while (i < MAX_CLIENTS)
;5196:	{
line 5197
;5197:		if (botstates[i] && botstates[i]->lovednum)
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2127
ADDRLP4 8
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2127
line 5198
;5198:		{
line 5199
;5199:			ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2130
JUMPV
LABELV $2129
line 5201
;5200:			while (ltest < botstates[i]->lovednum)
;5201:			{
line 5202
;5202:				if (strcmp(level.clients[bs->client].pers.netname, botstates[i]->loved[ltest].name) == 0)
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2132
line 5203
;5203:				{
line 5204
;5204:					BotLovedOneDied(botstates[i], bs, botstates[i]->loved[ltest].level);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotLovedOneDied
CALLV
pop
line 5205
;5205:					break;
ADDRGP4 $2131
JUMPV
LABELV $2132
line 5208
;5206:				}
;5207:
;5208:				ltest++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5209
;5209:			}
LABELV $2130
line 5200
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2129
LABELV $2131
line 5210
;5210:		}
LABELV $2127
line 5212
;5211:
;5212:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5213
;5213:	}
LABELV $2125
line 5195
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2124
line 5214
;5214:}
LABELV $2123
endproc BotDeathNotify 20 12
export StrafeTracing
proc StrafeTracing 1156 28
line 5217
;5215:
;5216:void StrafeTracing(bot_state_t *bs)
;5217:{
line 5222
;5218:	vec3_t mins, maxs;
;5219:	vec3_t right, rorg, drorg;
;5220:	trace_t tr;
;5221:
;5222:	mins[0] = -15;
ADDRLP4 12
CNSTF4 3245342720
ASGNF4
line 5223
;5223:	mins[1] = -15;
ADDRLP4 12+4
CNSTF4 3245342720
ASGNF4
line 5225
;5224:	//mins[2] = -24;
;5225:	mins[2] = -22;
ADDRLP4 12+8
CNSTF4 3249537024
ASGNF4
line 5226
;5226:	maxs[0] = 15;
ADDRLP4 24
CNSTF4 1097859072
ASGNF4
line 5227
;5227:	maxs[1] = 15;
ADDRLP4 24+4
CNSTF4 1097859072
ASGNF4
line 5228
;5228:	maxs[2] = 32;
ADDRLP4 24+8
CNSTF4 1107296256
ASGNF4
line 5230
;5229:
;5230:	AngleVectors(bs->viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5232
;5231:
;5232:	if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2139
line 5233
;5233:	{
line 5234
;5234:		rorg[0] = bs->origin[0] - right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
SUBF4
ASGNF4
line 5235
;5235:		rorg[1] = bs->origin[1] - right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 5236
;5236:		rorg[2] = bs->origin[2] - right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 5237
;5237:	}
ADDRGP4 $2140
JUMPV
LABELV $2139
line 5239
;5238:	else
;5239:	{
line 5240
;5240:		rorg[0] = bs->origin[0] + right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 5241
;5241:		rorg[1] = bs->origin[1] + right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5242
;5242:		rorg[2] = bs->origin[2] + right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5243
;5243:	}
LABELV $2140
line 5245
;5244:
;5245:	trap_Trace(&tr, bs->origin, mins, maxs, rorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5247
;5246:
;5247:	if (tr.fraction != 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $2149
line 5248
;5248:	{
line 5249
;5249:		bs->meleeStrafeDisable = level.time + Q_irand(500, 1500);
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1148
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1148
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5250
;5250:	}
LABELV $2149
line 5252
;5251:
;5252:	VectorCopy(rorg, drorg);
ADDRLP4 1128
ADDRLP4 0
INDIRB
ASGNB 12
line 5254
;5253:
;5254:	drorg[2] -= 32;
ADDRLP4 1128+8
ADDRLP4 1128+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5256
;5255:
;5256:	trap_Trace(&tr, rorg, NULL, NULL, drorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
CNSTP4 0
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5258
;5257:
;5258:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $2154
line 5259
;5259:	{ //this may be a dangerous ledge, so don't strafe over it just in case
line 5260
;5260:		bs->meleeStrafeDisable = level.time + Q_irand(500, 1500);
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1152
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1152
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5261
;5261:	}
LABELV $2154
line 5262
;5262:}
LABELV $2134
endproc StrafeTracing 1156 28
export PrimFiring
proc PrimFiring 8 0
line 5265
;5263:
;5264:int PrimFiring(bot_state_t *bs)
;5265:{
line 5266
;5266:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2159
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2159
line 5268
;5267:		bs->doAttack)
;5268:	{
line 5269
;5269:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2158
JUMPV
LABELV $2159
line 5272
;5270:	}
;5271:
;5272:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2161
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2161
line 5274
;5273:		!bs->doAttack)
;5274:	{
line 5275
;5275:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2158
JUMPV
LABELV $2161
line 5278
;5276:	}
;5277:
;5278:	return 0;
CNSTI4 0
RETI4
LABELV $2158
endproc PrimFiring 8 0
export KeepPrimFromFiring
proc KeepPrimFromFiring 8 0
line 5282
;5279:}
;5280:
;5281:int KeepPrimFromFiring(bot_state_t *bs)
;5282:{
line 5283
;5283:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2164
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2164
line 5285
;5284:		bs->doAttack)
;5285:	{
line 5286
;5286:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5287
;5287:	}
LABELV $2164
line 5289
;5288:
;5289:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2166
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2166
line 5291
;5290:		!bs->doAttack)
;5291:	{
line 5292
;5292:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5293
;5293:	}
LABELV $2166
line 5295
;5294:
;5295:	return 0;
CNSTI4 0
RETI4
LABELV $2163
endproc KeepPrimFromFiring 8 0
export AltFiring
proc AltFiring 8 0
line 5299
;5296:}
;5297:
;5298:int AltFiring(bot_state_t *bs)
;5299:{
line 5300
;5300:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2169
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2169
line 5302
;5301:		bs->doAltAttack)
;5302:	{
line 5303
;5303:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2169
line 5306
;5304:	}
;5305:
;5306:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2171
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2171
line 5308
;5307:		!bs->doAltAttack)
;5308:	{
line 5309
;5309:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2171
line 5312
;5310:	}
;5311:
;5312:	return 0;
CNSTI4 0
RETI4
LABELV $2168
endproc AltFiring 8 0
export KeepAltFromFiring
proc KeepAltFromFiring 8 0
line 5316
;5313:}
;5314:
;5315:int KeepAltFromFiring(bot_state_t *bs)
;5316:{
line 5317
;5317:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2174
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2174
line 5319
;5318:		bs->doAltAttack)
;5319:	{
line 5320
;5320:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5321
;5321:	}
LABELV $2174
line 5323
;5322:
;5323:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2176
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2176
line 5325
;5324:		!bs->doAltAttack)
;5325:	{
line 5326
;5326:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 5327
;5327:	}
LABELV $2176
line 5329
;5328:
;5329:	return 0;
CNSTI4 0
RETI4
LABELV $2173
endproc KeepAltFromFiring 8 0
export CheckForFriendInLOF
proc CheckForFriendInLOF 1172 28
line 5333
;5330:}
;5331:
;5332:gentity_t *CheckForFriendInLOF(bot_state_t *bs)
;5333:{
line 5340
;5334:	vec3_t fwd;
;5335:	vec3_t trfrom, trto;
;5336:	vec3_t mins, maxs;
;5337:	gentity_t *trent;
;5338:	trace_t tr;
;5339:
;5340:	mins[0] = -3;
ADDRLP4 36
CNSTF4 3225419776
ASGNF4
line 5341
;5341:	mins[1] = -3;
ADDRLP4 36+4
CNSTF4 3225419776
ASGNF4
line 5342
;5342:	mins[2] = -3;
ADDRLP4 36+8
CNSTF4 3225419776
ASGNF4
line 5344
;5343:
;5344:	maxs[0] = 3;
ADDRLP4 48
CNSTF4 1077936128
ASGNF4
line 5345
;5345:	maxs[1] = 3;
ADDRLP4 48+4
CNSTF4 1077936128
ASGNF4
line 5346
;5346:	maxs[2] = 3;
ADDRLP4 48+8
CNSTF4 1077936128
ASGNF4
line 5348
;5347:
;5348:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5350
;5349:
;5350:	VectorCopy(bs->eye, trfrom);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 5352
;5351:
;5352:	trto[0] = trfrom[0] + fwd[0]*2048;
ADDRLP4 24
ADDRLP4 0
INDIRF4
CNSTF4 1157627904
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 5353
;5353:	trto[1] = trfrom[1] + fwd[1]*2048;
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5354
;5354:	trto[2] = trfrom[2] + fwd[2]*2048;
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5356
;5355:
;5356:	trap_Trace(&tr, trfrom, mins, maxs, trto, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5358
;5357:
;5358:	if (tr.fraction != 1 && tr.entityNum <= MAX_CLIENTS)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $2189
ADDRLP4 60+52
INDIRI4
CNSTI4 32
GTI4 $2189
line 5359
;5359:	{
line 5360
;5360:		trent = &g_entities[tr.entityNum];
ADDRLP4 1140
CNSTI4 828
ADDRLP4 60+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5362
;5361:
;5362:		if (trent && trent->client)
ADDRLP4 1148
ADDRLP4 1140
INDIRP4
ASGNP4
ADDRLP4 1152
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2194
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2194
line 5363
;5363:		{
line 5364
;5364:			if (IsTeamplay() && OnSameTeam(&g_entities[bs->client], trent))
ADDRLP4 1156
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $2196
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $2196
line 5365
;5365:			{
line 5366
;5366:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2178
JUMPV
LABELV $2196
line 5369
;5367:			}
;5368:
;5369:			if (botstates[trent->s.number] && GetLoveLevel(bs, botstates[trent->s.number]) > 1)
ADDRLP4 1164
ADDRLP4 1140
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2198
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 1
LEI4 $2198
line 5370
;5370:			{
line 5371
;5371:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2178
JUMPV
LABELV $2198
line 5373
;5372:			}
;5373:		}
LABELV $2194
line 5374
;5374:	}
LABELV $2189
line 5376
;5375:
;5376:	return NULL;
CNSTP4 0
RETP4
LABELV $2178
endproc CheckForFriendInLOF 1172 28
export BotScanForLeader
proc BotScanForLeader 36 8
line 5380
;5377:}
;5378:
;5379:void BotScanForLeader(bot_state_t *bs)
;5380:{ //bots will only automatically obtain a leader if it's another bot using this method.
line 5381
;5381:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5384
;5382:	gentity_t *ent;
;5383:
;5384:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2204
line 5385
;5385:	{
line 5386
;5386:		return;
ADDRGP4 $2200
JUMPV
LABELV $2203
line 5390
;5387:	}
;5388:
;5389:	while (i < MAX_CLIENTS)
;5390:	{
line 5391
;5391:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5393
;5392:
;5393:		if (ent && ent->client && botstates[i] && botstates[i]->isSquadLeader && bs->client != i)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2206
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2206
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2206
ADDRLP4 20
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2206
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $2206
line 5394
;5394:		{
line 5395
;5395:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2208
line 5396
;5396:			{
line 5397
;5397:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5398
;5398:				break;
ADDRGP4 $2205
JUMPV
LABELV $2208
line 5400
;5399:			}
;5400:			if (GetLoveLevel(bs, botstates[i]) > 1 && !IsTeamplay())
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $2210
ADDRLP4 32
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2210
line 5401
;5401:			{ //ignore love status regarding squad leaders if we're in teamplay
line 5402
;5402:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5403
;5403:				break;
ADDRGP4 $2205
JUMPV
LABELV $2210
line 5405
;5404:			}
;5405:		}
LABELV $2206
line 5407
;5406:
;5407:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5408
;5408:	}
LABELV $2204
line 5389
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2203
LABELV $2205
line 5409
;5409:}
LABELV $2200
endproc BotScanForLeader 36 8
export BotReplyGreetings
proc BotReplyGreetings 20 12
line 5412
;5410:
;5411:void BotReplyGreetings(bot_state_t *bs)
;5412:{
line 5413
;5413:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5414
;5414:	int numhello = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2214
JUMPV
LABELV $2213
line 5417
;5415:
;5416:	while (i < MAX_CLIENTS)
;5417:	{
line 5418
;5418:		if (botstates[i] &&
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2216
ADDRLP4 12
INDIRP4
CNSTI4 2092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2216
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2216
line 5421
;5419:			botstates[i]->canChat &&
;5420:			i != bs->client)
;5421:		{
line 5422
;5422:			botstates[i]->chatObject = &g_entities[bs->client];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5423
;5423:			botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5424
;5424:			if (BotDoChat(botstates[i], "ResponseGreetings", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $2220
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2218
line 5425
;5425:			{
line 5426
;5426:				numhello++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5427
;5427:			}
LABELV $2218
line 5428
;5428:		}
LABELV $2216
line 5430
;5429:
;5430:		if (numhello > 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $2221
line 5431
;5431:		{ //don't let more than 4 bots say hello at once
line 5432
;5432:			return;
ADDRGP4 $2212
JUMPV
LABELV $2221
line 5435
;5433:		}
;5434:
;5435:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5436
;5436:	}
LABELV $2214
line 5416
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2213
line 5437
;5437:}
LABELV $2212
endproc BotReplyGreetings 20 12
export CTFFlagMovement
proc CTFFlagMovement 1184 28
line 5440
;5438:
;5439:void CTFFlagMovement(bot_state_t *bs)
;5440:{
line 5441
;5441:	int diddrop = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 5442
;5442:	gentity_t *desiredDrop = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 5446
;5443:	vec3_t a, mins, maxs;
;5444:	trace_t tr;
;5445:
;5446:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 5447
;5447:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 5448
;5448:	mins[2] = -7;
ADDRLP4 0+8
CNSTF4 3235905536
ASGNF4
line 5449
;5449:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 5450
;5450:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 5451
;5451:	maxs[2] = 7;
ADDRLP4 12+8
CNSTF4 1088421888
ASGNF4
line 5453
;5452:
;5453:	if (bs->wantFlag && (bs->wantFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2228
ADDRLP4 1124
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2228
line 5454
;5454:	{
line 5455
;5455:		if (bs->staticFlagSpot[0] == bs->wantFlag->s.pos.trBase[0] &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
ADDRLP4 1128
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 1852
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
NEF4 $2230
ADDRLP4 1128
INDIRP4
CNSTI4 1856
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
NEF4 $2230
ADDRLP4 1128
INDIRP4
CNSTI4 1860
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEF4 $2230
line 5458
;5456:			bs->staticFlagSpot[1] == bs->wantFlag->s.pos.trBase[1] &&
;5457:			bs->staticFlagSpot[2] == bs->wantFlag->s.pos.trBase[2])
;5458:		{
line 5459
;5459:			VectorSubtract(bs->origin, bs->wantFlag->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1136
INDIRP4
CNSTI4 1836
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 1136
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1136
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32+8
ADDRLP4 1144
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5461
;5460:
;5461:			if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1148
INDIRF4
CNSTF4 1132462080
GTF4 $2234
line 5462
;5462:			{
line 5463
;5463:				VectorCopy(bs->wantFlag->s.pos.trBase, bs->goalPosition);
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1152
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5464
;5464:				return;
ADDRGP4 $2223
JUMPV
LABELV $2234
line 5467
;5465:			}
;5466:			else
;5467:			{
line 5468
;5468:				bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5469
;5469:			}
line 5470
;5470:		}
ADDRGP4 $2229
JUMPV
LABELV $2230
line 5472
;5471:		else
;5472:		{
line 5473
;5473:			bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5474
;5474:		}
line 5475
;5475:	}
ADDRGP4 $2229
JUMPV
LABELV $2228
line 5476
;5476:	else if (bs->wantFlag)
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2236
line 5477
;5477:	{
line 5478
;5478:		bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5479
;5479:	}
LABELV $2236
LABELV $2229
line 5481
;5480:
;5481:	if (flagRed && flagBlue)
ADDRLP4 1128
CNSTU4 0
ASGNU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2238
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2238
line 5482
;5482:	{
line 5483
;5483:		if (bs->wpDestination == flagRed ||
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 1132
INDIRU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
EQU4 $2242
ADDRLP4 1132
INDIRU4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2240
LABELV $2242
line 5485
;5484:			bs->wpDestination == flagBlue)
;5485:		{
line 5486
;5486:			if (bs->wpDestination == flagRed && droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM) && droppedRedFlag->classname && strcmp(droppedRedFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
NEU4 $2243
ADDRLP4 1136
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 1140
CNSTU4 0
ASGNU4
ADDRLP4 1136
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2243
ADDRLP4 1136
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2243
ADDRLP4 1144
ADDRLP4 1136
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2243
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 $2245
ARGP4
ADDRLP4 1148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $2243
line 5487
;5487:			{
line 5488
;5488:				desiredDrop = droppedRedFlag;
ADDRLP4 24
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
line 5489
;5489:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5490
;5490:			}
LABELV $2243
line 5491
;5491:			if (bs->wpDestination == flagBlue && droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM) && droppedBlueFlag->classname && strcmp(droppedBlueFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2246
ADDRLP4 1152
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 1156
CNSTU4 0
ASGNU4
ADDRLP4 1152
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2246
ADDRLP4 1152
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2246
ADDRLP4 1160
ADDRLP4 1152
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2246
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 $2245
ARGP4
ADDRLP4 1164
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
EQI4 $2246
line 5492
;5492:			{
line 5493
;5493:				desiredDrop = droppedBlueFlag;
ADDRLP4 24
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
line 5494
;5494:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5495
;5495:			}
LABELV $2246
line 5497
;5496:
;5497:			if (diddrop && desiredDrop)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2248
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2248
line 5498
;5498:			{
line 5499
;5499:				VectorSubtract(bs->origin, desiredDrop->s.pos.trBase, a);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5501
;5500:
;5501:				if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1176
INDIRF4
CNSTF4 1132462080
GTF4 $2252
line 5502
;5502:				{
line 5503
;5503:					trap_Trace(&tr, bs->origin, mins, maxs, desiredDrop->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5505
;5504:
;5505:					if (tr.fraction == 1 || tr.entityNum == desiredDrop->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $2258
ADDRLP4 44+52
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
NEI4 $2254
LABELV $2258
line 5506
;5506:					{
line 5507
;5507:						VectorCopy(desiredDrop->s.pos.trBase, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5508
;5508:						VectorCopy(desiredDrop->s.pos.trBase, bs->staticFlagSpot);
ADDRFP4 0
INDIRP4
CNSTI4 1852
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5509
;5509:						return;
LABELV $2254
line 5511
;5510:					}
;5511:				}
LABELV $2252
line 5512
;5512:			}
LABELV $2248
line 5513
;5513:		}
LABELV $2240
line 5514
;5514:	}
LABELV $2238
line 5515
;5515:}
LABELV $2223
endproc CTFFlagMovement 1184 28
export BotCheckDetPacks
proc BotCheckDetPacks 84 12
line 5518
;5516:
;5517:void BotCheckDetPacks(bot_state_t *bs)
;5518:{
line 5519
;5519:	gentity_t *dp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 5520
;5520:	gentity_t *myDet = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $2261
JUMPV
LABELV $2260
line 5526
;5521:	vec3_t a;
;5522:	float enLen;
;5523:	float myLen;
;5524:
;5525:	while ( (dp = G_Find( dp, FOFS(classname), "detpack") ) != NULL )
;5526:	{
line 5527
;5527:		if (dp && dp->parent && dp->parent->s.number == bs->client)
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2264
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2264
ADDRLP4 36
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2264
line 5528
;5528:		{
line 5529
;5529:			myDet = dp;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5530
;5530:			break;
ADDRGP4 $2262
JUMPV
LABELV $2264
line 5532
;5531:		}
;5532:	}
LABELV $2261
line 5525
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $2263
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2260
LABELV $2262
line 5534
;5533:
;5534:	if (!myDet)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2266
line 5535
;5535:	{
line 5536
;5536:		return;
ADDRGP4 $2259
JUMPV
LABELV $2266
line 5539
;5537:	}
;5538:
;5539:	if (!bs->currentEnemy || !bs->currentEnemy->client || !bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2271
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2271
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2268
LABELV $2271
line 5540
;5540:	{ //require the enemy to be visilbe just to be fair..
line 5543
;5541:
;5542:		//unless..
;5543:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2259
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2259
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $2259
line 5545
;5544:			(level.time - bs->plantContinue) < 5000)
;5545:		{ //it's a fresh plant (within 5 seconds) so we should be able to guess
line 5546
;5546:			goto stillmadeit;
line 5548
;5547:		}
;5548:		return;
LABELV $2268
LABELV $2275
line 5553
;5549:	}
;5550:
;5551:stillmadeit:
;5552:
;5553:	VectorSubtract(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, a);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 408
ASGNI4
ADDRLP4 56
CNSTI4 24
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5554
;5554:	enLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 5556
;5555:
;5556:	VectorSubtract(bs->origin, myDet->s.pos.trBase, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 64
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5557
;5557:	myLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 5559
;5558:
;5559:	if (enLen > myLen)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $2280
line 5560
;5560:	{
line 5561
;5561:		return;
ADDRGP4 $2259
JUMPV
LABELV $2280
line 5564
;5562:	}
;5563:
;5564:	if (enLen < BOT_PLANT_BLOW_DISTANCE && OrgVisible(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, bs->currentEnemy->s.number))
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GEF4 $2282
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $2282
line 5565
;5565:	{ //we could just call the "blow all my detpacks" function here, but I guess that's cheating.
line 5566
;5566:		bs->plantKillEmAll = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5567
;5567:	}
LABELV $2282
line 5568
;5568:}
LABELV $2259
endproc BotCheckDetPacks 84 12
export BotUseInventoryItem
proc BotUseInventoryItem 12 8
line 5571
;5569:
;5570:int BotUseInventoryItem(bot_state_t *bs)
;5571:{
line 5572
;5572:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2286
line 5573
;5573:	{
line 5574
;5574:		if (g_entities[bs->client].health <= 50)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2288
line 5575
;5575:		{
line 5576
;5576:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_MEDPAC, IT_HOLDABLE);
CNSTI4 3
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5577
;5577:			goto wantuseitem;
ADDRGP4 $2291
JUMPV
LABELV $2288
line 5579
;5578:		}
;5579:	}
LABELV $2286
line 5580
;5580:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2292
line 5581
;5581:	{
line 5582
;5582:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2294
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2294
line 5583
;5583:		{
line 5584
;5584:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SEEKER, IT_HOLDABLE);
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5585
;5585:			goto wantuseitem;
ADDRGP4 $2291
JUMPV
LABELV $2294
line 5587
;5586:		}
;5587:	}
LABELV $2292
line 5588
;5588:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2296
line 5589
;5589:	{
line 5590
;5590:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2298
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2298
line 5591
;5591:		{
line 5592
;5592:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SENTRY_GUN, IT_HOLDABLE);
ADDRLP4 4
CNSTI4 6
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5593
;5593:			goto wantuseitem;
ADDRGP4 $2291
JUMPV
LABELV $2298
line 5595
;5594:		}
;5595:	}
LABELV $2296
line 5596
;5596:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2300
line 5597
;5597:	{
line 5598
;5598:		if (bs->currentEnemy && bs->frame_Enemy_Vis && bs->runningToEscapeThreat)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2302
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2302
ADDRLP4 0
INDIRP4
CNSTI4 2312
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2302
line 5599
;5599:		{ //this will (hopefully) result in the bot placing the shield down while facing
line 5601
;5600:		  //the enemy and running away
;5601:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SHIELD, IT_HOLDABLE);
CNSTI4 2
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5602
;5602:			goto wantuseitem;
ADDRGP4 $2291
JUMPV
LABELV $2302
line 5604
;5603:		}
;5604:	}
LABELV $2300
line 5606
;5605:
;5606:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $2285
JUMPV
LABELV $2291
line 5609
;5607:
;5608:wantuseitem:
;5609:	level.clients[bs->client].ps.stats[STAT_HOLDABLE_ITEM] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1800
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 220
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 5611
;5610:
;5611:	return 1;
CNSTI4 1
RETI4
LABELV $2285
endproc BotUseInventoryItem 12 8
export BotSurfaceNear
proc BotSurfaceNear 1104 28
line 5615
;5612:}
;5613:
;5614:int BotSurfaceNear(bot_state_t *bs)
;5615:{
line 5619
;5616:	trace_t tr;
;5617:	vec3_t fwd;
;5618:
;5619:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
CNSTP4 0
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5621
;5620:
;5621:	fwd[0] = bs->origin[0]+(fwd[0]*64);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 5622
;5622:	fwd[1] = bs->origin[1]+(fwd[1]*64);
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5623
;5623:	fwd[2] = bs->origin[2]+(fwd[2]*64);
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5625
;5624:
;5625:	trap_Trace(&tr, bs->origin, NULL, NULL, fwd, bs->client, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1100
CNSTP4 0
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5627
;5626:
;5627:	if (tr.fraction != 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $2309
line 5628
;5628:	{
line 5629
;5629:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2304
JUMPV
LABELV $2309
line 5632
;5630:	}
;5631:
;5632:	return 0;
CNSTI4 0
RETI4
LABELV $2304
endproc BotSurfaceNear 1104 28
export BotWeaponBlockable
proc BotWeaponBlockable 4 0
line 5636
;5633:}
;5634:
;5635:int BotWeaponBlockable(int weapon)
;5636:{
line 5637
;5637:	switch (weapon)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $2313
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $2313
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2322-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2322
address $2315
address $2313
address $2313
address $2313
address $2316
address $2313
address $2313
address $2317
address $2313
address $2318
address $2319
address $2320
address $2321
code
line 5638
;5638:	{
LABELV $2315
line 5640
;5639:	case WP_STUN_BATON:
;5640:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2316
line 5642
;5641:	case WP_DISRUPTOR:
;5642:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2317
line 5644
;5643:	case WP_DEMP2:
;5644:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2318
line 5646
;5645:	case WP_ROCKET_LAUNCHER:
;5646:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2319
line 5648
;5647:	case WP_THERMAL:
;5648:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2320
line 5650
;5649:	case WP_TRIP_MINE:
;5650:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2321
line 5652
;5651:	case WP_DET_PACK:
;5652:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2312
JUMPV
LABELV $2313
line 5654
;5653:	default:
;5654:		return 1;
CNSTI4 1
RETI4
LABELV $2312
endproc BotWeaponBlockable 4 0
export StandardBotAI
proc StandardBotAI 420 24
line 5662
;5655:	}
;5656:}
;5657:
;5658:void Cmd_EngageDuel_f(gentity_t *ent);
;5659:void Cmd_ToggleSaber_f(gentity_t *ent);
;5660:
;5661:void StandardBotAI(bot_state_t *bs, float thinktime)
;5662:{
line 5666
;5663:	int wp, enemy;
;5664:	int desiredIndex;
;5665:	int goalWPIndex;
;5666:	int doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5671
;5667:	int fjHalt;
;5668:	vec3_t a, ang, headlevel, eorg, noz_x, noz_y, dif, a_fo;
;5669:	float reaction;
;5670:	float bLeadAmount;
;5671:	int meleestrafe = 0;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 5672
;5672:	int useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5673
;5673:	int forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5674
;5674:	int cBAI = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 5675
;5675:	gentity_t *friendInLOF = 0;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 5677
;5676:	float mLen;
;5677:	int visResult = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 5678
;5678:	int selResult = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 5679
;5679:	int mineSelect = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 5680
;5680:	int detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 5682
;5681:
;5682:	if (gDeactivated)
ADDRGP4 gDeactivated
INDIRF4
CNSTF4 0
EQF4 $2325
line 5683
;5683:	{
line 5684
;5684:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5685
;5685:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5686
;5686:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5687
;5687:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5688
;5688:		return;
ADDRGP4 $2324
JUMPV
LABELV $2325
line 5691
;5689:	}
;5690:
;5691:	if (g_entities[bs->client].inuse &&
ADDRLP4 168
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2327
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2327
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2327
line 5694
;5692:		g_entities[bs->client].client &&
;5693:		g_entities[bs->client].client->sess.sessionTeam == TEAM_SPECTATOR)
;5694:	{
line 5695
;5695:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5696
;5696:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5697
;5697:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5698
;5698:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5699
;5699:		return;
ADDRGP4 $2324
JUMPV
LABELV $2327
line 5702
;5700:	}
;5701:
;5702:	trap_Cvar_Update(&bot_forgimmick);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5703
;5703:	trap_Cvar_Update(&bot_honorableduelacceptance);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5705
;5704:
;5705:	if (bot_forgimmick.integer)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 0
EQI4 $2332
line 5706
;5706:	{
line 5707
;5707:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5708
;5708:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5709
;5709:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5710
;5710:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5712
;5711:
;5712:		if (bot_forgimmick.integer == 2)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 2
NEI4 $2324
line 5713
;5713:		{ //for debugging saber stuff, this is handy
line 5714
;5714:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5715
;5715:		}
line 5716
;5716:		return;
ADDRGP4 $2324
JUMPV
LABELV $2332
line 5719
;5717:	}
;5718:
;5719:	if (!bs->lastDeadTime)
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2338
line 5720
;5720:	{ //just spawned in?
line 5721
;5721:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 5722
;5722:	}
LABELV $2338
line 5724
;5723:
;5724:	if (g_entities[bs->client].health < 1)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2341
line 5725
;5725:	{
line 5726
;5726:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 5728
;5727:
;5728:		if (!bs->deathActivitiesDone && bs->lastHurt && bs->lastHurt->client && bs->lastHurt->s.number != bs->client)
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 2620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2345
ADDRLP4 176
ADDRLP4 172
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 180
CNSTU4 0
ASGNU4
ADDRLP4 176
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $2345
ADDRLP4 176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $2345
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2345
line 5729
;5729:		{
line 5730
;5730:			BotDeathNotify(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDeathNotify
CALLV
pop
line 5731
;5731:			if (PassLovedOneCheck(bs, bs->lastHurt))
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $2347
line 5732
;5732:			{
line 5734
;5733:				//CHAT: Died
;5734:				bs->chatObject = bs->lastHurt;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5735
;5735:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5736
;5736:				BotDoChat(bs, "Died", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2349
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5737
;5737:			}
ADDRGP4 $2348
JUMPV
LABELV $2347
line 5738
;5738:			else if (!PassLovedOneCheck(bs, bs->lastHurt) &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $2350
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
ADDRLP4 200
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2350
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 208
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $2350
line 5741
;5739:				botstates[bs->lastHurt->s.number] &&
;5740:				PassLovedOneCheck(botstates[bs->lastHurt->s.number], &g_entities[bs->client]))
;5741:			{ //killed by a bot that I love, but that does not love me
line 5742
;5742:				bs->chatObject = bs->lastHurt;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5743
;5743:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5744
;5744:				BotDoChat(bs, "KilledOnPurposeByLove", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2352
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5745
;5745:			}
LABELV $2350
LABELV $2348
line 5747
;5746:
;5747:			bs->deathActivitiesDone = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 1
ASGNI4
line 5748
;5748:		}
LABELV $2345
line 5750
;5749:		
;5750:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5751
;5751:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5752
;5752:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5753
;5753:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 5754
;5754:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 5755
;5755:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 5756
;5756:		bs->wpDestIgnoreTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
CNSTF4 0
ASGNF4
line 5757
;5757:		bs->wpDestSwitchTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 5758
;5758:		bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 5759
;5759:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5761
;5760:
;5761:		if (rand()%10 < 5 &&
ADDRLP4 184
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2324
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2356
ADDRLP4 188
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2324
LABELV $2356
line 5763
;5762:			(!bs->doChat || bs->chatTime < level.time))
;5763:		{
line 5764
;5764:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5765
;5765:		}
line 5767
;5766:
;5767:		return;
ADDRGP4 $2324
JUMPV
LABELV $2341
line 5770
;5768:	}
;5769:
;5770:	bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5771
;5771:	bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5774
;5772:	//reset the attack states
;5773:
;5774:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2357
line 5775
;5775:	{
line 5776
;5776:		CommanderBotAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotAI
CALLV
pop
line 5777
;5777:	}
ADDRGP4 $2358
JUMPV
LABELV $2357
line 5779
;5778:	else
;5779:	{
line 5780
;5780:		BotDoTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDoTeamplayAI
CALLV
pop
line 5781
;5781:	}
LABELV $2358
line 5783
;5782:
;5783:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2359
line 5784
;5784:	{
line 5785
;5785:		bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 5786
;5786:	}
LABELV $2359
line 5788
;5787:
;5788:	if (bs->revengeEnemy && bs->revengeEnemy->client &&
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2361
ADDRLP4 180
ADDRLP4 172
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2361
ADDRLP4 184
ADDRLP4 180
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 8
EQI4 $2361
ADDRLP4 184
INDIRI4
CNSTI4 2
EQI4 $2361
line 5790
;5789:		bs->revengeEnemy->client->pers.connected != CA_ACTIVE && bs->revengeEnemy->client->pers.connected != CA_AUTHORIZING)
;5790:	{
line 5791
;5791:		bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 5792
;5792:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5793
;5793:	}
LABELV $2361
line 5795
;5794:
;5795:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
CNSTU4 0
ASGNU4
ADDRLP4 188
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRU4
EQU4 $2363
ADDRLP4 196
ADDRLP4 188
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRU4
EQU4 $2363
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 8
EQI4 $2363
ADDRLP4 200
INDIRI4
CNSTI4 2
EQI4 $2363
line 5797
;5796:		bs->currentEnemy->client->pers.connected != CA_ACTIVE && bs->currentEnemy->client->pers.connected != CA_AUTHORIZING)
;5797:	{
line 5798
;5798:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5799
;5799:	}
LABELV $2363
line 5801
;5800:
;5801:	fjHalt = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 5804
;5802:
;5803:#ifndef FORCEJUMP_INSTANTMETHOD
;5804:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2365
line 5805
;5805:	{
line 5806
;5806:		useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5807
;5807:		forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5808
;5808:	}
LABELV $2365
line 5810
;5809:
;5810:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis && bs->forceJumpChargeTime < level.time)
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 204
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 212
CNSTU4 0
ASGNU4
ADDRLP4 208
INDIRP4
CVPU4 4
ADDRLP4 212
INDIRU4
EQU4 $2368
ADDRLP4 208
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 212
INDIRU4
EQU4 $2368
ADDRLP4 204
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2368
ADDRLP4 204
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2368
line 5814
;5811:#else
;5812:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis)
;5813:#endif
;5814:	{
line 5815
;5815:		VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 216
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 224
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 228
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5816
;5816:		vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 5819
;5817:
;5818:		//do this above all things
;5819:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->doForcePush > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
CNSTI4 8
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2373
ADDRLP4 232
INDIRP4
CNSTI4 4796
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2373
ADDRLP4 240
CNSTI4 1800
ADDRLP4 232
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 240
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+12
ADDP4
INDIRI4
LEI4 $2373
ADDRLP4 232
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 244
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $2373
line 5820
;5820:		{
line 5821
;5821:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5822
;5822:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5823
;5823:			forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5824
;5824:		}
ADDRGP4 $2374
JUMPV
LABELV $2373
line 5825
;5825:		else if (bs->cur_ps.fd.forceSide == FORCE_DARKSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2377
line 5826
;5826:		{ //try dark side powers
line 5828
;5827:		  //in order of priority top to bottom
;5828:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && (bs->cur_ps.fd.forcePowersActive & (1 << FP_GRIP)) && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 64
ASGNI4
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
ADDRLP4 256
INDIRI4
EQI4 $2379
ADDRLP4 248
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
ADDRLP4 256
INDIRI4
EQI4 $2379
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2379
line 5829
;5829:			{ //already gripping someone, so hold it
line 5830
;5830:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5831
;5831:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5832
;5832:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5833
;5833:			}
ADDRGP4 $2378
JUMPV
LABELV $2379
line 5834
;5834:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_LIGHTNING)) && bs->frame_Enemy_Len < FORCE_LIGHTNING_RADIUS && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2381
ADDRLP4 264
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2381
CNSTI4 1800
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2381
ADDRLP4 264
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 268
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2381
line 5835
;5835:			{
line 5836
;5836:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_LIGHTNING;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 7
ASGNI4
line 5837
;5837:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5838
;5838:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5839
;5839:			}
ADDRGP4 $2378
JUMPV
LABELV $2381
line 5840
;5840:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && bs->frame_Enemy_Len < MAX_GRIP_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_GRIP]][FP_GRIP] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2383
ADDRLP4 272
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2383
ADDRLP4 276
CNSTI4 1800
ADDRLP4 272
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 276
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+24
ADDP4
INDIRI4
LEI4 $2383
ADDRLP4 272
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 280
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2383
line 5841
;5841:			{
line 5842
;5842:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5843
;5843:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5844
;5844:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5845
;5845:			}
ADDRGP4 $2378
JUMPV
LABELV $2383
line 5846
;5846:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_RAGE)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_RAGE]][FP_RAGE])
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2386
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 288
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2386
ADDRLP4 292
CNSTI4 1800
ADDRLP4 288
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 292
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+32
ADDP4
INDIRI4
LEI4 $2386
line 5847
;5847:			{
line 5848
;5848:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_RAGE;
ADDRLP4 296
CNSTI4 8
ASGNI4
CNSTI4 1800
ADDRFP4 0
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
ADDRLP4 296
INDIRI4
ASGNI4
line 5849
;5849:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5850
;5850:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5851
;5851:			}
ADDRGP4 $2378
JUMPV
LABELV $2386
line 5852
;5852:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_DRAIN)) && bs->frame_Enemy_Len < MAX_DRAIN_DISTANCE && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo) && bs->currentEnemy->client->ps.fd.forcePower > 10 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2378
ADDRLP4 296
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2378
CNSTI4 1800
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2378
ADDRLP4 296
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 300
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $2378
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 10
LEI4 $2378
ADDRLP4 304
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2378
line 5853
;5853:			{
line 5854
;5854:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_DRAIN;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 13
ASGNI4
line 5855
;5855:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5856
;5856:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5857
;5857:			}
line 5858
;5858:		}
ADDRGP4 $2378
JUMPV
LABELV $2377
line 5859
;5859:		else if (bs->cur_ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2392
line 5860
;5860:		{ //try light side powers
line 5861
;5861:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_TELEPATHY)) && bs->frame_Enemy_Len < MAX_TRICK_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TELEPATHY]][FP_TELEPATHY] && InFieldOfVision(bs->viewangles, 50, a_fo) && !(bs->currentEnemy->client->ps.fd.forcePowersActive & (1 << FP_SEE)))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2394
ADDRLP4 248
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2394
ADDRLP4 252
CNSTI4 1800
ADDRLP4 248
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 252
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+20
ADDP4
INDIRI4
LEI4 $2394
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 256
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRLP4 256
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $2394
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 260
INDIRI4
NEI4 $2394
line 5862
;5862:			{
line 5863
;5863:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TELEPATHY;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 5
ASGNI4
line 5864
;5864:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5865
;5865:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5866
;5866:			}
ADDRGP4 $2395
JUMPV
LABELV $2394
line 5867
;5867:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_ABSORB)) && g_entities[bs->client].health < 75 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_DARKSIDE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_ABSORB]][FP_ABSORB])
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2397
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 75
GEI4 $2397
ADDRLP4 264
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2397
ADDRLP4 272
CNSTI4 1800
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 272
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+40
ADDP4
INDIRI4
LEI4 $2397
line 5868
;5868:			{
line 5869
;5869:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_ABSORB;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 10
ASGNI4
line 5870
;5870:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5871
;5871:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5872
;5872:			}
ADDRGP4 $2398
JUMPV
LABELV $2397
line 5873
;5873:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PROTECT)) && g_entities[bs->client].health < 35 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PROTECT]][FP_PROTECT])
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2401
ADDRLP4 280
ADDRLP4 276
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 35
GEI4 $2401
ADDRLP4 284
CNSTI4 1800
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 284
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+36
ADDP4
INDIRI4
LEI4 $2401
line 5874
;5874:			{
line 5875
;5875:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PROTECT;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 9
ASGNI4
line 5876
;5876:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5877
;5877:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5878
;5878:			}
LABELV $2401
LABELV $2398
LABELV $2395
line 5879
;5879:		}
LABELV $2392
LABELV $2378
LABELV $2374
line 5881
;5880:
;5881:		if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2405
line 5882
;5882:		{ //try neutral powers
line 5883
;5883:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->cur_ps.fd.forceGripBeingGripped > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 8
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2407
ADDRLP4 248
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2407
ADDRLP4 256
CNSTI4 1800
ADDRLP4 248
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 256
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+12
ADDP4
INDIRI4
LEI4 $2407
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2407
line 5884
;5884:			{
line 5885
;5885:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5886
;5886:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5887
;5887:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5888
;5888:			}
ADDRGP4 $2408
JUMPV
LABELV $2407
line 5889
;5889:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SPEED)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SPEED]][FP_SPEED])
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2411
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2411
ADDRLP4 272
CNSTI4 1800
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 272
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+8
ADDP4
INDIRI4
LEI4 $2411
line 5890
;5890:			{
line 5891
;5891:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SPEED;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 2
ASGNI4
line 5892
;5892:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5893
;5893:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5894
;5894:			}
ADDRGP4 $2412
JUMPV
LABELV $2411
line 5895
;5895:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SEE)) && BotMindTricked(bs->client, bs->currentEnemy->s.number) && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SEE]][FP_SEE])
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $2415
ADDRLP4 276
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2415
ADDRLP4 284
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 284
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+56
ADDP4
INDIRI4
LEI4 $2415
line 5896
;5896:			{
line 5897
;5897:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SEE;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 14
ASGNI4
line 5898
;5898:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5899
;5899:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5900
;5900:			}
ADDRGP4 $2416
JUMPV
LABELV $2415
line 5901
;5901:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PULL)) && bs->frame_Enemy_Len < 256 && level.clients[bs->client].ps.fd.forcePower > 75 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2418
ADDRLP4 288
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2418
CNSTI4 1800
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2418
ADDRLP4 288
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 292
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $2418
line 5902
;5902:			{
line 5903
;5903:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PULL;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 4
ASGNI4
line 5904
;5904:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5905
;5905:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5906
;5906:			}
LABELV $2418
LABELV $2416
LABELV $2412
LABELV $2408
line 5907
;5907:		}
LABELV $2405
line 5908
;5908:	}
LABELV $2368
line 5910
;5909:
;5910:	if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2420
line 5911
;5911:	{ //try powers that we don't care if we have an enemy for
line 5912
;5912:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && bs->cur_ps.fd.forcePowerLevel[FP_HEAL] > FORCE_LEVEL_1)
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
CNSTI4 1
ASGNI4
ADDRLP4 216
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2422
ADDRLP4 224
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2422
ADDRLP4 228
CNSTI4 1800
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 228
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
INDIRI4
LEI4 $2422
ADDRLP4 216
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
LEI4 $2422
line 5913
;5913:		{
line 5914
;5914:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5915
;5915:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5916
;5916:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5917
;5917:		}
ADDRGP4 $2423
JUMPV
LABELV $2422
line 5918
;5918:		else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && !bs->currentEnemy && bs->isCamping > level.time)
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2425
ADDRLP4 236
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 236
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2425
ADDRLP4 240
CNSTI4 1800
ADDRLP4 236
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 240
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
INDIRI4
LEI4 $2425
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2425
ADDRLP4 232
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2425
line 5919
;5919:		{ //only meditate and heal if we're camping
line 5920
;5920:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5921
;5921:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5922
;5922:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5923
;5923:		}
LABELV $2425
LABELV $2423
line 5924
;5924:	}
LABELV $2420
line 5926
;5925:
;5926:	if (useTheForce && forceHostile)
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 216
INDIRI4
EQI4 $2429
ADDRLP4 16
INDIRI4
ADDRLP4 216
INDIRI4
EQI4 $2429
line 5927
;5927:	{
line 5928
;5928:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
ADDRLP4 220
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 228
CNSTU4 0
ASGNU4
ADDRLP4 224
INDIRP4
CVPU4 4
ADDRLP4 228
INDIRU4
EQU4 $2431
ADDRLP4 224
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 228
INDIRU4
EQU4 $2431
ADDRLP4 232
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 232
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
CNSTI4 1800
ADDRLP4 232
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 236
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $2431
line 5930
;5929:			!ForcePowerUsableOn(&g_entities[bs->client], bs->currentEnemy, level.clients[bs->client].ps.fd.forcePowerSelected))
;5930:		{
line 5931
;5931:			useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5932
;5932:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5933
;5933:		}
LABELV $2431
line 5934
;5934:	}
LABELV $2429
line 5936
;5935:
;5936:	doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5938
;5937:
;5938:	bs->deathActivitiesDone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 0
ASGNI4
line 5940
;5939:
;5940:	if (BotUseInventoryItem(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 220
ADDRGP4 BotUseInventoryItem
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $2433
line 5941
;5941:	{
line 5942
;5942:		if (rand()%10 < 5)
ADDRLP4 224
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2435
line 5943
;5943:		{
line 5944
;5944:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5945
;5945:		}
LABELV $2435
line 5946
;5946:	}
LABELV $2433
line 5948
;5947:
;5948:	if (bs->cur_ps.ammo[weaponData[bs->cur_ps.weapon].ammoIndex] < weaponData[bs->cur_ps.weapon].energyPerShot)
ADDRLP4 224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
CNSTI4 56
ADDRLP4 224
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 228
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 224
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
GEI4 $2437
line 5949
;5949:	{
line 5950
;5950:		if (BotTryAnotherWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotTryAnotherWeapon
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $2438
line 5951
;5951:		{
line 5952
;5952:			return;
ADDRGP4 $2324
JUMPV
line 5954
;5953:		}
;5954:	}
LABELV $2437
line 5956
;5955:	else
;5956:	{
line 5957
;5957:		if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number &&
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2442
ADDRLP4 232
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 236
INDIRP4
INDIRI4
NEI4 $2442
ADDRLP4 240
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
EQI4 $2442
ADDRLP4 232
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
EQI4 $2442
line 5959
;5958:			bs->frame_Enemy_Vis && bs->forceWeaponSelect /*&& bs->plantContinue < level.time*/)
;5959:		{
line 5960
;5960:			bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 5961
;5961:		}
LABELV $2442
line 5963
;5962:
;5963:		if (bs->plantContinue > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2444
line 5964
;5964:		{
line 5965
;5965:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5966
;5966:			bs->destinationGrabTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
CNSTF4 0
ASGNF4
line 5967
;5967:		}
LABELV $2444
line 5969
;5968:
;5969:		if (!bs->forceWeaponSelect && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
CNSTI4 0
ASGNI4
ADDRLP4 244
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 248
INDIRI4
NEI4 $2447
ADDRLP4 244
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 248
INDIRI4
EQI4 $2447
ADDRLP4 244
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2447
line 5970
;5970:		{
line 5971
;5971:			bs->forceWeaponSelect = WP_DET_PACK;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 13
ASGNI4
line 5972
;5972:		}
LABELV $2447
line 5974
;5973:
;5974:		if (bs->forceWeaponSelect)
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2450
line 5975
;5975:		{
line 5976
;5976:			selResult = BotSelectChoiceWeapon(bs, bs->forceWeaponSelect, 1);
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
ARGP4
ADDRLP4 252
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 256
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 256
INDIRI4
ASGNI4
line 5977
;5977:		}
LABELV $2450
line 5979
;5978:
;5979:		if (selResult)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2452
line 5980
;5980:		{
line 5981
;5981:			if (selResult == 2)
ADDRLP4 104
INDIRI4
CNSTI4 2
NEI4 $2453
line 5982
;5982:			{ //newly selected
line 5983
;5983:				return;
ADDRGP4 $2324
JUMPV
line 5985
;5984:			}
;5985:		}
LABELV $2452
line 5986
;5986:		else if (BotSelectIdealWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 252
ADDRGP4 BotSelectIdealWeapon
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
EQI4 $2456
line 5987
;5987:		{
line 5988
;5988:			return;
ADDRGP4 $2324
JUMPV
LABELV $2456
LABELV $2453
line 5990
;5989:		}
;5990:	}
LABELV $2438
line 5996
;5991:	/*if (BotSelectMelee(bs))
;5992:	{
;5993:		return;
;5994:	}*/
;5995:
;5996:	reaction = bs->skills.reflex/bs->settings.skill;
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 232
INDIRP4
CNSTI4 2316
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 232
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 5998
;5997:
;5998:	if (reaction < 0)
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $2458
line 5999
;5999:	{
line 6000
;6000:		reaction = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 6001
;6001:	}
LABELV $2458
line 6002
;6002:	if (reaction > 2000)
ADDRLP4 48
INDIRF4
CNSTF4 1157234688
LEF4 $2460
line 6003
;6003:	{
line 6004
;6004:		reaction = 2000;
ADDRLP4 48
CNSTF4 1157234688
ASGNF4
line 6005
;6005:	}
LABELV $2460
line 6007
;6006:
;6007:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2462
line 6008
;6008:	{
line 6009
;6009:		bs->timeToReact = level.time + reaction;
ADDRFP4 0
INDIRP4
CNSTI4 1992
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
line 6010
;6010:	}
LABELV $2462
line 6012
;6011:
;6012:	if (bs->cur_ps.weapon == WP_DET_PACK && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2465
ADDRLP4 236
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2465
ADDRLP4 236
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2465
line 6013
;6013:	{
line 6014
;6014:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6015
;6015:	}
LABELV $2465
line 6017
;6016:
;6017:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2468
line 6018
;6018:	{
line 6019
;6019:		if (bs->isCamping < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2470
line 6020
;6020:		{
line 6021
;6021:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6022
;6022:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6023
;6023:		}
LABELV $2470
line 6025
;6024:
;6025:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2473
ADDRLP4 240
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2473
line 6026
;6026:		{
line 6027
;6027:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6028
;6028:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6029
;6029:		}
LABELV $2473
line 6030
;6030:	}
LABELV $2468
line 6032
;6031:
;6032:	if (bs->wpCurrent &&
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2475
ADDRLP4 240
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2479
ADDRLP4 240
INDIRP4
CNSTI4 1976
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2475
LABELV $2479
line 6034
;6033:		(bs->wpSeenTime < level.time || bs->wpTravelTime < level.time))
;6034:	{
line 6035
;6035:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 6036
;6036:	}
LABELV $2475
line 6038
;6037:
;6038:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2480
line 6039
;6039:	{
line 6040
;6040:		if (bs->enemySeenTime < level.time ||
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2485
ADDRLP4 244
INDIRP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $2482
LABELV $2485
line 6042
;6041:			!PassStandardEnemyChecks(bs, bs->currentEnemy))
;6042:		{
line 6043
;6043:			if (bs->revengeEnemy == bs->currentEnemy &&
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
ADDRLP4 252
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 252
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 260
INDIRU4
NEU4 $2486
ADDRLP4 256
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2486
ADDRLP4 264
ADDRLP4 252
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 264
INDIRU4
CNSTU4 0
EQU4 $2486
ADDRLP4 264
INDIRU4
ADDRLP4 260
INDIRU4
NEU4 $2486
line 6046
;6044:				bs->currentEnemy->health < 1 &&
;6045:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6046:			{
line 6048
;6047:				//CHAT: Destroyed hated one [KilledHatedOne section]
;6048:				bs->chatObject = bs->revengeEnemy;
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 268
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
line 6049
;6049:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6050
;6050:				BotDoChat(bs, "KilledHatedOne", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2488
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6051
;6051:				bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 6052
;6052:				bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 6053
;6053:			}
ADDRGP4 $2487
JUMPV
LABELV $2486
line 6054
;6054:			else if (bs->currentEnemy->health < 1 && PassLovedOneCheck(bs, bs->currentEnemy) &&
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2489
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $2489
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
ADDRLP4 280
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 284
INDIRU4
CNSTU4 0
EQU4 $2489
ADDRLP4 284
INDIRU4
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
NEU4 $2489
line 6056
;6055:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6056:			{
line 6058
;6057:				//CHAT: Killed
;6058:				bs->chatObject = bs->currentEnemy;
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
line 6059
;6059:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6060
;6060:				BotDoChat(bs, "Killed", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2491
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6061
;6061:			}
LABELV $2489
LABELV $2487
line 6063
;6062:
;6063:			bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 6064
;6064:		}
LABELV $2482
line 6065
;6065:	}
LABELV $2480
line 6067
;6066:
;6067:	if (bot_honorableduelacceptance.integer)
ADDRGP4 bot_honorableduelacceptance+12
INDIRI4
CNSTI4 0
EQI4 $2492
line 6068
;6068:	{
line 6069
;6069:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 252
CNSTU4 0
ASGNU4
ADDRLP4 248
INDIRP4
CVPU4 4
ADDRLP4 252
INDIRU4
EQU4 $2495
ADDRLP4 256
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CVPU4 4
ADDRLP4 252
INDIRU4
EQU4 $2495
ADDRLP4 260
CNSTI4 2
ASGNI4
ADDRLP4 244
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $2495
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 g_privateDuel+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $2495
ADDRLP4 244
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $2495
ADDRLP4 244
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
GEF4 $2495
ADDRLP4 256
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $2495
ADDRLP4 256
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $2495
line 6076
;6070:			bs->cur_ps.weapon == WP_SABER &&
;6071:			g_privateDuel.integer &&
;6072:			bs->frame_Enemy_Vis &&
;6073:			bs->frame_Enemy_Len < 400 &&
;6074:			bs->currentEnemy->client->ps.weapon == WP_SABER &&
;6075:			bs->currentEnemy->client->ps.saberHolstered)
;6076:		{
line 6079
;6077:			vec3_t e_ang_vec;
;6078:
;6079:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, e_ang_vec);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 288
CNSTI4 408
ASGNI4
ADDRLP4 268
ADDRLP4 284
INDIRP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+4
ADDRLP4 284
INDIRP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268+8
ADDRLP4 292
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6081
;6080:
;6081:			if (InFieldOfVision(bs->viewangles, 100, e_ang_vec))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 268
ARGP4
ADDRLP4 296
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $2500
line 6082
;6082:			{ //Our enemy has his saber holstered and has challenged us to a duel, so challenge him back
line 6083
;6083:				if (!bs->cur_ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2502
line 6084
;6084:				{
line 6085
;6085:					Cmd_ToggleSaber_f(&g_entities[bs->client]);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 6086
;6086:				}
ADDRGP4 $2503
JUMPV
LABELV $2502
line 6088
;6087:				else
;6088:				{
line 6089
;6089:					if (bs->currentEnemy->client->ps.duelIndex == bs->client &&
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
ADDRLP4 300
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 300
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2504
ADDRLP4 304
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2504
ADDRLP4 300
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2504
line 6092
;6090:						bs->currentEnemy->client->ps.duelTime > level.time &&
;6091:						!bs->cur_ps.duelInProgress)
;6092:					{
line 6093
;6093:						Cmd_EngageDuel_f(&g_entities[bs->client]);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 6094
;6094:					}
LABELV $2504
line 6095
;6095:				}
LABELV $2503
line 6097
;6096:
;6097:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6098
;6098:				bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6099
;6099:				bs->botChallengingTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 6100
;6100:				bs->beStill = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6101
;6101:			}
LABELV $2500
line 6102
;6102:		}
LABELV $2495
line 6103
;6103:	}
LABELV $2492
line 6107
;6104:	//Apparently this "allows you to cheese" when fighting against bots. I'm not sure why you'd want to con bots
;6105:	//into an easy kill, since they're bots and all. But whatever.
;6106:
;6107:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2509
line 6108
;6108:	{
line 6109
;6109:		wp = GetNearestVisibleWP(bs->origin, bs->client);
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 248
INDIRI4
ASGNI4
line 6111
;6110:
;6111:		if (wp != -1)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $2511
line 6112
;6112:		{
line 6113
;6113:			bs->wpCurrent = gWPArray[wp];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6114
;6114:			bs->wpSeenTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6115
;6115:			bs->wpTravelTime = level.time + 10000; //never take more than 10 seconds to travel to a waypoint
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6116
;6116:		}
LABELV $2511
line 6117
;6117:	}
LABELV $2509
line 6119
;6118:
;6119:	if (bs->enemySeenTime < level.time || !bs->frame_Enemy_Vis || !bs->currentEnemy ||
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2520
ADDRLP4 244
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2520
ADDRLP4 248
ADDRLP4 244
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 252
CNSTU4 0
ASGNU4
ADDRLP4 248
INDIRU4
ADDRLP4 252
INDIRU4
EQU4 $2520
ADDRLP4 248
INDIRU4
ADDRLP4 252
INDIRU4
EQU4 $2515
LABELV $2520
line 6121
;6120:		(bs->currentEnemy /*&& bs->cur_ps.weapon == WP_SABER && bs->frame_Enemy_Len > 300*/))
;6121:	{
line 6122
;6122:		enemy = ScanForEnemies(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 ScanForEnemies
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 256
INDIRI4
ASGNI4
line 6124
;6123:
;6124:		if (enemy != -1)
ADDRLP4 148
INDIRI4
CNSTI4 -1
EQI4 $2521
line 6125
;6125:		{
line 6126
;6126:			bs->currentEnemy = &g_entities[enemy];
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTI4 828
ADDRLP4 148
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 6127
;6127:			bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6128
;6128:		}
LABELV $2521
line 6129
;6129:	}
LABELV $2515
line 6131
;6130:
;6131:	if (!bs->squadLeader && !bs->isSquadLeader)
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2524
ADDRLP4 256
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2524
line 6132
;6132:	{
line 6133
;6133:		BotScanForLeader(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotScanForLeader
CALLV
pop
line 6134
;6134:	}
LABELV $2524
line 6136
;6135:
;6136:	if (!bs->squadLeader && bs->squadCannotLead < level.time)
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2526
ADDRLP4 260
INDIRP4
CNSTI4 1876
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2526
line 6137
;6137:	{ //if still no leader after scanning, then become a squad leader
line 6138
;6138:		bs->isSquadLeader = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 1
ASGNI4
line 6139
;6139:	}
LABELV $2526
line 6141
;6140:
;6141:	if (bs->isSquadLeader && bs->squadLeader)
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2529
ADDRLP4 264
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2529
line 6142
;6142:	{ //we don't follow anyone if we are a leader
line 6143
;6143:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 6144
;6144:	}
LABELV $2529
line 6147
;6145:
;6146:	//ESTABLISH VISIBILITIES AND DISTANCES FOR THE WHOLE FRAME HERE
;6147:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2531
line 6148
;6148:	{
line 6149
;6149:		VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 272
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 276
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6150
;6150:		bs->frame_Waypoint_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 280
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
ADDRLP4 280
INDIRF4
ASGNF4
line 6152
;6151:
;6152:		visResult = WPOrgVisible(&g_entities[bs->client], bs->origin, bs->wpCurrent->origin, bs->client);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 828
ADDRLP4 288
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
INDIRI4
ARGI4
ADDRLP4 292
ADDRGP4 WPOrgVisible
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 292
INDIRI4
ASGNI4
line 6154
;6153:
;6154:		if (visResult == 2)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $2535
line 6155
;6155:		{
line 6156
;6156:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6157
;6157:			bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 6158
;6158:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6159
;6159:			bs->wpDestIgnoreTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
ASGNF4
line 6161
;6160:
;6161:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2538
line 6162
;6162:			{
line 6163
;6163:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6164
;6164:			}
ADDRGP4 $2536
JUMPV
LABELV $2538
line 6166
;6165:			else
;6166:			{
line 6167
;6167:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6168
;6168:			}
line 6169
;6169:		}
ADDRGP4 $2536
JUMPV
LABELV $2535
line 6170
;6170:		else if (visResult)
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $2540
line 6171
;6171:		{
line 6172
;6172:			bs->frame_Waypoint_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 1
ASGNI4
line 6173
;6173:		}
ADDRGP4 $2541
JUMPV
LABELV $2540
line 6175
;6174:		else
;6175:		{
line 6176
;6176:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6177
;6177:		}
LABELV $2541
LABELV $2536
line 6178
;6178:	}
LABELV $2531
line 6180
;6179:
;6180:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2542
line 6181
;6181:	{
line 6182
;6182:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2544
line 6183
;6183:		{
line 6184
;6184:			VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6185
;6185:			eorg[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6186
;6186:		}
ADDRGP4 $2545
JUMPV
LABELV $2544
line 6188
;6187:		else
;6188:		{
line 6189
;6189:			VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 6190
;6190:		}
LABELV $2545
line 6192
;6191:
;6192:		VectorSubtract(eorg, bs->eye, a);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56+4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6193
;6193:		bs->frame_Enemy_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
line 6195
;6194:
;6195:		if (OrgVisible(bs->eye, eorg, bs->client))
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 276
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2551
line 6196
;6196:		{
line 6197
;6197:			bs->frame_Enemy_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 1
ASGNI4
line 6198
;6198:			VectorCopy(eorg, bs->lastEnemySpotted);
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 6199
;6199:			VectorCopy(bs->origin, bs->hereWhenSpotted);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 1944
ADDP4
ADDRLP4 284
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6200
;6200:			bs->lastVisibleEnemyIndex = bs->currentEnemy->s.number;
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 1956
ADDP4
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 6202
;6201:			//VectorCopy(bs->eye, bs->lastEnemySpotted);
;6202:			bs->hitSpotted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1960
ADDP4
CNSTI4 0
ASGNI4
line 6203
;6203:		}
ADDRGP4 $2543
JUMPV
LABELV $2551
line 6205
;6204:		else
;6205:		{
line 6206
;6206:			bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 6207
;6207:		}
line 6208
;6208:	}
ADDRGP4 $2543
JUMPV
LABELV $2542
line 6210
;6209:	else
;6210:	{
line 6211
;6211:		bs->lastVisibleEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 1956
ADDP4
CNSTI4 1023
ASGNI4
line 6212
;6212:	}
LABELV $2543
line 6215
;6213:	//END
;6214:
;6215:	if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2553
line 6216
;6216:	{
line 6217
;6217:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6218
;6218:	}
LABELV $2553
line 6220
;6219:
;6220:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2556
line 6221
;6221:	{
line 6222
;6222:		WPConstantRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPConstantRoutine
CALLV
pop
line 6224
;6223:
;6224:		if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2558
line 6225
;6225:		{ //WPConstantRoutine has the ability to nullify the waypoint if it fails certain checks, so..
line 6226
;6226:			return;
ADDRGP4 $2324
JUMPV
LABELV $2558
line 6229
;6227:		}
;6228:
;6229:		if (bs->wpCurrent->flags & WPFLAG_WAITFORFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2560
line 6230
;6230:		{
line 6231
;6231:			if (!CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 268
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $2562
line 6232
;6232:			{
line 6233
;6233:				bs->beStill = level.time + 500; //no func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6234
;6234:			}
LABELV $2562
line 6235
;6235:		}
LABELV $2560
line 6236
;6236:		if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $2565
line 6237
;6237:		{
line 6238
;6238:			if (CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 268
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2567
line 6239
;6239:			{
line 6240
;6240:				bs->beStill = level.time + 500; //func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6241
;6241:			}
LABELV $2567
line 6242
;6242:		}
LABELV $2565
line 6244
;6243:
;6244:		if (bs->frame_Waypoint_Vis || (bs->wpCurrent->flags & WPFLAG_NOVIS))
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRLP4 268
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
NEI4 $2572
ADDRLP4 268
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 272
INDIRI4
EQI4 $2570
LABELV $2572
line 6245
;6245:		{
line 6246
;6246:			bs->wpSeenTime = level.time + 1500; //if we lose sight of the point, we have 1.5 seconds to regain it before we drop it
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6247
;6247:		}
LABELV $2570
line 6248
;6248:		VectorCopy(bs->wpCurrent->origin, bs->goalPosition);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6249
;6249:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2574
line 6250
;6250:		{
line 6251
;6251:			goalWPIndex = bs->wpCurrent->index-1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6252
;6252:		}
ADDRGP4 $2575
JUMPV
LABELV $2574
line 6254
;6253:		else
;6254:		{
line 6255
;6255:			goalWPIndex = bs->wpCurrent->index+1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6256
;6256:		}
LABELV $2575
line 6258
;6257:
;6258:		if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2576
line 6259
;6259:		{
line 6260
;6260:			VectorSubtract(bs->wpCampingTo->origin, bs->origin, a);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
ADDRLP4 280
INDIRP4
CNSTI4 2072
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 284
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 284
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 288
INDIRP4
CNSTI4 2072
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 288
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6261
;6261:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6262
;6262:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6264
;6263:
;6264:			VectorSubtract(bs->origin, bs->wpCamping->origin, a);
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
ADDRLP4 292
INDIRP4
CNSTI4 2068
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 292
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 292
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 300
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6265
;6265:			if (VectorLength(a) < 64)
ADDRLP4 0
ARGP4
ADDRLP4 304
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 304
INDIRF4
CNSTF4 1115684864
GEF4 $2577
line 6266
;6266:			{
line 6267
;6267:				VectorCopy(bs->wpCamping->origin, bs->goalPosition);
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 308
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6268
;6268:				bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6270
;6269:
;6270:				if (!bs->campStanding)
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2577
line 6271
;6271:				{
line 6272
;6272:					bs->duckTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6273
;6273:				}
line 6274
;6274:			}
line 6275
;6275:		}
ADDRGP4 $2577
JUMPV
LABELV $2576
line 6276
;6276:		else if (gWPArray[goalWPIndex] && gWPArray[goalWPIndex]->inuse &&
ADDRLP4 280
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2588
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $2588
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $2588
line 6278
;6277:			!(gLevelFlags & LEVELFLAG_NOPOINTPREDICTION))
;6278:		{
line 6279
;6279:			VectorSubtract(gWPArray[goalWPIndex]->origin, bs->origin, a);
ADDRLP4 288
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 288
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 288
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6280
;6280:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6281
;6281:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6282
;6282:		}
ADDRGP4 $2589
JUMPV
LABELV $2588
line 6284
;6283:		else
;6284:		{
line 6285
;6285:			VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 292
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 288
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 292
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 288
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 296
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6286
;6286:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6287
;6287:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6288
;6288:		}
LABELV $2589
LABELV $2577
line 6290
;6289:
;6290:		if (bs->destinationGrabTime < level.time /*&& (!bs->wpDestination || (bs->currentEnemy && bs->frame_Enemy_Vis))*/)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2594
line 6291
;6291:		{
line 6292
;6292:			GetIdealDestination(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 GetIdealDestination
CALLV
pop
line 6293
;6293:		}
LABELV $2594
line 6295
;6294:		
;6295:		if (bs->wpCurrent && bs->wpDestination)
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
CNSTU4 0
ASGNU4
ADDRLP4 288
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 292
INDIRU4
EQU4 $2597
ADDRLP4 288
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 292
INDIRU4
EQU4 $2597
line 6296
;6296:		{
line 6297
;6297:			if (TotalTrailDistance(bs->wpCurrent->index, bs->wpDestination->index, bs) == -1)
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
CNSTI4 16
ASGNI4
ADDRLP4 296
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 304
INDIRF4
CNSTF4 3212836864
NEF4 $2599
line 6298
;6298:			{
line 6299
;6299:				bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6300
;6300:				bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6301
;6301:			}
LABELV $2599
line 6302
;6302:		}
LABELV $2597
line 6304
;6303:
;6304:		if (bs->frame_Waypoint_Len < BOT_WPTOUCH_DISTANCE)
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1107296256
GEF4 $2557
line 6305
;6305:		{
line 6306
;6306:			WPTouchRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPTouchRoutine
CALLV
pop
line 6308
;6307:
;6308:			if (!bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2604
line 6309
;6309:			{
line 6310
;6310:				desiredIndex = bs->wpCurrent->index+1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6311
;6311:			}
ADDRGP4 $2605
JUMPV
LABELV $2604
line 6313
;6312:			else
;6313:			{
line 6314
;6314:				desiredIndex = bs->wpCurrent->index-1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6315
;6315:			}
LABELV $2605
line 6317
;6316:
;6317:			if (gWPArray[desiredIndex] &&
ADDRLP4 296
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 300
ADDRLP4 296
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2606
ADDRLP4 304
CNSTI4 0
ASGNI4
ADDRLP4 300
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 304
INDIRI4
EQI4 $2606
ADDRLP4 296
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $2606
ADDRLP4 296
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $2606
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 PassWayCheck
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $2606
line 6322
;6318:				gWPArray[desiredIndex]->inuse &&
;6319:				desiredIndex < gWPNum &&
;6320:				desiredIndex >= 0 &&
;6321:				PassWayCheck(bs, desiredIndex))
;6322:			{
line 6323
;6323:				bs->wpCurrent = gWPArray[desiredIndex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6324
;6324:			}
ADDRGP4 $2557
JUMPV
LABELV $2606
line 6326
;6325:			else
;6326:			{
line 6327
;6327:				if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2608
line 6328
;6328:				{
line 6329
;6329:					bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6330
;6330:					bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6331
;6331:				}
LABELV $2608
line 6333
;6332:
;6333:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2611
line 6334
;6334:				{
line 6335
;6335:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6336
;6336:				}
ADDRGP4 $2557
JUMPV
LABELV $2611
line 6338
;6337:				else
;6338:				{
line 6339
;6339:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6340
;6340:				}
line 6341
;6341:			}
line 6342
;6342:		}
line 6343
;6343:	}
ADDRGP4 $2557
JUMPV
LABELV $2556
line 6345
;6344:	else //We can't find a waypoint, going to need a fallback routine.
;6345:	{
line 6347
;6346:		/*if (g_gametype.integer == GT_TOURNAMENT)*/
;6347:		{ //helps them get out of messy situations
line 6354
;6348:			/*if ((level.time - bs->forceJumpChargeTime) > 3500)
;6349:			{
;6350:				bs->forceJumpChargeTime = level.time + 2000;
;6351:				trap_EA_MoveForward(bs->client);
;6352:			}
;6353:			*/
;6354:			bs->jumpTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6355
;6355:			bs->jumpHoldTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6356
;6356:			bs->jDelay = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2028
ADDP4
CNSTF4 0
ASGNF4
line 6357
;6357:		}
line 6358
;6358:		doingFallback = BotFallbackNavigation(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotFallbackNavigation
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 268
INDIRI4
ASGNI4
line 6359
;6359:	}
LABELV $2557
line 6361
;6360:
;6361:	if (doingFallback)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2615
line 6362
;6362:	{
line 6363
;6363:		bs->doingFallback = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 1
ASGNI4
line 6364
;6364:	}
ADDRGP4 $2616
JUMPV
LABELV $2615
line 6366
;6365:	else
;6366:	{
line 6367
;6367:		bs->doingFallback = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 0
ASGNI4
line 6368
;6368:	}
LABELV $2616
line 6370
;6369:
;6370:	if (bs->timeToReact < level.time && bs->currentEnemy && bs->enemySeenTime > level.time + (ENEMY_FORGET_MS - (ENEMY_FORGET_MS*0.2)))
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 1992
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2617
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2617
ADDRLP4 268
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1174011904
ADDF4
LEF4 $2617
line 6371
;6371:	{
line 6372
;6372:		if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2621
line 6373
;6373:		{
line 6374
;6374:			cBAI = CombatBotAI(bs, thinktime);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 272
ADDRGP4 CombatBotAI
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 272
INDIRI4
ASGNI4
line 6375
;6375:		}
ADDRGP4 $2622
JUMPV
LABELV $2621
line 6376
;6376:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2623
line 6377
;6377:		{ //keep charging in case we see him again before we lose track of him
line 6378
;6378:			bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6379
;6379:		}
ADDRGP4 $2624
JUMPV
LABELV $2623
line 6380
;6380:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2625
line 6381
;6381:		{ //keep charging in case we see him again before we lose track of him
line 6382
;6382:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6383
;6383:		}
LABELV $2625
LABELV $2624
LABELV $2622
line 6385
;6384:
;6385:		if (bs->destinationGrabTime > level.time + 100)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LEF4 $2627
line 6386
;6386:		{
line 6387
;6387:			bs->destinationGrabTime = level.time + 100; //assures that we will continue staying within a general area of where we want to be in a combat situation
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6388
;6388:		}
LABELV $2627
line 6390
;6389:
;6390:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2631
line 6391
;6391:		{
line 6392
;6392:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6393
;6393:			headlevel[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 108+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6394
;6394:		}
ADDRGP4 $2632
JUMPV
LABELV $2631
line 6396
;6395:		else
;6396:		{
line 6397
;6397:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6398
;6398:		}
LABELV $2632
line 6400
;6399:
;6400:		if (!bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2634
line 6401
;6401:		{
line 6403
;6402:			//if (!bs->hitSpotted && VectorLength(a) > 256)
;6403:			if (OrgVisible(bs->eye, bs->lastEnemySpotted, -1))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 1932
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 276
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $2635
line 6404
;6404:			{
line 6405
;6405:				VectorCopy(bs->lastEnemySpotted, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
INDIRB
ASGNB 12
line 6406
;6406:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6407
;6407:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6408
;6408:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6410
;6409:
;6410:				if (bs->cur_ps.weapon == WP_FLECHETTE &&
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 9
NEI4 $2635
ADDRLP4 284
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2635
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
CNSTU4 0
ASGNU4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRLP4 292
INDIRU4
EQU4 $2635
ADDRLP4 288
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 292
INDIRU4
EQU4 $2635
line 6413
;6411:					bs->cur_ps.weaponstate == WEAPON_READY &&
;6412:					bs->currentEnemy && bs->currentEnemy->client)
;6413:				{
line 6414
;6414:					mLen = VectorLength(a) > 128;
ADDRLP4 0
ARGP4
ADDRLP4 300
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 300
INDIRF4
CNSTF4 1124073472
LEF4 $2645
ADDRLP4 296
CNSTI4 1
ASGNI4
ADDRGP4 $2646
JUMPV
LABELV $2645
ADDRLP4 296
CNSTI4 0
ASGNI4
LABELV $2646
ADDRLP4 164
ADDRLP4 296
INDIRI4
CVIF4 4
ASGNF4
line 6415
;6415:					if (mLen > 128 && mLen < 1024)
ADDRLP4 304
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 304
INDIRF4
CNSTF4 1124073472
LEF4 $2635
ADDRLP4 304
INDIRF4
CNSTF4 1149239296
GEF4 $2635
line 6416
;6416:					{
line 6417
;6417:						VectorSubtract(bs->currentEnemy->client->ps.origin, bs->lastEnemySpotted, a);
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
ADDRLP4 308
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 316
CNSTI4 408
ASGNI4
ADDRLP4 0
ADDRLP4 312
INDIRP4
INDIRP4
ADDRLP4 316
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 308
INDIRP4
CNSTI4 1932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 312
INDIRP4
INDIRP4
ADDRLP4 316
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 308
INDIRP4
CNSTI4 1936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 320
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 320
INDIRP4
CNSTI4 1940
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6419
;6418:
;6419:						if (VectorLength(a) < 300)
ADDRLP4 0
ARGP4
ADDRLP4 324
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 324
INDIRF4
CNSTF4 1133903872
GEF4 $2635
line 6420
;6420:						{
line 6421
;6421:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6422
;6422:						}
line 6423
;6423:					}
line 6424
;6424:				}
line 6425
;6425:			}
line 6426
;6426:		}
ADDRGP4 $2635
JUMPV
LABELV $2634
line 6428
;6427:		else
;6428:		{
line 6429
;6429:			bLeadAmount = BotWeaponCanLead(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotWeaponCanLead
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 272
INDIRF4
ASGNF4
line 6430
;6430:			if ((bs->skills.accuracy/bs->settings.skill) <= 8 &&
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
CNSTF4 1090519040
GTF4 $2653
ADDRLP4 160
INDIRF4
CNSTF4 0
EQF4 $2653
line 6432
;6431:				bLeadAmount)
;6432:			{
line 6433
;6433:				BotAimLeading(bs, headlevel, bLeadAmount);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 160
INDIRF4
ARGF4
ADDRGP4 BotAimLeading
CALLV
pop
line 6434
;6434:			}
ADDRGP4 $2654
JUMPV
LABELV $2653
line 6436
;6435:			else
;6436:			{
line 6437
;6437:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6438
;6438:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6439
;6439:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6440
;6440:			}
LABELV $2654
line 6442
;6441:
;6442:			BotAimOffsetGoalAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimOffsetGoalAngles
CALLV
pop
line 6443
;6443:		}
LABELV $2635
line 6444
;6444:	}
LABELV $2617
line 6446
;6445:
;6446:	if (bs->cur_ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2659
line 6447
;6447:	{
line 6448
;6448:		bs->saberThrowTime = level.time + Q_irand(4000, 10000);
CNSTI4 4000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 272
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2728
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 272
INDIRI4
ADDI4
ASGNI4
line 6449
;6449:	}
LABELV $2659
line 6451
;6450:
;6451:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2662
line 6452
;6452:	{
line 6453
;6453:		if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 4
NEI4 $2664
line 6454
;6454:		{
line 6455
;6455:			int saberRange = SABER_ATTACK_RANGE;
ADDRLP4 276
CNSTI4 128
ASGNI4
line 6457
;6456:
;6457:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 288
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 284
INDIRP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 284
INDIRP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 292
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6458
;6458:			vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6460
;6459:
;6460:			if (bs->saberPowerTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2668
line 6461
;6461:			{ //Don't just use strong attacks constantly, switch around a bit
line 6462
;6462:				if (Q_irand(1, 10) <= 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 296
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 5
GTI4 $2671
line 6463
;6463:				{
line 6464
;6464:					bs->saberPower = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 1
ASGNI4
line 6465
;6465:				}
ADDRGP4 $2672
JUMPV
LABELV $2671
line 6467
;6466:				else
;6467:				{
line 6468
;6468:					bs->saberPower = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 0
ASGNI4
line 6469
;6469:				}
LABELV $2672
line 6471
;6470:
;6471:				bs->saberPowerTime = level.time + Q_irand(3000, 15000);
CNSTI4 3000
ARGI4
CNSTI4 15000
ARGI4
ADDRLP4 300
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 300
INDIRI4
ADDI4
ASGNI4
line 6472
;6472:			}
LABELV $2668
line 6474
;6473:
;6474:			if (bs->currentEnemy->health > 75 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 2)
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2674
CNSTI4 828
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 2
LEI4 $2674
line 6475
;6475:			{
line 6476
;6476:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_3 && bs->saberPower)
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 828
ADDRLP4 300
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2675
ADDRLP4 300
INDIRP4
CNSTI4 2732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2675
line 6477
;6477:				{ //if we are up against someone with a lot of health and we have a strong attack available, then h4q them
line 6478
;6478:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6479
;6479:				}
line 6480
;6480:			}
ADDRGP4 $2675
JUMPV
LABELV $2674
line 6481
;6481:			else if (bs->currentEnemy->health > 40 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 1)
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 40
LEI4 $2680
CNSTI4 828
ADDRLP4 300
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2680
line 6482
;6482:			{
line 6483
;6483:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_2)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2681
line 6484
;6484:				{ //they're down on health a little, use level 2 if we can
line 6485
;6485:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6486
;6486:				}
line 6487
;6487:			}
ADDRGP4 $2681
JUMPV
LABELV $2680
line 6489
;6488:			else
;6489:			{
line 6490
;6490:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_1)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2686
line 6491
;6491:				{ //they've gone below 40 health, go at them with quick attacks
line 6492
;6492:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6493
;6493:				}
LABELV $2686
line 6494
;6494:			}
LABELV $2681
LABELV $2675
line 6496
;6495:
;6496:			if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $2689
line 6497
;6497:			{
line 6498
;6498:				saberRange *= 3;
ADDRLP4 276
CNSTI4 3
ADDRLP4 276
INDIRI4
MULI4
ASGNI4
line 6499
;6499:			}
LABELV $2689
line 6501
;6500:
;6501:			if (bs->frame_Enemy_Len <= saberRange)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 276
INDIRI4
CVIF4 4
GTF4 $2692
line 6502
;6502:			{
line 6503
;6503:				SaberCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SaberCombatHandling
CALLV
pop
line 6505
;6504:
;6505:				if (bs->frame_Enemy_Len < 80)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $2665
line 6506
;6506:				{
line 6507
;6507:					meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6508
;6508:				}
line 6509
;6509:			}
ADDRGP4 $2665
JUMPV
LABELV $2692
line 6510
;6510:			else if (bs->saberThrowTime < level.time && !bs->cur_ps.saberInFlight &&
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2696
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 304
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
NEI4 $2696
ADDRLP4 304
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
ADDRLP4 308
INDIRI4
EQI4 $2696
ADDRLP4 304
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 312
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $2696
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1145569280
GEF4 $2696
line 6514
;6511:				(bs->cur_ps.fd.forcePowersKnown & (1 << FP_SABERTHROW)) &&
;6512:				InFieldOfVision(bs->viewangles, 30, a_fo) &&
;6513:				bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
;6514:			{
line 6515
;6515:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6516
;6516:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6517
;6517:			}
ADDRGP4 $2665
JUMPV
LABELV $2696
line 6518
;6518:			else if (bs->cur_ps.saberInFlight && bs->frame_Enemy_Len > 300 && bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2665
ADDRLP4 320
ADDRLP4 316
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 320
INDIRF4
CNSTF4 1133903872
LEF4 $2665
ADDRLP4 320
INDIRF4
CNSTF4 1145569280
GEF4 $2665
line 6519
;6519:			{
line 6520
;6520:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6521
;6521:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6522
;6522:			}
line 6523
;6523:		}
ADDRGP4 $2665
JUMPV
LABELV $2664
line 6524
;6524:		else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 1
NEI4 $2701
line 6525
;6525:		{
line 6526
;6526:			if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $2703
line 6527
;6527:			{
line 6528
;6528:				MeleeCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MeleeCombatHandling
CALLV
pop
line 6529
;6529:				meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6530
;6530:			}
LABELV $2703
line 6531
;6531:		}
LABELV $2701
LABELV $2665
line 6532
;6532:	}
LABELV $2662
line 6534
;6533:
;6534:	if (doingFallback && bs->currentEnemy) //just stand and fire if we have no idea where we are
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2705
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2705
line 6535
;6535:	{
line 6536
;6536:		VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 272
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6537
;6537:	}
LABELV $2705
line 6539
;6538:
;6539:	if (bs->forceJumping > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2024
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2707
line 6540
;6540:	{
line 6541
;6541:		VectorCopy(bs->origin, noz_x);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6542
;6542:		VectorCopy(bs->goalPosition, noz_y);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 6544
;6543:
;6544:		noz_x[2] = noz_y[2];
ADDRLP4 36+8
ADDRLP4 68+8
INDIRF4
ASGNF4
line 6546
;6545:
;6546:		VectorSubtract(noz_x, noz_y, noz_x);
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 6548
;6547:
;6548:		if (VectorLength(noz_x) < 32)
ADDRLP4 36
ARGP4
ADDRLP4 272
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 272
INDIRF4
CNSTF4 1107296256
GEF4 $2718
line 6549
;6549:		{
line 6550
;6550:			fjHalt = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 6551
;6551:		}
LABELV $2718
line 6552
;6552:	}
LABELV $2707
line 6554
;6553:
;6554:	if (bs->doChat && bs->chatTime > level.time && (!bs->currentEnemy || !bs->frame_Enemy_Vis))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
CNSTI4 0
ASGNI4
ADDRLP4 272
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 276
INDIRI4
EQI4 $2720
ADDRLP4 272
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2720
ADDRLP4 272
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2723
ADDRLP4 272
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 276
INDIRI4
NEI4 $2720
LABELV $2723
line 6555
;6555:	{
line 6556
;6556:		return;
ADDRGP4 $2324
JUMPV
LABELV $2720
line 6558
;6557:	}
;6558:	else if (bs->doChat && bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $2724
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2724
ADDRLP4 280
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $2724
line 6559
;6559:	{
line 6561
;6560:		//bs->chatTime = level.time + bs->chatTime_stored;
;6561:		bs->doChat = 0; //do we want to keep the bot waiting to chat until after the enemy is gone?
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6562
;6562:		bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6563
;6563:	}
ADDRGP4 $2725
JUMPV
LABELV $2724
line 6564
;6564:	else if (bs->doChat && bs->chatTime <= level.time)
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2726
ADDRLP4 288
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GTF4 $2726
line 6565
;6565:	{
line 6566
;6566:		if (bs->chatTeam)
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2729
line 6567
;6567:		{
line 6568
;6568:			trap_EA_SayTeam(bs->client, bs->currentChat);
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 6569
;6569:			bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6570
;6570:		}
ADDRGP4 $2730
JUMPV
LABELV $2729
line 6572
;6571:		else
;6572:		{
line 6573
;6573:			trap_EA_Say(bs->client, bs->currentChat);
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 6574
;6574:		}
LABELV $2730
line 6575
;6575:		if (bs->doChat == 2)
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2731
line 6576
;6576:		{
line 6577
;6577:			BotReplyGreetings(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotReplyGreetings
CALLV
pop
line 6578
;6578:		}
LABELV $2731
line 6579
;6579:		bs->doChat = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6580
;6580:	}
LABELV $2726
LABELV $2725
line 6582
;6581:
;6582:	CTFFlagMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CTFFlagMovement
CALLV
pop
line 6584
;6583:
;6584:	if (/*bs->wpDestination &&*/ bs->shootGoal &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2733
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
LEI4 $2733
ADDRLP4 292
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
EQI4 $2733
line 6587
;6585:		/*bs->wpDestination->associated_entity == bs->shootGoal->s.number &&*/
;6586:		bs->shootGoal->health > 0 && bs->shootGoal->takedamage)
;6587:	{
line 6588
;6588:		dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 300
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6589
;6589:		dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+4
ADDRLP4 304
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6590
;6590:		dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 308
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 308
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6592
;6591:
;6592:		if (!bs->currentEnemy || bs->frame_Enemy_Len > 256)
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2739
ADDRLP4 312
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
LEF4 $2737
LABELV $2739
line 6593
;6593:		{ //if someone is close then don't stop shooting them for this
line 6594
;6594:			VectorSubtract(dif, bs->eye, a);
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRF4
ADDRLP4 316
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
ADDRLP4 316
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6595
;6595:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6596
;6596:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6598
;6597:
;6598:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 320
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $2744
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 328
CNSTP4 0
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 324
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 324
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 0
EQI4 $2744
line 6600
;6599:				EntityVisibleBox(bs->origin, NULL, NULL, dif, bs->client, bs->shootGoal->s.number))
;6600:			{
line 6601
;6601:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6602
;6602:			}
LABELV $2744
line 6603
;6603:		}
LABELV $2737
line 6604
;6604:	}
LABELV $2733
line 6606
;6605:
;6606:	if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2746
line 6607
;6607:	{ //check if our enemy gets near it and detonate if he does
line 6608
;6608:		BotCheckDetPacks(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckDetPacks
CALLV
pop
line 6609
;6609:	}
ADDRGP4 $2747
JUMPV
LABELV $2746
line 6610
;6610:	else if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number && !bs->frame_Enemy_Vis && bs->plantTime < level.time &&
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
ADDRLP4 300
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2748
ADDRLP4 300
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 304
INDIRP4
INDIRI4
NEI4 $2748
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 300
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
NEI4 $2748
ADDRLP4 300
INDIRP4
CNSTI4 2292
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2748
ADDRLP4 300
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
NEI4 $2748
ADDRLP4 300
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
NEI4 $2748
line 6612
;6611:		!bs->doAttack && !bs->doAltAttack)
;6612:	{
line 6613
;6613:		VectorSubtract(bs->origin, bs->hereWhenSpotted, a);
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 312
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 312
INDIRP4
CNSTI4 1944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 312
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 312
INDIRP4
CNSTI4 1948
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 316
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 316
INDIRP4
CNSTI4 1952
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6615
;6614:
;6615:		if (bs->plantDecided > level.time || (bs->frame_Enemy_Len < BOT_PLANT_DISTANCE*2 && VectorLength(a) < BOT_PLANT_DISTANCE))
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $2756
ADDRLP4 320
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2749
ADDRLP4 0
ARGP4
ADDRLP4 324
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 324
INDIRF4
CNSTF4 1132462080
GEF4 $2749
LABELV $2756
line 6616
;6616:		{
line 6617
;6617:			mineSelect = BotSelectChoiceWeapon(bs, WP_TRIP_MINE, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 328
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 328
INDIRI4
ASGNI4
line 6618
;6618:			detSelect = BotSelectChoiceWeapon(bs, WP_DET_PACK, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 332
INDIRI4
ASGNI4
line 6619
;6619:			if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2757
line 6620
;6620:			{
line 6621
;6621:				detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 6622
;6622:			}
LABELV $2757
line 6624
;6623:
;6624:			if (bs->plantDecided > level.time && bs->forceWeaponSelect &&
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2759
ADDRLP4 340
ADDRLP4 336
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $2759
ADDRLP4 336
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
NEI4 $2759
line 6626
;6625:				bs->cur_ps.weapon == bs->forceWeaponSelect)
;6626:			{
line 6627
;6627:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6628
;6628:				bs->plantDecided = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
CNSTI4 0
ASGNI4
line 6629
;6629:				bs->plantTime = level.time + BOT_PLANT_INTERVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2292
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 6630
;6630:				bs->plantContinue = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 6631
;6631:				bs->beStill = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6632
;6632:			}
ADDRGP4 $2749
JUMPV
LABELV $2759
line 6633
;6633:			else if (mineSelect || detSelect)
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $2767
ADDRLP4 140
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $2749
LABELV $2767
line 6634
;6634:			{
line 6635
;6635:				if (BotSurfaceNear(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotSurfaceNear
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $2749
line 6636
;6636:				{
line 6637
;6637:					if (!mineSelect)
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $2770
line 6638
;6638:					{ //if no mines use detpacks, otherwise use mines
line 6639
;6639:						mineSelect = WP_DET_PACK;
ADDRLP4 156
CNSTI4 13
ASGNI4
line 6640
;6640:					}
ADDRGP4 $2771
JUMPV
LABELV $2770
line 6642
;6641:					else
;6642:					{
line 6643
;6643:						mineSelect = WP_TRIP_MINE;
ADDRLP4 156
CNSTI4 12
ASGNI4
line 6644
;6644:					}
LABELV $2771
line 6646
;6645:
;6646:					detSelect = BotSelectChoiceWeapon(bs, mineSelect, 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 352
INDIRI4
ASGNI4
line 6648
;6647:
;6648:					if (detSelect && detSelect != 2)
ADDRLP4 356
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $2772
ADDRLP4 356
INDIRI4
CNSTI4 2
EQI4 $2772
line 6649
;6649:					{ //We have it and it is now our weapon
line 6650
;6650:						bs->plantDecided = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 6651
;6651:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 6652
;6652:						return;
ADDRGP4 $2324
JUMPV
LABELV $2772
line 6654
;6653:					}
;6654:					else if (detSelect == 2)
ADDRLP4 140
INDIRI4
CNSTI4 2
NEI4 $2749
line 6655
;6655:					{
line 6656
;6656:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 6657
;6657:						return;
ADDRGP4 $2324
JUMPV
line 6659
;6658:					}
;6659:				}
line 6660
;6660:			}
line 6661
;6661:		}
line 6662
;6662:	}
LABELV $2748
line 6663
;6663:	else if (bs->plantContinue < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2777
line 6664
;6664:	{
line 6665
;6665:		bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 6666
;6666:	}
LABELV $2777
LABELV $2749
LABELV $2747
line 6668
;6667:
;6668:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster && bs->jmState == -1 && gJMSaberEnt && gJMSaberEnt->inuse)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2780
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 316
INDIRI4
NEI4 $2780
ADDRLP4 312
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $2780
ADDRLP4 320
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2780
ADDRLP4 320
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 316
INDIRI4
EQI4 $2780
line 6669
;6669:	{
line 6671
;6670:		vec3_t saberLen;
;6671:		float fSaberLen = 0;
ADDRLP4 336
CNSTF4 0
ASGNF4
line 6673
;6672:
;6673:		VectorSubtract(bs->origin, gJMSaberEnt->r.currentOrigin, saberLen);
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 324
ADDRLP4 340
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 324+4
ADDRLP4 340
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 324+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6674
;6674:		fSaberLen = VectorLength(saberLen);
ADDRLP4 324
ARGP4
ADDRLP4 348
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 336
ADDRLP4 348
INDIRF4
ASGNF4
line 6676
;6675:
;6676:		if (fSaberLen < 256)
ADDRLP4 336
INDIRF4
CNSTF4 1132462080
GEF4 $2785
line 6677
;6677:		{
line 6678
;6678:			if (OrgVisible(bs->origin, gJMSaberEnt->r.currentOrigin, bs->client))
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 356
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $2787
line 6679
;6679:			{
line 6680
;6680:				VectorCopy(gJMSaberEnt->r.currentOrigin, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 6681
;6681:			}
LABELV $2787
line 6682
;6682:		}
LABELV $2785
line 6683
;6683:	}
LABELV $2780
line 6685
;6684:
;6685:	if (bs->beStill < level.time && !WaitingForNow(bs, bs->goalPosition) && !fjHalt)
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2789
ADDRLP4 324
INDIRP4
ARGP4
ADDRLP4 324
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 328
ADDRGP4 WaitingForNow
CALLI4
ASGNI4
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRLP4 328
INDIRI4
ADDRLP4 332
INDIRI4
NEI4 $2789
ADDRLP4 96
INDIRI4
ADDRLP4 332
INDIRI4
NEI4 $2789
line 6686
;6686:	{
line 6687
;6687:		VectorSubtract(bs->goalPosition, bs->origin, bs->goalMovedir);
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 1908
ADDP4
ADDRLP4 336
INDIRP4
CNSTI4 1920
ADDP4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 1912
ADDP4
ADDRLP4 340
INDIRP4
CNSTI4 1924
ADDP4
INDIRF4
ADDRLP4 340
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 1916
ADDP4
ADDRLP4 344
INDIRP4
CNSTI4 1928
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6688
;6688:		VectorNormalize(bs->goalMovedir);
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6690
;6689:
;6690:		if (bs->jumpTime > level.time && bs->jDelay < level.time &&
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2792
ADDRLP4 348
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2792
CNSTI4 1800
ADDRLP4 348
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $2792
line 6692
;6691:			level.clients[bs->client].pers.cmd.upmove > 0)
;6692:		{
line 6694
;6693:		//	trap_EA_Move(bs->client, bs->origin, 5000);
;6694:			bs->beStill = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 6695
;6695:		}
ADDRGP4 $2793
JUMPV
LABELV $2792
line 6697
;6696:		else
;6697:		{
line 6698
;6698:			trap_EA_Move(bs->client, bs->goalMovedir, 5000);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 352
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
CNSTF4 1167867904
ARGF4
ADDRGP4 trap_EA_Move
CALLV
pop
line 6699
;6699:		}
LABELV $2793
line 6701
;6700:
;6701:		if (meleestrafe)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2797
line 6702
;6702:		{
line 6703
;6703:			StrafeTracing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StrafeTracing
CALLV
pop
line 6704
;6704:		}
LABELV $2797
line 6706
;6705:
;6706:		if (bs->meleeStrafeDir && meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
CNSTI4 0
ASGNI4
ADDRLP4 352
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ADDRLP4 356
INDIRI4
EQI4 $2799
ADDRLP4 92
INDIRI4
ADDRLP4 356
INDIRI4
EQI4 $2799
ADDRLP4 352
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2799
line 6707
;6707:		{
line 6708
;6708:			trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6709
;6709:		}
ADDRGP4 $2800
JUMPV
LABELV $2799
line 6710
;6710:		else if (meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2802
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2802
line 6711
;6711:		{
line 6712
;6712:			trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6713
;6713:		}
LABELV $2802
LABELV $2800
line 6715
;6714:
;6715:		if (BotTrace_Jump(bs, bs->goalPosition))
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 364
ADDRGP4 BotTrace_Jump
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
EQI4 $2805
line 6716
;6716:		{
line 6717
;6717:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6718
;6718:		}
ADDRGP4 $2806
JUMPV
LABELV $2805
line 6719
;6719:		else if (BotTrace_Duck(bs, bs->goalPosition))
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
INDIRP4
ARGP4
ADDRLP4 368
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 372
ADDRGP4 BotTrace_Duck
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $2808
line 6720
;6720:		{
line 6721
;6721:			bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6722
;6722:		}
ADDRGP4 $2809
JUMPV
LABELV $2808
line 6725
;6723:#ifdef BOT_STRAFE_AVOIDANCE
;6724:		else
;6725:		{
line 6726
;6726:			int strafeAround = BotTrace_Strafe(bs, bs->goalPosition);
ADDRLP4 380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 380
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 384
ADDRGP4 BotTrace_Strafe
CALLI4
ASGNI4
ADDRLP4 376
ADDRLP4 384
INDIRI4
ASGNI4
line 6728
;6727:
;6728:			if (strafeAround == STRAFEAROUND_RIGHT)
ADDRLP4 376
INDIRI4
CNSTI4 1
NEI4 $2811
line 6729
;6729:			{
line 6730
;6730:				trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6731
;6731:			}
ADDRGP4 $2812
JUMPV
LABELV $2811
line 6732
;6732:			else if (strafeAround == STRAFEAROUND_LEFT)
ADDRLP4 376
INDIRI4
CNSTI4 2
NEI4 $2813
line 6733
;6733:			{
line 6734
;6734:				trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6735
;6735:			}
LABELV $2813
LABELV $2812
line 6736
;6736:		}
LABELV $2809
LABELV $2806
line 6738
;6737:#endif
;6738:	}
LABELV $2789
line 6741
;6739:
;6740:#ifndef FORCEJUMP_INSTANTMETHOD
;6741:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2815
line 6742
;6742:	{
line 6743
;6743:		bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 6744
;6744:	}
LABELV $2815
line 6747
;6745:#endif
;6746:
;6747:	if (bs->jumpPrep > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2818
line 6748
;6748:	{
line 6749
;6749:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6750
;6750:	}
LABELV $2818
line 6752
;6751:
;6752:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2821
line 6753
;6753:	{
line 6754
;6754:		bs->jumpHoldTime = ((bs->forceJumpChargeTime - level.time)/2) + level.time;
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 2016
ADDP4
ADDRLP4 336
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDRGP4 level+32
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 6755
;6755:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6756
;6756:	}
LABELV $2821
line 6758
;6757:
;6758:	if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2826
line 6759
;6759:	{
line 6760
;6760:		bs->jumpTime = bs->jumpHoldTime;
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 2012
ADDP4
ADDRLP4 336
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ASGNF4
line 6761
;6761:	}
LABELV $2826
line 6763
;6762:
;6763:	if (bs->jumpTime > level.time && bs->jDelay < level.time)
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2829
ADDRLP4 336
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2829
line 6764
;6764:	{
line 6765
;6765:		if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2833
line 6766
;6766:		{
line 6767
;6767:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6768
;6768:			if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2836
line 6769
;6769:			{
line 6770
;6770:				if ((bs->wpCurrent->origin[2] - bs->origin[2]) < 64)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 340
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1115684864
GEF4 $2837
line 6771
;6771:				{
line 6772
;6772:					trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6773
;6773:				}
line 6774
;6774:			}
ADDRGP4 $2837
JUMPV
LABELV $2836
line 6776
;6775:			else
;6776:			{
line 6777
;6777:				trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6778
;6778:			}
LABELV $2837
line 6779
;6779:			if (g_entities[bs->client].client->ps.groundEntityNum == ENTITYNUM_NONE)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2834
line 6780
;6780:			{
line 6781
;6781:				g_entities[bs->client].client->ps.pm_flags |= PMF_JUMP_HELD;
ADDRLP4 340
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 6782
;6782:			}
line 6783
;6783:		}
ADDRGP4 $2834
JUMPV
LABELV $2833
line 6784
;6784:		else if (!(bs->cur_ps.pm_flags & PMF_JUMP_HELD))
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2844
line 6785
;6785:		{
line 6786
;6786:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6787
;6787:		}
LABELV $2844
LABELV $2834
line 6788
;6788:	}
LABELV $2829
line 6790
;6789:
;6790:	if (bs->duckTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2846
line 6791
;6791:	{
line 6792
;6792:		trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 6793
;6793:	}
LABELV $2846
line 6795
;6794:
;6795:	if ( bs->dangerousObject && bs->dangerousObject->inuse && bs->dangerousObject->health > 0 &&
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
ADDRLP4 340
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 348
CNSTU4 0
ASGNU4
ADDRLP4 344
INDIRP4
CVPU4 4
ADDRLP4 348
INDIRU4
EQU4 $2849
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRLP4 344
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
EQI4 $2849
ADDRLP4 344
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
LEI4 $2849
ADDRLP4 344
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
EQI4 $2849
ADDRLP4 340
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
EQI4 $2851
ADDRLP4 340
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 348
INDIRU4
NEU4 $2849
LABELV $2851
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 2
EQI4 $2852
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 3
NEI4 $2849
LABELV $2852
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
ADDRLP4 364
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 13
EQI4 $2849
ADDRLP4 368
INDIRI4
CNSTI4 12
EQI4 $2849
ADDRLP4 364
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2849
line 6800
;6796:		bs->dangerousObject->takedamage && (!bs->frame_Enemy_Vis || !bs->currentEnemy) &&
;6797:		(BotGetWeaponRange(bs) == BWEAPONRANGE_MID || BotGetWeaponRange(bs) == BWEAPONRANGE_LONG) &&
;6798:		bs->cur_ps.weapon != WP_DET_PACK && bs->cur_ps.weapon != WP_TRIP_MINE &&
;6799:		!bs->shootGoal )
;6800:	{
line 6803
;6801:		float danLen;
;6802:
;6803:		VectorSubtract(bs->dangerousObject->r.currentOrigin, bs->eye, a);
ADDRLP4 376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 380
ADDRLP4 376
INDIRP4
CNSTI4 1848
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 380
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 376
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 380
INDIRP4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 376
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 384
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 384
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 384
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6805
;6804:
;6805:		danLen = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 388
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 372
ADDRLP4 388
INDIRF4
ASGNF4
line 6807
;6806:
;6807:		if (danLen > 256)
ADDRLP4 372
INDIRF4
CNSTF4 1132462080
LEF4 $2855
line 6808
;6808:		{
line 6809
;6809:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6810
;6810:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6812
;6811:
;6812:			if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 392
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 5
GEI4 $2857
line 6813
;6813:			{
line 6814
;6814:				bs->goalAngles[YAW] += Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 396
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 400
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 400
INDIRP4
ADDRLP4 400
INDIRP4
INDIRF4
ADDRLP4 396
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6815
;6815:				bs->goalAngles[PITCH] += Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 404
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 408
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 408
INDIRP4
ADDRLP4 408
INDIRP4
INDIRF4
ADDRLP4 404
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6816
;6816:			}
ADDRGP4 $2858
JUMPV
LABELV $2857
line 6818
;6817:			else
;6818:			{
line 6819
;6819:				bs->goalAngles[YAW] -= Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 396
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 400
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 400
INDIRP4
ADDRLP4 400
INDIRP4
INDIRF4
ADDRLP4 396
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6820
;6820:				bs->goalAngles[PITCH] -= Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 404
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 408
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 408
INDIRP4
ADDRLP4 408
INDIRP4
INDIRF4
ADDRLP4 404
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6821
;6821:			}
LABELV $2858
line 6823
;6822:
;6823:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 396
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $2859
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 404
CNSTP4 0
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 408
ADDRLP4 400
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 408
INDIRP4
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
EQI4 $2859
line 6825
;6824:				EntityVisibleBox(bs->origin, NULL, NULL, bs->dangerousObject->r.currentOrigin, bs->client, bs->dangerousObject->s.number))
;6825:			{
line 6826
;6826:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6827
;6827:			}			
LABELV $2859
line 6828
;6828:		}
LABELV $2855
line 6829
;6829:	}
LABELV $2849
line 6831
;6830:
;6831:	if (PrimFiring(bs) ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 372
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
NEI4 $2863
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $2861
LABELV $2863
line 6833
;6832:		AltFiring(bs))
;6833:	{
line 6834
;6834:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 380
INDIRP4
ASGNP4
line 6836
;6835:
;6836:		if (friendInLOF)
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2862
line 6837
;6837:		{
line 6838
;6838:			if (PrimFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $2866
line 6839
;6839:			{
line 6840
;6840:				KeepPrimFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepPrimFromFiring
CALLI4
pop
line 6841
;6841:			}
LABELV $2866
line 6842
;6842:			if (AltFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 388
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $2868
line 6843
;6843:			{
line 6844
;6844:				KeepAltFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepAltFromFiring
CALLI4
pop
line 6845
;6845:			}
LABELV $2868
line 6846
;6846:			if (useTheForce && forceHostile)
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $2870
ADDRLP4 16
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $2870
line 6847
;6847:			{
line 6848
;6848:				useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6849
;6849:			}
LABELV $2870
line 6851
;6850:
;6851:			if (!useTheForce && friendInLOF->client)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2862
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2862
line 6852
;6852:			{ //we have a friend here and are not currently using force powers, see if we can help them out
line 6853
;6853:				if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2874
ADDRLP4 396
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 396
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 396
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+44
ADDP4
INDIRI4
LEI4 $2874
line 6854
;6854:				{
line 6855
;6855:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6856
;6856:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6857
;6857:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6858
;6858:				}
ADDRGP4 $2862
JUMPV
LABELV $2874
line 6859
;6859:				else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 400
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 400
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2862
ADDRLP4 404
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 404
INDIRP4
ADDRLP4 400
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 404
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+48
ADDP4
INDIRI4
LEI4 $2862
line 6860
;6860:				{
line 6861
;6861:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6862
;6862:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6863
;6863:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6864
;6864:				}
line 6865
;6865:			}
line 6866
;6866:		}
line 6867
;6867:	}
ADDRGP4 $2862
JUMPV
LABELV $2861
line 6868
;6868:	else if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $2880
line 6869
;6869:	{ //still check for anyone to help..
line 6870
;6870:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 380
INDIRP4
ASGNP4
line 6872
;6871:
;6872:		if (!useTheForce && friendInLOF)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2883
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2883
line 6873
;6873:		{
line 6874
;6874:			if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2885
ADDRLP4 384
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 384
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+44
ADDP4
INDIRI4
LEI4 $2885
line 6875
;6875:			{
line 6876
;6876:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6877
;6877:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6878
;6878:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6879
;6879:			}
ADDRGP4 $2886
JUMPV
LABELV $2885
line 6880
;6880:			else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 388
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2888
ADDRLP4 392
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 392
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 392
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+48
ADDP4
INDIRI4
LEI4 $2888
line 6881
;6881:			{
line 6882
;6882:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6883
;6883:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6884
;6884:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6885
;6885:			}
LABELV $2888
LABELV $2886
line 6886
;6886:		}
LABELV $2883
line 6887
;6887:	}
LABELV $2880
LABELV $2862
line 6889
;6888:
;6889:	if (bs->doAttack && bs->cur_ps.weapon == WP_DET_PACK &&
ADDRLP4 380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 384
CNSTI4 0
ASGNI4
ADDRLP4 380
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 384
INDIRI4
EQI4 $2891
ADDRLP4 380
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2891
ADDRLP4 380
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 384
INDIRI4
EQI4 $2891
line 6891
;6890:		bs->cur_ps.hasDetPackPlanted)
;6891:	{ //maybe a bit hackish, but bots only want to plant one of these at any given time to avoid complications
line 6892
;6892:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6893
;6893:	}
LABELV $2891
line 6895
;6894:
;6895:	if (bs->doAttack && bs->cur_ps.weapon == WP_SABER &&
ADDRLP4 388
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRLP4 388
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $2893
ADDRLP4 388
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2893
ADDRLP4 388
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $2893
ADDRLP4 396
ADDRLP4 388
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 400
CNSTU4 0
ASGNU4
ADDRLP4 396
INDIRP4
CVPU4 4
ADDRLP4 400
INDIRU4
EQU4 $2893
ADDRLP4 404
ADDRLP4 396
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 404
INDIRP4
CVPU4 4
ADDRLP4 400
INDIRU4
EQU4 $2893
ADDRLP4 404
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 BotWeaponBlockable
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
EQI4 $2893
line 6898
;6896:		bs->saberDefending && bs->currentEnemy && bs->currentEnemy->client &&
;6897:		BotWeaponBlockable(bs->currentEnemy->client->ps.weapon) )
;6898:	{
line 6899
;6899:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6900
;6900:	}
LABELV $2893
line 6902
;6901:
;6902:	if (bs->cur_ps.saberLockTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2895
line 6903
;6903:	{
line 6904
;6904:		if (rand()%10 < 5)
ADDRLP4 412
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2898
line 6905
;6905:		{
line 6906
;6906:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6907
;6907:		}
ADDRGP4 $2899
JUMPV
LABELV $2898
line 6909
;6908:		else
;6909:		{
line 6910
;6910:			bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6911
;6911:		}
LABELV $2899
line 6912
;6912:	}
LABELV $2895
line 6914
;6913:
;6914:	if (bs->botChallengingTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2900
line 6915
;6915:	{
line 6916
;6916:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6917
;6917:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6918
;6918:	}
LABELV $2900
line 6920
;6919:
;6920:	if (bs->doAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2903
line 6921
;6921:	{
line 6922
;6922:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 6923
;6923:	}
ADDRGP4 $2904
JUMPV
LABELV $2903
line 6924
;6924:	else if (bs->doAltAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2905
line 6925
;6925:	{
line 6926
;6926:		trap_EA_Alt_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Alt_Attack
CALLV
pop
line 6927
;6927:	}
LABELV $2905
LABELV $2904
line 6929
;6928:
;6929:	if (useTheForce && forceHostile && bs->botChallengingTime > level.time)
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 412
INDIRI4
EQI4 $2907
ADDRLP4 16
INDIRI4
ADDRLP4 412
INDIRI4
EQI4 $2907
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2907
line 6930
;6930:	{
line 6931
;6931:		useTheForce = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6932
;6932:	}
LABELV $2907
line 6934
;6933:
;6934:	if (useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2910
line 6935
;6935:	{
line 6937
;6936:#ifndef FORCEJUMP_INSTANTMETHOD
;6937:		if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2912
line 6938
;6938:		{
line 6939
;6939:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_LEVITATION;
CNSTI4 1800
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 1
ASGNI4
line 6940
;6940:			trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6941
;6941:		}
ADDRGP4 $2913
JUMPV
LABELV $2912
line 6943
;6942:		else
;6943:		{
line 6945
;6944:#endif
;6945:			if (bot_forcepowers.integer && !g_forcePowerDisable.integer)
ADDRLP4 416
CNSTI4 0
ASGNI4
ADDRGP4 bot_forcepowers+12
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $2915
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ADDRLP4 416
INDIRI4
NEI4 $2915
line 6946
;6946:			{
line 6947
;6947:				trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6948
;6948:			}
LABELV $2915
line 6950
;6949:#ifndef FORCEJUMP_INSTANTMETHOD
;6950:		}
LABELV $2913
line 6952
;6951:#endif
;6952:	}
LABELV $2910
line 6954
;6953:
;6954:	MoveTowardIdealAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveTowardIdealAngles
CALLV
pop
line 6955
;6955:}
LABELV $2324
endproc StandardBotAI 420 24
bss
align 4
LABELV $2920
skip 4
align 4
LABELV $2921
skip 4
align 4
LABELV $2922
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 24 12
line 6963
;6956://end rww
;6957:
;6958:/*
;6959:==================
;6960:BotAIStartFrame
;6961:==================
;6962:*/
;6963:int BotAIStartFrame(int time) {
line 6970
;6964:	int i;
;6965:	int elapsed_time, thinktime;
;6966:	static int local_time;
;6967:	static int botlib_residual;
;6968:	static int lastbotthink_time;
;6969:
;6970:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 6973
;6971:
;6972:	//rww - addl bot frame functions
;6973:	if (gBotEdit)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
EQF4 $2923
line 6974
;6974:	{
line 6975
;6975:		trap_Cvar_Update(&bot_wp_info);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 6976
;6976:		BotWaypointRender();
ADDRGP4 BotWaypointRender
CALLV
pop
line 6977
;6977:	}
LABELV $2923
line 6979
;6978:
;6979:	UpdateEventTracker();
ADDRGP4 UpdateEventTracker
CALLV
pop
line 6984
;6980:	//end rww
;6981:
;6982:	//cap the bot think time
;6983:	//if the bot think time changed we should reschedule the bots
;6984:	if (BOT_THINK_TIME != lastbotthink_time) {
ADDRGP4 $2922
INDIRI4
CNSTI4 0
EQI4 $2925
line 6985
;6985:		lastbotthink_time = BOT_THINK_TIME;
ADDRGP4 $2922
CNSTI4 0
ASGNI4
line 6986
;6986:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 6987
;6987:	}
LABELV $2925
line 6989
;6988:
;6989:	elapsed_time = time - local_time;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ADDRGP4 $2920
INDIRI4
SUBI4
ASGNI4
line 6990
;6990:	local_time = time;
ADDRGP4 $2920
ADDRFP4 0
INDIRI4
ASGNI4
line 6992
;6991:
;6992:	if (elapsed_time > BOT_THINK_TIME) thinktime = elapsed_time;
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $2927
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2928
JUMPV
LABELV $2927
line 6993
;6993:	else thinktime = BOT_THINK_TIME;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2928
line 6996
;6994:
;6995:	// execute scheduled bot AI
;6996:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2929
line 6997
;6997:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2935
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2933
LABELV $2935
line 6998
;6998:			continue;
ADDRGP4 $2930
JUMPV
LABELV $2933
line 7001
;6999:		}
;7000:		//
;7001:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 7003
;7002:		//
;7003:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2936
line 7004
;7004:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 7006
;7005:
;7006:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2938
line 7007
;7007:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 7008
;7008:			}
LABELV $2938
line 7009
;7009:		}
LABELV $2936
line 7010
;7010:	}
LABELV $2930
line 6996
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2929
line 7013
;7011:
;7012:	// execute bot user commands every frame
;7013:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2941
line 7014
;7014:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2947
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2945
LABELV $2947
line 7015
;7015:			continue;
ADDRGP4 $2942
JUMPV
LABELV $2945
line 7017
;7016:		}
;7017:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2948
line 7018
;7018:			continue;
ADDRGP4 $2942
JUMPV
LABELV $2948
line 7021
;7019:		}
;7020:
;7021:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 7022
;7022:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 7023
;7023:	}
LABELV $2942
line 7013
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2941
line 7025
;7024:
;7025:	return qtrue;
CNSTI4 1
RETI4
LABELV $2919
endproc BotAIStartFrame 24 12
export BotAISetup
proc BotAISetup 4 16
line 7033
;7026:}
;7027:
;7028:/*
;7029:==============
;7030:BotAISetup
;7031:==============
;7032:*/
;7033:int BotAISetup( int restart ) {
line 7035
;7034:	//rww - new bot cvars..
;7035:	trap_Cvar_Register(&bot_forcepowers, "bot_forcepowers", "1", CVAR_CHEAT);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 $2952
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7036
;7036:	trap_Cvar_Register(&bot_forgimmick, "bot_forgimmick", "0", CVAR_CHEAT);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 $2954
ARGP4
ADDRGP4 $2955
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7037
;7037:	trap_Cvar_Register(&bot_honorableduelacceptance, "bot_honorableduelacceptance", "0", CVAR_CHEAT);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 $2956
ARGP4
ADDRGP4 $2955
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7043
;7038:#ifdef _DEBUG
;7039:	trap_Cvar_Register(&bot_nogoals, "bot_nogoals", "0", CVAR_CHEAT);
;7040:	trap_Cvar_Register(&bot_debugmessages, "bot_debugmessages", "0", CVAR_CHEAT);
;7041:#endif
;7042:
;7043:	trap_Cvar_Register(&bot_attachments, "bot_attachments", "1", 0);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 $2957
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7044
;7044:	trap_Cvar_Register(&bot_camp, "bot_camp", "1", 0);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 $2958
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7046
;7045:
;7046:	trap_Cvar_Register(&bot_wp_info, "bot_wp_info", "1", 0);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 $2959
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7047
;7047:	trap_Cvar_Register(&bot_wp_edit, "bot_wp_edit", "0", CVAR_CHEAT);
ADDRGP4 bot_wp_edit
ARGP4
ADDRGP4 $2960
ARGP4
ADDRGP4 $2955
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7048
;7048:	trap_Cvar_Register(&bot_wp_clearweight, "bot_wp_clearweight", "1", 0);
ADDRGP4 bot_wp_clearweight
ARGP4
ADDRGP4 $2961
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7049
;7049:	trap_Cvar_Register(&bot_wp_distconnect, "bot_wp_distconnect", "1", 0);
ADDRGP4 bot_wp_distconnect
ARGP4
ADDRGP4 $2962
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7050
;7050:	trap_Cvar_Register(&bot_wp_visconnect, "bot_wp_visconnect", "1", 0);
ADDRGP4 bot_wp_visconnect
ARGP4
ADDRGP4 $2963
ARGP4
ADDRGP4 $2953
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7052
;7051:
;7052:	trap_Cvar_Update(&bot_forcepowers);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7056
;7053:	//end rww
;7054:
;7055:	//if the game is restarted for a tournament
;7056:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2964
line 7057
;7057:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2951
JUMPV
LABELV $2964
line 7061
;7058:	}
;7059:
;7060:	//initialize the bot states
;7061:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7063
;7062:
;7063:	if (!trap_BotLibSetup())
ADDRLP4 0
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2966
line 7064
;7064:	{
line 7065
;7065:		return qfalse; //wts?!
CNSTI4 0
RETI4
ADDRGP4 $2951
JUMPV
LABELV $2966
line 7068
;7066:	}
;7067:
;7068:	return qtrue;
CNSTI4 1
RETI4
LABELV $2951
endproc BotAISetup 4 16
export BotAIShutdown
proc BotAIShutdown 8 8
line 7076
;7069:}
;7070:
;7071:/*
;7072:==============
;7073:BotAIShutdown
;7074:==============
;7075:*/
;7076:int BotAIShutdown( int restart ) {
line 7081
;7077:
;7078:	int i;
;7079:
;7080:	//if the game is restarted for a tournament
;7081:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2969
line 7083
;7082:		//shutdown all the bots in the botlib
;7083:		for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2971
line 7084
;7084:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2975
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2975
line 7085
;7085:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 7086
;7086:			}
LABELV $2975
line 7087
;7087:		}
LABELV $2972
line 7083
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2971
line 7089
;7088:		//don't shutdown the bot library
;7089:	}
ADDRGP4 $2970
JUMPV
LABELV $2969
line 7090
;7090:	else {
line 7091
;7091:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 7092
;7092:	}
LABELV $2970
line 7093
;7093:	return qtrue;
CNSTI4 1
RETI4
LABELV $2968
endproc BotAIShutdown 8 8
import G_ThereIsAMaster
import WP_ForcePowerUsable
import ExitLevel
bss
export droppedBlueFlag
align 4
LABELV droppedBlueFlag
skip 4
export droppedRedFlag
align 4
LABELV droppedRedFlag
skip 4
export gBotEventTracker
align 4
LABELV gBotEventTracker
skip 512
import imperial_attackers
import rebel_attackers
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 128
import forceJumpStrength
import forceJumpHeight
import forcePowerNeeded
import g_MaxHolocronCarry
export floattime
align 4
LABELV floattime
skip 4
import gLevelFlags
import nodenum
import nodetable
import gLastPrintedIndex
import gWPNum
import gWPArray
import gWPRenderedFrame
import gBotEdit
import gDeactivated
import gWPRenderTime
import gBotChatBuffer
export eFlagBlue
align 4
LABELV eFlagBlue
skip 4
export eFlagRed
align 4
LABELV eFlagRed
skip 4
export oFlagBlue
align 4
LABELV oFlagBlue
skip 4
export flagBlue
align 4
LABELV flagBlue
skip 4
export oFlagRed
align 4
LABELV oFlagRed
skip 4
export flagRed
align 4
LABELV flagRed
skip 4
export bot_wp_visconnect
align 4
LABELV bot_wp_visconnect
skip 272
export bot_wp_distconnect
align 4
LABELV bot_wp_distconnect
skip 272
export bot_wp_clearweight
align 4
LABELV bot_wp_clearweight
skip 272
export bot_wp_edit
align 4
LABELV bot_wp_edit
skip 272
export bot_wp_info
align 4
LABELV bot_wp_info
skip 272
export bot_camp
align 4
LABELV bot_camp
skip 272
export bot_attachments
align 4
LABELV bot_attachments
skip 272
export bot_honorableduelacceptance
align 4
LABELV bot_honorableduelacceptance
skip 272
export bot_forgimmick
align 4
LABELV bot_forgimmick
skip 272
export bot_forcepowers
align 4
LABELV bot_forcepowers
skip 272
import ConcatArgs
import BotWaypointRender
import BotDoChat
import BotUtilizePersonality
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_ForcePower
import EA_Alt_Attack
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import B_CleanupAlloc
import B_InitAlloc
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $2963
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 118
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $2962
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 100
char 1 105
char 1 115
char 1 116
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $2961
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 99
char 1 108
char 1 101
char 1 97
char 1 114
char 1 119
char 1 101
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $2960
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 101
char 1 100
char 1 105
char 1 116
char 1 0
align 1
LABELV $2959
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $2958
char 1 98
char 1 111
char 1 116
char 1 95
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $2957
char 1 98
char 1 111
char 1 116
char 1 95
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 104
char 1 109
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $2956
char 1 98
char 1 111
char 1 116
char 1 95
char 1 104
char 1 111
char 1 110
char 1 111
char 1 114
char 1 97
char 1 98
char 1 108
char 1 101
char 1 100
char 1 117
char 1 101
char 1 108
char 1 97
char 1 99
char 1 99
char 1 101
char 1 112
char 1 116
char 1 97
char 1 110
char 1 99
char 1 101
char 1 0
align 1
LABELV $2955
char 1 48
char 1 0
align 1
LABELV $2954
char 1 98
char 1 111
char 1 116
char 1 95
char 1 102
char 1 111
char 1 114
char 1 103
char 1 105
char 1 109
char 1 109
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $2953
char 1 49
char 1 0
align 1
LABELV $2952
char 1 98
char 1 111
char 1 116
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2491
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $2488
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 72
char 1 97
char 1 116
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 0
align 1
LABELV $2352
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 79
char 1 110
char 1 80
char 1 117
char 1 114
char 1 112
char 1 111
char 1 115
char 1 101
char 1 66
char 1 121
char 1 76
char 1 111
char 1 118
char 1 101
char 1 0
align 1
LABELV $2349
char 1 68
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $2263
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $2245
char 1 102
char 1 114
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $2220
char 1 82
char 1 101
char 1 115
char 1 112
char 1 111
char 1 110
char 1 115
char 1 101
char 1 71
char 1 114
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $2122
char 1 66
char 1 101
char 1 108
char 1 111
char 1 118
char 1 101
char 1 100
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $2119
char 1 72
char 1 97
char 1 116
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $2112
char 1 76
char 1 111
char 1 118
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 76
char 1 111
char 1 118
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 0
align 1
LABELV $450
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 0
align 1
LABELV $387
char 1 71
char 1 101
char 1 110
char 1 101
char 1 114
char 1 97
char 1 108
char 1 71
char 1 114
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $381
char 1 66
char 1 111
char 1 116
char 1 65
char 1 73
char 1 83
char 1 101
char 1 116
char 1 117
char 1 112
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 58
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 100
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 10
char 1 0
align 1
LABELV $353
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 76
char 1 101
char 1 118
char 1 101
char 1 108
char 1 83
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $350
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $347
char 1 99
char 1 115
char 1 0
align 1
LABELV $344
char 1 99
char 1 112
char 1 32
char 1 0
align 1
LABELV $336
char 1 66
char 1 111
char 1 116
char 1 65
char 1 73
char 1 58
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 10
char 1 0
align 1
LABELV $160
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 65
char 1 99
char 1 99
char 1 101
char 1 112
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $100
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 101
char 1 109
char 1 112
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 114
char 1 111
char 1 117
char 1 112
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 109
char 1 32
char 1 97
char 1 32
char 1 110
char 1 101
char 1 119
char 1 32
char 1 115
char 1 113
char 1 117
char 1 97
char 1 100
char 1 0
align 1
LABELV $99
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 121
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $98
char 1 73
char 1 39
char 1 109
char 1 32
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 121
char 1 32
char 1 115
char 1 113
char 1 117
char 1 97
char 1 100
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $97
char 1 73
char 1 39
char 1 109
char 1 32
char 1 112
char 1 114
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 32
char 1 102
char 1 114
char 1 111
char 1 109
char 1 32
char 1 99
char 1 111
char 1 109
char 1 112
char 1 108
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 105
char 1 114
char 1 32
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $96
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 101
char 1 109
char 1 116
char 1 112
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 99
char 1 111
char 1 109
char 1 112
char 1 108
char 1 101
char 1 116
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 32
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $95
char 1 73
char 1 39
char 1 118
char 1 101
char 1 32
char 1 103
char 1 111
char 1 116
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 39
char 1 115
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $94
char 1 73
char 1 39
char 1 109
char 1 32
char 1 101
char 1 115
char 1 99
char 1 111
char 1 114
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 32
char 1 99
char 1 97
char 1 114
char 1 114
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $93
char 1 73
char 1 39
char 1 109
char 1 32
char 1 103
char 1 101
char 1 116
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 32
char 1 98
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $92
char 1 73
char 1 39
char 1 109
char 1 32
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $91
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 39
char 1 115
char 1 32
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $90
char 1 73
char 1 39
char 1 109
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 99
char 1 99
char 1 117
char 1 112
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $89
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 77
char 1 65
char 1 88
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $88
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 71
char 1 69
char 1 84
char 1 70
char 1 76
char 1 65
char 1 71
char 1 72
char 1 79
char 1 77
char 1 69
char 1 0
align 1
LABELV $87
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 71
char 1 85
char 1 65
char 1 82
char 1 68
char 1 67
char 1 65
char 1 82
char 1 82
char 1 73
char 1 69
char 1 82
char 1 0
align 1
LABELV $86
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 82
char 1 69
char 1 84
char 1 82
char 1 73
char 1 69
char 1 86
char 1 65
char 1 76
char 1 0
align 1
LABELV $85
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 68
char 1 69
char 1 70
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 0
align 1
LABELV $84
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 65
char 1 84
char 1 84
char 1 65
char 1 67
char 1 75
char 1 69
char 1 82
char 1 0
align 1
LABELV $83
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 78
char 1 79
char 1 78
char 1 69
char 1 0
