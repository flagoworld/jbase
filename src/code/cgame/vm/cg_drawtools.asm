export CG_DrawRect
code
proc CG_DrawRect 0 20
file "../cg_drawtools.c"
line 24
;1:/*
;2:// this line must stay at top so the whole PCH thing works...
;3:#include "cg_headers.h"
;4:
;5://#include "cg_local.h"
;6:#include "cg_media.h"
;7:#include "cg_text.h"
;8:*/
;9:
;10:// Copyright (C) 1999-2000 Id Software, Inc.
;11://
;12:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;13:#include "cg_local.h"
;14:#include "../game/q_shared.h"
;15:
;16:
;17:/*
;18:================
;19:UI_DrawRect
;20:
;21:Coordinates are 640*480 virtual values
;22:=================
;23:*/
;24:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 25
;25:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 27
;26:	
;27:	CG_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 28
;28:	CG_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 30
;29:	
;30:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 31
;31:}
LABELV $120
endproc CG_DrawRect 0 20
export CG_GetColorForHealth
proc CG_GetColorForHealth 16 0
line 40
;32:
;33:
;34:
;35:/*
;36:=================
;37:CG_GetColorForHealth
;38:=================
;39:*/
;40:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 46
;41:	int		count;
;42:	int		max;
;43:
;44:	// calculate the total points of damage that can
;45:	// be sustained at the current health / armor level
;46:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $122
line 47
;47:		VectorClear( hcolor );	// black
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 48
;48:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 49
;49:		return;
ADDRGP4 $121
JUMPV
LABELV $122
line 51
;50:	}
;51:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 52
;52:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 8
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 8
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 53
;53:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $124
line 54
;54:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 55
;55:	}
LABELV $124
line 56
;56:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 59
;57:
;58:	// set the color based on health
;59:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 60
;60:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 61
;61:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $126
line 62
;62:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 63
;63:	} else if ( health < 66 ) {
ADDRGP4 $127
JUMPV
LABELV $126
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $128
line 64
;64:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 65
;65:	} else {
ADDRGP4 $129
JUMPV
LABELV $128
line 66
;66:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1107558400
DIVF4
ASGNF4
line 67
;67:	}
LABELV $129
LABELV $127
line 69
;68:
;69:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $130
line 70
;70:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 71
;71:	} else if ( health < 30 ) {
ADDRGP4 $131
JUMPV
LABELV $130
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $132
line 72
;72:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 73
;73:	} else {
ADDRGP4 $133
JUMPV
LABELV $132
line 74
;74:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1106247680
DIVF4
ASGNF4
line 75
;75:	}
LABELV $133
LABELV $131
line 76
;76:}
LABELV $121
endproc CG_GetColorForHealth 16 0
export CG_DrawSides
proc CG_DrawSides 12 36
line 85
;77:
;78:/*
;79:================
;80:CG_DrawSides
;81:
;82:Coords are virtual 640x480
;83:================
;84:*/
;85:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 86
;86:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+32936
INDIRF4
MULF4
ASGNF4
line 87
;87:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 88
;88:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 89
;89:}
LABELV $134
endproc CG_DrawSides 12 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 12 36
line 91
;90:
;91:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 92
;92:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+32940
INDIRF4
MULF4
ASGNF4
line 93
;93:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 94
;94:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 95
;95:}
LABELV $140
endproc CG_DrawTopBottom 12 36
export CG_FillRect2
proc CG_FillRect2 4 36
line 103
;96:
;97:/*
;98:-------------------------
;99:CGC_FillRect2
;100:real coords
;101:-------------------------
;102:*/
;103:void CG_FillRect2( float x, float y, float width, float height, const float *color ) {
line 104
;104:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 105
;105:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 106
;106:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 107
;107:}
LABELV $146
endproc CG_FillRect2 4 36
export CG_FillRect
proc CG_FillRect 4 36
line 116
;108:
;109:/*
;110:================
;111:CG_FillRect
;112:
;113:Coordinates are 640*480 virtual values
;114:=================
;115:*/
;116:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 117
;117:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 119
;118:
;119:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 121
;120:
;121:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 122
;122:}
LABELV $149
endproc CG_FillRect 4 36
export CG_DrawPic
proc CG_DrawPic 8 36
line 133
;123:
;124:
;125:/*
;126:================
;127:CG_DrawPic
;128:
;129:Coordinates are 640*480 virtual values
;130:A width of 0 will draw with the original image width
;131:=================
;132:*/
;133:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 134
;134:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 135
;135:}
LABELV $152
endproc CG_DrawPic 8 36
export CG_DrawRotatePic
proc CG_DrawRotatePic 8 40
line 146
;136:
;137:/*
;138:================
;139:CG_DrawRotatePic
;140:
;141:Coordinates are 640*480 virtual values
;142:A width of 0 will draw with the original image width
;143:rotates around the upper right corner of the passed in point
;144:=================
;145:*/
;146:void CG_DrawRotatePic( float x, float y, float width, float height,float angle, qhandle_t hShader ) {
line 147
;147:	trap_R_DrawRotatePic( x, y, width, height, 0, 0, 1, 1, angle, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawRotatePic
CALLV
pop
line 148
;148:}
LABELV $153
endproc CG_DrawRotatePic 8 40
export CG_DrawRotatePic2
proc CG_DrawRotatePic2 8 40
line 159
;149:
;150:/*
;151:================
;152:CG_DrawRotatePic2
;153:
;154:Coordinates are 640*480 virtual values
;155:A width of 0 will draw with the original image width
;156:Actually rotates around the center point of the passed in coordinates
;157:=================
;158:*/
;159:void CG_DrawRotatePic2( float x, float y, float width, float height,float angle, qhandle_t hShader ) {
line 160
;160:	trap_R_DrawRotatePic2( x, y, width, height, 0, 0, 1, 1, angle, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawRotatePic2
CALLV
pop
line 161
;161:}
LABELV $154
endproc CG_DrawRotatePic2 8 40
export CG_DrawChar
proc CG_DrawChar 48 36
line 170
;162:
;163:/*
;164:===============
;165:CG_DrawChar
;166:
;167:Coordinates and size in 640*480 virtual screen size
;168:===============
;169:*/
;170:void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 177
;171:	int row, col;
;172:	float frow, fcol;
;173:	float size;
;174:	float	ax, ay, aw, ah;
;175:	float size2;
;176:
;177:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 179
;178:
;179:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $156
line 180
;180:		return;
ADDRGP4 $155
JUMPV
LABELV $156
line 183
;181:	}
;182:
;183:	ax = x;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 184
;184:	ay = y;
ADDRLP4 24
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 185
;185:	aw = width;
ADDRLP4 28
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 186
;186:	ah = height;
ADDRLP4 32
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 188
;187:
;188:	row = ch>>4;
ADDRLP4 8
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 189
;189:	col = ch&15;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 191
;190:
;191:	frow = row*0.0625;
ADDRLP4 0
CNSTF4 1031798784
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 192
;192:	fcol = col*0.0625;
ADDRLP4 4
CNSTF4 1031798784
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 193
;193:	size = 0.03125;
ADDRLP4 16
CNSTF4 1023410176
ASGNF4
line 194
;194:	size2 = 0.0625;
ADDRLP4 36
CNSTF4 1031798784
ASGNF4
line 196
;195:
;196:	trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + size, frow + size2, 
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+70296
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 199
;197:		cgs.media.charsetShader );
;198:
;199:}
LABELV $155
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 48 36
line 214
;200:
;201:/*
;202:==================
;203:CG_DrawStringExt
;204:
;205:Draws a multi-colored string with a drop shadow, optionally forcing
;206:to a fixed color.
;207:
;208:Coordinates are at 640 by 480 virtual resolution
;209:==================
;210:*/
;211:#include "../../ui/menudef.h"	// for "ITEM_TEXTSTYLE_SHADOWED"
;212:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor, 
;213:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars )
;214:{
line 215
;215:	if (trap_Language_IsAsian())
ADDRLP4 0
ADDRGP4 trap_Language_IsAsian
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $160
line 216
;216:	{
line 220
;217:		// hack-a-doodle-do (post-release quick fix code)...
;218:		//
;219:		vec4_t color;
;220:		memcpy(color,setColor, sizeof(color));	// de-const it
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 221
;221:		CG_Text_Paint(x, y, 1.0f,	// float scale, 
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $163
ADDRLP4 20
CNSTI4 3
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $164
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 229
;222:						color,		// vec4_t color, 
;223:						string,		// const char *text, 
;224:						0.0f,		// float adjust, 
;225:						0,			// int limit, 
;226:						shadow ? ITEM_TEXTSTYLE_SHADOWED : 0,	// int style, 
;227:						FONT_MEDIUM		// iMenuFont
;228:						) ;
;229:	}
ADDRGP4 $161
JUMPV
LABELV $160
line 231
;230:	else
;231:	{
line 237
;232:		vec4_t		color;
;233:		const char	*s;
;234:		int			xx;
;235:
;236:		// draw the drop shadow
;237:		if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $165
line 238
;238:			color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 239
;239:			color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 240
;240:			trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 241
;241:			s = string;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 242
;242:			xx = x;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
line 243
;243:			while ( *s ) {
line 244
;244:				if ( Q_IsColorString( s ) ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $173
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $173
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $173
ADDRLP4 40
INDIRI4
CNSTI4 55
GTI4 $173
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $173
line 245
;245:					s += 2;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 246
;246:					continue;
ADDRGP4 $171
JUMPV
LABELV $173
line 248
;247:				}
;248:				CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, *s );
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 249
;249:				xx += charWidth;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 250
;250:				s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 251
;251:			}
LABELV $171
line 243
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $170
line 252
;252:		}
LABELV $165
line 255
;253:
;254:		// draw the colored text
;255:		s = string;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 256
;256:		xx = x;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
line 257
;257:		trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $176
JUMPV
LABELV $175
line 258
;258:		while ( *s ) {
line 259
;259:			if ( Q_IsColorString( s ) ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
ADDRLP4 32
CNSTI4 94
ASGNI4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $178
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $178
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $178
ADDRLP4 36
INDIRI4
CNSTI4 55
GTI4 $178
ADDRLP4 36
INDIRI4
CNSTI4 48
LTI4 $178
line 260
;260:				if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $180
line 261
;261:					memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 262
;262:					color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 263
;263:					trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 264
;264:				}
LABELV $180
line 265
;265:				s += 2;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 266
;266:				continue;
ADDRGP4 $176
JUMPV
LABELV $178
line 268
;267:			}
;268:			CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 269
;269:			xx += charWidth;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 270
;270:			s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 271
;271:		}
LABELV $176
line 258
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $175
line 272
;272:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 273
;273:	}
LABELV $161
line 274
;274:}
LABELV $159
endproc CG_DrawStringExt 48 36
export CG_DrawBigString
proc CG_DrawBigString 28 36
line 276
;275:
;276:void CG_DrawBigString( int x, int y, const char *s, float alpha ) {
line 279
;277:	float	color[4];
;278:
;279:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 280
;280:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 281
;281:	CG_DrawStringExt( x, y, s, color, qfalse, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 282
;282:}
LABELV $183
endproc CG_DrawBigString 28 36
export CG_DrawBigStringColor
proc CG_DrawBigStringColor 8 36
line 284
;283:
;284:void CG_DrawBigStringColor( int x, int y, const char *s, vec4_t color ) {
line 285
;285:	CG_DrawStringExt( x, y, s, color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 286
;286:}
LABELV $187
endproc CG_DrawBigStringColor 8 36
export CG_DrawSmallString
proc CG_DrawSmallString 24 36
line 288
;287:
;288:void CG_DrawSmallString( int x, int y, const char *s, float alpha ) {
line 291
;289:	float	color[4];
;290:
;291:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 292
;292:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 293
;293:	CG_DrawStringExt( x, y, s, color, qfalse, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 294
;294:}
LABELV $188
endproc CG_DrawSmallString 24 36
export CG_DrawSmallStringColor
proc CG_DrawSmallStringColor 4 36
line 296
;295:
;296:void CG_DrawSmallStringColor( int x, int y, const char *s, vec4_t color ) {
line 297
;297:	CG_DrawStringExt( x, y, s, color, qtrue, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 298
;298:}
LABELV $192
endproc CG_DrawSmallStringColor 4 36
export CG_DrawStrlen
proc CG_DrawStrlen 20 0
line 307
;299:
;300:/*
;301:=================
;302:CG_DrawStrlen
;303:
;304:Returns character count, skiping color escape codes
;305:=================
;306:*/
;307:int CG_DrawStrlen( const char *str ) {
line 308
;308:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 309
;309:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $195
JUMPV
LABELV $194
line 311
;310:
;311:	while ( *s ) {
line 312
;312:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $197
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $197
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $197
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $197
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $197
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $197
line 313
;313:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 314
;314:		} else {
ADDRGP4 $198
JUMPV
LABELV $197
line 315
;315:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 316
;316:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 317
;317:		}
LABELV $198
line 318
;318:	}
LABELV $195
line 311
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $194
line 320
;319:
;320:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $193
endproc CG_DrawStrlen 20 0
proc CG_TileClearBox 16 36
line 331
;321:}
;322:
;323:/*
;324:=============
;325:CG_TileClearBox
;326:
;327:This repeats a 64*64 tile graphic to fill the screen around a sized down
;328:refresh window.
;329:=============
;330:*/
;331:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 334
;332:	float	s1, t1, s2, t2;
;333:
;334:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 335
;335:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 336
;336:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 337
;337:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 338
;338:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 339
;339:}
LABELV $199
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 48 20
line 350
;340:
;341:
;342:
;343:/*
;344:==============
;345:CG_TileClear
;346:
;347:Clear around a sized down screen
;348:==============
;349:*/
;350:void CG_TileClear( void ) {
line 354
;351:	int		top, bottom, left, right;
;352:	int		w, h;
;353:
;354:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+21604+11304
INDIRI4
ASGNI4
line 355
;355:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+21604+11308
INDIRI4
ASGNI4
line 357
;356:
;357:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+3616
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $205
ADDRGP4 cg+3616+4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $205
ADDRGP4 cg+3616+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $205
ADDRGP4 cg+3616+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $205
line 358
;358:		cg.refdef.width == w && cg.refdef.height == h ) {
line 359
;359:		return;		// full screen rendering
ADDRGP4 $200
JUMPV
LABELV $205
line 362
;360:	}
;361:
;362:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+3616+4
INDIRI4
ASGNI4
line 363
;363:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+3616+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 364
;364:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+3616
INDIRI4
ASGNI4
line 365
;365:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+3616+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 368
;366:
;367:	// clear above view screen
;368:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+70296+244
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 371
;369:
;370:	// clear below view screen
;371:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+70296+244
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 374
;372:
;373:	// clear left of view screen
;374:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+70296+244
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 377
;375:
;376:	// clear right of view screen
;377:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+70296+244
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 378
;378:}
LABELV $200
endproc CG_TileClear 48 20
bss
align 4
LABELV $230
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 387
;379:
;380:
;381:
;382:/*
;383:================
;384:CG_FadeColor
;385:================
;386:*/
;387:float *CG_FadeColor( int startMsec, int totalMsec ) {
line 391
;388:	static vec4_t		color;
;389:	int			t;
;390:
;391:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $231
line 392
;392:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $229
JUMPV
LABELV $231
line 395
;393:	}
;394:
;395:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 397
;396:
;397:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $234
line 398
;398:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $229
JUMPV
LABELV $234
line 402
;399:	}
;400:
;401:	// fade out
;402:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $236
line 403
;403:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
ADDRGP4 $230+12
CNSTF4 1065353216
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 404
;404:	} else {
ADDRGP4 $237
JUMPV
LABELV $236
line 405
;405:		color[3] = 1.0;
ADDRGP4 $230+12
CNSTF4 1065353216
ASGNF4
line 406
;406:	}
LABELV $237
line 407
;407:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $230+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $230+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $230
ADDRLP4 4
INDIRF4
ASGNF4
line 409
;408:
;409:	return color;
ADDRGP4 $230
RETP4
LABELV $229
endproc CG_FadeColor 8 0
export CG_ColorForGivenHealth
proc CG_ColorForGivenHealth 0 0
line 419
;410:}
;411:
;412:
;413:/*
;414:=================
;415:CG_ColorForHealth
;416:=================
;417:*/
;418:void CG_ColorForGivenHealth( vec4_t hcolor, int health ) 
;419:{
line 421
;420:	// set the color based on health
;421:	hcolor[0] = 1.0;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 422
;422:	if ( health >= 100 ) 
ADDRFP4 4
INDIRI4
CNSTI4 100
LTI4 $243
line 423
;423:	{
line 424
;424:		hcolor[2] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 425
;425:	} 
ADDRGP4 $244
JUMPV
LABELV $243
line 426
;426:	else if ( health < 66 ) 
ADDRFP4 4
INDIRI4
CNSTI4 66
GEI4 $245
line 427
;427:	{
line 428
;428:		hcolor[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 429
;429:	} 
ADDRGP4 $246
JUMPV
LABELV $245
line 431
;430:	else 
;431:	{
line 432
;432:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1107558400
DIVF4
ASGNF4
line 433
;433:	}
LABELV $246
LABELV $244
line 435
;434:
;435:	if ( health > 60 ) 
ADDRFP4 4
INDIRI4
CNSTI4 60
LEI4 $247
line 436
;436:	{
line 437
;437:		hcolor[1] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 438
;438:	} 
ADDRGP4 $248
JUMPV
LABELV $247
line 439
;439:	else if ( health < 30 ) 
ADDRFP4 4
INDIRI4
CNSTI4 30
GEI4 $249
line 440
;440:	{
line 441
;441:		hcolor[1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 442
;442:	} 
ADDRGP4 $250
JUMPV
LABELV $249
line 444
;443:	else 
;444:	{
line 445
;445:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1106247680
DIVF4
ASGNF4
line 446
;446:	}
LABELV $250
LABELV $248
line 447
;447:}
LABELV $242
endproc CG_ColorForGivenHealth 0 0
export CG_ColorForHealth
proc CG_ColorForHealth 20 8
line 455
;448:
;449:/*
;450:=================
;451:CG_ColorForHealth
;452:=================
;453:*/
;454:void CG_ColorForHealth( vec4_t hcolor ) 
;455:{
line 462
;456:	int		health;
;457:	int		count;
;458:	int		max;
;459:
;460:	// calculate the total points of damage that can
;461:	// be sustained at the current health / armor level
;462:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
line 464
;463:
;464:	if ( health <= 0 ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $253
line 465
;465:	{
line 466
;466:		VectorClear( hcolor );	// black
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
line 467
;467:		hcolor[3] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 468
;468:		return;
ADDRGP4 $251
JUMPV
LABELV $253
line 471
;469:	}
;470:
;471:	count = cg.snap->ps.stats[STAT_ARMOR];
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 472
;472:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 12
CNSTF4 1056964608
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 473
;473:	if ( max < count ) 
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $256
line 474
;474:	{
line 475
;475:		count = max;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 476
;476:	}
LABELV $256
line 477
;477:	health += count;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 479
;478:
;479:	hcolor[3] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 480
;480:	CG_ColorForGivenHealth( hcolor, health );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_ColorForGivenHealth
CALLV
pop
line 481
;481:}
LABELV $251
endproc CG_ColorForHealth 20 8
export CG_DrawNumField
proc CG_DrawNumField 72 20
line 492
;482:
;483:/*
;484:==============
;485:CG_DrawNumField
;486:
;487:Take x,y positions as if 640 x 480 and scales them to the proper resolution
;488:
;489:==============
;490:*/
;491:void CG_DrawNumField (int x, int y, int width, int value,int charWidth,int charHeight,int style,qboolean zeroFill) 
;492:{
line 497
;493:	char	num[16], *ptr;
;494:	int		l;
;495:	int		frame;
;496:	int		xWidth;
;497:	int		i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 499
;498:
;499:	if (width < 1) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $259
line 500
;500:		return;
ADDRGP4 $258
JUMPV
LABELV $259
line 504
;501:	}
;502:
;503:	// draw number string
;504:	if (width > 5) {
ADDRFP4 8
INDIRI4
CNSTI4 5
LEI4 $261
line 505
;505:		width = 5;
ADDRFP4 8
CNSTI4 5
ASGNI4
line 506
;506:	}
LABELV $261
line 508
;507:
;508:	switch ( width ) {
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
LTI4 $263
ADDRLP4 36
INDIRI4
CNSTI4 4
GTI4 $263
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $293-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $293
address $265
address $272
address $279
address $286
code
LABELV $265
line 510
;509:	case 1:
;510:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $267
ADDRLP4 40
CNSTI4 9
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $267
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $268
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 511
;511:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $270
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $271
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 512
;512:		break;
ADDRGP4 $264
JUMPV
LABELV $272
line 514
;513:	case 2:
;514:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $274
ADDRLP4 48
CNSTI4 99
ASGNI4
ADDRGP4 $275
JUMPV
LABELV $274
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $275
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 515
;515:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $277
ADDRLP4 52
CNSTI4 -9
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $277
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $278
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 516
;516:		break;
ADDRGP4 $264
JUMPV
LABELV $279
line 518
;517:	case 3:
;518:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $281
ADDRLP4 56
CNSTI4 999
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $282
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 519
;519:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $284
ADDRLP4 60
CNSTI4 -99
ASGNI4
ADDRGP4 $285
JUMPV
LABELV $284
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $285
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 520
;520:		break;
ADDRGP4 $264
JUMPV
LABELV $286
line 522
;521:	case 4:
;522:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $288
ADDRLP4 64
CNSTI4 9999
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $288
ADDRLP4 64
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $289
ADDRFP4 12
ADDRLP4 64
INDIRI4
ASGNI4
line 523
;523:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $291
ADDRLP4 68
CNSTI4 -999
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
ADDRLP4 68
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $292
ADDRFP4 12
ADDRLP4 68
INDIRI4
ASGNI4
line 524
;524:		break;
LABELV $263
LABELV $264
line 527
;525:	}
;526:
;527:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 20
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $295
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 528
;528:	l = strlen(num);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 529
;529:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $296
line 530
;530:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $296
line 533
;531:
;532:	// FIXME: Might need to do something different for the chunky font??
;533:	switch(style)
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
EQI4 $302
ADDRLP4 44
INDIRI4
CNSTI4 2
EQI4 $300
ADDRLP4 44
INDIRI4
CNSTI4 3
EQI4 $301
ADDRGP4 $298
JUMPV
line 534
;534:	{
LABELV $300
line 536
;535:	case NUM_FONT_SMALL:
;536:		xWidth = charWidth;
ADDRLP4 8
ADDRFP4 16
INDIRI4
ASGNI4
line 537
;537:		break;
ADDRGP4 $299
JUMPV
LABELV $301
line 539
;538:	case NUM_FONT_CHUNKY:
;539:		xWidth = (charWidth/1.2f) + 2;
ADDRLP4 8
ADDRFP4 16
INDIRI4
CVIF4 4
CNSTF4 1067030938
DIVF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 540
;540:		break;
ADDRGP4 $299
JUMPV
LABELV $298
LABELV $302
line 543
;541:	default:
;542:	case NUM_FONT_BIG:
;543:		xWidth = (charWidth/2) + 7;//(charWidth/6);
ADDRLP4 8
ADDRFP4 16
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 7
ADDI4
ASGNI4
line 544
;544:		break;
LABELV $299
line 547
;545:	}
;546:
;547:	if ( zeroFill )
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $303
line 548
;548:	{
line 549
;549:		for (i = 0; i < (width - l); i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 550
;550:		{
line 551
;551:			switch(style)
ADDRLP4 48
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $317
ADDRLP4 48
INDIRI4
CNSTI4 2
EQI4 $311
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $314
ADDRGP4 $309
JUMPV
line 552
;552:			{
LABELV $311
line 554
;553:			case NUM_FONT_SMALL:
;554:				CG_DrawPic( x,y, charWidth, charHeight, cgs.media.smallnumberShaders[0] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+308
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 555
;555:				break;
ADDRGP4 $310
JUMPV
LABELV $314
line 557
;556:			case NUM_FONT_CHUNKY:
;557:				CG_DrawPic( x,y, charWidth, charHeight, cgs.media.chunkyNumberShaders[0] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+352
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 558
;558:				break;
ADDRGP4 $310
JUMPV
LABELV $309
LABELV $317
line 561
;559:			default:
;560:			case NUM_FONT_BIG:
;561:				CG_DrawPic( x,y, charWidth, charHeight, cgs.media.numberShaders[0] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+264
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 562
;562:				break;
LABELV $310
line 564
;563:			}
;564:			x += 2 + (xWidth);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 565
;565:		}
LABELV $306
line 549
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
LTI4 $305
line 566
;566:	}
ADDRGP4 $304
JUMPV
LABELV $303
line 568
;567:	else
;568:	{
line 569
;569:		x += 2 + (xWidth)*(width - l);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
MULI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 570
;570:	}
LABELV $304
line 572
;571:
;572:	ptr = num;
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $321
JUMPV
LABELV $320
line 574
;573:	while (*ptr && l)
;574:	{
line 575
;575:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $323
line 576
;576:			frame = STAT_MINUS;
ADDRLP4 12
CNSTI4 10
ASGNI4
ADDRGP4 $324
JUMPV
LABELV $323
line 578
;577:		else
;578:			frame = *ptr -'0';
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $324
line 580
;579:
;580:		switch(style)
ADDRLP4 48
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $333
ADDRLP4 48
INDIRI4
CNSTI4 2
EQI4 $327
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $330
ADDRGP4 $325
JUMPV
line 581
;581:		{
LABELV $327
line 583
;582:		case NUM_FONT_SMALL:
;583:			CG_DrawPic( x,y, charWidth, charHeight, cgs.media.smallnumberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+308
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 584
;584:			x++;	// For a one line gap
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 585
;585:			break;
ADDRGP4 $326
JUMPV
LABELV $330
line 587
;586:		case NUM_FONT_CHUNKY:
;587:			CG_DrawPic( x,y, charWidth, charHeight, cgs.media.chunkyNumberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+352
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 588
;588:			break;
ADDRGP4 $326
JUMPV
LABELV $325
LABELV $333
line 591
;589:		default:
;590:		case NUM_FONT_BIG:
;591:			CG_DrawPic( x,y, charWidth, charHeight, cgs.media.numberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+264
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 592
;592:			break;
LABELV $326
line 595
;593:		}
;594:
;595:		x += (xWidth);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 596
;596:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 597
;597:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 598
;598:	}
LABELV $321
line 573
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 48
INDIRI4
EQI4 $336
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $320
LABELV $336
line 600
;599:
;600:}
LABELV $258
endproc CG_DrawNumField 72 20
export UI_DrawProportionalString
proc UI_DrawProportionalString 24 36
line 604
;601:
;602:#include "../ui/ui_shared.h"	// for some text style junk
;603:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) 
;604:{
line 608
;605:	// having all these different style defines (1 for UI, one for CG, and now one for the re->font stuff) 
;606:	//	is dumb, but for now...
;607:	//
;608:	int iStyle = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 609
;609:	int iMenuFont = (style & UI_SMALLFONT) ? FONT_SMALL : FONT_MEDIUM;
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $348
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $348
ADDRLP4 8
CNSTI4 2
ASGNI4
LABELV $349
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 611
;610:
;611:	switch (style & (UI_LEFT|UI_CENTER|UI_RIGHT))
ADDRLP4 12
ADDRFP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $351
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $354
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $355
ADDRGP4 $351
JUMPV
line 612
;612:	{
line 615
;613:		default:
;614:		case UI_LEFT:
;615:		{
line 617
;616:			// nada...
;617:		}
line 618
;618:		break;
LABELV $354
line 621
;619:
;620:		case UI_CENTER:
;621:		{
line 622
;622:			x -= CG_Text_Width(str, 1.0, iMenuFont) / 2;
ADDRFP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 623
;623:		}
line 624
;624:		break;
ADDRGP4 $351
JUMPV
LABELV $355
line 627
;625:
;626:		case UI_RIGHT:
;627:		{
line 628
;628:			x -= CG_Text_Width(str, 1.0, iMenuFont) / 2;
ADDRFP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 629
;629:		}
line 630
;630:		break;
LABELV $351
line 633
;631:	}
;632:
;633:	if (style & UI_DROPSHADOW)
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $356
line 634
;634:	{
line 635
;635:		iStyle = ITEM_TEXTSTYLE_SHADOWED;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 636
;636:	}
ADDRGP4 $357
JUMPV
LABELV $356
line 638
;637:	else
;638:	if ( style & (UI_BLINK|UI_PULSE) )
ADDRFP4 12
INDIRI4
CNSTI4 20480
BANDI4
CNSTI4 0
EQI4 $358
line 639
;639:	{
line 640
;640:		iStyle = ITEM_TEXTSTYLE_BLINK;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 641
;641:	}
LABELV $358
LABELV $357
line 643
;642:
;643:	CG_Text_Paint(x, y, 1.0, color, str, 0, 0, iStyle, iMenuFont);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 644
;644:}
LABELV $346
endproc UI_DrawProportionalString 24 36
export UI_DrawScaledProportionalString
proc UI_DrawScaledProportionalString 16 36
line 647
;645:
;646:void UI_DrawScaledProportionalString( int x, int y, const char* str, int style, vec4_t color, float scale) 
;647:{
line 651
;648:	// having all these different style defines (1 for UI, one for CG, and now one for the re->font stuff) 
;649:	//	is dumb, but for now...
;650:	//
;651:	int iStyle = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 653
;652:
;653:	switch (style & (UI_LEFT|UI_CENTER|UI_RIGHT))
ADDRLP4 4
ADDRFP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $362
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $365
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $366
ADDRGP4 $362
JUMPV
line 654
;654:	{
line 657
;655:		default:
;656:		case UI_LEFT:
;657:		{
line 659
;658:			// nada...
;659:		}
line 660
;660:		break;
LABELV $365
line 663
;661:
;662:		case UI_CENTER:
;663:		{
line 664
;664:			x -= CG_Text_Width(str, scale, FONT_MEDIUM) / 2;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 665
;665:		}
line 666
;666:		break;
ADDRGP4 $362
JUMPV
LABELV $366
line 669
;667:
;668:		case UI_RIGHT:
;669:		{
line 670
;670:			x -= CG_Text_Width(str, scale, FONT_MEDIUM) / 2;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 671
;671:		}
line 672
;672:		break;
LABELV $362
line 675
;673:	}
;674:
;675:	if (style & UI_DROPSHADOW)
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $367
line 676
;676:	{
line 677
;677:		iStyle = ITEM_TEXTSTYLE_SHADOWED;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 678
;678:	}
ADDRGP4 $368
JUMPV
LABELV $367
line 680
;679:	else
;680:	if ( style & (UI_BLINK|UI_PULSE) )
ADDRFP4 12
INDIRI4
CNSTI4 20480
BANDI4
CNSTI4 0
EQI4 $369
line 681
;681:	{
line 682
;682:		iStyle = ITEM_TEXTSTYLE_BLINK;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 683
;683:	}
LABELV $369
LABELV $368
line 685
;684:
;685:	CG_Text_Paint(x, y, scale, color, str, 0, 0, iStyle, FONT_MEDIUM);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 686
;686:}
LABELV $360
endproc UI_DrawScaledProportionalString 16 36
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
import CG_DrawOldScoreboard
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
import CG_TeamColor
import CG_DrawString
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
LABELV $295
char 1 37
char 1 105
char 1 0
