
/*  A Bison parser, made from yacc.y
 by  GNU Bison version 1.25
  */
#ifndef  YACC1_H
#define  YACC1_H


#define YYBISON 1  /* Identify Bison output.  */

#define alloca

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

#line 1 "yacc.y"

#pragma warning (disable: 4514 4786)
#include <windows.h>
#include <cstdlib>
#include <string.h>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdarg.h>  //'va_start' is used 
#include <string>
#include <vector>
#include "MdxParser/QueryMember.h"
#include "MdxParser/QueryTuple.h"
#include "MdxParser/ParsedMDX.h"
#include "MdxParser/SymTab.h"
#include "MdxParser/SyntTree.h" 
#include <iostream>

using namespace dwschemac;
//using namespace mdx;

#define DEBUG
// Some yacc (bison) defines
#define YYDEBUG 1 //将这个变量设置为1时则表示启动YACC的调试功能,需要YYERROR_VERBOSE
#define YYERROR_VERBOSE // 给出更加详细的编译信息 

// Error-reporting function must be defined by the caller
void Error (char *format, ...);

SymTab st;     // create the symbol table
SyntTree tree = NULL; // the syntax tree

// vector<string> vecMemInfo;
// vector<QueryMember*> vecMem;
// vector<QueryTuple*> vecTuple;
//vector< vector<QueryTuple*> > vecSet;

#ifdef _LEX_YY_CPP
   int lineno = 1; // line number count; this will be used for error messages later
#else
   // Import some variables
   extern int lineno;
#endif

extern int yylex();
extern void yyerror(char *msg);
extern FILE *yyin, *yyout;

char* MakeLogicoperName();
char* MakeMathoperName();
char* MakeIdName ();
char* MakeQidName();
char* MakeNumName ();
char* MakeFormName ();

#line 59 "yacc.y"
typedef union {
   char *str;     // a character string
   int  integer;  //a integer number
   class SymDesc *symbol;  // entry from symbol table
   class TreeNode *tnode;  // node in the syntax tree
} YYSTYPE;
#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		132
#define	YYFLAG		32768
#define	YYNTBASE	54

#define YYTRANSLATE(x) ((unsigned)(x) <= 299 ? yytranslate[x] : 104)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    50,
    51,     9,     7,    49,     8,     2,    10,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    52,     2,    53,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,    11,    12,    13,    14,    15,    16,    17,    18,    19,
    20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
    30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
    40,    41,    42,    43,    44,    45,    46,    47,    48
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     2,     9,    10,    13,    16,    18,    20,    22,    26,
    28,    33,    37,    39,    41,    45,    50,    54,    58,    60,
    62,    64,    68,    70,    73,    75,    79,    83,    85,    87,
    91,    93,    95,    97,   101,   103,   104,   108,   110,   114,
   120,   122,   124,   126,   128,   130,   132,   134,   136,   141,
   145,   147,   149,   151,   155,   157,   162,   166,   168,   170,
   174,   176,   180,   182,   184,   188,   190,   192,   194,   196,
   198,   200,   203,   205,   207,   209,   210,   213,   215,   217,
   219,   221,   223
};

