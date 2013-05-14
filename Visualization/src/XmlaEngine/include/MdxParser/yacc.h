#ifndef YACC_H
#define YACC_H

typedef union {
   char *str;     // a character string
   int  integer;  //a integer number
   class SymDesc *symbol;  // entry from symbol table
   class TreeNode *tnode;  // node in the syntax tree
} YYSTYPE;
#define	OR	258
#define	AND	259
#define	NOT	260
#define	XOR	261
#define	UMINUS	262
#define	IDENTIFIER	263
#define	QUOTED_ID	264
#define	LOGICOPER	265
#define	MATHOPER	266
#define	NUMBER	267
#define	ADD	268
#define	AMPERSAND	269
#define	AS	270
#define	AXIS	271
#define	CHAPTERS	272
#define	COLUMNS	273
#define	DIMENSION	274
#define	DIV	275
#define	DOT	276
#define	EMPTY	277
#define	EXCEPT	278
#define	FORMAT	279
#define	FROM	280
#define	IS	281
#define	MEMBER	282
#define	MINUS	283
#define	NON	284
#define	NULLX	285
#define	ON	286
#define	PAGES	287
#define	PERCENTSIGN	288
#define	PROPERTIES	289
#define	ROWS	290
#define	SECTIONS	291
#define	SELECT	292
#define	SET	293
#define	SHARP	294
#define	SINGLEQUOTE	295
#define	STAR	296
#define	STRING	297
#define	WHERE	298
#define	WITH	299


extern YYSTYPE yylval;

#endif