/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    FLOAT = 259,                   /* FLOAT  */
    DOUBLE = 260,                  /* DOUBLE  */
    CHAR = 261,                    /* CHAR  */
    SHORT = 262,                   /* SHORT  */
    VOID = 263,                    /* VOID  */
    STRLITERAL = 264,              /* STRLITERAL  */
    CHARLITERAL = 265,             /* CHARLITERAL  */
    LONG = 266,                    /* LONG  */
    IDENTIFIER = 267,              /* IDENTIFIER  */
    VALUE = 268,                   /* VALUE  */
    INVALID_ID = 269,              /* INVALID_ID  */
    INCLUDE = 270,                 /* INCLUDE  */
    HEADER = 271,                  /* HEADER  */
    MAIN = 272,                    /* MAIN  */
    RETURN = 273,                  /* RETURN  */
    PRINTF = 274,                  /* PRINTF  */
    SCANF = 275,                   /* SCANF  */
    MUL_ASSIGN = 276,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 277,              /* DIV_ASSIGN  */
    MOD_ASSIGN = 278,              /* MOD_ASSIGN  */
    ADD_ASSIGN = 279,              /* ADD_ASSIGN  */
    SUB_ASSIGN = 280,              /* SUB_ASSIGN  */
    LEFT_ASSIGN = 281,             /* LEFT_ASSIGN  */
    RIGHT_ASSIGN = 282,            /* RIGHT_ASSIGN  */
    AND_ASSIGN = 283,              /* AND_ASSIGN  */
    OR_ASSIGN = 284,               /* OR_ASSIGN  */
    XOR_ASSIGN = 285,              /* XOR_ASSIGN  */
    RIGHTSHIFT = 286,              /* RIGHTSHIFT  */
    LEFTSHIFT = 287,               /* LEFTSHIFT  */
    LTEQ = 288,                    /* LTEQ  */
    GTEQ = 289,                    /* GTEQ  */
    EQ = 290,                      /* EQ  */
    EQCOMP = 291,                  /* EQCOMP  */
    NE = 292,                      /* NE  */
    LAND = 293,                    /* LAND  */
    LOR = 294,                     /* LOR  */
    TRUE = 295,                    /* TRUE  */
    FALSE = 296,                   /* FALSE  */
    COLON = 297,                   /* COLON  */
    UADD = 298,                    /* UADD  */
    USUB = 299,                    /* USUB  */
    IF = 300,                      /* IF  */
    ELSEIF = 301,                  /* ELSEIF  */
    ELSE = 302,                    /* ELSE  */
    SWITCH = 303,                  /* SWITCH  */
    CASE = 304,                    /* CASE  */
    FOR = 305,                     /* FOR  */
    WHILE = 306,                   /* WHILE  */
    DO = 307,                      /* DO  */
    CONTINUE = 308,                /* CONTINUE  */
    BREAK = 309,                   /* BREAK  */
    SCOMMENT = 310,                /* SCOMMENT  */
    MCOMMENT = 311                 /* MCOMMENT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define INT 258
#define FLOAT 259
#define DOUBLE 260
#define CHAR 261
#define SHORT 262
#define VOID 263
#define STRLITERAL 264
#define CHARLITERAL 265
#define LONG 266
#define IDENTIFIER 267
#define VALUE 268
#define INVALID_ID 269
#define INCLUDE 270
#define HEADER 271
#define MAIN 272
#define RETURN 273
#define PRINTF 274
#define SCANF 275
#define MUL_ASSIGN 276
#define DIV_ASSIGN 277
#define MOD_ASSIGN 278
#define ADD_ASSIGN 279
#define SUB_ASSIGN 280
#define LEFT_ASSIGN 281
#define RIGHT_ASSIGN 282
#define AND_ASSIGN 283
#define OR_ASSIGN 284
#define XOR_ASSIGN 285
#define RIGHTSHIFT 286
#define LEFTSHIFT 287
#define LTEQ 288
#define GTEQ 289
#define EQ 290
#define EQCOMP 291
#define NE 292
#define LAND 293
#define LOR 294
#define TRUE 295
#define FALSE 296
#define COLON 297
#define UADD 298
#define USUB 299
#define IF 300
#define ELSEIF 301
#define ELSE 302
#define SWITCH 303
#define CASE 304
#define FOR 305
#define WHILE 306
#define DO 307
#define CONTINUE 308
#define BREAK 309
#define SCOMMENT 310
#define MCOMMENT 311

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