static const short yyrhs[] = {    55,
     0,    56,    41,    76,    29,    94,    97,     0,     0,    48,
    57,     0,    58,    57,     0,    58,     0,    59,     0,    64,
     0,    60,    49,    61,     0,    60,     0,    31,    62,    19,
    65,     0,    63,    49,    61,     0,    63,     0,    75,     0,
    95,    71,    66,     0,    42,    74,    19,    65,     0,    44,
    66,    44,     0,    68,    67,    66,     0,    68,     0,     3,
     0,     6,     0,    69,     4,    68,     0,    69,     0,     5,
    69,     0,    70,     0,    70,    71,    72,     0,    70,    30,
    34,     0,    72,     0,    99,     0,    89,    73,    89,     0,
    86,     0,   100,     0,    75,     0,    75,    25,    92,     0,
    92,     0,     0,    77,    49,    76,     0,    77,     0,    81,
    35,    78,     0,    33,    26,    81,    35,    78,     0,    79,
     0,    80,     0,    22,     0,    39,     0,    36,     0,    21,
     0,    40,     0,    96,     0,    20,    50,    96,    51,     0,
    82,    49,    81,     0,    82,     0,    83,     0,    84,     0,
    52,    85,    53,     0,    89,     0,    95,    50,    81,    51,
     0,    86,    49,    85,     0,    86,     0,    87,     0,    50,
    88,    51,     0,    89,     0,    89,    49,    88,     0,    89,
     0,    90,     0,    90,    25,    91,     0,    96,     0,    91,
     0,    92,     0,    93,     0,    95,     0,   101,     0,    18,
   101,     0,    92,     0,   102,     0,   103,     0,     0,    47,
    98,     0,    66,     0,    14,     0,    15,     0,    13,     0,
    12,     0,    16,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   112,   115,   139,   141,   145,   150,   152,   154,   159,   164,
   169,   176,   181,   183,   185,   195,   202,   206,   211,   214,
   216,   219,   221,   223,   225,   227,   229,   230,   233,   236,
   241,   244,   254,   257,   262,   269,   271,   275,   289,   294,
   300,   302,   305,   307,   308,   309,   310,   313,   315,   320,
   325,   327,   331,   333,   334,   336,   342,   347,   351,   355,
   357,   360,   365,   369,   375,   380,   381,   385,   387,   390,
   392,   397,   402,   406,   410,   416,   418,   429,   434,   446,
   458,   470,   482
};
#endif


#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)

static const char * const yytname[] = {   "$","error","$undefined.","OR","AND",
"NOT","XOR","'+'","'-'","'*'","'/'","UMINUS","IDENTIFIER","QUOTED_ID","LOGICOPER",
"MATHOPER","NUMBER","ADD","AMPERSAND","AS","AXIS","CHAPTERS","COLUMNS","DIMENSION",
"DIV","DOT","EMPTY","EXCEPT","FORMAT","FROM","IS","MEMBER","MINUS","NON","NULLX",
"ON","PAGES","PERCENTSIGN","PROPERTIES","ROWS","SECTIONS","SELECT","SET","SHARP",
"SINGLEQUOTE","STAR","STRING","WHERE","WITH","','","'('","')'","'{'","'}'","mdx_statement",
"statement_list","with_formula_specification_opt","formula_specification","single_formula_specification",
"member_specification_list","member_specification","member_property_def_list",
"member_name","member_property_definition","nameset_specification_list","formula_string",
"value_expression","or_xor","term4","term3","term2","logic_oper_node","term1",
"math_operator_node","name_set","compound_id","axis_specification_list","axis_specification",
"axis_name_number","axis_name","axis_number","set_specification_list","set_specification",
"set_node","fun_specification","tuple_specification_list","tuple_specification",
"tuple_node","member_expression_list","member_expression","member_expression_node",
"identifier_list_opt","identifier_opt","amp_quoted_identifier","cube_specification",
"identifier_node","number_node","where_clause_opt","slicer_specification","logic_oper",
"mathematical_oper","quoted_identifier","identifier","number", NULL
};
#endif

static const short yyr1[] = {     0,
    54,    55,    56,    56,    57,    57,    58,    58,    59,    59,
    60,    61,    61,    62,    63,    64,    65,    66,    66,    67,
    67,    68,    68,    69,    69,    70,    70,    70,    71,    72,
    72,    73,    74,    75,    75,    76,    76,    76,    77,    77,
    78,    78,    79,    79,    79,    79,    79,    80,    80,    81,
    81,    82,    83,    83,    83,    84,    85,    85,    86,    87,
    87,    88,    88,    89,    90,    90,    90,    91,    91,    92,
    92,    93,    94,    95,    96,    97,    97,    98,    99,   100,
   101,   102,   103
};

