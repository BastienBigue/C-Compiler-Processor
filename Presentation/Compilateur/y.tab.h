/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tInt = 258,
    tPo = 259,
    tPf = 260,
    tAo = 261,
    tAf = 262,
    tPV = 263,
    tIf = 264,
    tWhile = 265,
    tPrint = 266,
    tEquEqu = 267,
    tAnd = 268,
    tPlus = 269,
    tMoins = 270,
    tMul = 271,
    tDiv = 272,
    tVir = 273,
    tEqu = 274,
    tElse = 275,
    tOr = 276,
    tConst = 277,
    tReturn = 278,
    tInf = 279,
    tSup = 280,
    tInfE = 281,
    tSupE = 282,
    tAddr = 283,
    tNULL = 284,
    tId = 285,
    tMain = 286,
    tNb = 287
  };
#endif
/* Tokens.  */
#define tInt 258
#define tPo 259
#define tPf 260
#define tAo 261
#define tAf 262
#define tPV 263
#define tIf 264
#define tWhile 265
#define tPrint 266
#define tEquEqu 267
#define tAnd 268
#define tPlus 269
#define tMoins 270
#define tMul 271
#define tDiv 272
#define tVir 273
#define tEqu 274
#define tElse 275
#define tOr 276
#define tConst 277
#define tReturn 278
#define tInf 279
#define tSup 280
#define tInfE 281
#define tSupE 282
#define tAddr 283
#define tNULL 284
#define tId 285
#define tMain 286
#define tNb 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 7 "file.yacc" /* yacc.c:1909  */
 	int nb;
		char * str;
	

#line 123 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
