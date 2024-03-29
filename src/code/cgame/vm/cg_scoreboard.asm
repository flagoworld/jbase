code
proc CG_DrawClientScore 44 36
file "../cg_scoreboard.c"
line 62
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_scoreboard -- draw the scoreboard on top of the game screen
;4:#include "cg_local.h"
;5:#include "../ui/ui_shared.h"
;6:
;7:#define	SCOREBOARD_X		(0)
;8:
;9:#define SB_HEADER			86
;10:#define SB_TOP				(SB_HEADER+32)
;11:
;12:// Where the status bar starts, so we don't overwrite it
;13:#define SB_STATUSBAR		420
;14:
;15:#define SB_NORMAL_HEIGHT	25
;16:#define SB_INTER_HEIGHT		15 // interleaved height
;17:
;18:#define SB_MAXCLIENTS_NORMAL  ((SB_STATUSBAR - SB_TOP) / SB_NORMAL_HEIGHT)
;19:#define SB_MAXCLIENTS_INTER   ((SB_STATUSBAR - SB_TOP) / SB_INTER_HEIGHT - 1)
;20:
;21:// Used when interleaved
;22:
;23:
;24:
;25:#define SB_LEFT_BOTICON_X	(SCOREBOARD_X+0)
;26:#define SB_LEFT_HEAD_X		(SCOREBOARD_X+32)
;27:#define SB_RIGHT_BOTICON_X	(SCOREBOARD_X+64)
;28:#define SB_RIGHT_HEAD_X		(SCOREBOARD_X+96)
;29:// Normal
;30:#define SB_BOTICON_X		(SCOREBOARD_X+32)
;31:#define SB_HEAD_X			(SCOREBOARD_X+64)
;32:
;33:#define SB_SCORELINE_X		100
;34:#define SB_SCORELINE_WIDTH	(640 - SB_SCORELINE_X * 2)
;35:
;36:#define SB_RATING_WIDTH	    0 // (6 * BIGCHAR_WIDTH)
;37:#define SB_NAME_X			(SB_SCORELINE_X)
;38:#define SB_SCORE_X			(SB_SCORELINE_X + .55 * SB_SCORELINE_WIDTH)
;39:#define SB_PING_X			(SB_SCORELINE_X + .70 * SB_SCORELINE_WIDTH)
;40:#define SB_TIME_X			(SB_SCORELINE_X + .85 * SB_SCORELINE_WIDTH)
;41:
;42:// The new and improved score board
;43://
;44:// In cases where the number of clients is high, the score board heads are interleaved
;45:// here's the layout
;46:
;47://
;48://	0   32   80  112  144   240  320  400   <-- pixel position
;49://  bot head bot head score ping time name
;50://  
;51://  wins/losses are drawn on bot icon now
;52:
;53:static qboolean localClient; // true if local client has been displayed
;54:
;55:
;56:							 /*
;57:=================
;58:CG_DrawScoreboard
;59:=================
;60:*/
;61:static void CG_DrawClientScore( int y, score_t *score, float *color, float fade, qboolean largeFormat ) 
;62:{
line 68
;63:	//vec3_t	headAngles;
;64:	clientInfo_t	*ci;
;65:	int iconx, headx;
;66:	float		scale;
;67:
;68:	if ( largeFormat )
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $130
line 69
;69:	{
line 70
;70:		scale = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 71
;71:	}
ADDRGP4 $131
JUMPV
LABELV $130
line 73
;72:	else
;73:	{
line 74
;74:		scale = 0.75f;
ADDRLP4 4
CNSTF4 1061158912
ASGNF4
line 75
;75:	}
LABELV $131
line 77
;76:
;77:	if ( score->client < 0 || score->client >= cgs.maxclients ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $135
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $132
LABELV $135
line 78
;78:		Com_Printf( "Bad score->client: %i\n", score->client );
ADDRGP4 $136
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 79
;79:		return;
ADDRGP4 $129
JUMPV
LABELV $132
line 82
;80:	}
;81:	
;82:	ci = &cgs.clientinfo[score->client];
ADDRLP4 0
CNSTI4 788
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 84
;83:
;84:	iconx = SB_BOTICON_X + (SB_RATING_WIDTH / 2);
ADDRLP4 8
CNSTI4 32
ASGNI4
line 85
;85:	headx = SB_HEAD_X + (SB_RATING_WIDTH / 2);
ADDRLP4 12
CNSTI4 64
ASGNI4
line 88
;86:
;87:	// draw the handicap or bot skill marker (unless player has flag)
;88:	if ( ci->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $138
line 89
;89:		if( largeFormat ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $140
line 90
;90:			CG_DrawFlagModel( iconx, y - ( 32 - BIGCHAR_HEIGHT ) / 2, 32, 32, TEAM_FREE, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 8
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 91
;91:		}
ADDRGP4 $139
JUMPV
LABELV $140
line 92
;92:		else {
line 93
;93:			CG_DrawFlagModel( iconx, y, 16, 16, TEAM_FREE, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
CNSTF4 1098907648
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 94
;94:		}
line 95
;95:	} else if ( ci->powerups & ( 1 << PW_REDFLAG ) ) {
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $142
line 96
;96:		if( largeFormat ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $144
line 97
;97:			CG_DrawFlagModel( iconx*cgs.screenXScale, y*cgs.screenYScale, 32*cgs.screenXScale, 32*cgs.screenYScale, TEAM_RED, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 98
;98:		}
ADDRGP4 $143
JUMPV
LABELV $144
line 99
;99:		else {
line 100
;100:			CG_DrawFlagModel( iconx*cgs.screenXScale, y*cgs.screenYScale, 32*cgs.screenXScale, 32*cgs.screenYScale, TEAM_RED, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 101
;101:		}
line 102
;102:	} else if ( ci->powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $154
line 103
;103:		if( largeFormat ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $156
line 104
;104:			CG_DrawFlagModel( iconx*cgs.screenXScale, y*cgs.screenYScale, 32*cgs.screenXScale, 32*cgs.screenYScale, TEAM_BLUE, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 105
;105:		}
ADDRGP4 $155
JUMPV
LABELV $156
line 106
;106:		else {
line 107
;107:			CG_DrawFlagModel( iconx*cgs.screenXScale, y*cgs.screenYScale, 32*cgs.screenXScale, 32*cgs.screenYScale, TEAM_BLUE, qfalse );
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
ADDRLP4 20
CNSTF4 1107296256
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ARGF4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 108
;108:		}
line 109
;109:	} else {
LABELV $154
line 118
;110:		// draw the wins / losses
;111:		/*
;112:		if ( cgs.gametype == GT_TOURNAMENT ) 
;113:		{
;114:			CG_DrawSmallStringColor( iconx, y + SMALLCHAR_HEIGHT/2, va("%i/%i", ci->wins, ci->losses ), color );
;115:		}
;116:		*/
;117:		//rww - in duel, we now show wins/losses in place of "frags". This is because duel now defaults to 1 kill per round.
;118:	}
LABELV $155
LABELV $143
LABELV $139
line 121
;119:
;120:	// highlight your position
;121:	if ( score->client == cg.snap->ps.clientNum ) 
ADDRFP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $166
line 122
;122:	{
line 126
;123:		float	hcolor[4];
;124:		int		rank;
;125:
;126:		localClient = qtrue;
ADDRGP4 localClient
CNSTI4 1
ASGNI4
line 128
;127:
;128:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR 
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
EQI4 $173
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $169
LABELV $173
line 129
;129:			|| cgs.gametype >= GT_TEAM ) {
line 130
;130:			rank = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 131
;131:		} else {
ADDRGP4 $170
JUMPV
LABELV $169
line 132
;132:			rank = cg.snap->ps.persistant[PERS_RANK] & ~RANK_TIED_FLAG;
ADDRLP4 36
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 133
;133:		}
LABELV $170
line 134
;134:		if ( rank == 0 ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $175
line 135
;135:			hcolor[0] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 136
;136:			hcolor[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 137
;137:			hcolor[2] = 0.7f;
ADDRLP4 20+8
CNSTF4 1060320051
ASGNF4
line 138
;138:		} else if ( rank == 1 ) {
ADDRGP4 $176
JUMPV
LABELV $175
ADDRLP4 36
INDIRI4
CNSTI4 1
NEI4 $179
line 139
;139:			hcolor[0] = 0.7f;
ADDRLP4 20
CNSTF4 1060320051
ASGNF4
line 140
;140:			hcolor[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 141
;141:			hcolor[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 142
;142:		} else if ( rank == 2 ) {
ADDRGP4 $180
JUMPV
LABELV $179
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $183
line 143
;143:			hcolor[0] = 0.7f;
ADDRLP4 20
CNSTF4 1060320051
ASGNF4
line 144
;144:			hcolor[1] = 0.7f;
ADDRLP4 20+4
CNSTF4 1060320051
ASGNF4
line 145
;145:			hcolor[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 146
;146:		} else {
ADDRGP4 $184
JUMPV
LABELV $183
line 147
;147:			hcolor[0] = 0.7f;
ADDRLP4 20
CNSTF4 1060320051
ASGNF4
line 148
;148:			hcolor[1] = 0.7f;
ADDRLP4 20+4
CNSTF4 1060320051
ASGNF4
line 149
;149:			hcolor[2] = 0.7f;
ADDRLP4 20+8
CNSTF4 1060320051
ASGNF4
line 150
;150:		}
LABELV $184
LABELV $180
LABELV $176
line 152
;151:
;152:		hcolor[3] = fade * 0.7;
ADDRLP4 20+12
CNSTF4 1060320051
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 153
;153:		CG_FillRect( SB_SCORELINE_X - 5, y + 2, 640 - SB_SCORELINE_X * 2 + 10, largeFormat?SB_NORMAL_HEIGHT:SB_INTER_HEIGHT, hcolor );
CNSTF4 1119748096
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138819072
ARGF4
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 40
CNSTI4 25
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $191
ADDRLP4 40
CNSTI4 15
ASGNI4
LABELV $192
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 154
;154:	}
LABELV $166
line 156
;155:
;156:	CG_Text_Paint (SB_NAME_X, y, 0.9f * scale, colorWhite, ci->name,0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1120403456
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1063675494
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 158
;157:
;158:	if ( ci->team != TEAM_SPECTATOR || cgs.gametype == GT_TOURNAMENT )
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $196
ADDRGP4 cgs+32960
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $193
LABELV $196
line 159
;159:	{
line 160
;160:		if (cgs.gametype == GT_TOURNAMENT)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $197
line 161
;161:		{
line 162
;162:			CG_Text_Paint (SB_SCORE_X, y, 1.0f * scale, colorWhite, va("%i/%i", ci->wins, ci->losses),0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_SMALL );
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1135280128
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 163
;163:		}
ADDRGP4 $198
JUMPV
LABELV $197
line 165
;164:		else
;165:		{
line 166
;166:			CG_Text_Paint (SB_SCORE_X, y, 1.0f * scale, colorWhite, va("%i", score->score),0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_SMALL );
ADDRGP4 $201
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1135280128
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 167
;167:		}
LABELV $198
line 168
;168:	}
LABELV $193
line 170
;169:
;170:	CG_Text_Paint (SB_PING_X, y, 1.0f * scale, colorWhite, va("%i", score->ping),0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_SMALL );
ADDRGP4 $201
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1137442816
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 171
;171:	CG_Text_Paint (SB_TIME_X, y, 1.0f * scale, colorWhite, va("%i", score->time),0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_SMALL );
ADDRGP4 $201
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1139605504
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 174
;172:
;173:	// add the "ready" marker for intermission exiting
;174:	if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << score->client ) ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $202
line 175
;175:	{
line 176
;176:		CG_Text_Paint (SB_NAME_X - 64, y + 2, 0.7f * scale, colorWhite, CG_GetStripEdString("INGAMETEXT", "READY"),0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
ADDRGP4 $205
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 36
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
CNSTF4 1108344832
ARGF4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1060320051
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 177
;177:	}
LABELV $202
line 178
;178:}
LABELV $129
endproc CG_DrawClientScore 44 36
proc CG_TeamScoreboard 44 20
line 186
;179:
;180:/*
;181:=================
;182:CG_TeamScoreboard
;183:=================
;184:*/
;185:static int CG_TeamScoreboard( int y, team_t team, float fade, int maxClients, int lineHeight, qboolean countOnly ) 
;186:{
line 193
;187:	int		i;
;188:	score_t	*score;
;189:	float	color[4];
;190:	int		count;
;191:	clientInfo_t	*ci;
;192:
;193:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ASGNF4
line 194
;194:	color[3] = fade;
ADDRLP4 16+12
ADDRFP4 8
INDIRF4
ASGNF4
line 196
;195:
;196:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 197
;197:	for ( i = 0 ; i < cg.numScores && count < maxClients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 198
;198:		score = &cg.scores[i];
ADDRLP4 8
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+5064
ADDP4
ASGNP4
line 199
;199:		ci = &cgs.clientinfo[ score->client ];
ADDRLP4 12
CNSTI4 788
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 201
;200:
;201:		if ( team != ci->team ) {
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
EQI4 $218
line 202
;202:			continue;
ADDRGP4 $212
JUMPV
LABELV $218
line 205
;203:		}
;204:
;205:		if ( !countOnly )
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $220
line 206
;206:		{
line 207
;207:			CG_DrawClientScore( y + lineHeight * count, score, color, fade, lineHeight == SB_NORMAL_HEIGHT );
ADDRLP4 40
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
INDIRI4
CNSTI4 25
NEI4 $223
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $224
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 CG_DrawClientScore
CALLV
pop
line 208
;208:		}
LABELV $220
line 210
;209:
;210:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 211
;211:	}
LABELV $212
line 197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 cg+5048
INDIRI4
GEI4 $225
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
LTI4 $211
LABELV $225
line 213
;212:
;213:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $207
endproc CG_TeamScoreboard 44 20
export CG_GetTeamCount
proc CG_GetTeamCount 16 0
line 217
;214:}
;215:
;216:int CG_GetTeamCount(team_t team, int maxClients)
;217:{
line 218
;218:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 219
;219:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 223
;220:	clientInfo_t	*ci;
;221:	score_t	*score;
;222:
;223:	for ( i = 0 ; i < cg.numScores && count < maxClients ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $230
JUMPV
LABELV $227
line 224
;224:	{
line 225
;225:		score = &cg.scores[i];
ADDRLP4 12
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+5064
ADDP4
ASGNP4
line 226
;226:		ci = &cgs.clientinfo[ score->client ];
ADDRLP4 8
CNSTI4 788
ADDRLP4 12
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 228
;227:
;228:		if ( team != ci->team )
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
EQI4 $234
line 229
;229:		{
line 230
;230:			continue;
ADDRGP4 $228
JUMPV
LABELV $234
line 233
;231:		}
;232:
;233:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 234
;234:	}
LABELV $228
line 223
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $230
ADDRLP4 0
INDIRI4
ADDRGP4 cg+5048
INDIRI4
GEI4 $236
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $227
LABELV $236
line 236
;235:
;236:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $226
endproc CG_GetTeamCount 16 0
export CG_DrawOldScoreboard
proc CG_DrawOldScoreboard 840 36
line 245
;237:}
;238:/*
;239:=================
;240:CG_DrawScoreboard
;241:
;242:Draw the normal in-game scoreboard
;243:=================
;244:*/
;245:qboolean CG_DrawOldScoreboard( void ) {
line 255
;246:	int		x, y, w, i, n1, n2;
;247:	float	fade;
;248:	float	*fadeColor;
;249:	char	*s;
;250:	int maxClients;
;251:	int lineHeight;
;252:	int topBorderSize, bottomBorderSize;
;253:
;254:	// don't draw amuthing if the menu or console is up
;255:	if ( cg_paused.integer ) {
ADDRGP4 cg_paused+12
INDIRI4
CNSTI4 0
EQI4 $238
line 256
;256:		cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 257
;257:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $237
JUMPV
LABELV $238
line 261
;258:	}
;259:
;260:	// don't draw scoreboard during death while warmup up
;261:	if ( cg.warmup && !cg.showScores ) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 cg+13352
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $242
ADDRGP4 cg+6984
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $242
line 262
;262:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $237
JUMPV
LABELV $242
line 265
;263:	}
;264:
;265:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD ||
ADDRGP4 cg+6984
INDIRI4
CNSTI4 0
NEI4 $254
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 4
EQI4 $254
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 6
NEI4 $246
LABELV $254
line 266
;266:		 cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
line 267
;267:		fade = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 268
;268:		fadeColor = colorWhite;
ADDRLP4 24
ADDRGP4 colorWhite
ASGNP4
line 269
;269:	} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 270
;270:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
ADDRGP4 cg+6992
INDIRI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 56
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 56
INDIRP4
ASGNP4
line 272
;271:		
;272:		if ( !fadeColor ) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 274
;273:			// next time scoreboard comes up, don't print killer
;274:			cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 275
;275:			cg.killerName[0] = 0;
ADDRGP4 cg+6996
CNSTI1 0
ASGNI1
line 276
;276:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $237
JUMPV
LABELV $256
line 278
;277:		}
;278:		fade = *fadeColor;
ADDRLP4 12
ADDRLP4 24
INDIRP4
INDIRF4
ASGNF4
line 279
;279:	}
LABELV $247
line 283
;280:
;281:	// fragged by ... line
;282:	// or if in intermission and duel, prints the winner of the duel round
;283:	if (cgs.gametype == GT_TOURNAMENT && cgs.duelWinner != -1 &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $260
ADDRGP4 cgs+36336
INDIRI4
CNSTI4 -1
EQI4 $260
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 6
NEI4 $260
line 285
;284:		cg.predictedPlayerState.pm_type == PM_INTERMISSION)
;285:	{
line 286
;286:		s = va("%s %s", cgs.clientinfo[cgs.duelWinner].name, CG_GetStripEdString("INGAMETEXT", "DUEL_WINS") );
ADDRGP4 $205
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 56
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $266
ARGP4
CNSTI4 788
ADDRGP4 cgs+36336
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 292
;287:		/*w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;288:		x = ( SCREEN_WIDTH - w ) / 2;
;289:		y = 40;
;290:		CG_DrawBigString( x, y, s, fade );
;291:		*/
;292:		x = ( SCREEN_WIDTH ) / 2;
ADDRLP4 32
CNSTI4 320
ASGNI4
line 293
;293:		y = 40;
ADDRLP4 0
CNSTI4 40
ASGNI4
line 294
;294:		CG_Text_Paint ( x - CG_Text_Width ( s, 1.0f, FONT_MEDIUM ) / 2, y, 1.0f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 64
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 68
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 295
;295:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 296
;296:	else if (cgs.gametype == GT_TOURNAMENT && cgs.duelist1 != -1 && cgs.duelist2 != -1 &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $271
ADDRLP4 56
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $271
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $271
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 6
NEI4 $271
line 298
;297:		cg.predictedPlayerState.pm_type == PM_INTERMISSION)
;298:	{
line 299
;299:		s = va("%s %s %s", cgs.clientinfo[cgs.duelist1].name, CG_GetStripEdString("INGAMETEXT", "SPECHUD_VERSUS"), cgs.clientinfo[cgs.duelist2].name );
ADDRGP4 $205
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 60
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $278
ARGP4
ADDRLP4 64
CNSTI4 788
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ADDRGP4 cgs+36344
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 68
INDIRP4
ASGNP4
line 305
;300:		/*w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;301:		x = ( SCREEN_WIDTH - w ) / 2;
;302:		y = 40;
;303:		CG_DrawBigString( x, y, s, fade );
;304:		*/
;305:		x = ( SCREEN_WIDTH ) / 2;
ADDRLP4 32
CNSTI4 320
ASGNI4
line 306
;306:		y = 40;
ADDRLP4 0
CNSTI4 40
ASGNI4
line 307
;307:		CG_Text_Paint ( x - CG_Text_Width ( s, 1.0f, FONT_MEDIUM ) / 2, y, 1.0f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 72
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 308
;308:	}
ADDRGP4 $272
JUMPV
LABELV $271
line 309
;309:	else if ( cg.killerName[0] ) {
ADDRGP4 cg+6996
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $286
line 310
;310:		s = va("%s %s", CG_GetStripEdString("INGAMETEXT", "KILLEDBY"), cg.killerName );
ADDRGP4 $205
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 60
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $266
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 cg+6996
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 316
;311:		/*w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;312:		x = ( SCREEN_WIDTH - w ) / 2;
;313:		y = 40;
;314:		CG_DrawBigString( x, y, s, fade );
;315:		*/
;316:		x = ( SCREEN_WIDTH ) / 2;
ADDRLP4 32
CNSTI4 320
ASGNI4
line 317
;317:		y = 40;
ADDRLP4 0
CNSTI4 40
ASGNI4
line 318
;318:		CG_Text_Paint ( x - CG_Text_Width ( s, 1.0f, FONT_MEDIUM ) / 2, y, 1.0f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 72
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 68
INDIRI4
ADDRLP4 72
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 319
;319:	}
LABELV $286
LABELV $272
LABELV $261
line 322
;320:
;321:	// current rank
;322:	if ( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
GEI4 $291
line 323
;323:		if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
EQI4 $292
line 324
;324:		{
line 329
;325:			char sPlace[256];
;326:			char sOf[256];
;327:			char sWith[256];
;328:
;329:			trap_SP_GetStringTextString("INGAMETEXT_PLACE",	sPlace,	sizeof(sPlace));
ADDRGP4 $297
ARGP4
ADDRLP4 60
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 330
;330:			trap_SP_GetStringTextString("INGAMETEXT_OF",	sOf,	sizeof(sOf));
ADDRGP4 $298
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 331
;331:			trap_SP_GetStringTextString("INGAMETEXT_WITH",	sWith,	sizeof(sWith));
ADDRGP4 $299
ARGP4
ADDRLP4 572
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 333
;332:
;333:			s = va("%s %s (%s %i) %s %i",
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 828
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $300
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 316
ARGP4
ADDRGP4 cg+5048
INDIRI4
ARGI4
ADDRLP4 572
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 832
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 832
INDIRP4
ASGNP4
line 340
;334:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;335:				sPlace,
;336:				sOf,
;337:				cg.numScores,
;338:				sWith,
;339:				cg.snap->ps.persistant[PERS_SCORE] );
;340:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 836
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 836
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 341
;341:			x = ( SCREEN_WIDTH ) / 2;
ADDRLP4 32
CNSTI4 320
ASGNI4
line 342
;342:			y = 60;
ADDRLP4 0
CNSTI4 60
ASGNI4
line 344
;343:			//CG_DrawBigString( x, y, s, fade );
;344:			UI_DrawProportionalString(x, y, s, UI_CENTER|UI_DROPSHADOW, colorTable[CT_WHITE]);
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 2049
ARGI4
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 345
;345:		}
line 346
;346:	} else {
ADDRGP4 $292
JUMPV
LABELV $291
line 347
;347:		if ( cg.teamScores[0] == cg.teamScores[1] ) {
ADDRGP4 cg+5056
INDIRI4
ADDRGP4 cg+5056+4
INDIRI4
NEI4 $305
line 348
;348:			s = va("Teams are tied at %i", cg.teamScores[0] );
ADDRGP4 $310
ARGP4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 349
;349:		} else if ( cg.teamScores[0] >= cg.teamScores[1] ) {
ADDRGP4 $306
JUMPV
LABELV $305
ADDRGP4 cg+5056
INDIRI4
ADDRGP4 cg+5056+4
INDIRI4
LTI4 $312
line 350
;350:			s = va("Red leads %i to %i",cg.teamScores[0], cg.teamScores[1] );
ADDRGP4 $317
ARGP4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRGP4 cg+5056+4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 351
;351:		} else {
ADDRGP4 $313
JUMPV
LABELV $312
line 352
;352:			s = va("Blue leads %i to %i",cg.teamScores[1], cg.teamScores[0] );
ADDRGP4 $321
ARGP4
ADDRGP4 cg+5056+4
INDIRI4
ARGI4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 353
;353:		}
LABELV $313
LABELV $306
line 355
;354:
;355:		x = ( SCREEN_WIDTH ) / 2;
ADDRLP4 32
CNSTI4 320
ASGNI4
line 356
;356:		y = 60;
ADDRLP4 0
CNSTI4 60
ASGNI4
line 358
;357:		
;358:		CG_Text_Paint ( x - CG_Text_Width ( s, 1.0f, FONT_MEDIUM ) / 2, y, 1.0f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 60
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 359
;359:	}
LABELV $292
line 362
;360:
;361:	// scoreboard
;362:	y = SB_HEADER;
ADDRLP4 0
CNSTI4 86
ASGNI4
line 364
;363:
;364:	CG_DrawPic ( SB_SCORELINE_X - 40, y - 5, SB_SCORELINE_WIDTH + 80, 40, trap_R_RegisterShaderNoMip ( "gfx/menus/menu_buttonback.tga" ) );
ADDRGP4 $325
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTF4 1114636288
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 5
SUBI4
CVIF4 4
ARGF4
CNSTF4 1140981760
ARGF4
CNSTF4 1109393408
ARGF4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 366
;365:
;366:	CG_Text_Paint ( SB_NAME_X, y, 1.0f, colorWhite, "Name", 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1120403456
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $326
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 367
;367:	if (cgs.gametype == GT_TOURNAMENT)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $327
line 368
;368:	{
line 370
;369:		char sWL[100];
;370:		trap_SP_GetStringTextString("INGAMETEXT_W_L", sWL,	sizeof(sWL));
ADDRGP4 $330
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 372
;371:
;372:		CG_Text_Paint ( SB_SCORE_X, y, 1.0f, colorWhite, sWL, 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1135280128
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 373
;373:	}
ADDRGP4 $328
JUMPV
LABELV $327
line 375
;374:	else
;375:	{
line 376
;376:		CG_Text_Paint ( SB_SCORE_X, y, 1.0f, colorWhite, "Score", 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1135280128
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $331
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 377
;377:	}
LABELV $328
line 378
;378:	CG_Text_Paint ( SB_PING_X, y, 1.0f, colorWhite, "Ping", 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1137442816
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $332
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 379
;379:	CG_Text_Paint ( SB_TIME_X, y, 1.0f, colorWhite, "Time", 0, 0, ITEM_TEXTSTYLE_OUTLINED, FONT_MEDIUM );
CNSTF4 1139605504
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $333
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 381
;380:
;381:	y = SB_TOP;
ADDRLP4 0
CNSTI4 118
ASGNI4
line 384
;382:
;383:	// If there are more than SB_MAXCLIENTS_NORMAL, use the interleaved scores
;384:	if ( cg.numScores > SB_MAXCLIENTS_NORMAL ) {
ADDRGP4 cg+5048
INDIRI4
CNSTI4 12
LEI4 $334
line 385
;385:		maxClients = SB_MAXCLIENTS_INTER;
ADDRLP4 16
CNSTI4 19
ASGNI4
line 386
;386:		lineHeight = SB_INTER_HEIGHT;
ADDRLP4 8
CNSTI4 15
ASGNI4
line 387
;387:		topBorderSize = 8;
ADDRLP4 40
CNSTI4 8
ASGNI4
line 388
;388:		bottomBorderSize = 16;
ADDRLP4 44
CNSTI4 16
ASGNI4
line 389
;389:	} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 390
;390:		maxClients = SB_MAXCLIENTS_NORMAL;
ADDRLP4 16
CNSTI4 12
ASGNI4
line 391
;391:		lineHeight = SB_NORMAL_HEIGHT;
ADDRLP4 8
CNSTI4 25
ASGNI4
line 392
;392:		topBorderSize = 8;
ADDRLP4 40
CNSTI4 8
ASGNI4
line 393
;393:		bottomBorderSize = 8;
ADDRLP4 44
CNSTI4 8
ASGNI4
line 394
;394:	}
LABELV $335
line 396
;395:
;396:	localClient = qfalse;
ADDRGP4 localClient
CNSTI4 0
ASGNI4
line 406
;397:
;398:
;399:	//I guess this should end up being able to display 19 clients at once.
;400:	//In a team game, if there are 9 or more clients on the team not in the lead,
;401:	//we only want to show 10 of the clients on the team in the lead, so that we
;402:	//have room to display the clients in the lead on the losing team.
;403:
;404:	//I guess this can be accomplished simply by printing the first teams score with a maxClients
;405:	//value passed in related to how many players are on both teams.
;406:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $337
line 410
;407:		//
;408:		// teamplay scoreboard
;409:		//
;410:		y += lineHeight/2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 412
;411:
;412:		if ( cg.teamScores[0] >= cg.teamScores[1] ) {
ADDRGP4 cg+5056
INDIRI4
ADDRGP4 cg+5056+4
INDIRI4
LTI4 $340
line 413
;413:			int team1MaxCl = CG_GetTeamCount(TEAM_RED, maxClients);
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_GetTeamCount
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
ASGNI4
line 414
;414:			int team2MaxCl = CG_GetTeamCount(TEAM_BLUE, maxClients);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_GetTeamCount
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 76
INDIRI4
ASGNI4
line 416
;415:
;416:			if (team1MaxCl > 10 && (team1MaxCl+team2MaxCl) > maxClients)
ADDRLP4 80
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 10
LEI4 $345
ADDRLP4 80
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
ADDRLP4 16
INDIRI4
LEI4 $345
line 417
;417:			{
line 418
;418:				team1MaxCl -= team2MaxCl;
ADDRLP4 64
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
SUBI4
ASGNI4
line 422
;419:				//subtract as many as you have to down to 10, once we get there
;420:				//we just set it to 10
;421:
;422:				if (team1MaxCl < 10)
ADDRLP4 64
INDIRI4
CNSTI4 10
GEI4 $347
line 423
;423:				{
line 424
;424:					team1MaxCl = 10;
ADDRLP4 64
CNSTI4 10
ASGNI4
line 425
;425:				}
LABELV $347
line 426
;426:			}
LABELV $345
line 428
;427:
;428:			team2MaxCl = (maxClients-team1MaxCl); //team2 can display however many is left over after team1's display
ADDRLP4 68
ADDRLP4 16
INDIRI4
ADDRLP4 64
INDIRI4
SUBI4
ASGNI4
line 430
;429:
;430:			n1 = CG_TeamScoreboard( y, TEAM_RED, fade, team1MaxCl, lineHeight, qtrue );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 88
INDIRI4
ASGNI4
line 431
;431:			CG_DrawTeamBackground( SB_SCORELINE_X - 5, y - topBorderSize, 640 - SB_SCORELINE_X * 2 + 10, n1 * lineHeight + bottomBorderSize, 0.33f, TEAM_RED );
CNSTI4 95
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
CNSTI4 450
ARGI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
CNSTF4 1051260355
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 432
;432:			CG_TeamScoreboard( y, TEAM_RED, fade, team1MaxCl, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_TeamScoreboard
CALLI4
pop
line 433
;433:			y += (n1 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 437
;434:
;435:			//maxClients -= n1;
;436:
;437:			n2 = CG_TeamScoreboard( y, TEAM_BLUE, fade, team2MaxCl, lineHeight, qtrue );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 92
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 92
INDIRI4
ASGNI4
line 438
;438:			CG_DrawTeamBackground( SB_SCORELINE_X - 5, y - topBorderSize, 640 - SB_SCORELINE_X * 2 + 10, n2 * lineHeight + bottomBorderSize, 0.33f, TEAM_BLUE );
CNSTI4 95
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
CNSTI4 450
ARGI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
CNSTF4 1051260355
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 439
;439:			CG_TeamScoreboard( y, TEAM_BLUE, fade, team2MaxCl, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_TeamScoreboard
CALLI4
pop
line 440
;440:			y += (n2 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 444
;441:
;442:			//maxClients -= n2;
;443:
;444:			maxClients -= (team1MaxCl+team2MaxCl);
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
SUBI4
ASGNI4
line 445
;445:		} else {
ADDRGP4 $341
JUMPV
LABELV $340
line 446
;446:			int team1MaxCl = CG_GetTeamCount(TEAM_BLUE, maxClients);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_GetTeamCount
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
ASGNI4
line 447
;447:			int team2MaxCl = CG_GetTeamCount(TEAM_RED, maxClients);
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_GetTeamCount
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 76
INDIRI4
ASGNI4
line 449
;448:
;449:			if (team1MaxCl > 10 && (team1MaxCl+team2MaxCl) > maxClients)
ADDRLP4 80
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 10
LEI4 $349
ADDRLP4 80
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
ADDRLP4 16
INDIRI4
LEI4 $349
line 450
;450:			{
line 451
;451:				team1MaxCl -= team2MaxCl;
ADDRLP4 64
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
SUBI4
ASGNI4
line 455
;452:				//subtract as many as you have to down to 10, once we get there
;453:				//we just set it to 10
;454:
;455:				if (team1MaxCl < 10)
ADDRLP4 64
INDIRI4
CNSTI4 10
GEI4 $351
line 456
;456:				{
line 457
;457:					team1MaxCl = 10;
ADDRLP4 64
CNSTI4 10
ASGNI4
line 458
;458:				}
LABELV $351
line 459
;459:			}
LABELV $349
line 461
;460:
;461:			team2MaxCl = (maxClients-team1MaxCl); //team2 can display however many is left over after team1's display
ADDRLP4 68
ADDRLP4 16
INDIRI4
ADDRLP4 64
INDIRI4
SUBI4
ASGNI4
line 463
;462:
;463:			n1 = CG_TeamScoreboard( y, TEAM_BLUE, fade, team1MaxCl, lineHeight, qtrue );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 84
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 84
INDIRI4
ASGNI4
line 464
;464:			CG_DrawTeamBackground( SB_SCORELINE_X - 5, y - topBorderSize, 640 - SB_SCORELINE_X * 2 + 10, n1 * lineHeight + bottomBorderSize, 0.33f, TEAM_BLUE );
CNSTI4 95
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
CNSTI4 450
ARGI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
CNSTF4 1051260355
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 465
;465:			CG_TeamScoreboard( y, TEAM_BLUE, fade, team1MaxCl, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_TeamScoreboard
CALLI4
pop
line 466
;466:			y += (n1 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 470
;467:
;468:			//maxClients -= n1;
;469:
;470:			n2 = CG_TeamScoreboard( y, TEAM_RED, fade, team2MaxCl, lineHeight, qtrue );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 92
INDIRI4
ASGNI4
line 471
;471:			CG_DrawTeamBackground( SB_SCORELINE_X - 5, y - topBorderSize, 640 - SB_SCORELINE_X * 2 + 10, n2 * lineHeight + bottomBorderSize, 0.33f, TEAM_RED );
CNSTI4 95
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
CNSTI4 450
ARGI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
CNSTF4 1051260355
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 472
;472:			CG_TeamScoreboard( y, TEAM_RED, fade, team2MaxCl, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_TeamScoreboard
CALLI4
pop
line 473
;473:			y += (n2 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 477
;474:
;475:			//maxClients -= n2;
;476:
;477:			maxClients -= (team1MaxCl+team2MaxCl);
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
SUBI4
ASGNI4
line 478
;478:		}
LABELV $341
line 479
;479:		n1 = CG_TeamScoreboard( y, TEAM_SPECTATOR, fade, maxClients, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 64
INDIRI4
ASGNI4
line 480
;480:		y += (n1 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 482
;481:
;482:	} else {
ADDRGP4 $338
JUMPV
LABELV $337
line 486
;483:		//
;484:		// free for all scoreboard
;485:		//
;486:		n1 = CG_TeamScoreboard( y, TEAM_FREE, fade, maxClients, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 68
INDIRI4
ASGNI4
line 487
;487:		y += (n1 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 488
;488:		n2 = CG_TeamScoreboard( y, TEAM_SPECTATOR, fade, maxClients - n1, lineHeight, qfalse );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 CG_TeamScoreboard
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 72
INDIRI4
ASGNI4
line 489
;489:		y += (n2 * lineHeight) + BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
CNSTI4 16
ADDI4
ADDI4
ASGNI4
line 490
;490:	}
LABELV $338
line 492
;491:
;492:	if (!localClient) {
ADDRGP4 localClient
INDIRI4
CNSTI4 0
NEI4 $353
line 494
;493:		// draw local client at the bottom
;494:		for ( i = 0 ; i < cg.numScores ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 495
;495:			if ( cg.scores[i].client == cg.snap->ps.clientNum ) {
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+5064
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $360
line 496
;496:				CG_DrawClientScore( y, &cg.scores[i], fadeColor, fade, lineHeight == SB_NORMAL_HEIGHT );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+5064
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 25
NEI4 $366
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRGP4 $367
JUMPV
LABELV $366
ADDRLP4 64
CNSTI4 0
ASGNI4
LABELV $367
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_DrawClientScore
CALLV
pop
line 497
;497:				break;
ADDRGP4 $357
JUMPV
LABELV $360
line 499
;498:			}
;499:		}
LABELV $356
line 494
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 4
INDIRI4
ADDRGP4 cg+5048
INDIRI4
LTI4 $355
LABELV $357
line 500
;500:	}
LABELV $353
line 503
;501:
;502:	// load any models that have been deferred
;503:	if ( ++cg.deferredPlayerLoading > 10 ) {
ADDRLP4 64
ADDRGP4 cg+16
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 10
LEI4 $368
line 504
;504:		CG_LoadDeferredPlayers();
ADDRGP4 CG_LoadDeferredPlayers
CALLV
pop
line 505
;505:	}
LABELV $368
line 507
;506:
;507:	return qtrue;
CNSTI4 1
RETI4
LABELV $237
endproc CG_DrawOldScoreboard 840 36
bss
align 4
LABELV localClient
skip 4
import trap_SP_Register
import trap_SP_RegisterServer
import trap_PC_RemoveAllGlobalDefines
import trap_PC_LoadGlobalDefines
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
import CG_CreateBBRefEnts
import CG_SetGhoul2Info
import CG_Init_CGents
import CG_Init_CG
import trap_G2API_SetNewOrigin
import trap_G2API_SetSurfaceOnOff
import trap_G2API_SetRootSurface
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_GiveMeVectorFromMatrix
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import trap_G2API_CollisionDetect
import FX_ForceDrained
import FX_BlasterWeaponHitPlayer
import FX_BlasterWeaponHitWall
import FX_BlasterAltFireThink
import FX_BlasterProjectileThink
import FX_BryarAltHitPlayer
import FX_BryarHitPlayer
import FX_BryarAltHitWall
import FX_BryarHitWall
import CG_Spark
import FX_TurretHitPlayer
import FX_TurretHitWall
import FX_TurretProjectileThink
import CG_NewParticleArea
import initparticles
import CG_GetStripEdString
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_CG_RegisterSharedMemory
import trap_SP_GetStringTextString
import trap_SP_Print
import trap_FX_AddSprite
import trap_FX_AddPrimitive
import trap_FX_AddBezier
import trap_FX_AddPoly
import trap_FX_AdjustTime
import trap_FX_FreeSystem
import trap_FX_InitSystem
import trap_FX_AddScheduledEffects
import trap_FX_PlayBoltedEffectID
import trap_FX_PlayEntityEffectID
import trap_FX_PlayEffectID
import trap_FX_PlaySimpleEffectID
import trap_FX_PlayEntityEffect
import trap_FX_PlayEffect
import trap_FX_PlaySimpleEffect
import trap_FX_RegisterEffect
import trap_R_inPVS
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import BG_CycleForce
import BG_ProperForceIndex
import BG_CycleInven
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_OpenUIMenu
import trap_SetClientTurnExtent
import trap_SetClientForceAngle
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_FX_AddLine
import trap_R_GetBModelVerts
import trap_R_SetLightStyle
import trap_R_GetLightStyle
import trap_R_RemapShader
import trap_R_DrawRotatePic2
import trap_R_DrawRotatePic
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_S_MuteSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_SagaObjectiveCompleted
import CG_SagaRoundOver
import CG_InitSagaMode
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_InitGlass
import CG_TestLine
import CG_SurfaceExplosion
import CG_MakeExplosion
import CG_Bleed
import CG_ScorePlum
import CG_CreateDebris
import CG_GlassShatter
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawIconBackground
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_GetClientWeaponMuzzleBoltPoint
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_PlayerShieldHit
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_DeferMenuScript
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawScaledProportionalString
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawNumField
import CG_DrawString
import CG_DrawRotatePic2
import CG_DrawRotatePic
import CG_DrawPic
import CG_FillRect
import CG_TestModelAnimate_f
import CG_TestModelSetAnglespost_f
import CG_TestModelSetAnglespre_f
import CG_ListModelBones_f
import CG_ListModelSurfaces_f
import CG_TestModelSurfaceOnOff_f
import CG_TestG2Model_f
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_PrevForcePower_f
import CG_NextForcePower_f
import CG_PrevInventory_f
import CG_NextInventory_f
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugBB
import ui_myteam
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawEnemyInfo
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonHorzOffset
import cg_thirdPersonAlpha
import cg_thirdPersonTargetDamp
import cg_thirdPersonCameraDamp
import cg_thirdPersonVertOffset
import cg_thirdPersonPitchOffset
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPerson
import cg_dismember
import cg_animBlend
import cg_auraShell
import cg_speedTrail
import cg_duelHeadAngles
import cg_saberTrail
import cg_saberContact
import cg_saberDynamicMarkTime
import cg_saberDynamicMarks
import cg_fpls
import cg_saberModelTraceEffect
import cg_oldPainSounds
import cg_swingAngles
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_dynamicCrosshair
import cg_drawScores
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_shadows
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CGCam_SetMusicMult
import CGCam_Shake
import cgScreenEffects
import ammoTicPos
import forceTicPos
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
LABELV $333
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $332
char 1 80
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $331
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $330
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 87
char 1 95
char 1 76
char 1 0
align 1
LABELV $326
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $325
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 95
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 98
char 1 97
char 1 99
char 1 107
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $321
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $317
char 1 82
char 1 101
char 1 100
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $310
char 1 84
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 32
char 1 116
char 1 105
char 1 101
char 1 100
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $300
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 41
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $299
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 87
char 1 73
char 1 84
char 1 72
char 1 0
align 1
LABELV $298
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 79
char 1 70
char 1 0
align 1
LABELV $297
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 80
char 1 76
char 1 65
char 1 67
char 1 69
char 1 0
align 1
LABELV $289
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 66
char 1 89
char 1 0
align 1
LABELV $282
char 1 83
char 1 80
char 1 69
char 1 67
char 1 72
char 1 85
char 1 68
char 1 95
char 1 86
char 1 69
char 1 82
char 1 83
char 1 85
char 1 83
char 1 0
align 1
LABELV $278
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $270
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 87
char 1 73
char 1 78
char 1 83
char 1 0
align 1
LABELV $266
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $206
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 0
align 1
LABELV $205
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 0
align 1
LABELV $201
char 1 37
char 1 105
char 1 0
align 1
LABELV $200
char 1 37
char 1 105
char 1 47
char 1 37
char 1 105
char 1 0
align 1
LABELV $136
char 1 66
char 1 97
char 1 100
char 1 32
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 45
char 1 62
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