static const short yyr2[] = {     0,
     1,     6,     0,     2,     2,     1,     1,     1,     3,     1,
     4,     3,     1,     1,     3,     4,     3,     3,     1,     1,
     1,     3,     1,     2,     1,     3,     3,     1,     1,     3,
     1,     1,     1,     3,     1,     0,     3,     1,     3,     5,
     1,     1,     1,     1,     1,     1,     1,     1,     4,     3,
     1,     1,     1,     3,     1,     4,     3,     1,     1,     3,
     1,     3,     1,     1,     3,     1,     1,     1,     1,     1,
     1,     2,     1,     1,     1,     0,     2,     1,     1,     1,
     1,     1,     1
};

static const short yydefact[] = {     3,
     0,     1,     0,     0,     0,     4,     6,     7,    10,     8,
    36,    82,    81,     0,    14,    35,    70,    71,    74,     0,
    33,     5,     0,    83,     0,     0,     0,     0,    38,     0,
    51,    52,    53,    55,    64,    67,    68,    69,    70,    66,
    75,     0,     0,     0,     9,    13,     0,    72,     0,     0,
     0,    58,    59,    61,     0,    36,     0,     0,     0,     0,
     0,    11,    34,    16,     0,    79,     0,    29,     0,     0,
    63,    54,     0,    73,    76,    37,     0,    46,    43,    45,
    44,    47,    39,    41,    42,    48,    50,    65,     0,     0,
     0,    19,    23,    25,    28,    31,    61,    12,    15,     0,
    60,     0,    57,     0,     2,     0,    56,    24,    17,    20,
    21,     0,     0,     0,     0,    80,     0,    32,    40,    62,
    78,    77,     0,    18,    22,    27,    26,    30,    49,     0,
     0,     0
};

static const short yydefgoto[] = {   130,
     2,     3,     6,     7,     8,     9,    45,    14,    46,    10,
    62,    91,   112,    92,    93,    94,    67,    95,   117,    20,
    15,    28,    29,    83,    84,    85,    30,    31,    32,    33,
    51,    96,    53,    70,    97,    35,    36,    37,    38,    75,
    17,    40,   105,   122,    68,   118,    18,    19,    41
};

static const short yypact[] = {   -41,
   -30,-32768,   -32,    20,    20,-32768,   -30,-32768,   -23,-32768,
    11,-32768,-32768,    16,    12,-32768,-32768,-32768,-32768,    21,
    12,-32768,    30,-32768,    33,    34,    55,    27,    15,    26,
    25,-32768,-32768,-32768,    40,-32768,-32768,-32768,    19,-32768,
-32768,    31,    20,    31,-32768,    35,    72,-32768,    18,    67,
    36,    39,-32768,-32768,    20,    11,    56,    18,    69,    18,
     1,-32768,-32768,-32768,    30,-32768,     1,-32768,    58,    43,
    41,-32768,    55,-32768,    50,-32768,    48,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,    49,     1,
    57,    22,    95,   -12,-32768,-32768,    87,-32768,-32768,    56,
-32768,    67,-32768,     1,-32768,    88,-32768,-32768,-32768,-32768,
-32768,     1,     1,    73,    55,-32768,    67,-32768,-32768,-32768,
-32768,-32768,    52,-32768,-32768,-32768,-32768,-32768,-32768,   108,
   109,-32768
};

static const short yypgoto[] = {-32768,
-32768,-32768,   103,-32768,-32768,-32768,    46,-32768,-32768,-32768,
    68,   -46,-32768,     2,    23,-32768,    24,    -1,-32768,-32768,
   111,    61,-32768,    28,-32768,-32768,   -38,-32768,-32768,-32768,
    47,   -19,-32768,    17,   -11,-32768,    62,     0,-32768,-32768,
    -8,   -47,-32768,-32768,-32768,-32768,    97,-32768,-32768
};


#define	YYLAST		128


