data
align 4
LABELV syscall
byte 4 4294967295
export dllEntry
code
proc dllEntry 0 0
file "../g_syscalls.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// this file is only included when building a dll
;6:// g_syscalls.asm is included instead when building a qvm
;7:
;8:static int (QDECL *syscall)( int arg, ... ) = (int (QDECL *)( int, ...))-1;
;9:
;10:
;11:#if MAC_PORT && __MWERKS__
;12:#pragma export on
;13:#endif
;14:void dllEntry( int (QDECL *syscallptr)( int arg,... ) ) {
line 15
;15:	syscall = syscallptr;
ADDRGP4 syscall
ADDRFP4 0
INDIRP4
ASGNP4
line 16
;16:}
LABELV $78
endproc dllEntry 0 0
export PASSFLOAT
proc PASSFLOAT 4 0
line 21
;17:#if MAC_PORT && __MWERKS__
;18:#pragma export reset
;19:#endif
;20:
;21:int PASSFLOAT( float x ) {
line 23
;22:	float	floatTemp;
;23:	floatTemp = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 24
;24:	return *(int *)&floatTemp;
ADDRLP4 0
INDIRI4
RETI4
LABELV $79
endproc PASSFLOAT 4 0
export trap_Printf
proc trap_Printf 0 8
line 27
;25:}
;26:
;27:void	trap_Printf( const char *fmt ) {
line 28
;28:	syscall( G_PRINT, fmt );
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 29
;29:}
LABELV $80
endproc trap_Printf 0 8
export trap_Error
proc trap_Error 0 8
line 31
;30:
;31:void	trap_Error( const char *fmt ) {
line 32
;32:	syscall( G_ERROR, fmt );
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 33
;33:}
LABELV $81
endproc trap_Error 0 8
export trap_Milliseconds
proc trap_Milliseconds 4 4
line 35
;34:
;35:int		trap_Milliseconds( void ) {
line 36
;36:	return syscall( G_MILLISECONDS ); 
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $82
endproc trap_Milliseconds 4 4
export trap_Cvar_Register
proc trap_Cvar_Register 0 20
line 39
;37:}
;38:
;39:void	trap_Cvar_Register( vmCvar_t *cvar, const char *var_name, const char *value, int flags ) {
line 40
;40:	syscall( G_CVAR_REGISTER, cvar, var_name, value, flags );
CNSTI4 3
ARGI4
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
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 41
;41:}
LABELV $83
endproc trap_Cvar_Register 0 20
export trap_Cvar_Update
proc trap_Cvar_Update 0 8
line 43
;42:
;43:void	trap_Cvar_Update( vmCvar_t *cvar ) {
line 44
;44:	syscall( G_CVAR_UPDATE, cvar );
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 45
;45:}
LABELV $84
endproc trap_Cvar_Update 0 8
export trap_Cvar_Set
proc trap_Cvar_Set 0 12
line 47
;46:
;47:void trap_Cvar_Set( const char *var_name, const char *value ) {
line 48
;48:	syscall( G_CVAR_SET, var_name, value );
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 49
;49:}
LABELV $85
endproc trap_Cvar_Set 0 12
export trap_Cvar_VariableIntegerValue
proc trap_Cvar_VariableIntegerValue 4 8
line 51
;50:
;51:int trap_Cvar_VariableIntegerValue( const char *var_name ) {
line 52
;52:	return syscall( G_CVAR_VARIABLE_INTEGER_VALUE, var_name );
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $86
endproc trap_Cvar_VariableIntegerValue 4 8
export trap_Cvar_VariableStringBuffer
proc trap_Cvar_VariableStringBuffer 0 16
line 55
;53:}
;54:
;55:void trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize ) {
line 56
;56:	syscall( G_CVAR_VARIABLE_STRING_BUFFER, var_name, buffer, bufsize );
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 57
;57:}
LABELV $87
endproc trap_Cvar_VariableStringBuffer 0 16
export trap_Argc
proc trap_Argc 4 4
line 59
;58:
;59:int		trap_Argc( void ) {
line 60
;60:	return syscall( G_ARGC );
CNSTI4 8
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $88
endproc trap_Argc 4 4
export trap_Argv
proc trap_Argv 0 16
line 63
;61:}
;62:
;63:void	trap_Argv( int n, char *buffer, int bufferLength ) {
line 64
;64:	syscall( G_ARGV, n, buffer, bufferLength );
CNSTI4 9
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 65
;65:}
LABELV $89
endproc trap_Argv 0 16
export trap_FS_FOpenFile
proc trap_FS_FOpenFile 4 16
line 67
;66:
;67:int		trap_FS_FOpenFile( const char *qpath, fileHandle_t *f, fsMode_t mode ) {
line 68
;68:	return syscall( G_FS_FOPEN_FILE, qpath, f, mode );
CNSTI4 10
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $90
endproc trap_FS_FOpenFile 4 16
export trap_FS_Read
proc trap_FS_Read 0 16
line 71
;69:}
;70:
;71:void	trap_FS_Read( void *buffer, int len, fileHandle_t f ) {
line 72
;72:	syscall( G_FS_READ, buffer, len, f );
CNSTI4 11
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 73
;73:}
LABELV $91
endproc trap_FS_Read 0 16
export trap_FS_Write
proc trap_FS_Write 0 16
line 75
;74:
;75:void	trap_FS_Write( const void *buffer, int len, fileHandle_t f ) {
line 76
;76:	syscall( G_FS_WRITE, buffer, len, f );
CNSTI4 12
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 77
;77:}
LABELV $92
endproc trap_FS_Write 0 16
export trap_FS_FCloseFile
proc trap_FS_FCloseFile 0 8
line 79
;78:
;79:void	trap_FS_FCloseFile( fileHandle_t f ) {
line 80
;80:	syscall( G_FS_FCLOSE_FILE, f );
CNSTI4 13
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 81
;81:}
LABELV $93
endproc trap_FS_FCloseFile 0 8
export trap_SendConsoleCommand
proc trap_SendConsoleCommand 0 12
line 83
;82:
;83:void	trap_SendConsoleCommand( int exec_when, const char *text ) {
line 84
;84:	syscall( G_SEND_CONSOLE_COMMAND, exec_when, text );
CNSTI4 14
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 85
;85:}
LABELV $94
endproc trap_SendConsoleCommand 0 12
export trap_LocateGameData
proc trap_LocateGameData 0 24
line 88
;86:
;87:void trap_LocateGameData( gentity_t *gEnts, int numGEntities, int sizeofGEntity_t,
;88:						 playerState_t *clients, int sizeofGClient ) {
line 89
;89:	syscall( G_LOCATE_GAME_DATA, gEnts, numGEntities, sizeofGEntity_t, clients, sizeofGClient );
CNSTI4 15
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 90
;90:}
LABELV $95
endproc trap_LocateGameData 0 24
export trap_DropClient
proc trap_DropClient 0 12
line 92
;91:
;92:void trap_DropClient( int clientNum, const char *reason ) {
line 93
;93:	syscall( G_DROP_CLIENT, clientNum, reason );
CNSTI4 16
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 94
;94:}
LABELV $96
endproc trap_DropClient 0 12
export trap_SendServerCommand
proc trap_SendServerCommand 0 12
line 96
;95:
;96:void trap_SendServerCommand( int clientNum, const char *text ) {
line 97
;97:	syscall( G_SEND_SERVER_COMMAND, clientNum, text );
CNSTI4 17
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 98
;98:}
LABELV $97
endproc trap_SendServerCommand 0 12
export trap_SetConfigstring
proc trap_SetConfigstring 0 12
line 100
;99:
;100:void trap_SetConfigstring( int num, const char *string ) {
line 101
;101:	syscall( G_SET_CONFIGSTRING, num, string );
CNSTI4 18
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 102
;102:}
LABELV $98
endproc trap_SetConfigstring 0 12
export trap_GetConfigstring
proc trap_GetConfigstring 0 16
line 104
;103:
;104:void trap_GetConfigstring( int num, char *buffer, int bufferSize ) {
line 105
;105:	syscall( G_GET_CONFIGSTRING, num, buffer, bufferSize );
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 106
;106:}
LABELV $99
endproc trap_GetConfigstring 0 16
export trap_GetUserinfo
proc trap_GetUserinfo 0 16
line 108
;107:
;108:void trap_GetUserinfo( int num, char *buffer, int bufferSize ) {
line 109
;109:	syscall( G_GET_USERINFO, num, buffer, bufferSize );
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 110
;110:}
LABELV $100
endproc trap_GetUserinfo 0 16
export trap_SetUserinfo
proc trap_SetUserinfo 0 12
line 112
;111:
;112:void trap_SetUserinfo( int num, const char *buffer ) {
line 113
;113:	syscall( G_SET_USERINFO, num, buffer );
CNSTI4 21
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 114
;114:}
LABELV $101
endproc trap_SetUserinfo 0 12
export trap_GetServerinfo
proc trap_GetServerinfo 0 12
line 116
;115:
;116:void trap_GetServerinfo( char *buffer, int bufferSize ) {
line 117
;117:	syscall( G_GET_SERVERINFO, buffer, bufferSize );
CNSTI4 22
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 118
;118:}
LABELV $102
endproc trap_GetServerinfo 0 12
export trap_SetBrushModel
proc trap_SetBrushModel 0 12
line 120
;119:
;120:void trap_SetBrushModel( gentity_t *ent, const char *name ) {
line 121
;121:	syscall( G_SET_BRUSH_MODEL, ent, name );
CNSTI4 23
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 122
;122:}
LABELV $103
endproc trap_SetBrushModel 0 12
export trap_Trace
proc trap_Trace 0 40
line 124
;123:
;124:void trap_Trace( trace_t *results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask ) {
line 125
;125:	syscall( G_TRACE, results, start, mins, maxs, end, passEntityNum, contentmask, 0, 10 );
CNSTI4 24
ARGI4
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
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 126
;126:}
LABELV $104
endproc trap_Trace 0 40
export trap_PointContents
proc trap_PointContents 4 12
line 128
;127:
;128:int trap_PointContents( const vec3_t point, int passEntityNum ) {
line 129
;129:	return syscall( G_POINT_CONTENTS, point, passEntityNum );
CNSTI4 25
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $105
endproc trap_PointContents 4 12
export trap_InPVS
proc trap_InPVS 4 12
line 133
;130:}
;131:
;132:
;133:qboolean trap_InPVS( const vec3_t p1, const vec3_t p2 ) {
line 134
;134:	return syscall( G_IN_PVS, p1, p2 );
CNSTI4 26
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $106
endproc trap_InPVS 4 12
export trap_InPVSIgnorePortals
proc trap_InPVSIgnorePortals 4 12
line 137
;135:}
;136:
;137:qboolean trap_InPVSIgnorePortals( const vec3_t p1, const vec3_t p2 ) {
line 138
;138:	return syscall( G_IN_PVS_IGNORE_PORTALS, p1, p2 );
CNSTI4 27
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $107
endproc trap_InPVSIgnorePortals 4 12
export trap_AdjustAreaPortalState
proc trap_AdjustAreaPortalState 0 12
line 141
;139:}
;140:
;141:void trap_AdjustAreaPortalState( gentity_t *ent, qboolean open ) {
line 142
;142:	syscall( G_ADJUST_AREA_PORTAL_STATE, ent, open );
CNSTI4 28
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 143
;143:}
LABELV $108
endproc trap_AdjustAreaPortalState 0 12
export trap_AreasConnected
proc trap_AreasConnected 4 12
line 145
;144:
;145:qboolean trap_AreasConnected( int area1, int area2 ) {
line 146
;146:	return syscall( G_AREAS_CONNECTED, area1, area2 );
CNSTI4 29
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $109
endproc trap_AreasConnected 4 12
export trap_LinkEntity
proc trap_LinkEntity 0 8
line 149
;147:}
;148:
;149:void trap_LinkEntity( gentity_t *ent ) {
line 150
;150:	syscall( G_LINKENTITY, ent );
CNSTI4 30
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 151
;151:}
LABELV $110
endproc trap_LinkEntity 0 8
export trap_UnlinkEntity
proc trap_UnlinkEntity 0 8
line 153
;152:
;153:void trap_UnlinkEntity( gentity_t *ent ) {
line 154
;154:	syscall( G_UNLINKENTITY, ent );
CNSTI4 31
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 155
;155:}
LABELV $111
endproc trap_UnlinkEntity 0 8
export trap_EntitiesInBox
proc trap_EntitiesInBox 4 20
line 157
;156:
;157:int trap_EntitiesInBox( const vec3_t mins, const vec3_t maxs, int *list, int maxcount ) {
line 158
;158:	return syscall( G_ENTITIES_IN_BOX, mins, maxs, list, maxcount );
CNSTI4 32
ARGI4
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
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $112
endproc trap_EntitiesInBox 4 20
export trap_EntityContact
proc trap_EntityContact 4 16
line 161
;159:}
;160:
;161:qboolean trap_EntityContact( const vec3_t mins, const vec3_t maxs, const gentity_t *ent ) {
line 162
;162:	return syscall( G_ENTITY_CONTACT, mins, maxs, ent );
CNSTI4 33
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $113
endproc trap_EntityContact 4 16
export trap_BotAllocateClient
proc trap_BotAllocateClient 4 4
line 165
;163:}
;164:
;165:int trap_BotAllocateClient( void ) {
line 166
;166:	return syscall( G_BOT_ALLOCATE_CLIENT );
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $114
endproc trap_BotAllocateClient 4 4
export trap_BotFreeClient
proc trap_BotFreeClient 0 8
line 169
;167:}
;168:
;169:void trap_BotFreeClient( int clientNum ) {
line 170
;170:	syscall( G_BOT_FREE_CLIENT, clientNum );
CNSTI4 35
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 171
;171:}
LABELV $115
endproc trap_BotFreeClient 0 8
export trap_GetUsercmd
proc trap_GetUsercmd 0 12
line 173
;172:
;173:void trap_GetUsercmd( int clientNum, usercmd_t *cmd ) {
line 174
;174:	syscall( G_GET_USERCMD, clientNum, cmd );
CNSTI4 36
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 175
;175:}
LABELV $116
endproc trap_GetUsercmd 0 12
export trap_GetEntityToken
proc trap_GetEntityToken 4 12
line 177
;176:
;177:qboolean trap_GetEntityToken( char *buffer, int bufferSize ) {
line 178
;178:	return syscall( G_GET_ENTITY_TOKEN, buffer, bufferSize );
CNSTI4 37
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $117
endproc trap_GetEntityToken 4 12
export trap_FS_GetFileList
proc trap_FS_GetFileList 4 20
line 181
;179:}
;180:
;181:int trap_FS_GetFileList(  const char *path, const char *extension, char *listbuf, int bufsize ) {
line 182
;182:	return syscall( G_FS_GETFILELIST, path, extension, listbuf, bufsize );
CNSTI4 38
ARGI4
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
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $118
endproc trap_FS_GetFileList 4 20
export trap_DebugPolygonCreate
proc trap_DebugPolygonCreate 4 16
line 185
;183:}
;184:
;185:int trap_DebugPolygonCreate(int color, int numPoints, vec3_t *points) {
line 186
;186:	return syscall( G_DEBUG_POLYGON_CREATE, color, numPoints, points );
CNSTI4 39
ARGI4
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
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $119
endproc trap_DebugPolygonCreate 4 16
export trap_DebugPolygonDelete
proc trap_DebugPolygonDelete 0 8
line 189
;187:}
;188:
;189:void trap_DebugPolygonDelete(int id) {
line 190
;190:	syscall( G_DEBUG_POLYGON_DELETE, id );
CNSTI4 40
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 191
;191:}
LABELV $120
endproc trap_DebugPolygonDelete 0 8
export trap_RealTime
proc trap_RealTime 4 8
line 193
;192:
;193:int trap_RealTime( qtime_t *qtime ) {
line 194
;194:	return syscall( G_REAL_TIME, qtime );
CNSTI4 41
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $121
endproc trap_RealTime 4 8
export trap_SnapVector
proc trap_SnapVector 0 8
line 197
;195:}
;196:
;197:void trap_SnapVector( float *v ) {
line 198
;198:	syscall( G_SNAPVECTOR, v );
CNSTI4 42
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 199
;199:}
LABELV $122
endproc trap_SnapVector 0 8
export trap_TraceCapsule
proc trap_TraceCapsule 0 40
line 201
;200:
;201:void trap_TraceCapsule( trace_t *results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask ) {
line 202
;202:	syscall( G_TRACECAPSULE, results, start, mins, maxs, end, passEntityNum, contentmask, 0, 10 );
CNSTI4 43
ARGI4
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
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 203
;203:}
LABELV $123
endproc trap_TraceCapsule 0 40
export trap_EntityContactCapsule
proc trap_EntityContactCapsule 4 16
line 205
;204:
;205:qboolean trap_EntityContactCapsule( const vec3_t mins, const vec3_t maxs, const gentity_t *ent ) {
line 206
;206:	return syscall( G_ENTITY_CONTACTCAPSULE, mins, maxs, ent );
CNSTI4 44
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $124
endproc trap_EntityContactCapsule 4 16
export trap_SP_RegisterServer
proc trap_SP_RegisterServer 4 8
line 210
;207:}
;208:
;209:qboolean trap_SP_RegisterServer( const char *package ) 
;210:{
line 211
;211:	return syscall( SP_REGISTER_SERVER_CMD, package );
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $125
endproc trap_SP_RegisterServer 4 8
export trap_SP_GetStringTextString
proc trap_SP_GetStringTextString 4 16
line 215
;212:}
;213:
;214:int trap_SP_GetStringTextString(const char *text, char *buffer, int bufferLength)
;215:{
line 216
;216:	return syscall( SP_GETSTRINGTEXTSTRING, text, buffer, bufferLength );
CNSTI4 46
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $126
endproc trap_SP_GetStringTextString 4 16
export trap_ROFF_Clean
proc trap_ROFF_Clean 4 4
line 220
;217:}
;218:
;219:qboolean trap_ROFF_Clean( void ) 
;220:{
line 221
;221:	return syscall( G_ROFF_CLEAN );
CNSTI4 47
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $127
endproc trap_ROFF_Clean 4 4
export trap_ROFF_UpdateEntities
proc trap_ROFF_UpdateEntities 0 4
line 225
;222:}
;223:
;224:void trap_ROFF_UpdateEntities( void ) 
;225:{
line 226
;226:	syscall( G_ROFF_UPDATE_ENTITIES );
CNSTI4 48
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 227
;227:}
LABELV $128
endproc trap_ROFF_UpdateEntities 0 4
export trap_ROFF_Cache
proc trap_ROFF_Cache 4 8
line 230
;228:
;229:int trap_ROFF_Cache( char *file ) 
;230:{
line 231
;231:	return syscall( G_ROFF_CACHE, file );
CNSTI4 49
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $129
endproc trap_ROFF_Cache 4 8
export trap_ROFF_Play
proc trap_ROFF_Play 4 16
line 235
;232:}
;233:
;234:qboolean trap_ROFF_Play( int entID, int roffID, qboolean doTranslation ) 
;235:{
line 236
;236:	return syscall( G_ROFF_PLAY, entID, roffID, doTranslation );
CNSTI4 50
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $130
endproc trap_ROFF_Play 4 16
export trap_ROFF_Purge_Ent
proc trap_ROFF_Purge_Ent 4 8
line 240
;237:}
;238:
;239:qboolean trap_ROFF_Purge_Ent( int entID ) 
;240:{
line 241
;241:	return syscall( G_ROFF_PURGE_ENT, entID );
CNSTI4 51
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $131
endproc trap_ROFF_Purge_Ent 4 8
export trap_BotLibSetup
proc trap_BotLibSetup 4 4
line 245
;242:}
;243:
;244:// BotLib traps start here
;245:int trap_BotLibSetup( void ) {
line 246
;246:	return syscall( BOTLIB_SETUP );
CNSTI4 200
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $132
endproc trap_BotLibSetup 4 4
export trap_BotLibShutdown
proc trap_BotLibShutdown 4 4
line 249
;247:}
;248:
;249:int trap_BotLibShutdown( void ) {
line 250
;250:	return syscall( BOTLIB_SHUTDOWN );
CNSTI4 201
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $133
endproc trap_BotLibShutdown 4 4
export trap_BotLibVarSet
proc trap_BotLibVarSet 4 12
line 253
;251:}
;252:
;253:int trap_BotLibVarSet(char *var_name, char *value) {
line 254
;254:	return syscall( BOTLIB_LIBVAR_SET, var_name, value );
CNSTI4 202
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $134
endproc trap_BotLibVarSet 4 12
export trap_BotLibVarGet
proc trap_BotLibVarGet 4 16
line 257
;255:}
;256:
;257:int trap_BotLibVarGet(char *var_name, char *value, int size) {
line 258
;258:	return syscall( BOTLIB_LIBVAR_GET, var_name, value, size );
CNSTI4 203
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $135
endproc trap_BotLibVarGet 4 16
export trap_BotLibDefine
proc trap_BotLibDefine 4 8
line 261
;259:}
;260:
;261:int trap_BotLibDefine(char *string) {
line 262
;262:	return syscall( BOTLIB_PC_ADD_GLOBAL_DEFINE, string );
CNSTI4 204
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $136
endproc trap_BotLibDefine 4 8
export trap_BotLibStartFrame
proc trap_BotLibStartFrame 8 8
line 265
;263:}
;264:
;265:int trap_BotLibStartFrame(float time) {
line 266
;266:	return syscall( BOTLIB_START_FRAME, PASSFLOAT( time ) );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 205
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $137
endproc trap_BotLibStartFrame 8 8
export trap_BotLibLoadMap
proc trap_BotLibLoadMap 4 8
line 269
;267:}
;268:
;269:int trap_BotLibLoadMap(const char *mapname) {
line 270
;270:	return syscall( BOTLIB_LOAD_MAP, mapname );
CNSTI4 206
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $138
endproc trap_BotLibLoadMap 4 8
export trap_BotLibUpdateEntity
proc trap_BotLibUpdateEntity 4 12
line 273
;271:}
;272:
;273:int trap_BotLibUpdateEntity(int ent, void /* struct bot_updateentity_s */ *bue) {
line 274
;274:	return syscall( BOTLIB_UPDATENTITY, ent, bue );
CNSTI4 207
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $139
endproc trap_BotLibUpdateEntity 4 12
export trap_BotLibTest
proc trap_BotLibTest 4 20
line 277
;275:}
;276:
;277:int trap_BotLibTest(int parm0, char *parm1, vec3_t parm2, vec3_t parm3) {
line 278
;278:	return syscall( BOTLIB_TEST, parm0, parm1, parm2, parm3 );
CNSTI4 208
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $140
endproc trap_BotLibTest 4 20
export trap_BotGetSnapshotEntity
proc trap_BotGetSnapshotEntity 4 12
line 281
;279:}
;280:
;281:int trap_BotGetSnapshotEntity( int clientNum, int sequence ) {
line 282
;282:	return syscall( BOTLIB_GET_SNAPSHOT_ENTITY, clientNum, sequence );
CNSTI4 209
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $141
endproc trap_BotGetSnapshotEntity 4 12
export trap_BotGetServerCommand
proc trap_BotGetServerCommand 4 16
line 285
;283:}
;284:
;285:int trap_BotGetServerCommand(int clientNum, char *message, int size) {
line 286
;286:	return syscall( BOTLIB_GET_CONSOLE_MESSAGE, clientNum, message, size );
CNSTI4 210
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $142
endproc trap_BotGetServerCommand 4 16
export trap_BotUserCommand
proc trap_BotUserCommand 0 12
line 289
;287:}
;288:
;289:void trap_BotUserCommand(int clientNum, usercmd_t *ucmd) {
line 290
;290:	syscall( BOTLIB_USER_COMMAND, clientNum, ucmd );
CNSTI4 211
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 291
;291:}
LABELV $143
endproc trap_BotUserCommand 0 12
export trap_AAS_EntityInfo
proc trap_AAS_EntityInfo 0 12
line 293
;292:
;293:void trap_AAS_EntityInfo(int entnum, void /* struct aas_entityinfo_s */ *info) {
line 294
;294:	syscall( BOTLIB_AAS_ENTITY_INFO, entnum, info );
CNSTI4 303
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 295
;295:}
LABELV $144
endproc trap_AAS_EntityInfo 0 12
export trap_AAS_Initialized
proc trap_AAS_Initialized 4 4
line 297
;296:
;297:int trap_AAS_Initialized(void) {
line 298
;298:	return syscall( BOTLIB_AAS_INITIALIZED );
CNSTI4 304
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $145
endproc trap_AAS_Initialized 4 4
export trap_AAS_PresenceTypeBoundingBox
proc trap_AAS_PresenceTypeBoundingBox 0 16
line 301
;299:}
;300:
;301:void trap_AAS_PresenceTypeBoundingBox(int presencetype, vec3_t mins, vec3_t maxs) {
line 302
;302:	syscall( BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX, presencetype, mins, maxs );
CNSTI4 305
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 303
;303:}
LABELV $146
endproc trap_AAS_PresenceTypeBoundingBox 0 16
export trap_AAS_Time
proc trap_AAS_Time 8 4
line 305
;304:
;305:float trap_AAS_Time(void) {
line 307
;306:	int temp;
;307:	temp = syscall( BOTLIB_AAS_TIME );
CNSTI4 306
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 308
;308:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $147
endproc trap_AAS_Time 8 4
export trap_AAS_PointAreaNum
proc trap_AAS_PointAreaNum 4 8
line 311
;309:}
;310:
;311:int trap_AAS_PointAreaNum(vec3_t point) {
line 312
;312:	return syscall( BOTLIB_AAS_POINT_AREA_NUM, point );
CNSTI4 307
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $148
endproc trap_AAS_PointAreaNum 4 8
export trap_AAS_PointReachabilityAreaIndex
proc trap_AAS_PointReachabilityAreaIndex 4 8
line 315
;313:}
;314:
;315:int trap_AAS_PointReachabilityAreaIndex(vec3_t point) {
line 316
;316:	return syscall( BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX, point );
CNSTI4 577
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $149
endproc trap_AAS_PointReachabilityAreaIndex 4 8
export trap_AAS_TraceAreas
proc trap_AAS_TraceAreas 4 24
line 319
;317:}
;318:
;319:int trap_AAS_TraceAreas(vec3_t start, vec3_t end, int *areas, vec3_t *points, int maxareas) {
line 320
;320:	return syscall( BOTLIB_AAS_TRACE_AREAS, start, end, areas, points, maxareas );
CNSTI4 308
ARGI4
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
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $150
endproc trap_AAS_TraceAreas 4 24
export trap_AAS_BBoxAreas
proc trap_AAS_BBoxAreas 4 20
line 323
;321:}
;322:
;323:int trap_AAS_BBoxAreas(vec3_t absmins, vec3_t absmaxs, int *areas, int maxareas) {
line 324
;324:	return syscall( BOTLIB_AAS_BBOX_AREAS, absmins, absmaxs, areas, maxareas );
CNSTI4 301
ARGI4
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
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $151
endproc trap_AAS_BBoxAreas 4 20
export trap_AAS_AreaInfo
proc trap_AAS_AreaInfo 4 12
line 327
;325:}
;326:
;327:int trap_AAS_AreaInfo( int areanum, void /* struct aas_areainfo_s */ *info ) {
line 328
;328:	return syscall( BOTLIB_AAS_AREA_INFO, areanum, info );
CNSTI4 302
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $152
endproc trap_AAS_AreaInfo 4 12
export trap_AAS_PointContents
proc trap_AAS_PointContents 4 8
line 331
;329:}
;330:
;331:int trap_AAS_PointContents(vec3_t point) {
line 332
;332:	return syscall( BOTLIB_AAS_POINT_CONTENTS, point );
CNSTI4 309
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $153
endproc trap_AAS_PointContents 4 8
export trap_AAS_NextBSPEntity
proc trap_AAS_NextBSPEntity 4 8
line 335
;333:}
;334:
;335:int trap_AAS_NextBSPEntity(int ent) {
line 336
;336:	return syscall( BOTLIB_AAS_NEXT_BSP_ENTITY, ent );
CNSTI4 310
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $154
endproc trap_AAS_NextBSPEntity 4 8
export trap_AAS_ValueForBSPEpairKey
proc trap_AAS_ValueForBSPEpairKey 4 20
line 339
;337:}
;338:
;339:int trap_AAS_ValueForBSPEpairKey(int ent, char *key, char *value, int size) {
line 340
;340:	return syscall( BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY, ent, key, value, size );
CNSTI4 311
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $155
endproc trap_AAS_ValueForBSPEpairKey 4 20
export trap_AAS_VectorForBSPEpairKey
proc trap_AAS_VectorForBSPEpairKey 4 16
line 343
;341:}
;342:
;343:int trap_AAS_VectorForBSPEpairKey(int ent, char *key, vec3_t v) {
line 344
;344:	return syscall( BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY, ent, key, v );
CNSTI4 312
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $156
endproc trap_AAS_VectorForBSPEpairKey 4 16
export trap_AAS_FloatForBSPEpairKey
proc trap_AAS_FloatForBSPEpairKey 4 16
line 347
;345:}
;346:
;347:int trap_AAS_FloatForBSPEpairKey(int ent, char *key, float *value) {
line 348
;348:	return syscall( BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY, ent, key, value );
CNSTI4 313
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $157
endproc trap_AAS_FloatForBSPEpairKey 4 16
export trap_AAS_IntForBSPEpairKey
proc trap_AAS_IntForBSPEpairKey 4 16
line 351
;349:}
;350:
;351:int trap_AAS_IntForBSPEpairKey(int ent, char *key, int *value) {
line 352
;352:	return syscall( BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY, ent, key, value );
CNSTI4 314
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $158
endproc trap_AAS_IntForBSPEpairKey 4 16
export trap_AAS_AreaReachability
proc trap_AAS_AreaReachability 4 8
line 355
;353:}
;354:
;355:int trap_AAS_AreaReachability(int areanum) {
line 356
;356:	return syscall( BOTLIB_AAS_AREA_REACHABILITY, areanum );
CNSTI4 315
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $159
endproc trap_AAS_AreaReachability 4 8
export trap_AAS_AreaTravelTimeToGoalArea
proc trap_AAS_AreaTravelTimeToGoalArea 4 20
line 359
;357:}
;358:
;359:int trap_AAS_AreaTravelTimeToGoalArea(int areanum, vec3_t origin, int goalareanum, int travelflags) {
line 360
;360:	return syscall( BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA, areanum, origin, goalareanum, travelflags );
CNSTI4 316
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $160
endproc trap_AAS_AreaTravelTimeToGoalArea 4 20
export trap_AAS_EnableRoutingArea
proc trap_AAS_EnableRoutingArea 4 12
line 363
;361:}
;362:
;363:int trap_AAS_EnableRoutingArea( int areanum, int enable ) {
line 364
;364:	return syscall( BOTLIB_AAS_ENABLE_ROUTING_AREA, areanum, enable );
CNSTI4 300
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $161
endproc trap_AAS_EnableRoutingArea 4 12
export trap_AAS_PredictRoute
proc trap_AAS_PredictRoute 4 48
line 369
;365:}
;366:
;367:int trap_AAS_PredictRoute(void /*struct aas_predictroute_s*/ *route, int areanum, vec3_t origin,
;368:							int goalareanum, int travelflags, int maxareas, int maxtime,
;369:							int stopevent, int stopcontents, int stoptfl, int stopareanum) {
line 370
;370:	return syscall( BOTLIB_AAS_PREDICT_ROUTE, route, areanum, origin, goalareanum, travelflags, maxareas, maxtime, stopevent, stopcontents, stoptfl, stopareanum );
CNSTI4 576
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $162
endproc trap_AAS_PredictRoute 4 48
export trap_AAS_AlternativeRouteGoals
proc trap_AAS_AlternativeRouteGoals 4 36
line 375
;371:}
;372:
;373:int trap_AAS_AlternativeRouteGoals(vec3_t start, int startareanum, vec3_t goal, int goalareanum, int travelflags,
;374:										void /*struct aas_altroutegoal_s*/ *altroutegoals, int maxaltroutegoals,
;375:										int type) {
line 376
;376:	return syscall( BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL, start, startareanum, goal, goalareanum, travelflags, altroutegoals, maxaltroutegoals, type );
CNSTI4 575
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $163
endproc trap_AAS_AlternativeRouteGoals 4 36
export trap_AAS_Swimming
proc trap_AAS_Swimming 4 8
line 379
;377:}
;378:
;379:int trap_AAS_Swimming(vec3_t origin) {
line 380
;380:	return syscall( BOTLIB_AAS_SWIMMING, origin );
CNSTI4 317
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $164
endproc trap_AAS_Swimming 4 8
export trap_AAS_PredictClientMovement
proc trap_AAS_PredictClientMovement 8 56
line 383
;381:}
;382:
;383:int trap_AAS_PredictClientMovement(void /* struct aas_clientmove_s */ *move, int entnum, vec3_t origin, int presencetype, int onground, vec3_t velocity, vec3_t cmdmove, int cmdframes, int maxframes, float frametime, int stopevent, int stopareanum, int visualize) {
line 384
;384:	return syscall( BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT, move, entnum, origin, presencetype, onground, velocity, cmdmove, cmdframes, maxframes, PASSFLOAT(frametime), stopevent, stopareanum, visualize );
ADDRFP4 36
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 318
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRFP4 44
INDIRI4
ARGI4
ADDRFP4 48
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $165
endproc trap_AAS_PredictClientMovement 8 56
export trap_EA_Say
proc trap_EA_Say 0 12
line 387
;385:}
;386:
;387:void trap_EA_Say(int client, char *str) {
line 388
;388:	syscall( BOTLIB_EA_SAY, client, str );
CNSTI4 400
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 389
;389:}
LABELV $166
endproc trap_EA_Say 0 12
export trap_EA_SayTeam
proc trap_EA_SayTeam 0 12
line 391
;390:
;391:void trap_EA_SayTeam(int client, char *str) {
line 392
;392:	syscall( BOTLIB_EA_SAY_TEAM, client, str );
CNSTI4 401
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 393
;393:}
LABELV $167
endproc trap_EA_SayTeam 0 12
export trap_EA_Command
proc trap_EA_Command 0 12
line 395
;394:
;395:void trap_EA_Command(int client, char *command) {
line 396
;396:	syscall( BOTLIB_EA_COMMAND, client, command );
CNSTI4 402
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 397
;397:}
LABELV $168
endproc trap_EA_Command 0 12
export trap_EA_Action
proc trap_EA_Action 0 12
line 399
;398:
;399:void trap_EA_Action(int client, int action) {
line 400
;400:	syscall( BOTLIB_EA_ACTION, client, action );
CNSTI4 403
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 401
;401:}
LABELV $169
endproc trap_EA_Action 0 12
export trap_EA_Gesture
proc trap_EA_Gesture 0 8
line 403
;402:
;403:void trap_EA_Gesture(int client) {
line 404
;404:	syscall( BOTLIB_EA_GESTURE, client );
CNSTI4 404
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 405
;405:}
LABELV $170
endproc trap_EA_Gesture 0 8
export trap_EA_Talk
proc trap_EA_Talk 0 8
line 407
;406:
;407:void trap_EA_Talk(int client) {
line 408
;408:	syscall( BOTLIB_EA_TALK, client );
CNSTI4 405
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 409
;409:}
LABELV $171
endproc trap_EA_Talk 0 8
export trap_EA_Attack
proc trap_EA_Attack 0 8
line 411
;410:
;411:void trap_EA_Attack(int client) {
line 412
;412:	syscall( BOTLIB_EA_ATTACK, client );
CNSTI4 406
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 413
;413:}
LABELV $172
endproc trap_EA_Attack 0 8
export trap_EA_Alt_Attack
proc trap_EA_Alt_Attack 0 8
line 415
;414:
;415:void trap_EA_Alt_Attack(int client) {
line 416
;416:	syscall( BOTLIB_EA_ALT_ATTACK, client );
CNSTI4 407
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 417
;417:}
LABELV $173
endproc trap_EA_Alt_Attack 0 8
export trap_EA_ForcePower
proc trap_EA_ForcePower 0 8
line 419
;418:
;419:void trap_EA_ForcePower(int client) {
line 420
;420:	syscall( BOTLIB_EA_FORCEPOWER, client );
CNSTI4 408
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 421
;421:}
LABELV $174
endproc trap_EA_ForcePower 0 8
export trap_EA_Use
proc trap_EA_Use 0 8
line 423
;422:
;423:void trap_EA_Use(int client) {
line 424
;424:	syscall( BOTLIB_EA_USE, client );
CNSTI4 409
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 425
;425:}
LABELV $175
endproc trap_EA_Use 0 8
export trap_EA_Respawn
proc trap_EA_Respawn 0 8
line 427
;426:
;427:void trap_EA_Respawn(int client) {
line 428
;428:	syscall( BOTLIB_EA_RESPAWN, client );
CNSTI4 410
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 429
;429:}
LABELV $176
endproc trap_EA_Respawn 0 8
export trap_EA_Crouch
proc trap_EA_Crouch 0 8
line 431
;430:
;431:void trap_EA_Crouch(int client) {
line 432
;432:	syscall( BOTLIB_EA_CROUCH, client );
CNSTI4 411
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 433
;433:}
LABELV $177
endproc trap_EA_Crouch 0 8
export trap_EA_MoveUp
proc trap_EA_MoveUp 0 8
line 435
;434:
;435:void trap_EA_MoveUp(int client) {
line 436
;436:	syscall( BOTLIB_EA_MOVE_UP, client );
CNSTI4 412
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 437
;437:}
LABELV $178
endproc trap_EA_MoveUp 0 8
export trap_EA_MoveDown
proc trap_EA_MoveDown 0 8
line 439
;438:
;439:void trap_EA_MoveDown(int client) {
line 440
;440:	syscall( BOTLIB_EA_MOVE_DOWN, client );
CNSTI4 413
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 441
;441:}
LABELV $179
endproc trap_EA_MoveDown 0 8
export trap_EA_MoveForward
proc trap_EA_MoveForward 0 8
line 443
;442:
;443:void trap_EA_MoveForward(int client) {
line 444
;444:	syscall( BOTLIB_EA_MOVE_FORWARD, client );
CNSTI4 414
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 445
;445:}
LABELV $180
endproc trap_EA_MoveForward 0 8
export trap_EA_MoveBack
proc trap_EA_MoveBack 0 8
line 447
;446:
;447:void trap_EA_MoveBack(int client) {
line 448
;448:	syscall( BOTLIB_EA_MOVE_BACK, client );
CNSTI4 415
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 449
;449:}
LABELV $181
endproc trap_EA_MoveBack 0 8
export trap_EA_MoveLeft
proc trap_EA_MoveLeft 0 8
line 451
;450:
;451:void trap_EA_MoveLeft(int client) {
line 452
;452:	syscall( BOTLIB_EA_MOVE_LEFT, client );
CNSTI4 416
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 453
;453:}
LABELV $182
endproc trap_EA_MoveLeft 0 8
export trap_EA_MoveRight
proc trap_EA_MoveRight 0 8
line 455
;454:
;455:void trap_EA_MoveRight(int client) {
line 456
;456:	syscall( BOTLIB_EA_MOVE_RIGHT, client );
CNSTI4 417
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 457
;457:}
LABELV $183
endproc trap_EA_MoveRight 0 8
export trap_EA_SelectWeapon
proc trap_EA_SelectWeapon 0 12
line 459
;458:
;459:void trap_EA_SelectWeapon(int client, int weapon) {
line 460
;460:	syscall( BOTLIB_EA_SELECT_WEAPON, client, weapon );
CNSTI4 418
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 461
;461:}
LABELV $184
endproc trap_EA_SelectWeapon 0 12
export trap_EA_Jump
proc trap_EA_Jump 0 8
line 463
;462:
;463:void trap_EA_Jump(int client) {
line 464
;464:	syscall( BOTLIB_EA_JUMP, client );
CNSTI4 419
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 465
;465:}
LABELV $185
endproc trap_EA_Jump 0 8
export trap_EA_DelayedJump
proc trap_EA_DelayedJump 0 8
line 467
;466:
;467:void trap_EA_DelayedJump(int client) {
line 468
;468:	syscall( BOTLIB_EA_DELAYED_JUMP, client );
CNSTI4 420
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 469
;469:}
LABELV $186
endproc trap_EA_DelayedJump 0 8
export trap_EA_Move
proc trap_EA_Move 4 16
line 471
;470:
;471:void trap_EA_Move(int client, vec3_t dir, float speed) {
line 472
;472:	syscall( BOTLIB_EA_MOVE, client, dir, PASSFLOAT(speed) );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 421
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 473
;473:}
LABELV $187
endproc trap_EA_Move 4 16
export trap_EA_View
proc trap_EA_View 0 12
line 475
;474:
;475:void trap_EA_View(int client, vec3_t viewangles) {
line 476
;476:	syscall( BOTLIB_EA_VIEW, client, viewangles );
CNSTI4 422
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 477
;477:}
LABELV $188
endproc trap_EA_View 0 12
export trap_EA_EndRegular
proc trap_EA_EndRegular 4 12
line 479
;478:
;479:void trap_EA_EndRegular(int client, float thinktime) {
line 480
;480:	syscall( BOTLIB_EA_END_REGULAR, client, PASSFLOAT(thinktime) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 423
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 481
;481:}
LABELV $189
endproc trap_EA_EndRegular 4 12
export trap_EA_GetInput
proc trap_EA_GetInput 4 16
line 483
;482:
;483:void trap_EA_GetInput(int client, float thinktime, void /* struct bot_input_s */ *input) {
line 484
;484:	syscall( BOTLIB_EA_GET_INPUT, client, PASSFLOAT(thinktime), input );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 424
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 485
;485:}
LABELV $190
endproc trap_EA_GetInput 4 16
export trap_EA_ResetInput
proc trap_EA_ResetInput 0 8
line 487
;486:
;487:void trap_EA_ResetInput(int client) {
line 488
;488:	syscall( BOTLIB_EA_RESET_INPUT, client );
CNSTI4 425
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 489
;489:}
LABELV $191
endproc trap_EA_ResetInput 0 8
export trap_BotLoadCharacter
proc trap_BotLoadCharacter 8 12
line 491
;490:
;491:int trap_BotLoadCharacter(char *charfile, float skill) {
line 492
;492:	return syscall( BOTLIB_AI_LOAD_CHARACTER, charfile, PASSFLOAT(skill));
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 500
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $192
endproc trap_BotLoadCharacter 8 12
export trap_BotFreeCharacter
proc trap_BotFreeCharacter 0 8
line 495
;493:}
;494:
;495:void trap_BotFreeCharacter(int character) {
line 496
;496:	syscall( BOTLIB_AI_FREE_CHARACTER, character );
CNSTI4 501
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 497
;497:}
LABELV $193
endproc trap_BotFreeCharacter 0 8
export trap_Characteristic_Float
proc trap_Characteristic_Float 8 12
line 499
;498:
;499:float trap_Characteristic_Float(int character, int index) {
line 501
;500:	int temp;
;501:	temp = syscall( BOTLIB_AI_CHARACTERISTIC_FLOAT, character, index );
CNSTI4 502
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 502
;502:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $194
endproc trap_Characteristic_Float 8 12
export trap_Characteristic_BFloat
proc trap_Characteristic_BFloat 16 20
line 505
;503:}
;504:
;505:float trap_Characteristic_BFloat(int character, int index, float min, float max) {
line 507
;506:	int temp;
;507:	temp = syscall( BOTLIB_AI_CHARACTERISTIC_BFLOAT, character, index, PASSFLOAT(min), PASSFLOAT(max) );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 503
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 508
;508:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $195
endproc trap_Characteristic_BFloat 16 20
export trap_Characteristic_Integer
proc trap_Characteristic_Integer 4 12
line 511
;509:}
;510:
;511:int trap_Characteristic_Integer(int character, int index) {
line 512
;512:	return syscall( BOTLIB_AI_CHARACTERISTIC_INTEGER, character, index );
CNSTI4 504
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $196
endproc trap_Characteristic_Integer 4 12
export trap_Characteristic_BInteger
proc trap_Characteristic_BInteger 4 20
line 515
;513:}
;514:
;515:int trap_Characteristic_BInteger(int character, int index, int min, int max) {
line 516
;516:	return syscall( BOTLIB_AI_CHARACTERISTIC_BINTEGER, character, index, min, max );
CNSTI4 505
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $197
endproc trap_Characteristic_BInteger 4 20
export trap_Characteristic_String
proc trap_Characteristic_String 0 20
line 519
;517:}
;518:
;519:void trap_Characteristic_String(int character, int index, char *buf, int size) {
line 520
;520:	syscall( BOTLIB_AI_CHARACTERISTIC_STRING, character, index, buf, size );
CNSTI4 506
ARGI4
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
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 521
;521:}
LABELV $198
endproc trap_Characteristic_String 0 20
export trap_BotAllocChatState
proc trap_BotAllocChatState 4 4
line 523
;522:
;523:int trap_BotAllocChatState(void) {
line 524
;524:	return syscall( BOTLIB_AI_ALLOC_CHAT_STATE );
CNSTI4 507
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $199
endproc trap_BotAllocChatState 4 4
export trap_BotFreeChatState
proc trap_BotFreeChatState 0 8
line 527
;525:}
;526:
;527:void trap_BotFreeChatState(int handle) {
line 528
;528:	syscall( BOTLIB_AI_FREE_CHAT_STATE, handle );
CNSTI4 508
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 529
;529:}
LABELV $200
endproc trap_BotFreeChatState 0 8
export trap_BotQueueConsoleMessage
proc trap_BotQueueConsoleMessage 0 16
line 531
;530:
;531:void trap_BotQueueConsoleMessage(int chatstate, int type, char *message) {
line 532
;532:	syscall( BOTLIB_AI_QUEUE_CONSOLE_MESSAGE, chatstate, type, message );
CNSTI4 509
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 533
;533:}
LABELV $201
endproc trap_BotQueueConsoleMessage 0 16
export trap_BotRemoveConsoleMessage
proc trap_BotRemoveConsoleMessage 0 12
line 535
;534:
;535:void trap_BotRemoveConsoleMessage(int chatstate, int handle) {
line 536
;536:	syscall( BOTLIB_AI_REMOVE_CONSOLE_MESSAGE, chatstate, handle );
CNSTI4 510
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 537
;537:}
LABELV $202
endproc trap_BotRemoveConsoleMessage 0 12
export trap_BotNextConsoleMessage
proc trap_BotNextConsoleMessage 4 12
line 539
;538:
;539:int trap_BotNextConsoleMessage(int chatstate, void /* struct bot_consolemessage_s */ *cm) {
line 540
;540:	return syscall( BOTLIB_AI_NEXT_CONSOLE_MESSAGE, chatstate, cm );
CNSTI4 511
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $203
endproc trap_BotNextConsoleMessage 4 12
export trap_BotNumConsoleMessages
proc trap_BotNumConsoleMessages 4 8
line 543
;541:}
;542:
;543:int trap_BotNumConsoleMessages(int chatstate) {
line 544
;544:	return syscall( BOTLIB_AI_NUM_CONSOLE_MESSAGE, chatstate );
CNSTI4 512
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $204
endproc trap_BotNumConsoleMessages 4 8
export trap_BotInitialChat
proc trap_BotInitialChat 0 48
line 547
;545:}
;546:
;547:void trap_BotInitialChat(int chatstate, char *type, int mcontext, char *var0, char *var1, char *var2, char *var3, char *var4, char *var5, char *var6, char *var7 ) {
line 548
;548:	syscall( BOTLIB_AI_INITIAL_CHAT, chatstate, type, mcontext, var0, var1, var2, var3, var4, var5, var6, var7 );
CNSTI4 513
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRP4
ARGP4
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 549
;549:}
LABELV $205
endproc trap_BotInitialChat 0 48
export trap_BotNumInitialChats
proc trap_BotNumInitialChats 4 12
line 551
;550:
;551:int	trap_BotNumInitialChats(int chatstate, char *type) {
line 552
;552:	return syscall( BOTLIB_AI_NUM_INITIAL_CHATS, chatstate, type );
CNSTI4 569
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $206
endproc trap_BotNumInitialChats 4 12
export trap_BotReplyChat
proc trap_BotReplyChat 4 52
line 555
;553:}
;554:
;555:int trap_BotReplyChat(int chatstate, char *message, int mcontext, int vcontext, char *var0, char *var1, char *var2, char *var3, char *var4, char *var5, char *var6, char *var7 ) {
line 556
;556:	return syscall( BOTLIB_AI_REPLY_CHAT, chatstate, message, mcontext, vcontext, var0, var1, var2, var3, var4, var5, var6, var7 );
CNSTI4 514
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRP4
ARGP4
ADDRFP4 40
INDIRP4
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $207
endproc trap_BotReplyChat 4 52
export trap_BotChatLength
proc trap_BotChatLength 4 8
line 559
;557:}
;558:
;559:int trap_BotChatLength(int chatstate) {
line 560
;560:	return syscall( BOTLIB_AI_CHAT_LENGTH, chatstate );
CNSTI4 515
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $208
endproc trap_BotChatLength 4 8
export trap_BotEnterChat
proc trap_BotEnterChat 0 16
line 563
;561:}
;562:
;563:void trap_BotEnterChat(int chatstate, int client, int sendto) {
line 564
;564:	syscall( BOTLIB_AI_ENTER_CHAT, chatstate, client, sendto );
CNSTI4 516
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 565
;565:}
LABELV $209
endproc trap_BotEnterChat 0 16
export trap_BotGetChatMessage
proc trap_BotGetChatMessage 0 16
line 567
;566:
;567:void trap_BotGetChatMessage(int chatstate, char *buf, int size) {
line 568
;568:	syscall( BOTLIB_AI_GET_CHAT_MESSAGE, chatstate, buf, size);
CNSTI4 570
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 569
;569:}
LABELV $210
endproc trap_BotGetChatMessage 0 16
export trap_StringContains
proc trap_StringContains 4 16
line 571
;570:
;571:int trap_StringContains(char *str1, char *str2, int casesensitive) {
line 572
;572:	return syscall( BOTLIB_AI_STRING_CONTAINS, str1, str2, casesensitive );
CNSTI4 517
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $211
endproc trap_StringContains 4 16
export trap_BotFindMatch
proc trap_BotFindMatch 4 16
line 575
;573:}
;574:
;575:int trap_BotFindMatch(char *str, void /* struct bot_match_s */ *match, unsigned long int context) {
line 576
;576:	return syscall( BOTLIB_AI_FIND_MATCH, str, match, context );
CNSTI4 518
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRU4
ARGU4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $212
endproc trap_BotFindMatch 4 16
export trap_BotMatchVariable
proc trap_BotMatchVariable 0 20
line 579
;577:}
;578:
;579:void trap_BotMatchVariable(void /* struct bot_match_s */ *match, int variable, char *buf, int size) {
line 580
;580:	syscall( BOTLIB_AI_MATCH_VARIABLE, match, variable, buf, size );
CNSTI4 519
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 581
;581:}
LABELV $213
endproc trap_BotMatchVariable 0 20
export trap_UnifyWhiteSpaces
proc trap_UnifyWhiteSpaces 0 8
line 583
;582:
;583:void trap_UnifyWhiteSpaces(char *string) {
line 584
;584:	syscall( BOTLIB_AI_UNIFY_WHITE_SPACES, string );
CNSTI4 520
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 585
;585:}
LABELV $214
endproc trap_UnifyWhiteSpaces 0 8
export trap_BotReplaceSynonyms
proc trap_BotReplaceSynonyms 0 12
line 587
;586:
;587:void trap_BotReplaceSynonyms(char *string, unsigned long int context) {
line 588
;588:	syscall( BOTLIB_AI_REPLACE_SYNONYMS, string, context );
CNSTI4 521
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRU4
ARGU4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 589
;589:}
LABELV $215
endproc trap_BotReplaceSynonyms 0 12
export trap_BotLoadChatFile
proc trap_BotLoadChatFile 4 16
line 591
;590:
;591:int trap_BotLoadChatFile(int chatstate, char *chatfile, char *chatname) {
line 592
;592:	return syscall( BOTLIB_AI_LOAD_CHAT_FILE, chatstate, chatfile, chatname );
CNSTI4 522
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $216
endproc trap_BotLoadChatFile 4 16
export trap_BotSetChatGender
proc trap_BotSetChatGender 0 12
line 595
;593:}
;594:
;595:void trap_BotSetChatGender(int chatstate, int gender) {
line 596
;596:	syscall( BOTLIB_AI_SET_CHAT_GENDER, chatstate, gender );
CNSTI4 523
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 597
;597:}
LABELV $217
endproc trap_BotSetChatGender 0 12
export trap_BotSetChatName
proc trap_BotSetChatName 0 16
line 599
;598:
;599:void trap_BotSetChatName(int chatstate, char *name, int client) {
line 600
;600:	syscall( BOTLIB_AI_SET_CHAT_NAME, chatstate, name, client );
CNSTI4 524
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 601
;601:}
LABELV $218
endproc trap_BotSetChatName 0 16
export trap_BotResetGoalState
proc trap_BotResetGoalState 0 8
line 603
;602:
;603:void trap_BotResetGoalState(int goalstate) {
line 604
;604:	syscall( BOTLIB_AI_RESET_GOAL_STATE, goalstate );
CNSTI4 525
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 605
;605:}
LABELV $219
endproc trap_BotResetGoalState 0 8
export trap_BotResetAvoidGoals
proc trap_BotResetAvoidGoals 0 8
line 607
;606:
;607:void trap_BotResetAvoidGoals(int goalstate) {
line 608
;608:	syscall( BOTLIB_AI_RESET_AVOID_GOALS, goalstate );
CNSTI4 526
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 609
;609:}
LABELV $220
endproc trap_BotResetAvoidGoals 0 8
export trap_BotRemoveFromAvoidGoals
proc trap_BotRemoveFromAvoidGoals 0 12
line 611
;610:
;611:void trap_BotRemoveFromAvoidGoals(int goalstate, int number) {
line 612
;612:	syscall( BOTLIB_AI_REMOVE_FROM_AVOID_GOALS, goalstate, number);
CNSTI4 571
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 613
;613:}
LABELV $221
endproc trap_BotRemoveFromAvoidGoals 0 12
export trap_BotPushGoal
proc trap_BotPushGoal 0 12
line 615
;614:
;615:void trap_BotPushGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 616
;616:	syscall( BOTLIB_AI_PUSH_GOAL, goalstate, goal );
CNSTI4 527
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 617
;617:}
LABELV $222
endproc trap_BotPushGoal 0 12
export trap_BotPopGoal
proc trap_BotPopGoal 0 8
line 619
;618:
;619:void trap_BotPopGoal(int goalstate) {
line 620
;620:	syscall( BOTLIB_AI_POP_GOAL, goalstate );
CNSTI4 528
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 621
;621:}
LABELV $223
endproc trap_BotPopGoal 0 8
export trap_BotEmptyGoalStack
proc trap_BotEmptyGoalStack 0 8
line 623
;622:
;623:void trap_BotEmptyGoalStack(int goalstate) {
line 624
;624:	syscall( BOTLIB_AI_EMPTY_GOAL_STACK, goalstate );
CNSTI4 529
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 625
;625:}
LABELV $224
endproc trap_BotEmptyGoalStack 0 8
export trap_BotDumpAvoidGoals
proc trap_BotDumpAvoidGoals 0 8
line 627
;626:
;627:void trap_BotDumpAvoidGoals(int goalstate) {
line 628
;628:	syscall( BOTLIB_AI_DUMP_AVOID_GOALS, goalstate );
CNSTI4 530
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 629
;629:}
LABELV $225
endproc trap_BotDumpAvoidGoals 0 8
export trap_BotDumpGoalStack
proc trap_BotDumpGoalStack 0 8
line 631
;630:
;631:void trap_BotDumpGoalStack(int goalstate) {
line 632
;632:	syscall( BOTLIB_AI_DUMP_GOAL_STACK, goalstate );
CNSTI4 531
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 633
;633:}
LABELV $226
endproc trap_BotDumpGoalStack 0 8
export trap_BotGoalName
proc trap_BotGoalName 0 16
line 635
;634:
;635:void trap_BotGoalName(int number, char *name, int size) {
line 636
;636:	syscall( BOTLIB_AI_GOAL_NAME, number, name, size );
CNSTI4 532
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 637
;637:}
LABELV $227
endproc trap_BotGoalName 0 16
export trap_BotGetTopGoal
proc trap_BotGetTopGoal 4 12
line 639
;638:
;639:int trap_BotGetTopGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 640
;640:	return syscall( BOTLIB_AI_GET_TOP_GOAL, goalstate, goal );
CNSTI4 533
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $228
endproc trap_BotGetTopGoal 4 12
export trap_BotGetSecondGoal
proc trap_BotGetSecondGoal 4 12
line 643
;641:}
;642:
;643:int trap_BotGetSecondGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 644
;644:	return syscall( BOTLIB_AI_GET_SECOND_GOAL, goalstate, goal );
CNSTI4 534
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $229
endproc trap_BotGetSecondGoal 4 12
export trap_BotChooseLTGItem
proc trap_BotChooseLTGItem 4 20
line 647
;645:}
;646:
;647:int trap_BotChooseLTGItem(int goalstate, vec3_t origin, int *inventory, int travelflags) {
line 648
;648:	return syscall( BOTLIB_AI_CHOOSE_LTG_ITEM, goalstate, origin, inventory, travelflags );
CNSTI4 535
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $230
endproc trap_BotChooseLTGItem 4 20
export trap_BotChooseNBGItem
proc trap_BotChooseNBGItem 8 28
line 651
;649:}
;650:
;651:int trap_BotChooseNBGItem(int goalstate, vec3_t origin, int *inventory, int travelflags, void /* struct bot_goal_s */ *ltg, float maxtime) {
line 652
;652:	return syscall( BOTLIB_AI_CHOOSE_NBG_ITEM, goalstate, origin, inventory, travelflags, ltg, PASSFLOAT(maxtime) );
ADDRFP4 20
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 536
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $231
endproc trap_BotChooseNBGItem 8 28
export trap_BotTouchingGoal
proc trap_BotTouchingGoal 4 12
line 655
;653:}
;654:
;655:int trap_BotTouchingGoal(vec3_t origin, void /* struct bot_goal_s */ *goal) {
line 656
;656:	return syscall( BOTLIB_AI_TOUCHING_GOAL, origin, goal );
CNSTI4 537
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $232
endproc trap_BotTouchingGoal 4 12
export trap_BotItemGoalInVisButNotVisible
proc trap_BotItemGoalInVisButNotVisible 4 20
line 659
;657:}
;658:
;659:int trap_BotItemGoalInVisButNotVisible(int viewer, vec3_t eye, vec3_t viewangles, void /* struct bot_goal_s */ *goal) {
line 660
;660:	return syscall( BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE, viewer, eye, viewangles, goal );
CNSTI4 538
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $233
endproc trap_BotItemGoalInVisButNotVisible 4 20
export trap_BotGetLevelItemGoal
proc trap_BotGetLevelItemGoal 4 16
line 663
;661:}
;662:
;663:int trap_BotGetLevelItemGoal(int index, char *classname, void /* struct bot_goal_s */ *goal) {
line 664
;664:	return syscall( BOTLIB_AI_GET_LEVEL_ITEM_GOAL, index, classname, goal );
CNSTI4 539
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $234
endproc trap_BotGetLevelItemGoal 4 16
export trap_BotGetNextCampSpotGoal
proc trap_BotGetNextCampSpotGoal 4 12
line 667
;665:}
;666:
;667:int trap_BotGetNextCampSpotGoal(int num, void /* struct bot_goal_s */ *goal) {
line 668
;668:	return syscall( BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL, num, goal );
CNSTI4 567
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $235
endproc trap_BotGetNextCampSpotGoal 4 12
export trap_BotGetMapLocationGoal
proc trap_BotGetMapLocationGoal 4 12
line 671
;669:}
;670:
;671:int trap_BotGetMapLocationGoal(char *name, void /* struct bot_goal_s */ *goal) {
line 672
;672:	return syscall( BOTLIB_AI_GET_MAP_LOCATION_GOAL, name, goal );
CNSTI4 568
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $236
endproc trap_BotGetMapLocationGoal 4 12
export trap_BotAvoidGoalTime
proc trap_BotAvoidGoalTime 8 12
line 675
;673:}
;674:
;675:float trap_BotAvoidGoalTime(int goalstate, int number) {
line 677
;676:	int temp;
;677:	temp = syscall( BOTLIB_AI_AVOID_GOAL_TIME, goalstate, number );
CNSTI4 540
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 678
;678:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $237
endproc trap_BotAvoidGoalTime 8 12
export trap_BotSetAvoidGoalTime
proc trap_BotSetAvoidGoalTime 4 16
line 681
;679:}
;680:
;681:void trap_BotSetAvoidGoalTime(int goalstate, int number, float avoidtime) {
line 682
;682:	syscall( BOTLIB_AI_SET_AVOID_GOAL_TIME, goalstate, number, PASSFLOAT(avoidtime));
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 573
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 683
;683:}
LABELV $238
endproc trap_BotSetAvoidGoalTime 4 16
export trap_BotInitLevelItems
proc trap_BotInitLevelItems 0 4
line 685
;684:
;685:void trap_BotInitLevelItems(void) {
line 686
;686:	syscall( BOTLIB_AI_INIT_LEVEL_ITEMS );
CNSTI4 541
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 687
;687:}
LABELV $239
endproc trap_BotInitLevelItems 0 4
export trap_BotUpdateEntityItems
proc trap_BotUpdateEntityItems 0 4
line 689
;688:
;689:void trap_BotUpdateEntityItems(void) {
line 690
;690:	syscall( BOTLIB_AI_UPDATE_ENTITY_ITEMS );
CNSTI4 542
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 691
;691:}
LABELV $240
endproc trap_BotUpdateEntityItems 0 4
export trap_BotLoadItemWeights
proc trap_BotLoadItemWeights 4 12
line 693
;692:
;693:int trap_BotLoadItemWeights(int goalstate, char *filename) {
line 694
;694:	return syscall( BOTLIB_AI_LOAD_ITEM_WEIGHTS, goalstate, filename );
CNSTI4 543
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $241
endproc trap_BotLoadItemWeights 4 12
export trap_BotFreeItemWeights
proc trap_BotFreeItemWeights 0 8
line 697
;695:}
;696:
;697:void trap_BotFreeItemWeights(int goalstate) {
line 698
;698:	syscall( BOTLIB_AI_FREE_ITEM_WEIGHTS, goalstate );
CNSTI4 544
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 699
;699:}
LABELV $242
endproc trap_BotFreeItemWeights 0 8
export trap_BotInterbreedGoalFuzzyLogic
proc trap_BotInterbreedGoalFuzzyLogic 0 16
line 701
;700:
;701:void trap_BotInterbreedGoalFuzzyLogic(int parent1, int parent2, int child) {
line 702
;702:	syscall( BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC, parent1, parent2, child );
CNSTI4 565
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 703
;703:}
LABELV $243
endproc trap_BotInterbreedGoalFuzzyLogic 0 16
export trap_BotSaveGoalFuzzyLogic
proc trap_BotSaveGoalFuzzyLogic 0 12
line 705
;704:
;705:void trap_BotSaveGoalFuzzyLogic(int goalstate, char *filename) {
line 706
;706:	syscall( BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC, goalstate, filename );
CNSTI4 545
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 707
;707:}
LABELV $244
endproc trap_BotSaveGoalFuzzyLogic 0 12
export trap_BotMutateGoalFuzzyLogic
proc trap_BotMutateGoalFuzzyLogic 0 12
line 709
;708:
;709:void trap_BotMutateGoalFuzzyLogic(int goalstate, float range) {
line 710
;710:	syscall( BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC, goalstate, range );
CNSTI4 566
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 711
;711:}
LABELV $245
endproc trap_BotMutateGoalFuzzyLogic 0 12
export trap_BotAllocGoalState
proc trap_BotAllocGoalState 4 8
line 713
;712:
;713:int trap_BotAllocGoalState(int state) {
line 714
;714:	return syscall( BOTLIB_AI_ALLOC_GOAL_STATE, state );
CNSTI4 546
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $246
endproc trap_BotAllocGoalState 4 8
export trap_BotFreeGoalState
proc trap_BotFreeGoalState 0 8
line 717
;715:}
;716:
;717:void trap_BotFreeGoalState(int handle) {
line 718
;718:	syscall( BOTLIB_AI_FREE_GOAL_STATE, handle );
CNSTI4 547
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 719
;719:}
LABELV $247
endproc trap_BotFreeGoalState 0 8
export trap_BotResetMoveState
proc trap_BotResetMoveState 0 8
line 721
;720:
;721:void trap_BotResetMoveState(int movestate) {
line 722
;722:	syscall( BOTLIB_AI_RESET_MOVE_STATE, movestate );
CNSTI4 548
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 723
;723:}
LABELV $248
endproc trap_BotResetMoveState 0 8
export trap_BotAddAvoidSpot
proc trap_BotAddAvoidSpot 4 20
line 725
;724:
;725:void trap_BotAddAvoidSpot(int movestate, vec3_t origin, float radius, int type) {
line 726
;726:	syscall( BOTLIB_AI_ADD_AVOID_SPOT, movestate, origin, PASSFLOAT(radius), type);
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 574
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 727
;727:}
LABELV $249
endproc trap_BotAddAvoidSpot 4 20
export trap_BotMoveToGoal
proc trap_BotMoveToGoal 0 20
line 729
;728:
;729:void trap_BotMoveToGoal(void /* struct bot_moveresult_s */ *result, int movestate, void /* struct bot_goal_s */ *goal, int travelflags) {
line 730
;730:	syscall( BOTLIB_AI_MOVE_TO_GOAL, result, movestate, goal, travelflags );
CNSTI4 549
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 731
;731:}
LABELV $250
endproc trap_BotMoveToGoal 0 20
export trap_BotMoveInDirection
proc trap_BotMoveInDirection 8 20
line 733
;732:
;733:int trap_BotMoveInDirection(int movestate, vec3_t dir, float speed, int type) {
line 734
;734:	return syscall( BOTLIB_AI_MOVE_IN_DIRECTION, movestate, dir, PASSFLOAT(speed), type );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 550
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $251
endproc trap_BotMoveInDirection 8 20
export trap_BotResetAvoidReach
proc trap_BotResetAvoidReach 0 8
line 737
;735:}
;736:
;737:void trap_BotResetAvoidReach(int movestate) {
line 738
;738:	syscall( BOTLIB_AI_RESET_AVOID_REACH, movestate );
CNSTI4 551
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 739
;739:}
LABELV $252
endproc trap_BotResetAvoidReach 0 8
export trap_BotResetLastAvoidReach
proc trap_BotResetLastAvoidReach 0 8
line 741
;740:
;741:void trap_BotResetLastAvoidReach(int movestate) {
line 742
;742:	syscall( BOTLIB_AI_RESET_LAST_AVOID_REACH,movestate  );
CNSTI4 552
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 743
;743:}
LABELV $253
endproc trap_BotResetLastAvoidReach 0 8
export trap_BotReachabilityArea
proc trap_BotReachabilityArea 4 12
line 745
;744:
;745:int trap_BotReachabilityArea(vec3_t origin, int testground) {
line 746
;746:	return syscall( BOTLIB_AI_REACHABILITY_AREA, origin, testground );
CNSTI4 553
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $254
endproc trap_BotReachabilityArea 4 12
export trap_BotMovementViewTarget
proc trap_BotMovementViewTarget 8 24
line 749
;747:}
;748:
;749:int trap_BotMovementViewTarget(int movestate, void /* struct bot_goal_s */ *goal, int travelflags, float lookahead, vec3_t target) {
line 750
;750:	return syscall( BOTLIB_AI_MOVEMENT_VIEW_TARGET, movestate, goal, travelflags, PASSFLOAT(lookahead), target );
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 554
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $255
endproc trap_BotMovementViewTarget 8 24
export trap_BotPredictVisiblePosition
proc trap_BotPredictVisiblePosition 4 24
line 753
;751:}
;752:
;753:int trap_BotPredictVisiblePosition(vec3_t origin, int areanum, void /* struct bot_goal_s */ *goal, int travelflags, vec3_t target) {
line 754
;754:	return syscall( BOTLIB_AI_PREDICT_VISIBLE_POSITION, origin, areanum, goal, travelflags, target );
CNSTI4 572
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $256
endproc trap_BotPredictVisiblePosition 4 24
export trap_BotAllocMoveState
proc trap_BotAllocMoveState 4 4
line 757
;755:}
;756:
;757:int trap_BotAllocMoveState(void) {
line 758
;758:	return syscall( BOTLIB_AI_ALLOC_MOVE_STATE );
CNSTI4 555
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $257
endproc trap_BotAllocMoveState 4 4
export trap_BotFreeMoveState
proc trap_BotFreeMoveState 0 8
line 761
;759:}
;760:
;761:void trap_BotFreeMoveState(int handle) {
line 762
;762:	syscall( BOTLIB_AI_FREE_MOVE_STATE, handle );
CNSTI4 556
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 763
;763:}
LABELV $258
endproc trap_BotFreeMoveState 0 8
export trap_BotInitMoveState
proc trap_BotInitMoveState 0 12
line 765
;764:
;765:void trap_BotInitMoveState(int handle, void /* struct bot_initmove_s */ *initmove) {
line 766
;766:	syscall( BOTLIB_AI_INIT_MOVE_STATE, handle, initmove );
CNSTI4 557
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 767
;767:}
LABELV $259
endproc trap_BotInitMoveState 0 12
export trap_BotChooseBestFightWeapon
proc trap_BotChooseBestFightWeapon 4 12
line 769
;768:
;769:int trap_BotChooseBestFightWeapon(int weaponstate, int *inventory) {
line 770
;770:	return syscall( BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON, weaponstate, inventory );
CNSTI4 558
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $260
endproc trap_BotChooseBestFightWeapon 4 12
export trap_BotGetWeaponInfo
proc trap_BotGetWeaponInfo 0 16
line 773
;771:}
;772:
;773:void trap_BotGetWeaponInfo(int weaponstate, int weapon, void /* struct weaponinfo_s */ *weaponinfo) {
line 774
;774:	syscall( BOTLIB_AI_GET_WEAPON_INFO, weaponstate, weapon, weaponinfo );
CNSTI4 559
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 775
;775:}
LABELV $261
endproc trap_BotGetWeaponInfo 0 16
export trap_BotLoadWeaponWeights
proc trap_BotLoadWeaponWeights 4 12
line 777
;776:
;777:int trap_BotLoadWeaponWeights(int weaponstate, char *filename) {
line 778
;778:	return syscall( BOTLIB_AI_LOAD_WEAPON_WEIGHTS, weaponstate, filename );
CNSTI4 560
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $262
endproc trap_BotLoadWeaponWeights 4 12
export trap_BotAllocWeaponState
proc trap_BotAllocWeaponState 4 4
line 781
;779:}
;780:
;781:int trap_BotAllocWeaponState(void) {
line 782
;782:	return syscall( BOTLIB_AI_ALLOC_WEAPON_STATE );
CNSTI4 561
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $263
endproc trap_BotAllocWeaponState 4 4
export trap_BotFreeWeaponState
proc trap_BotFreeWeaponState 0 8
line 785
;783:}
;784:
;785:void trap_BotFreeWeaponState(int weaponstate) {
line 786
;786:	syscall( BOTLIB_AI_FREE_WEAPON_STATE, weaponstate );
CNSTI4 562
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 787
;787:}
LABELV $264
endproc trap_BotFreeWeaponState 0 8
export trap_BotResetWeaponState
proc trap_BotResetWeaponState 0 8
line 789
;788:
;789:void trap_BotResetWeaponState(int weaponstate) {
line 790
;790:	syscall( BOTLIB_AI_RESET_WEAPON_STATE, weaponstate );
CNSTI4 563
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 791
;791:}
LABELV $265
endproc trap_BotResetWeaponState 0 8
export trap_GeneticParentsAndChildSelection
proc trap_GeneticParentsAndChildSelection 4 24
line 793
;792:
;793:int trap_GeneticParentsAndChildSelection(int numranks, float *ranks, int *parent1, int *parent2, int *child) {
line 794
;794:	return syscall( BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION, numranks, ranks, parent1, parent2, child );
CNSTI4 564
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
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
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $266
endproc trap_GeneticParentsAndChildSelection 4 24
export trap_PC_LoadSource
proc trap_PC_LoadSource 4 8
line 797
;795:}
;796:
;797:int trap_PC_LoadSource( const char *filename ) {
line 798
;798:	return syscall( BOTLIB_PC_LOAD_SOURCE, filename );
CNSTI4 578
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $267
endproc trap_PC_LoadSource 4 8
export trap_PC_FreeSource
proc trap_PC_FreeSource 4 8
line 801
;799:}
;800:
;801:int trap_PC_FreeSource( int handle ) {
line 802
;802:	return syscall( BOTLIB_PC_FREE_SOURCE, handle );
CNSTI4 579
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $268
endproc trap_PC_FreeSource 4 8
export trap_PC_ReadToken
proc trap_PC_ReadToken 4 12
line 805
;803:}
;804:
;805:int trap_PC_ReadToken( int handle, pc_token_t *pc_token ) {
line 806
;806:	return syscall( BOTLIB_PC_READ_TOKEN, handle, pc_token );
CNSTI4 580
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $269
endproc trap_PC_ReadToken 4 12
export trap_PC_SourceFileAndLine
proc trap_PC_SourceFileAndLine 4 16
line 809
;807:}
;808:
;809:int trap_PC_SourceFileAndLine( int handle, char *filename, int *line ) {
line 810
;810:	return syscall( BOTLIB_PC_SOURCE_FILE_AND_LINE, handle, filename, line );
CNSTI4 581
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $270
endproc trap_PC_SourceFileAndLine 4 16
export trap_G2_ListModelBones
proc trap_G2_ListModelBones 0 12
line 819
;811:}
;812:
;813:
;814:/*
;815:Ghoul2 Insert Start
;816:*/
;817:// CG Specific API calls
;818:void trap_G2_ListModelBones(void *ghlInfo, int frame)
;819:{
line 820
;820:	syscall( G_G2_LISTBONES, ghlInfo, frame);
CNSTI4 582
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 821
;821:}
LABELV $271
endproc trap_G2_ListModelBones 0 12
export trap_G2_ListModelSurfaces
proc trap_G2_ListModelSurfaces 0 8
line 824
;822:
;823:void trap_G2_ListModelSurfaces(void *ghlInfo)
;824:{
line 825
;825:	syscall( G_G2_LISTSURFACES, ghlInfo);
CNSTI4 583
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 826
;826:}
LABELV $272
endproc trap_G2_ListModelSurfaces 0 8
export trap_G2_HaveWeGhoul2Models
proc trap_G2_HaveWeGhoul2Models 4 8
line 829
;827:
;828:qboolean trap_G2_HaveWeGhoul2Models(	void *ghoul2)
;829:{
line 830
;830:	return (qboolean)(syscall(G_G2_HAVEWEGHOULMODELS, ghoul2));
CNSTI4 584
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $273
endproc trap_G2_HaveWeGhoul2Models 4 8
export trap_G2_SetGhoul2ModelIndexes
proc trap_G2_SetGhoul2ModelIndexes 0 16
line 834
;831:}
;832:
;833:void trap_G2_SetGhoul2ModelIndexes(void *ghoul2, qhandle_t *modelList, qhandle_t *skinList)
;834:{
line 835
;835:	syscall( G_G2_SETMODELS, ghoul2, modelList, skinList);
CNSTI4 585
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 836
;836:}
LABELV $274
endproc trap_G2_SetGhoul2ModelIndexes 0 16
export trap_G2API_GetBoltMatrix
proc trap_G2API_GetBoltMatrix 4 40
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
line 840
;837:
;838:qboolean trap_G2API_GetBoltMatrix(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix,
;839:								const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale)
;840:{
line 841
;841:	return (qboolean)(syscall(G_G2_GETBOLT, ghoul2, modelIndex, boltIndex, matrix, angles, position, frameNum, modelList, scale));
CNSTI4 586
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $275
endproc trap_G2API_GetBoltMatrix 4 40
export trap_G2API_GetBoltMatrix_NoReconstruct
proc trap_G2API_GetBoltMatrix_NoReconstruct 4 40
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
line 846
;842:}
;843:
;844:qboolean trap_G2API_GetBoltMatrix_NoReconstruct(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix,
;845:								const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale)
;846:{ //Same as above but force it to not reconstruct the skeleton before getting the bolt position
line 847
;847:	return (qboolean)(syscall(G_G2_GETBOLT_NOREC, ghoul2, modelIndex, boltIndex, matrix, angles, position, frameNum, modelList, scale));
CNSTI4 587
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $276
endproc trap_G2API_GetBoltMatrix_NoReconstruct 4 40
export trap_G2API_GetBoltMatrix_NoRecNoRot
proc trap_G2API_GetBoltMatrix_NoRecNoRot 4 40
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
line 852
;848:}
;849:
;850:qboolean trap_G2API_GetBoltMatrix_NoRecNoRot(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix,
;851:								const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale)
;852:{ //Same as above but force it to not reconstruct the skeleton before getting the bolt position
line 853
;853:	return (qboolean)(syscall(G_G2_GETBOLT_NOREC_NOROT, ghoul2, modelIndex, boltIndex, matrix, angles, position, frameNum, modelList, scale));
CNSTI4 588
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $277
endproc trap_G2API_GetBoltMatrix_NoRecNoRot 4 40
export trap_G2API_InitGhoul2Model
proc trap_G2API_InitGhoul2Model 4 32
line 858
;854:}
;855:
;856:int trap_G2API_InitGhoul2Model(void **ghoul2Ptr, const char *fileName, int modelIndex, qhandle_t customSkin,
;857:						  qhandle_t customShader, int modelFlags, int lodBias)
;858:{
line 859
;859:	return syscall(G_G2_INITGHOUL2MODEL, ghoul2Ptr, fileName, modelIndex, customSkin, customShader, modelFlags, lodBias);
CNSTI4 589
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $278
endproc trap_G2API_InitGhoul2Model 4 32
export trap_G2API_AddBolt
proc trap_G2API_AddBolt 4 16
line 863
;860:}
;861:
;862:int trap_G2API_AddBolt(void *ghoul2, int modelIndex, const char *boneName)
;863:{
line 864
;864:	return syscall(G_G2_ADDBOLT, ghoul2, modelIndex, boneName);
CNSTI4 590
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $279
endproc trap_G2API_AddBolt 4 16
export trap_G2API_SetBoltInfo
proc trap_G2API_SetBoltInfo 0 16
line 868
;865:}
;866:
;867:void trap_G2API_SetBoltInfo(void *ghoul2, int modelIndex, int boltInfo)
;868:{
line 869
;869:	syscall(G_G2_SETBOLTINFO, ghoul2, modelIndex, boltInfo);
CNSTI4 591
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 870
;870:}
LABELV $280
endproc trap_G2API_SetBoltInfo 0 16
export trap_G2API_SetBoneAngles
proc trap_G2API_SetBoneAngles 4 48
ADDRFP4 16
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
ADDRFP4 28
ADDRFP4 28
INDIRI4
ASGNI4
line 875
;871:
;872:qboolean trap_G2API_SetBoneAngles(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags,
;873:								const int up, const int right, const int forward, qhandle_t *modelList,
;874:								int blendTime , int currentTime )
;875:{
line 876
;876:	return (syscall(G_G2_ANGLEOVERRIDE, ghoul2, modelIndex, boneName, angles, flags, up, right, forward, modelList, blendTime, currentTime));
CNSTI4 592
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $281
endproc trap_G2API_SetBoneAngles 4 48
export trap_G2API_SetBoneAnim
proc trap_G2API_SetBoneAnim 12 44
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRFP4 16
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRFP4 28
ADDRFP4 28
INDIRI4
ASGNI4
ADDRFP4 36
ADDRFP4 36
INDIRI4
ASGNI4
line 881
;877:}
;878:
;879:qboolean trap_G2API_SetBoneAnim(void *ghoul2, const int modelIndex, const char *boneName, const int startFrame, const int endFrame,
;880:							  const int flags, const float animSpeed, const int currentTime, const float setFrame , const int blendTime )
;881:{
line 882
;882:	return syscall(G_G2_PLAYANIM, ghoul2, modelIndex, boneName, startFrame, endFrame, flags, PASSFLOAT(animSpeed), currentTime, PASSFLOAT(setFrame), blendTime);
ADDRFP4 24
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 32
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 593
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $282
endproc trap_G2API_SetBoneAnim 12 44
export trap_G2API_GetGLAName
proc trap_G2API_GetGLAName 0 16
line 886
;883:}
;884:
;885:void trap_G2API_GetGLAName(void *ghoul2, int modelIndex, char *fillBuf)
;886:{
line 887
;887:	syscall(G_G2_GETGLANAME, ghoul2, modelIndex, fillBuf);
CNSTI4 594
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 888
;888:}
LABELV $283
endproc trap_G2API_GetGLAName 0 16
export trap_G2API_CopyGhoul2Instance
proc trap_G2API_CopyGhoul2Instance 4 16
line 891
;889:
;890:int trap_G2API_CopyGhoul2Instance(void *g2From, void *g2To, int modelIndex)
;891:{
line 892
;892:	return syscall(G_G2_COPYGHOUL2INSTANCE, g2From, g2To, modelIndex);
CNSTI4 595
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $284
endproc trap_G2API_CopyGhoul2Instance 4 16
export trap_G2API_CopySpecificGhoul2Model
proc trap_G2API_CopySpecificGhoul2Model 0 20
line 896
;893:}
;894:
;895:void trap_G2API_CopySpecificGhoul2Model(void *g2From, int modelFrom, void *g2To, int modelTo)
;896:{
line 897
;897:	syscall(G_G2_COPYSPECIFICGHOUL2MODEL, g2From, modelFrom, g2To, modelTo);
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 898
;898:}
LABELV $285
endproc trap_G2API_CopySpecificGhoul2Model 0 20
export trap_G2API_DuplicateGhoul2Instance
proc trap_G2API_DuplicateGhoul2Instance 0 12
line 901
;899:
;900:void trap_G2API_DuplicateGhoul2Instance(void *g2From, void **g2To)
;901:{
line 902
;902:	syscall(G_G2_DUPLICATEGHOUL2INSTANCE, g2From, g2To);
CNSTI4 597
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 903
;903:}
LABELV $286
endproc trap_G2API_DuplicateGhoul2Instance 0 12
export trap_G2API_HasGhoul2ModelOnIndex
proc trap_G2API_HasGhoul2ModelOnIndex 4 12
line 906
;904:
;905:qboolean trap_G2API_HasGhoul2ModelOnIndex(void *ghlInfo, int modelIndex)
;906:{
line 907
;907:	return syscall(G_G2_HASGHOUL2MODELONINDEX, ghlInfo, modelIndex);
CNSTI4 598
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $287
endproc trap_G2API_HasGhoul2ModelOnIndex 4 12
export trap_G2API_RemoveGhoul2Model
proc trap_G2API_RemoveGhoul2Model 4 12
line 911
;908:}
;909:
;910:qboolean trap_G2API_RemoveGhoul2Model(void *ghlInfo, int modelIndex)
;911:{
line 912
;912:	return syscall(G_G2_REMOVEGHOUL2MODEL, ghlInfo, modelIndex);
CNSTI4 599
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $288
endproc trap_G2API_RemoveGhoul2Model 4 12
export trap_G2API_CleanGhoul2Models
proc trap_G2API_CleanGhoul2Models 0 8
line 916
;913:}
;914:
;915:void trap_G2API_CleanGhoul2Models(void **ghoul2Ptr)
;916:{
line 917
;917:	syscall(G_G2_CLEANMODELS, ghoul2Ptr);
CNSTI4 600
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 918
;918:}
LABELV $289
endproc trap_G2API_CleanGhoul2Models 0 8
export trap_G2API_CollisionDetect
proc trap_G2API_CollisionDetect 4 52
line 934
;919:
;920:void trap_G2API_CollisionDetect ( 
;921:	CollisionRecord_t *collRecMap, 
;922:	void* ghoul2, 
;923:	const vec3_t angles, 
;924:	const vec3_t position,
;925:	int frameNumber, 
;926:	int entNum, 
;927:	vec3_t rayStart, 
;928:	vec3_t rayEnd, 
;929:	vec3_t scale, 
;930:	int traceFlags, 
;931:	int useLod,
;932:	float fRadius
;933:	)
;934:{
line 935
;935:	syscall ( G_G2_COLLISIONDETECT, collRecMap, ghoul2, angles, position, frameNumber, entNum, rayStart, rayEnd, scale, traceFlags, useLod, PASSFLOAT(fRadius) );
ADDRFP4 44
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 601
ARGI4
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
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 936
;936:}
LABELV $290
endproc trap_G2API_CollisionDetect 4 52
import trap_SP_Register
import trap_Cvar_VariableValue
import trap_Args
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
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
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
