export GetIDForString
code
proc GetIDForString 8 8
file "../../game/q_shared.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:/*
;7:-------------------------
;8:GetIDForString 
;9:-------------------------
;10:*/
;11:
;12:
;13:int GetIDForString ( stringID_table_t *table, const char *string )
;14:{
line 15
;15:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $38
JUMPV
LABELV $37
line 19
;16:
;17:	while ( ( table[index].name != NULL ) &&
;18:			( table[index].name[0] != 0 ) )
;19:	{
line 20
;20:		if ( !Q_stricmp( table[index].name, string ) )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $40
line 21
;21:			return table[index].id;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
RETI4
ADDRGP4 $36
JUMPV
LABELV $40
line 23
;22:
;23:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 24
;24:	}
LABELV $38
line 17
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $42
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $37
LABELV $42
line 26
;25:
;26:	return -1;
CNSTI4 -1
RETI4
LABELV $36
endproc GetIDForString 8 8
export GetStringForID
proc GetStringForID 8 0
line 36
;27:}
;28:
;29:/*
;30:-------------------------
;31:GetStringForID
;32:-------------------------
;33:*/
;34:
;35:const char *GetStringForID( stringID_table_t *table, int id )
;36:{
line 37
;37:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $45
JUMPV
LABELV $44
line 41
;38:
;39:	while ( ( table[index].name != NULL ) &&
;40:			( table[index].name[0] != 0 ) )
;41:	{
line 42
;42:		if ( table[index].id == id )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $47
line 43
;43:			return table[index].name;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $43
JUMPV
LABELV $47
line 45
;44:
;45:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 46
;46:	}
LABELV $45
line 39
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $49
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $44
LABELV $49
line 48
;47:
;48:	return NULL;
CNSTP4 0
RETP4
LABELV $43
endproc GetStringForID 8 0
export Com_Clamp
proc Com_Clamp 0 0
line 52
;49:}
;50:
;51:
;52:float Com_Clamp( float min, float max, float value ) {
line 53
;53:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $51
line 54
;54:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $50
JUMPV
LABELV $51
line 56
;55:	}
;56:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $53
line 57
;57:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $50
JUMPV
LABELV $53
line 59
;58:	}
;59:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $50
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 69
;60:}
;61:
;62:
;63:/*
;64:============
;65:COM_SkipPath
;66:============
;67:*/
;68:char *COM_SkipPath (char *pathname)
;69:{
line 72
;70:	char	*last;
;71:	
;72:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $57
JUMPV
LABELV $56
line 74
;73:	while (*pathname)
;74:	{
line 75
;75:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $59
line 76
;76:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $59
line 77
;77:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 78
;78:	}
LABELV $57
line 73
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $56
line 79
;79:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $55
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 0
line 87
;80:}
;81:
;82:/*
;83:============
;84:COM_StripExtension
;85:============
;86:*/
;87:void COM_StripExtension( const char *in, char *out ) {
ADDRGP4 $63
JUMPV
LABELV $62
line 88
;88:	while ( *in && *in != '.' ) {
line 89
;89:		*out++ = *in++;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 90
;90:	}
LABELV $63
line 88
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $65
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $62
LABELV $65
line 91
;91:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 92
;92:}
LABELV $61
endproc COM_StripExtension 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 100
;93:
;94:
;95:/*
;96:==================
;97:COM_DefaultExtension
;98:==================
;99:*/
;100:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 108
;101:	char	oldPath[MAX_QPATH];
;102:	char    *src;
;103:
;104://
;105:// if path doesn't have a .EXT, append extension
;106:// (extension should include the .)
;107://
;108:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $68
JUMPV
LABELV $67
line 110
;109:
;110:	while (*src != '/' && src != path) {
line 111
;111:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $70
line 112
;112:			return;                 // it has an extension
ADDRGP4 $66
JUMPV
LABELV $70
line 114
;113:		}
;114:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 115
;115:	}
LABELV $68
line 110
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $72
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $67
LABELV $72
line 117
;116:
;117:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 118
;118:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $73
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 119
;119:}
LABELV $66
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 151
;120:
;121:/*
;122:============================================================================
;123:
;124:					BYTE ORDER FUNCTIONS
;125:
;126:============================================================================
;127:*/
;128:/*
;129:// can't just use function pointers, or dll linkage can
;130:// mess up when qcommon is included in multiple places
;131:static short	(*_BigShort) (short l);
;132:static short	(*_LittleShort) (short l);
;133:static int		(*_BigLong) (int l);
;134:static int		(*_LittleLong) (int l);
;135:static qint64	(*_BigLong64) (qint64 l);
;136:static qint64	(*_LittleLong64) (qint64 l);
;137:static float	(*_BigFloat) (const float *l);
;138:static float	(*_LittleFloat) (const float *l);
;139:
;140:short	BigShort(short l){return _BigShort(l);}
;141:short	LittleShort(short l) {return _LittleShort(l);}
;142:int		BigLong (int l) {return _BigLong(l);}
;143:int		LittleLong (int l) {return _LittleLong(l);}
;144:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;145:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;146:float	BigFloat (const float *l) {return _BigFloat(l);}
;147:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;148:*/
;149:
;150:short   ShortSwap (short l)
;151:{
line 154
;152:	byte    b1,b2;
;153:
;154:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 155
;155:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 157
;156:
;157:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $74
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 161
;158:}
;159:
;160:short	ShortNoSwap (short l)
;161:{
line 162
;162:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $75
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 166
;163:}
;164:
;165:int    LongSwap (int l)
;166:{
line 169
;167:	byte    b1,b2,b3,b4;
;168:
;169:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 170
;170:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 171
;171:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 172
;172:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 174
;173:
;174:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $76
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 178
;175:}
;176:
;177:int	LongNoSwap (int l)
;178:{
line 179
;179:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $77
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 183
;180:}
;181:
;182:qint64 Long64Swap (qint64 ll)
;183:{
line 186
;184:	qint64	result;
;185:
;186:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 187
;187:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 188
;188:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 189
;189:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 190
;190:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 191
;191:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 192
;192:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 193
;193:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 195
;194:
;195:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $78
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 199
;196:}
;197:
;198:qint64 Long64NoSwap (qint64 ll)
;199:{
line 200
;200:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $87
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 12 4
line 208
;201:}
;202:
;203:typedef union {
;204:    float	f;
;205:    unsigned int i;
;206:} _FloatByteUnion;
;207:
;208:float FloatSwap (const float *f) {
line 212
;209:	const _FloatByteUnion *in;
;210:	_FloatByteUnion out;
;211:
;212:	in = (_FloatByteUnion *)f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 213
;213:	out.i = LongSwap(in->i);
ADDRLP4 0
INDIRP4
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 8
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CVIU4 4
ASGNU4
line 215
;214:
;215:	return out.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $90
endproc FloatSwap 12 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 219
;216:}
;217:
;218:float FloatNoSwap (const float *f)
;219:{
line 220
;220:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $91
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 273
;221:}
;222:
;223:/*
;224:================
;225:Swap_Init
;226:================
;227:*/
;228:/*
;229:void Swap_Init (void)
;230:{
;231:	byte	swaptest[2] = {1,0};
;232:
;233:// set the byte swapping variables in a portable manner	
;234:	if ( *(short *)swaptest == 1)
;235:	{
;236:		_BigShort = ShortSwap;
;237:		_LittleShort = ShortNoSwap;
;238:		_BigLong = LongSwap;
;239:		_LittleLong = LongNoSwap;
;240:		_BigLong64 = Long64Swap;
;241:		_LittleLong64 = Long64NoSwap;
;242:		_BigFloat = FloatSwap;
;243:		_LittleFloat = FloatNoSwap;
;244:	}
;245:	else
;246:	{
;247:		_BigShort = ShortNoSwap;
;248:		_LittleShort = ShortSwap;
;249:		_BigLong = LongNoSwap;
;250:		_LittleLong = LongSwap;
;251:		_BigLong64 = Long64NoSwap;
;252:		_LittleLong64 = Long64Swap;
;253:		_BigFloat = FloatNoSwap;
;254:		_LittleFloat = FloatSwap;
;255:	}
;256:
;257:}
;258:*/
;259:
;260:/*
;261:============================================================================
;262:
;263:PARSING
;264:
;265:============================================================================
;266:*/
;267:
;268:static	char	com_token[MAX_TOKEN_CHARS];
;269:static	char	com_parsename[MAX_TOKEN_CHARS];
;270:static	int		com_lines;
;271:
;272:void COM_BeginParseSession( const char *name )
;273:{
line 274
;274:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 275
;275:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 276
;276:}
LABELV $92
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 279
;277:
;278:int COM_GetCurrentParseLine( void )
;279:{
line 280
;280:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $94
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 284
;281:}
;282:
;283:char *COM_Parse( const char **data_p )
;284:{
line 285
;285:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $95
endproc COM_Parse 4 8
bss
align 1
LABELV $97
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 289
;286:}
;287:
;288:void COM_ParseError( char *format, ... )
;289:{
line 293
;290:	va_list argptr;
;291:	static char string[4096];
;292:
;293:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 294
;294:	vsprintf (string, format, argptr);
ADDRGP4 $97
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 295
;295:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 297
;296:
;297:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $99
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $97
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 298
;298:}
LABELV $96
endproc COM_ParseError 4 16
bss
align 1
LABELV $101
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 301
;299:
;300:void COM_ParseWarning( char *format, ... )
;301:{
line 305
;302:	va_list argptr;
;303:	static char string[4096];
;304:
;305:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 306
;306:	vsprintf (string, format, argptr);
ADDRGP4 $101
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 307
;307:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 309
;308:
;309:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $103
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $101
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 310
;310:}
LABELV $100
endproc COM_ParseWarning 4 16
export SkipWhitespace
proc SkipWhitespace 8 0
line 324
;311:
;312:/*
;313:==============
;314:COM_Parse
;315:
;316:Parse a token out of a string
;317:Will never return NULL, just empty strings
;318:
;319:If "allowLineBreaks" is qtrue then an empty
;320:string will be returned if the next token is
;321:a newline.
;322:==============
;323:*/
;324:const char *SkipWhitespace( const char *data, qboolean *hasNewLines ) {
ADDRGP4 $106
JUMPV
LABELV $105
line 327
;325:	int c;
;326:
;327:	while( (c = *data) <= ' ') {
line 328
;328:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $108
line 329
;329:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $104
JUMPV
LABELV $108
line 331
;330:		}
;331:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $110
line 332
;332:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;333:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 334
;334:		}
LABELV $110
line 335
;335:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 336
;336:	}
LABELV $106
line 327
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $105
line 338
;337:
;338:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $104
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 341
;339:}
;340:
;341:int COM_Compress( char *data_p ) {
line 344
;342:	char *in, *out;
;343:	int c;
;344:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 346
;345:	
;346:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 347
;347:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
ADDRGP4 $116
JUMPV
LABELV $115
line 348
;348:		while ((c = *in) != 0) {
line 350
;349:			// skip double slash comments
;350:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $118
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $118
ADDRGP4 $121
JUMPV
LABELV $120
line 351
;351:				while (*in && *in != '\n') {
line 352
;352:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 353
;353:				}
LABELV $121
line 351
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $120
LABELV $123
line 355
;354:				// skip /* */ comments
;355:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $124
ADDRGP4 $127
JUMPV
LABELV $126
line 357
;356:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;357:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $127
line 356
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $129
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $126
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $126
LABELV $129
line 358
;358:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $125
line 359
;359:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 361
;360:				// record when we hit a newline
;361:			} else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $134
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $132
LABELV $134
line 362
;362:				newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 363
;363:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 365
;364:				// record when we hit whitespace
;365:			} else if ( c == ' ' || c == '\t') {
ADDRGP4 $133
JUMPV
LABELV $132
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $137
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $135
LABELV $137
line 366
;366:				whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 367
;367:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 369
;368:				// an actual token
;369:			} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 371
;370:				// if we have a pending newline, emit it (and it counts as whitespace)
;371:				if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $138
line 372
;372:					*out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 373
;373:					newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 374
;374:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 375
;375:				} if (whitespace) {
LABELV $138
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $140
line 376
;376:					*out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 377
;377:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 378
;378:				}
LABELV $140
line 381
;379:				
;380:				// copy quoted strings unmolested
;381:				if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $142
line 382
;382:					*out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 383
;383:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $144
line 384
;384:					while (1) {
line 385
;385:						c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 386
;386:						if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $146
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $146
line 387
;387:							*out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 388
;388:							in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 389
;389:						} else {
line 390
;390:							break;
LABELV $148
line 392
;391:						}
;392:					}
LABELV $145
line 384
ADDRGP4 $144
JUMPV
LABELV $146
line 393
;393:					if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $143
line 394
;394:						*out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 395
;395:						in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 396
;396:					}
line 397
;397:				} else {
ADDRGP4 $143
JUMPV
LABELV $142
line 398
;398:					*out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 399
;399:					out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 400
;400:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 401
;401:				}
LABELV $143
line 402
;402:			}
LABELV $136
LABELV $133
LABELV $125
LABELV $119
line 403
;403:		}
LABELV $116
line 348
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $115
line 404
;404:	}
LABELV $113
line 405
;405:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 406
;406:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $112
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 410
;407:}
;408:
;409:char *COM_ParseExt( const char **data_p, qboolean allowLineBreaks )
;410:{
line 411
;411:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 412
;412:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 415
;413:	const char *data;
;414:
;415:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 416
;416:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 417
;417:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 420
;418:
;419:	// make sure incoming data is valid
;420:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $155
line 421
;421:	{
line 422
;422:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 423
;423:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $151
JUMPV
LABELV $154
line 427
;424:	}
;425:
;426:	while ( 1 )
;427:	{
line 429
;428:		// skip whitespace
;429:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 430
;430:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 431
;431:		{
line 432
;432:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 433
;433:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $151
JUMPV
LABELV $157
line 435
;434:		}
;435:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $159
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $159
line 436
;436:		{
line 437
;437:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 438
;438:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $151
JUMPV
LABELV $159
line 441
;439:		}
;440:
;441:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 444
;442:
;443:		// skip double slash comments
;444:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $161
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $161
line 445
;445:		{
line 446
;446:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $164
JUMPV
LABELV $163
line 447
;447:			while (*data && *data != '\n') {
line 448
;448:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 449
;449:			}
LABELV $164
line 447
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $166
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $163
LABELV $166
line 450
;450:		}
ADDRGP4 $162
JUMPV
LABELV $161
line 452
;451:		// skip /* */ comments
;452:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $156
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $156
line 453
;453:		{
line 454
;454:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $170
JUMPV
LABELV $169
line 456
;455:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;456:			{
line 457
;457:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 458
;458:			}
LABELV $170
line 455
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $172
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $169
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $169
LABELV $172
line 459
;459:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $168
line 460
;460:			{
line 461
;461:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 462
;462:			}
line 463
;463:		}
line 465
;464:		else
;465:		{
line 466
;466:			break;
LABELV $168
LABELV $162
line 468
;467:		}
;468:	}
LABELV $155
line 426
ADDRGP4 $154
JUMPV
LABELV $156
line 471
;469:
;470:	// handle quoted strings
;471:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $175
line 472
;472:	{
line 473
;473:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $177
line 475
;474:		while (1)
;475:		{
line 476
;476:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 477
;477:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $182
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $180
LABELV $182
line 478
;478:			{
line 479
;479:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 480
;480:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 481
;481:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $151
JUMPV
LABELV $180
line 483
;482:			}
;483:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $183
line 484
;484:			{
line 485
;485:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 486
;486:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 487
;487:			}
LABELV $183
line 488
;488:		}
LABELV $178
line 474
ADDRGP4 $177
JUMPV
line 489
;489:	}
LABELV $175
LABELV $185
line 493
;490:
;491:	// parse a regular word
;492:	do
;493:	{
line 494
;494:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $188
line 495
;495:		{
line 496
;496:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 497
;497:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 498
;498:		}
LABELV $188
line 499
;499:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 500
;500:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 501
;501:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $190
line 502
;502:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $190
line 503
;503:	} while (c>32);
LABELV $186
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $185
line 505
;504:
;505:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
NEI4 $192
line 506
;506:	{
line 508
;507://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;508:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 509
;509:	}
LABELV $192
line 510
;510:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 512
;511:
;512:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 513
;513:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $151
endproc COM_ParseExt 36 8
export COM_ParseString
proc COM_ParseString 4 8
line 577
;514:}
;515:
;516:
;517:#if 0
;518:// no longer used
;519:/*
;520:===============
;521:COM_ParseInfos
;522:===============
;523:*/
;524:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;525:	char	*token;
;526:	int		count;
;527:	char	key[MAX_TOKEN_CHARS];
;528:
;529:	count = 0;
;530:
;531:	while ( 1 ) {
;532:		token = COM_Parse( &buf );
;533:		if ( !token[0] ) {
;534:			break;
;535:		}
;536:		if ( strcmp( token, "{" ) ) {
;537:			Com_Printf( "Missing { in info file\n" );
;538:			break;
;539:		}
;540:
;541:		if ( count == max ) {
;542:			Com_Printf( "Max infos exceeded\n" );
;543:			break;
;544:		}
;545:
;546:		infos[count][0] = 0;
;547:		while ( 1 ) {
;548:			token = COM_ParseExt( &buf, qtrue );
;549:			if ( !token[0] ) {
;550:				Com_Printf( "Unexpected end of info file\n" );
;551:				break;
;552:			}
;553:			if ( !strcmp( token, "}" ) ) {
;554:				break;
;555:			}
;556:			Q_strncpyz( key, token, sizeof( key ) );
;557:
;558:			token = COM_ParseExt( &buf, qfalse );
;559:			if ( !token[0] ) {
;560:				strcpy( token, "<NULL>" );
;561:			}
;562:			Info_SetValueForKey( infos[count], key, token );
;563:		}
;564:		count++;
;565:	}
;566:
;567:	return count;
;568:}
;569:#endif
;570:
;571:/*
;572:===============
;573:COM_ParseString
;574:===============
;575:*/
;576:qboolean COM_ParseString( const char **data, const char **s ) 
;577:{
line 579
;578://	*s = COM_ParseExt( data, qtrue );
;579:	*s = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 580
;580:	if ( s[0] == 0 ) 
ADDRFP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $195
line 581
;581:	{
line 582
;582:		Com_Printf("unexpected EOF\n");
ADDRGP4 $197
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 583
;583:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
LABELV $195
line 585
;584:	}
;585:	return qfalse;
CNSTI4 0
RETI4
LABELV $194
endproc COM_ParseString 4 8
export COM_ParseInt
proc COM_ParseInt 12 8
line 594
;586:}
;587:
;588:/*
;589:===============
;590:COM_ParseInt
;591:===============
;592:*/
;593:qboolean COM_ParseInt( const char **data, int *i ) 
;594:{
line 597
;595:	const char	*token;
;596:
;597:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 598
;598:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $199
line 599
;599:	{
line 600
;600:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $197
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 601
;601:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $198
JUMPV
LABELV $199
line 604
;602:	}
;603:
;604:	*i = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 605
;605:	return qfalse;
CNSTI4 0
RETI4
LABELV $198
endproc COM_ParseInt 12 8
export COM_ParseFloat
proc COM_ParseFloat 12 8
line 614
;606:}
;607:
;608:/*
;609:===============
;610:COM_ParseFloat
;611:===============
;612:*/
;613:qboolean COM_ParseFloat( const char **data, float *f ) 
;614:{
line 617
;615:	const char	*token;
;616:
;617:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 618
;618:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $202
line 619
;619:	{
line 620
;620:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $197
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 621
;621:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $201
JUMPV
LABELV $202
line 624
;622:	}
;623:
;624:	*f = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 625
;625:	return qfalse;
CNSTI4 0
RETI4
LABELV $201
endproc COM_ParseFloat 12 8
export COM_ParseVec4
proc COM_ParseVec4 12 8
line 634
;626:}
;627:
;628:/*
;629:===============
;630:COM_ParseVec4
;631:===============
;632:*/
;633:qboolean COM_ParseVec4( const char **buffer, vec4_t *c) 
;634:{
line 638
;635:	int i;
;636:	float f;
;637:
;638:	for (i = 0; i < 4; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $205
line 639
;639:	{
line 640
;640:		if (COM_ParseFloat(buffer, &f)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 COM_ParseFloat
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $209
line 641
;641:		{
line 642
;642:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $204
JUMPV
LABELV $209
line 644
;643:		}
;644:		(*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 645
;645:	}
LABELV $206
line 638
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $205
line 646
;646:	return qfalse;
CNSTI4 0
RETI4
LABELV $204
endproc COM_ParseVec4 12 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 654
;647:}
;648:
;649:/*
;650:==================
;651:COM_MatchToken
;652:==================
;653:*/
;654:void COM_MatchToken( const char **buf_p, char *match ) {
line 657
;655:	char	*token;
;656:
;657:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 658
;658:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $212
line 659
;659:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $214
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 660
;660:	}
LABELV $212
line 661
;661:}
LABELV $211
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 673
;662:
;663:
;664:/*
;665:=================
;666:SkipBracedSection
;667:
;668:The next token should be an open brace.
;669:Skips until a matching close brace is found.
;670:Internal brace depths are properly skipped.
;671:=================
;672:*/
;673:void SkipBracedSection (const char **program) {
line 677
;674:	char			*token;
;675:	int				depth;
;676:
;677:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $216
line 678
;678:	do {
line 679
;679:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 680
;680:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $219
line 681
;681:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $221
line 682
;682:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 683
;683:			}
ADDRGP4 $222
JUMPV
LABELV $221
line 684
;684:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $223
line 685
;685:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 686
;686:			}
LABELV $223
LABELV $222
line 687
;687:		}
LABELV $219
line 688
;688:	} while( depth && *program );
LABELV $217
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $225
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
LABELV $225
line 689
;689:}
LABELV $215
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 696
;690:
;691:/*
;692:=================
;693:SkipRestOfLine
;694:=================
;695:*/
;696:void SkipRestOfLine ( const char **data ) {
line 700
;697:	const char	*p;
;698:	int		c;
;699:
;700:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $228
JUMPV
LABELV $227
line 701
;701:	while ( (c = *p++) != 0 ) {
line 702
;702:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $230
line 703
;703:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 704
;704:			break;
ADDRGP4 $229
JUMPV
LABELV $230
line 706
;705:		}
;706:	}
LABELV $228
line 701
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $227
LABELV $229
line 708
;707:
;708:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 709
;709:}
LABELV $226
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 712
;710:
;711:
;712:void Parse1DMatrix (const char **buf_p, int x, float *m) {
line 716
;713:	char	*token;
;714:	int		i;
;715:
;716:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 718
;717:
;718:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $234
line 719
;719:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 720
;720:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 721
;721:	}
LABELV $235
line 718
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $237
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $234
line 723
;722:
;723:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 724
;724:}
LABELV $232
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 726
;725:
;726:void Parse2DMatrix (const char **buf_p, int y, int x, float *m) {
line 729
;727:	int		i;
;728:
;729:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 731
;730:
;731:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $240
line 732
;732:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 733
;733:	}
LABELV $241
line 731
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $243
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $240
line 735
;734:
;735:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 736
;736:}
LABELV $239
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 738
;737:
;738:void Parse3DMatrix (const char **buf_p, int z, int y, int x, float *m) {
line 741
;739:	int		i;
;740:
;741:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 743
;742:
;743:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $248
JUMPV
LABELV $245
line 744
;744:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 745
;745:	}
LABELV $246
line 743
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $248
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $245
line 747
;746:
;747:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 748
;748:}
LABELV $244
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 760
;749:
;750:
;751:/*
;752:============================================================================
;753:
;754:					LIBRARY REPLACEMENT FUNCTIONS
;755:
;756:============================================================================
;757:*/
;758:
;759:int Q_isprint( int c )
;760:{
line 761
;761:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $250
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $250
line 762
;762:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $249
JUMPV
LABELV $250
line 763
;763:	return ( 0 );
CNSTI4 0
RETI4
LABELV $249
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 767
;764:}
;765:
;766:int Q_islower( int c )
;767:{
line 768
;768:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $253
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $253
line 769
;769:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $252
JUMPV
LABELV $253
line 770
;770:	return ( 0 );
CNSTI4 0
RETI4
LABELV $252
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 774
;771:}
;772:
;773:int Q_isupper( int c )
;774:{
line 775
;775:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $256
line 776
;776:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 777
;777:	return ( 0 );
CNSTI4 0
RETI4
LABELV $255
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 781
;778:}
;779:
;780:int Q_isalpha( int c )
;781:{
line 782
;782:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $262
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $261
LABELV $262
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $259
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $259
LABELV $261
line 783
;783:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $258
JUMPV
LABELV $259
line 784
;784:	return ( 0 );
CNSTI4 0
RETI4
LABELV $258
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 788
;785:}
;786:
;787:char* Q_strrchr( const char* string, int c )
;788:{
line 789
;789:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 791
;790:	char *s;
;791:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 793
;792:
;793:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $265
JUMPV
LABELV $264
line 796
;794:
;795:	while (*s)
;796:	{
line 797
;797:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $267
line 798
;798:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $267
line 799
;799:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 800
;800:	}
LABELV $265
line 795
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $264
line 801
;801:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $269
line 802
;802:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $269
line 804
;803:
;804:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $263
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 814
;805:}
;806:
;807:/*
;808:=============
;809:Q_strncpyz
;810: 
;811:Safe strncpy that ensures a trailing zero
;812:=============
;813:*/
;814:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 816
;815:  // bk001129 - also NULL dest
;816:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $272
line 817
;817:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $274
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 818
;818:  }
LABELV $272
line 819
;819:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $275
line 820
;820:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $277
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 821
;821:	}
LABELV $275
line 822
;822:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $278
line 823
;823:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $280
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 824
;824:	}
LABELV $278
line 826
;825:
;826:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 827
;827:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 828
;828:}
LABELV $271
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 830
;829:                 
;830:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 834
;831:	int		c1, c2;
;832:
;833:	// bk001129 - moved in 1.17 fix not in id codebase
;834:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $282
line 835
;835:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $284
line 836
;836:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $281
JUMPV
LABELV $284
line 838
;837:           else
;838:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $281
JUMPV
LABELV $282
line 840
;839:        }
;840:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $286
line 841
;841:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $281
JUMPV
LABELV $286
LABELV $288
line 845
;842:
;843:
;844:	
;845:	do {
line 846
;846:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 847
;847:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 849
;848:
;849:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $291
line 850
;850:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $281
JUMPV
LABELV $291
line 853
;851:		}
;852:		
;853:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $293
line 854
;854:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $295
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $295
line 855
;855:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 856
;856:			}
LABELV $295
line 857
;857:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $297
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $297
line 858
;858:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 859
;859:			}
LABELV $297
line 860
;860:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $299
line 861
;861:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $302
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $303
JUMPV
LABELV $302
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $303
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $281
JUMPV
LABELV $299
line 863
;862:			}
;863:		}
LABELV $293
line 864
;864:	} while (c1);
LABELV $289
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $288
line 866
;865:	
;866:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $281
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 869
;867:}
;868:
;869:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $305
line 872
;870:	int		c1, c2;
;871:	
;872:	do {
line 873
;873:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 874
;874:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 876
;875:
;876:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $308
line 877
;877:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $308
line 880
;878:		}
;879:		
;880:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $310
line 881
;881:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $313
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $313
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $314
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $304
JUMPV
LABELV $310
line 883
;882:		}
;883:	} while (c1);
LABELV $306
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $305
line 885
;884:	
;885:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $304
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 888
;886:}
;887:
;888:int Q_stricmp (const char *s1, const char *s2) {
line 889
;889:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $317
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $317
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $317
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $318
ADDRLP4 0
INDIRI4
RETI4
LABELV $315
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 893
;890:}
;891:
;892:
;893:char *Q_strlwr( char *s1 ) {
line 896
;894:    char	*s;
;895:
;896:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $321
JUMPV
LABELV $320
line 897
;897:	while ( *s ) {
line 898
;898:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 899
;899:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 900
;900:	}
LABELV $321
line 897
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $320
line 901
;901:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $319
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 904
;902:}
;903:
;904:char *Q_strupr( char *s1 ) {
line 907
;905:    char	*s;
;906:
;907:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $325
JUMPV
LABELV $324
line 908
;908:	while ( *s ) {
line 909
;909:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 910
;910:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 911
;911:	}
LABELV $325
line 908
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $324
line 912
;912:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $323
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 917
;913:}
;914:
;915:
;916:// never goes past bounds or leaves without a terminating 0
;917:void Q_strcat( char *dest, int size, const char *src ) {
line 920
;918:	int		l1;
;919:
;920:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 921
;921:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $328
line 922
;922:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $330
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 923
;923:	}
LABELV $328
line 924
;924:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 925
;925:}
LABELV $327
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 20 0
line 928
;926:
;927:
;928:int Q_PrintStrlen( const char *string ) {
line 932
;929:	int			len;
;930:	const char	*p;
;931:
;932:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 933
;933:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $332
line 936
;934:	}
;935:
;936:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 937
;937:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $335
JUMPV
LABELV $334
line 938
;938:	while( *p ) {
line 939
;939:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $337
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $337
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
EQI4 $337
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $337
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $337
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $337
line 940
;940:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 941
;941:			continue;
ADDRGP4 $335
JUMPV
LABELV $337
line 943
;942:		}
;943:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 944
;944:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 945
;945:	}
LABELV $335
line 938
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $334
line 947
;946:
;947:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $331
endproc Q_PrintStrlen 20 0
export Q_CleanStr
proc Q_CleanStr 32 0
line 951
;948:}
;949:
;950:
;951:char *Q_CleanStr( char *string ) {
line 956
;952:	char*	d;
;953:	char*	s;
;954:	int		c;
;955:
;956:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 957
;957:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $341
JUMPV
LABELV $340
line 958
;958:	while ((c = *s) != 0 ) {
line 959
;959:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $343
ADDRLP4 16
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $343
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $343
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $343
ADDRLP4 20
INDIRI4
CNSTI4 55
GTI4 $343
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $343
line 960
;960:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 961
;961:		}		
ADDRGP4 $344
JUMPV
LABELV $343
line 962
;962:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $345
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $345
line 963
;963:			*d++ = c;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 964
;964:		}
LABELV $345
LABELV $344
line 965
;965:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 966
;966:	}
LABELV $341
line 958
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $340
line 967
;967:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 969
;968:
;969:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $339
endproc Q_CleanStr 32 0
export Com_sprintf
proc Com_sprintf 32012 12
line 973
;970:}
;971:
;972:
;973:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 978
;974:	int		len;
;975:	va_list		argptr;
;976:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;977:
;978:	va_start (argptr,fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 979
;979:	len = vsprintf (bigbuffer,fmt,argptr);
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32008
INDIRI4
ASGNI4
line 980
;980:	va_end (argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 981
;981:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $349
line 982
;982:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $351
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 983
;983:	}
LABELV $349
line 984
;984:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $352
line 985
;985:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $354
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 993
;986:#ifdef	_DEBUG
;987:#if !MAC_PORT
;988:		__asm {
;989:			int 3;
;990:		}
;991:#endif
;992:#endif
;993:	}
LABELV $352
line 994
;994:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 995
;995:}
LABELV $347
endproc Com_sprintf 32012 12
bss
align 1
LABELV $356
skip 64000
data
align 4
LABELV $357
byte 4 0
export va
code
proc va 12 12
line 1007
;996:
;997:
;998:/*
;999:============
;1000:va
;1001:
;1002:does a varargs printf into a temp buffer, so I don't need to have
;1003:varargs versions of all text functions.
;1004:FIXME: make this buffer size safe someday
;1005:============
;1006:*/
;1007:char	* QDECL va( const char *format, ... ) {
line 1013
;1008:	va_list		argptr;
;1009:	static char		string[2][32000];	// in case va is called by nested functions
;1010:	static int		index = 0;
;1011:	char	*buf;
;1012:
;1013:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $357
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $356
ADDP4
ASGNP4
line 1014
;1014:	index++;
ADDRLP4 8
ADDRGP4 $357
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1016
;1015:
;1016:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1017
;1017:	vsprintf (buf, format,argptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 1018
;1018:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1020
;1019:
;1020:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $355
endproc va 12 12
bss
align 1
LABELV $360
skip 16384
data
align 4
LABELV $361
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1041
;1021:}
;1022:
;1023:
;1024:/*
;1025:=====================================================================
;1026:
;1027:  INFO STRINGS
;1028:
;1029:=====================================================================
;1030:*/
;1031:
;1032:/*
;1033:===============
;1034:Info_ValueForKey
;1035:
;1036:Searches the string for the given
;1037:key and returns the associated value, or an empty string.
;1038:FIXME: overflow check?
;1039:===============
;1040:*/
;1041:char *Info_ValueForKey( const char *s, const char *key ) {
line 1048
;1042:	char	pkey[BIG_INFO_KEY];
;1043:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1044:											// work without stomping on each other
;1045:	static	int	valueindex = 0;
;1046:	char	*o;
;1047:	
;1048:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $364
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $362
LABELV $364
line 1049
;1049:		return "";
ADDRGP4 $365
RETP4
ADDRGP4 $359
JUMPV
LABELV $362
line 1052
;1050:	}
;1051:
;1052:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $366
line 1053
;1053:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $368
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1054
;1054:	}
LABELV $366
line 1056
;1055:
;1056:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $361
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1057
;1057:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $372
line 1058
;1058:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $372
JUMPV
LABELV $371
line 1060
;1059:	while (1)
;1060:	{
line 1061
;1061:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $375
JUMPV
LABELV $374
line 1063
;1062:		while (*s != '\\')
;1063:		{
line 1064
;1064:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $377
line 1065
;1065:				return "";
ADDRGP4 $365
RETP4
ADDRGP4 $359
JUMPV
LABELV $377
line 1066
;1066:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1067
;1067:		}
LABELV $375
line 1062
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $374
line 1068
;1068:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1069
;1069:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1071
;1070:
;1071:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $361
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $360
ADDP4
ASGNP4
ADDRGP4 $380
JUMPV
LABELV $379
line 1074
;1072:
;1073:		while (*s != '\\' && *s)
;1074:		{
line 1075
;1075:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1076
;1076:		}
LABELV $380
line 1073
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $382
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $379
LABELV $382
line 1077
;1077:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1079
;1078:
;1079:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $383
line 1080
;1080:			return value[valueindex];
ADDRGP4 $361
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $360
ADDP4
RETP4
ADDRGP4 $359
JUMPV
LABELV $383
line 1082
;1081:
;1082:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $385
line 1083
;1083:			break;
ADDRGP4 $373
JUMPV
LABELV $385
line 1084
;1084:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1085
;1085:	}
LABELV $372
line 1059
ADDRGP4 $371
JUMPV
LABELV $373
line 1087
;1086:
;1087:	return "";
ADDRGP4 $365
RETP4
LABELV $359
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1098
;1088:}
;1089:
;1090:
;1091:/*
;1092:===================
;1093:Info_NextPair
;1094:
;1095:Used to itterate through all the key/value pairs in an info string
;1096:===================
;1097:*/
;1098:void Info_NextPair( const char **head, char *key, char *value ) {
line 1102
;1099:	char	*o;
;1100:	const char	*s;
;1101:
;1102:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1104
;1103:
;1104:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $388
line 1105
;1105:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1106
;1106:	}
LABELV $388
line 1107
;1107:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1108
;1108:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1110
;1109:
;1110:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $391
JUMPV
LABELV $390
line 1111
;1111:	while ( *s != '\\' ) {
line 1112
;1112:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $393
line 1113
;1113:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1114
;1114:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1115
;1115:			return;
ADDRGP4 $387
JUMPV
LABELV $393
line 1117
;1116:		}
;1117:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1118
;1118:	}
LABELV $391
line 1111
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $390
line 1119
;1119:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1120
;1120:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1122
;1121:
;1122:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $396
JUMPV
LABELV $395
line 1123
;1123:	while ( *s != '\\' && *s ) {
line 1124
;1124:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1125
;1125:	}
LABELV $396
line 1123
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $398
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $395
LABELV $398
line 1126
;1126:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1128
;1127:
;1128:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1129
;1129:}
LABELV $387
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 8
line 1137
;1130:
;1131:
;1132:/*
;1133:===================
;1134:Info_RemoveKey
;1135:===================
;1136:*/
;1137:void Info_RemoveKey( char *s, const char *key ) {
line 1143
;1138:	char	*start;
;1139:	char	pkey[MAX_INFO_KEY];
;1140:	char	value[MAX_INFO_VALUE];
;1141:	char	*o;
;1142:
;1143:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $400
line 1144
;1144:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $402
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1145
;1145:	}
LABELV $400
line 1147
;1146:
;1147:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $406
line 1148
;1148:		return;
ADDRGP4 $399
JUMPV
LABELV $405
line 1152
;1149:	}
;1150:
;1151:	while (1)
;1152:	{
line 1153
;1153:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1154
;1154:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $408
line 1155
;1155:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $408
line 1156
;1156:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $411
JUMPV
LABELV $410
line 1158
;1157:		while (*s != '\\')
;1158:		{
line 1159
;1159:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $413
line 1160
;1160:				return;
ADDRGP4 $399
JUMPV
LABELV $413
line 1161
;1161:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1162
;1162:		}
LABELV $411
line 1157
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $410
line 1163
;1163:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1164
;1164:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1166
;1165:
;1166:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $416
JUMPV
LABELV $415
line 1168
;1167:		while (*s != '\\' && *s)
;1168:		{
line 1169
;1169:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $418
line 1170
;1170:				return;
ADDRGP4 $399
JUMPV
LABELV $418
line 1171
;1171:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1172
;1172:		}
LABELV $416
line 1167
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $420
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $415
LABELV $420
line 1173
;1173:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1175
;1174:
;1175:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $421
line 1176
;1176:		{
line 1177
;1177:			strcpy (start, s);	// remove this part
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1178
;1178:			return;
ADDRGP4 $399
JUMPV
LABELV $421
line 1181
;1179:		}
;1180:
;1181:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $423
line 1182
;1182:			return;
ADDRGP4 $399
JUMPV
LABELV $423
line 1183
;1183:	}
LABELV $406
line 1151
ADDRGP4 $405
JUMPV
line 1185
;1184:
;1185:}
LABELV $399
endproc Info_RemoveKey 2076 8
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1192
;1186:
;1187:/*
;1188:===================
;1189:Info_RemoveKey_Big
;1190:===================
;1191:*/
;1192:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1198
;1193:	char	*start;
;1194:	char	pkey[BIG_INFO_KEY];
;1195:	char	value[BIG_INFO_VALUE];
;1196:	char	*o;
;1197:
;1198:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $426
line 1199
;1199:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $428
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1200
;1200:	}
LABELV $426
line 1202
;1201:
;1202:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $432
line 1203
;1203:		return;
ADDRGP4 $425
JUMPV
LABELV $431
line 1207
;1204:	}
;1205:
;1206:	while (1)
;1207:	{
line 1208
;1208:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1209
;1209:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $434
line 1210
;1210:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $434
line 1211
;1211:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $437
JUMPV
LABELV $436
line 1213
;1212:		while (*s != '\\')
;1213:		{
line 1214
;1214:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $439
line 1215
;1215:				return;
ADDRGP4 $425
JUMPV
LABELV $439
line 1216
;1216:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1217
;1217:		}
LABELV $437
line 1212
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $436
line 1218
;1218:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1219
;1219:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1221
;1220:
;1221:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $441
line 1223
;1222:		while (*s != '\\' && *s)
;1223:		{
line 1224
;1224:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $444
line 1225
;1225:				return;
ADDRGP4 $425
JUMPV
LABELV $444
line 1226
;1226:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1227
;1227:		}
LABELV $442
line 1222
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $446
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $441
LABELV $446
line 1228
;1228:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1230
;1229:
;1230:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $447
line 1231
;1231:		{
line 1232
;1232:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1233
;1233:			return;
ADDRGP4 $425
JUMPV
LABELV $447
line 1236
;1234:		}
;1235:
;1236:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $449
line 1237
;1237:			return;
ADDRGP4 $425
JUMPV
LABELV $449
line 1238
;1238:	}
LABELV $432
line 1206
ADDRGP4 $431
JUMPV
line 1240
;1239:
;1240:}
LABELV $425
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1253
;1241:
;1242:
;1243:
;1244:
;1245:/*
;1246:==================
;1247:Info_Validate
;1248:
;1249:Some characters are illegal in info strings because they
;1250:can mess up the server's parsing
;1251:==================
;1252:*/
;1253:qboolean Info_Validate( const char *s ) {
line 1254
;1254:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $452
line 1255
;1255:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $451
JUMPV
LABELV $452
line 1257
;1256:	}
;1257:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $454
line 1258
;1258:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $451
JUMPV
LABELV $454
line 1260
;1259:	}
;1260:	return qtrue;
CNSTI4 1
RETI4
LABELV $451
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1068 20
line 1270
;1261:}
;1262:
;1263:/*
;1264:==================
;1265:Info_SetValueForKey
;1266:
;1267:Changes or adds a key/value pair
;1268:==================
;1269:*/
;1270:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1273
;1271:	char	newi[MAX_INFO_STRING];
;1272:
;1273:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 1024
LTI4 $457
line 1274
;1274:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $459
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1275
;1275:	}
LABELV $457
line 1277
;1276:
;1277:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1028
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $462
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
LABELV $462
line 1278
;1278:	{
line 1279
;1279:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $463
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1280
;1280:		return;
ADDRGP4 $456
JUMPV
LABELV $460
line 1283
;1281:	}
;1282:
;1283:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $466
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $464
LABELV $466
line 1284
;1284:	{
line 1285
;1285:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $467
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1286
;1286:		return;
ADDRGP4 $456
JUMPV
LABELV $464
line 1289
;1287:	}
;1288:
;1289:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1044
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $470
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1048
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $468
LABELV $470
line 1290
;1290:	{
line 1291
;1291:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $471
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1292
;1292:		return;
ADDRGP4 $456
JUMPV
LABELV $468
line 1295
;1293:	}
;1294:
;1295:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1296
;1296:	if (!value || !strlen(value))
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $474
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $472
LABELV $474
line 1297
;1297:		return;
ADDRGP4 $456
JUMPV
LABELV $472
line 1299
;1298:
;1299:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $475
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1301
;1300:
;1301:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $476
line 1302
;1302:	{
line 1303
;1303:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $478
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1304
;1304:		return;
ADDRGP4 $456
JUMPV
LABELV $476
line 1307
;1305:	}
;1306:
;1307:	strcat (newi, s);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1308
;1308:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1309
;1309:}
LABELV $456
endproc Info_SetValueForKey 1068 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1318
;1310:
;1311:/*
;1312:==================
;1313:Info_SetValueForKey_Big
;1314:
;1315:Changes or adds a key/value pair
;1316:==================
;1317:*/
;1318:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1321
;1319:	char	newi[BIG_INFO_STRING];
;1320:
;1321:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8192
INDIRI4
CNSTI4 8192
LTI4 $480
line 1322
;1322:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $459
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1323
;1323:	}
LABELV $480
line 1325
;1324:
;1325:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8196
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $484
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $482
LABELV $484
line 1326
;1326:	{
line 1327
;1327:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $463
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1328
;1328:		return;
ADDRGP4 $479
JUMPV
LABELV $482
line 1331
;1329:	}
;1330:
;1331:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $487
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8208
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
LABELV $487
line 1332
;1332:	{
line 1333
;1333:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $467
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1334
;1334:		return;
ADDRGP4 $479
JUMPV
LABELV $485
line 1337
;1335:	}
;1336:
;1337:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8212
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $490
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8216
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $488
LABELV $490
line 1338
;1338:	{
line 1339
;1339:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $471
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1340
;1340:		return;
ADDRGP4 $479
JUMPV
LABELV $488
line 1343
;1341:	}
;1342:
;1343:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1344
;1344:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $493
ADDRLP4 8220
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
NEI4 $491
LABELV $493
line 1345
;1345:		return;
ADDRGP4 $479
JUMPV
LABELV $491
line 1347
;1346:
;1347:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $475
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1349
;1348:
;1349:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 8228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8228
INDIRI4
ADDRLP4 8232
INDIRI4
ADDI4
CNSTI4 8192
LEI4 $494
line 1350
;1350:	{
line 1351
;1351:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $496
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1352
;1352:		return;
ADDRGP4 $479
JUMPV
LABELV $494
line 1355
;1353:	}
;1354:
;1355:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1356
;1356:}
LABELV $479
endproc Info_SetValueForKey_Big 8236 20
export Q_irand
proc Q_irand 8 0
line 1361
;1357:
;1358:
;1359://rww - convience function..
;1360:int Q_irand(int value1, int value2)
;1361:{
line 1364
;1362:	int r;
;1363:
;1364:	r = rand()%value2;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
MODI4
ASGNI4
line 1365
;1365:	r += value1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 1367
;1366:	
;1367:	return r;
ADDRLP4 0
INDIRI4
RETI4
LABELV $497
endproc Q_irand 8 0
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_RemoveKey_big
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
LABELV $496
char 1 66
char 1 73
char 1 71
char 1 32
char 1 73
char 1 110
char 1 102
char 1 111
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $478
char 1 73
char 1 110
char 1 102
char 1 111
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $475
char 1 92
char 1 37
char 1 115
char 1 92
char 1 37
char 1 115
char 1 0
align 1
LABELV $471
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 34
char 1 10
char 1 0
align 1
LABELV $467
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 115
char 1 101
char 1 109
char 1 105
char 1 99
char 1 111
char 1 108
char 1 111
char 1 110
char 1 10
char 1 0
align 1
LABELV $463
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 92
char 1 10
char 1 0
align 1
LABELV $459
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 83
char 1 101
char 1 116
char 1 86
char 1 97
char 1 108
char 1 117
char 1 101
char 1 70
char 1 111
char 1 114
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $428
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 75
char 1 101
char 1 121
char 1 95
char 1 66
char 1 105
char 1 103
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $402
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $368
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 86
char 1 97
char 1 108
char 1 117
char 1 101
char 1 70
char 1 111
char 1 114
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $365
char 1 0
align 1
LABELV $354
char 1 67
char 1 111
char 1 109
char 1 95
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 102
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 32
char 1 111
char 1 102
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 110
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $351
char 1 67
char 1 111
char 1 109
char 1 95
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 102
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 32
char 1 98
char 1 105
char 1 103
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 0
align 1
LABELV $330
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 99
char 1 97
char 1 116
char 1 58
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 0
align 1
LABELV $280
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 60
char 1 32
char 1 49
char 1 0
align 1
LABELV $277
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 115
char 1 114
char 1 99
char 1 0
align 1
LABELV $274
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 0
align 1
LABELV $238
char 1 41
char 1 0
align 1
LABELV $233
char 1 40
char 1 0
align 1
LABELV $214
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 84
char 1 111
char 1 107
char 1 101
char 1 110
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 33
char 1 61
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $197
char 1 117
char 1 110
char 1 101
char 1 120
char 1 112
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 69
char 1 79
char 1 70
char 1 10
char 1 0
align 1
LABELV $103
char 1 87
char 1 65
char 1 82
char 1 78
char 1 73
char 1 78
char 1 71
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 108
char 1 105
char 1 110
char 1 101
char 1 32
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $99
char 1 69
char 1 82
char 1 82
char 1 79
char 1 82
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 108
char 1 105
char 1 110
char 1 101
char 1 32
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $93
char 1 37
char 1 115
char 1 0
align 1
LABELV $73
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
