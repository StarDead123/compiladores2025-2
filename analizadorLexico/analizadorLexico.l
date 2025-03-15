%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TAMP 10 //tamaño máximo para recorrer los caracteres que componen a cada componente léxico
FILE *resultado_analisis_lexico, *archivo_a_analizar;
char pr[][TAMP] = {"Bool","Cade","Continuar","Devo","Ent",
                   "Fals","Flota","Global","Haz","Mientras",
                   "Nulo","Para","Parar","Si","Sino","Ver"};
char opari[][TAMP] = {"sum","rest","mult","div","mod","inc",
                      "dec","exp","dive"};
char opasi[][TAMP] = {"->","+->","-->","*->","/->","%->",
                      ">>","<<","^->","&->"};
char se[][TAMP] = {"<",">","<<",">>#","#","#!","*","|","°"};
char oprel[][TAMP] = {"h","m","e","c","he","me"};
%}
espacio [ ]
tab \t
nuevaL \n
delimitador ({espacio}|{tab}|{nuevaL})+
letM [A-Z]
letm [a-z]
leta [áéíóúñ]
letA [ÁÉÍÓÚÑ]
dig [0-9]
identificador @({letM}|{letm}|{leta}|{letA}|{dig})+_
entero (\+|-)?({dig})+([gp])?
real ({dig})+(('{dig}+)|[rR])
cadena (--)(.)*(--)
comentario \[(.)*\]
pr0 Bool
pr1 Cade
pr2 Continuar
pr3 Devo
pr4 Ent
pr5 Fals
pr6 Flota
pr7 Global
pr8 Haz
pr9 Mientras
pr10 Nulo
pr11 Para
pr12 Parar
pr13 Si
pr14 Sino
pr15 Ver
pr ({pr0}|{pr1}|{pr2}|{pr3}|{pr4}|{pr5}|{pr6}|{pr7}|{pr8}|{pr9}|{pr10}|{pr11}|{pr12}|{pr13}|{pr14}|{pr15})
opari0 sum
opari1 rest
opari2 mult
opari3 div
opari4 mod
opari5 inc
opari6 dec
opari7 exp
opari8 dive
opari ({opari0}|{opari1}|{opari2}|{opari3}|{opari4}|{opari5}|{opari6}|{opari7}|{opari8})
opasi0 ->
opasi1 \+->
opasi2 -->
opasi3 \*->
opasi4 \/->
opasi5 %->
opasi6 >>
opasi7 <<
opasi8 \^->
opasi9 &->
opasi ({opasi0}|{opasi1}|{opasi2}|{opasi3}|{opasi4}|{opasi5}|{opasi6}|{opasi7}|{opasi8}|{opasi9})
se0 <
se1 >
se2 <<
se3 >>#
se4 #
se5 #!
se6 \*
se7 \|
se8 °
se ({se0}|{se1}|{se2}|{se3}|{se4}|{se5}|{se6}|{se7}|{se8})
oprel0 h
oprel1 m
oprel2 e
oprel3 c
oprel4 he
oprel5 me
oprel ({oprel0}|{oprel1}|{oprel2}|{oprel3}|{oprel4}|{oprel5})
error (.)
%%

{identificador} printf("MENCIÓN ENCONTRADA: %s\n", yytext);
{pr} printf("PR ENCONTRADA: %s\n", yytext);
{opari} printf("OPARI ENCONTRADA: %s\n", yytext);
{opasi} printf("OPASI ENCONTRADA: %s\n", yytext);
{se} printf("SE ENCONTRADA: %s\n", yytext);
{oprel} printf("oprel ENCONTRADA: %s\n", yytext);
{real} printf("real ENCONTRADA: %s\n", yytext);
{entero} printf("entero ENCONTRADA: %s\n", yytext);
{cadena} printf("cadena ENCONTRADA: %s\n", yytext);
{comentario} printf("comentario ENCONTRADA: %s\n", yytext);
{delimitador} printf("DELIMITADOR ENCONTRADA: %s\n", yytext);
{error} printf("ERROR ENCONTRADA: %s\n", yytext);

%%

int main(int argc, char **argv) 
{
    printf("%i\n",strcmp(opasi[5], "%->"));
    if(argc > 1)
        printf("%s\n",*(argv+1));
    yylex();
    return 0;
}