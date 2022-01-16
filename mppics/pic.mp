input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[oneside]{book}
\usepackage{../kusochek+}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;
%filenametemplate "%j-%1c.svg";
outputformat := "eps";


beginfig(100) 
save u,p;
path p[];
u:=1.4cm;

z.o=origin;
z.r=(0,1)*u;
z.z=(-5,0)*u;

p0=circle(z.o,z.r);
z.big=point .85 of p0;
z.bbig=z.z+(abs(z.big-z.z),0);
z.small=point 1.2 of p0;
z.bsmall=z.z+(abs(z.small-z.z),0);

draw p0;
draw ddline(-z.r,z.r)(.2,.2);
draw ddarc(z.big, z.bbig, z.big yscaled -1)(5,5);
draw ddarc(z.small, z.bsmall, z.small yscaled -1)(5,5);

dOt z.o;

label.ulft(btex $\RR^{m-2}$ etex rotated 90, z.r);
label.rt(btex $p$ etex, z.o);
label.rt(btex $s_{ij}=-h$ etex rotated 90, z.bbig);
label.lft(btex $s_{ij}=h$ etex rotated 90, z.bsmall);

endfig;


end