static const short yytable[] = {    34,
     4,    66,    39,    16,    16,    90,     1,    52,    11,    86,
    69,     5,    12,    13,    47,    54,    24,   114,    25,    87,
    99,    89,    12,    13,   110,    23,    24,   111,    25,    12,
    13,    12,    13,    24,    42,    25,    43,    34,    71,    44,
    39,    12,    63,    26,    34,    13,    34,    39,    34,    39,
    50,    39,    86,    52,    74,    55,    47,   121,   123,    49,
    57,    54,    27,    56,    59,   124,    12,    13,    60,    27,
    24,    24,    25,    58,    61,    77,    78,    79,    12,    13,
    12,    13,    24,    65,    25,    66,    25,    73,    72,   102,
    71,    80,   100,   101,    81,    82,   104,   106,   113,   107,
   109,   116,   129,    24,    50,   128,   126,   131,   132,    22,
    98,    64,   108,   127,   125,    21,    76,   115,   120,   103,
    88,    48,     0,     0,     0,     0,     0,   119
};

static const short yycheck[] = {    11,
    31,    14,    11,     4,     5,     5,    48,    27,    41,    57,
    49,    42,    12,    13,    23,    27,    16,    30,    18,    58,
    67,    60,    12,    13,     3,    49,    16,     6,    18,    12,
    13,    12,    13,    16,    19,    18,    25,    49,    50,    19,
    49,    12,    43,    33,    56,    13,    58,    56,    60,    58,
    50,    60,   100,    73,    55,    29,    65,   104,   106,    26,
    35,    73,    52,    49,    25,   112,    12,    13,    50,    52,
    16,    16,    18,    49,    44,    20,    21,    22,    12,    13,
    12,    13,    16,    49,    18,    14,    18,    49,    53,    49,
   102,    36,    35,    51,    39,    40,    47,    50,     4,    51,
    44,    15,    51,    16,    50,   117,    34,     0,     0,     7,
    65,    44,    90,   115,   113,     5,    56,    94,   102,    73,
    59,    25,    -1,    -1,    -1,    -1,    -1,   100
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(TO,FROM,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (to, from, count)
     char *to;
     char *from;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *to, char *from, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif


/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#ifdef __cplusplus
#define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#else /* not __cplusplus */
#define YYPARSE_PARAM_ARG YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#endif /* not __cplusplus */
#else /* not YYPARSE_PARAM */
#define YYPARSE_PARAM_ARG
#define YYPARSE_PARAM_DECL
#endif /* not YYPARSE_PARAM */

int
yyparse(YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_memcpy ((char *)yyss, (char *)yyss1, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_memcpy ((char *)yyvs, (char *)yyvs1, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_memcpy ((char *)yyls, (char *)yyls1, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

case 1:
#line 113 "yacc.y"
{tree = yyvsp[0].tnode;;
    break;}
case 2:
#line 120 "yacc.y"
{   
              if ((yyvsp[-5].tnode != NULL)&&(yyvsp[0].tnode != NULL)&&(yyvsp[-3].tnode != NULL))
                  yyval.tnode = new TreeNode(WITHSELTFROMWHERE_LIST, yyvsp[-5].tnode, yyvsp[-3].tnode, yyvsp[-1].tnode, yyvsp[0].tnode);
              else if ((yyvsp[-5].tnode != NULL)&&(yyvsp[0].tnode == NULL)&&(yyvsp[-3].tnode != NULL))
                  yyval.tnode = new TreeNode(WITHSELFROM_LIST, yyvsp[-5].tnode, yyvsp[-3].tnode, yyvsp[-1].tnode);
              else if ((yyvsp[-5].tnode == NULL)&&(yyvsp[0].tnode != NULL)&&(yyvsp[-3].tnode != NULL))
                  yyval.tnode = new TreeNode(SELFROMWHERE_LIST, yyvsp[-3].tnode, yyvsp[-1].tnode, yyvsp[0].tnode);
			  else if ((yyvsp[-5].tnode == NULL)&&(yyvsp[0].tnode == NULL)&&(yyvsp[-3].tnode == NULL))
			      yyval.tnode = new TreeNode(FROM_STMT, yyvsp[-1].tnode);
			  else if ((yyvsp[-5].tnode == NULL)&&(yyvsp[0].tnode != NULL)&&(yyvsp[-3].tnode == NULL))
			      yyval.tnode = new TreeNode(FORM_WHERE,yyvsp[-1].tnode,yyvsp[0].tnode);
              else
                  yyval.tnode = new TreeNode(SELFROM_LIST, yyvsp[-3].tnode, yyvsp[-1].tnode);
         ;
    break;}
case 3:
#line 140 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 4:
#line 141 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 5:
#line 147 "yacc.y"
{
            yyval.tnode = new TreeNode (FORMULA_STMT, yyvsp[-1].tnode, yyvsp[0].tnode);               
         ;
    break;}
case 6:
#line 150 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 7:
#line 153 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 8:
#line 154 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 9:
#line 161 "yacc.y"
{
               yyval.tnode = new TreeNode(MEM_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);                 
           ;
    break;}
case 10:
#line 164 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 11:
#line 171 "yacc.y"
{
            yyval.tnode = new TreeNode(MEM_STMT, yyvsp[-2].tnode, yyvsp[0].tnode);
        ;
    break;}
case 12:
#line 178 "yacc.y"
{
            yyval.tnode = new TreeNode(MEMDEF_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);                           
        ;
    break;}
case 13:
#line 181 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 14:
#line 183 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode;;
    break;}
case 15:
#line 187 "yacc.y"
{
            yyval.tnode = new TreeNode(MEMPDEF_STMT,  yyvsp[-2].tnode, yyvsp[-1].tnode, yyvsp[0].tnode);      
        ;
    break;}
case 16:
#line 197 "yacc.y"
{
            yyval.tnode = new TreeNode(NAMESET_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);    
          ;
    break;}
case 17:
#line 203 "yacc.y"
{ yyval.tnode = yyvsp[-1].tnode; ;
    break;}
case 18:
#line 208 "yacc.y"
{
             yyval.tnode = new TreeNode(VALUE_EXPR, yyvsp[-2].tnode, yyvsp[0].tnode);              
         ;
    break;}
case 19:
#line 211 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 20:
#line 215 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 21:
#line 216 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 22:
#line 220 "yacc.y"
{yyval.tnode = new TreeNode(TERM4, yyvsp[-2].tnode, yyvsp[0].tnode);;
    break;}
case 23:
#line 221 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 24:
#line 224 "yacc.y"
{yyval.tnode = new TreeNode(TERM3, yyvsp[0].tnode);;
    break;}
case 25:
#line 225 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 26:
#line 228 "yacc.y"
{yyval.tnode = new TreeNode(TERM2, yyvsp[-2].tnode, yyvsp[-1].tnode, yyvsp[0].tnode);;
    break;}
case 27:
#line 229 "yacc.y"
{yyval.tnode = yyvsp[-2].tnode;;
    break;}
case 28:
#line 230 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 29:
#line 234 "yacc.y"
{yyval.tnode = new TreeNode(LOGIC_OPER); yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 30:
#line 238 "yacc.y"
{
              yyval.tnode = new TreeNode(TERM1, yyvsp[-2].tnode, yyvsp[0].tnode);                      
          ;
    break;}
case 31:
#line 241 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 32:
#line 249 "yacc.y"
{yyval.tnode = new TreeNode(MATH_OPER); yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 33:
#line 255 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 34:
#line 259 "yacc.y"
{
          yyval.tnode = new TreeNode(COMID_STMT, yyvsp[-2].tnode, yyvsp[0].tnode);       
       ;
    break;}
case 35:
#line 262 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 36:
#line 270 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 37:
#line 272 "yacc.y"
{
               yyval.tnode = new TreeNode(AXIS_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);              
          ;
    break;}
case 38:
#line 275 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 39:
#line 291 "yacc.y"
{
  				yyval.tnode = new TreeNode(AXIS_STMT, yyvsp[-2].tnode, yyvsp[0].tnode);
  			;
    break;}
case 40:
#line 295 "yacc.y"
{
 			   yyval.tnode = new  TreeNode(NONEMPTY_AXIS_STMT, yyvsp[-2].tnode, yyvsp[0].tnode);
 			;
    break;}
case 41:
#line 301 "yacc.y"
{yyval.tnode = new TreeNode(AXISNAME_STMT, yyvsp[0].tnode);;
    break;}
case 42:
#line 302 "yacc.y"
{yyval.tnode = new TreeNode(AXISNUM_STMT, yyvsp[0].tnode);;
    break;}
case 43:
#line 306 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 44:
#line 307 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 45:
#line 308 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 46:
#line 309 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 47:
#line 310 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 48:
#line 314 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 49:
#line 315 "yacc.y"
{yyval.tnode = yyvsp[-1].tnode;;
    break;}
case 50:
#line 322 "yacc.y"
{
	        yyval.tnode = new TreeNode(SET_STMT_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);
	   ;
    break;}
case 51:
#line 325 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 52:
#line 328 "yacc.y"
{yyval.tnode = new TreeNode(SET_STMT, yyvsp[0].tnode);;
    break;}
case 53:
#line 332 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 54:
#line 333 "yacc.y"
{yyval.tnode = yyvsp[-1].tnode;;
    break;}
case 55:
#line 334 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;
    break;}
case 56:
#line 338 "yacc.y"
{
	       yyval.tnode = new TreeNode(FUN_STMT, yyvsp[-3].tnode, yyvsp[-1].tnode);
	   ;
    break;}
case 57:
#line 344 "yacc.y"
{
		   yyval.tnode = new TreeNode(TUPLE_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);
	   ;
    break;}
case 58:
#line 347 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 59:
#line 352 "yacc.y"
{ yyval.tnode = new TreeNode(TUPLE_STMT, yyvsp[0].tnode); ;
    break;}
case 60:
#line 356 "yacc.y"
{ yyval.tnode = yyvsp[-1].tnode; ;
    break;}
case 61:
#line 357 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 62:
#line 362 "yacc.y"
{
		    yyval.tnode = new TreeNode(MEMEXPR_LIST, yyvsp[-2].tnode, yyvsp[0].tnode);
		;
    break;}
case 63:
#line 365 "yacc.y"
{ yyval.tnode = yyvsp[0].tnode; ;
    break;}
case 64:
#line 371 "yacc.y"
{
		     yyval.tnode = new TreeNode(MEM_EXPR, yyvsp[0].tnode);  //读到MEM_EXPR生成QueryMember对象，而不是MEM_NODE
		 ;
    break;}
case 65:
#line 377 "yacc.y"
{
		     yyval.tnode = new TreeNode(MEM_NODE, yyvsp[-2].tnode, yyvsp[0].tnode);
		 ;
    break;}
case 66:
#line 380 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 67:
#line 381 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 68:
#line 386 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 69:
#line 387 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 70:
#line 391 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 71:
#line 392 "yacc.y"
{yyval.tnode = new TreeNode (QIDENT_EXPR); yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 72:
#line 398 "yacc.y"
{yyval.tnode = new TreeNode(AMPID_EXPR);yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 73:
#line 403 "yacc.y"
{yyval.tnode = new TreeNode(CUBE_STMT,yyvsp[0].tnode);;
    break;}
case 74:
#line 407 "yacc.y"
{yyval.tnode = new TreeNode (IDENT_EXPR); yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 75:
#line 411 "yacc.y"
{yyval.tnode = new TreeNode (NUM_EXPR); yyval.tnode->symbol = yyvsp[0].symbol;;
    break;}
case 76:
#line 417 "yacc.y"
{yyval.tnode = NULL;;
    break;}
case 77:
#line 419 "yacc.y"
{
             //printf("keyword:WHERE\n");
             yyval.tnode = new TreeNode(WHERE_STMT, yyvsp[0].tnode);
         ;
    break;}
case 78:
#line 430 "yacc.y"
{yyval.tnode = yyvsp[0].tnode;;
    break;}
case 79:
#line 436 "yacc.y"
{
	    yyval.symbol = st.find (yylval.str);
        if (yyval.symbol == NULL)   
        { // doesn't exist yet; create it
            yyval.symbol = new SymDesc (MakeLogicoperName(), LOGIC_OPER_STR, yylval.str, lineno);
            st.add (yyval.symbol);
        }  
	;
    break;}
case 80:
#line 448 "yacc.y"
{
		yyval.symbol = st.find (yylval.str);
			if (yyval.symbol == NULL)   
			{ // doesn't exist yet; create it
				yyval.symbol = new SymDesc (MakeMathoperName(), MATH_OPER_STR, yylval.str, lineno);
				st.add (yyval.symbol);
			}
	;
    break;}
case 81:
#line 460 "yacc.y"
{
	        yyval.symbol = st.find (yylval.str);
            if (yyval.symbol == NULL)   
            { // doesn't exist yet; create it
                yyval.symbol = new SymDesc (MakeQidName(), QID_STR, yylval.str, lineno);
                st.add (yyval.symbol);
            }  
		 ;
    break;}
case 82:
#line 472 "yacc.y"
{
           yyval.symbol = st.find (yylval.str);
           if (yyval.symbol == NULL)   
              { // doesn't exist yet; create it
                 yyval.symbol = new SymDesc (MakeIdName(), IDENT_STR, yylval.str, lineno);
                 st.add (yyval.symbol);
              }       
         ;
    break;}
case 83:
#line 484 "yacc.y"
{  
		   //符号表暂时只支持字符型的，没法加入和显示int型的
		   //所以把int型的改为字符型的加入和显示
		   char* c = new char[32];
		   _itoa(yylval.integer, c, 10);
           yyval.symbol = st.find (c);
           if (yyval.symbol == NULL)   
           { // doesn't exist yet; create it
              yyval.symbol = new SymDesc (MakeNumName(), IDENT_NUM, c, lineno);
              st.add (yyval.symbol);			  
           }       
        ;
    break;}
}
   /* the action file gets copied in in place of this dollarsign */

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 496 "yacc.y"



// Generate a unique name for a logic operator
char* MakeLogicoperName(){
   char *name = new char [32];
   char num[32];
   static l = 0;
   _itoa(++l,num,10);
   strcpy (name, "logicOper");
   strcat (name, num);
   return name;
}
// Generate a unique name for a mathematical operator
char* MakeMathoperName(){
   char *name = new char [32];
   char num[32];
   static l = 0;
   _itoa(++l,num,10);
   strcpy (name, "mathematicalOper");
   strcat (name, num);
   return name;
}

// Generate a unique name for a string identifier
char* MakeIdName(){
   char *name = new char [32];
   char num[32];
   static l = 0;
   //sprintf (num, "%d", ++l);
   _itoa(++l,num,10);
   strcpy (name, "unquotedId");
   strcat (name, num);
   //printf("MakeIdName:%d->%s\n",l,name);
   return name;
}

// Generate a unique name for a number identifier
char* MakeNumName(){
   char *name = new char [32];
   char num[32];
   static m = 0;
   //sprintf (num, "%d", ++m);

   _itoa(++m,num,10);
   strcpy (name, "numberId"); 
   strcat (name, num);
   //printf("MakeNumName:%d->%s\n",m,name);
   return name;
}

// Generate a unique name for formula_string
char* MakeFormName(){
   char *name = new char [32];
   char num[32];   
   static n = 0;
   //sprintf (num, "%d", ++n);
   _itoa(++n,num,10);
   strcpy (name, "fromulaStr"); 
   strcat (name, num);
   //printf("MakeFormName:%d->%s\n",n,name);
   return name;
}

char* MakeQidName(){
   char *name = new char [32];
   char num[32];
   static s = 0;
   //sprintf (num, "%d", ++s);
    _itoa(++s,num,10);
   strcpy (name, "quotedId"); 
   strcat (name, num);
   //printf("MakeQidName:%d->%s\n",s,name);
   return name;
}


int errors = 0;

// Function used to report errors
void Error (char *format, ...)   {
   va_list args;

   errors++;
   fprintf (stderr, "Line %d: ", lineno);
   va_start(args, format);
   vfprintf(stderr, format, args);
   va_end(args);
   printf("\n");
}

// Show an error count
void ErrorSummary ()  {
   fprintf (stderr, "%d error(s) were found.\n", errors);
}

// Function called by the parser when an error occurs while parsing
// (parse error or stack overflow)
void yyerror(char *msg) {
   Error (msg);
}

#endif