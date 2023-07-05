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

beginfig(25)
save u,k,d,e;
u:=2cm;
k:=.2;
d:=.8;
e:=.3;


z.O=origin;
z.R=(0,1)*u;
z.A=sqrt(1-k**2)*z.R;

save p;
path p[];

p0=circle(z.O,z.R);
p1=p0 scaled (sqrt(1-d**2)) shifted (sqrt(1-k**2)*d*z.R/k);
p2=p0 scaled (sqrt(1-e**2)) shifted (sqrt(1-k**2)*e*z.R/k);

z.tan=support(p1,z.O);
z.tane=support(p2,z.O);
 
save T;
transform T[];

T1= identity yscaled k;

z.C=(p0 yscaled sqrt(1-k**2)) intersectionpoint (p2 transformed T1);
z.D=(p0 yscaled sqrt(1-k**2)) intersectionpoint (p1 transformed T1);

p10=p0 cutafter (p1 transformed T1) cutbefore (p1 transformed T1);

z.shift = (z.O transformed T1);

draw p10;
draw p10  yscaled -1 shifted (2*sqrt(1-k**2)*d*z.R);

draw (p1 transformed T1) cutbefore p0 cutafter (p0 scaled .999) dashed evenly;
draw subpath (1,4) of (p1 transformed T1) cutbefore (p0 scaled .999);
draw subpath (0,1) of(p1 transformed T1) cutafter (p0 scaled .999);

%dOt ((z.tan reflectedabout (z.O,z.R)) transformed T1), -(point 0 of p10);
 
label(btex $L$ etex, sqrt(1-k**2)*d*z.R);
label.bot(btex $D$ etex, sqrt(1-k**2)*d*z.R+(0,.45)*u);
label.top(btex $D'$ etex, sqrt(1-k**2)*d*z.R+(0,-.45)*u);
endfig;


beginfig(50) 
save u,p;
path p[];
u:=1cm;

z.p=origin;
z.q=(0,-5)*u;

p1=circle(z.p, 1*u) rotated 90;
p2=circle(z.p,1.4*u) rotated 90;

p11=circle(z.q, abs(z.p-z.q)-.7*u);
p12=circle(z.q, abs(z.p-z.q)-.3*u);
p13=circle(z.q, abs(z.p-z.q)+.3*u);
p14=circle(z.q, abs(z.p-z.q)+.7*u);

p31=(subpath (2,4) of p1) cutafter p13 cutbefore p12;
p41=(subpath (0,2) of p1) cutafter p12 cutbefore p13;
p312=p12 cutafter p1 cutbefore p1;
p313=p13 cutafter p1 cutbefore p1;
p100=(reverse p31)--(p312)--(reverse p41)--(reverse p313)--cycle;

p32=(subpath (2,4) of p2) cutafter p14 cutbefore p11;
p42=(subpath (0,2) of p2) cutafter p11 cutbefore p14;
p311=p11 cutafter p2 cutbefore p2;
p314=p14 cutafter p2 cutbefore p2;
p200=(reverse p32)--(p311)--(reverse p42)--(reverse p314)--cycle;


p50=(-2,-1.5)*u--(2,-1.5)*u--(2,1.5)*u--(-2,1.5)*u--cycle;

draw p1 dashed evenly;
draw p2 dashed evenly;

draw p11 dashed evenly;
draw p12 dashed evenly;
draw p13 dashed evenly;
draw p14 dashed evenly;

hatchfill p100  withcolor (87, 2mm, -.5bp);
hatchfill p200--p50--cycle withcolor (17, 2mm, -.5bp);

draw p100;
draw p200;

clip currentpicture to p50;

whitelabel(btex $\phi_n=1$ etex, z.p);
whitelabel(btex $\phi_n=0$ etex, z.p+(0,-1.1)*u);

endfig;


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
label.rt(btex $s_{ij}=-w$ etex rotated 90, z.bbig);
label.lft(btex $s_{ij}=w$ etex rotated 90, z.bsmall);

endfig;

beginfig(200) 
save u,p;
path p[];
u:=1.4cm;

z.x=origin;
z.yy= (1,0)*u rotated 35;
z.y=.3*z.yy;
z.l=z.yy rotated 10;
z.r=z.l reflectedabout(z.x, z.y);

p0=circle(z.x,z.yy-z.x) rotated angle(z.y) cutbefore z.l cutafter z.r;

draw p0;
draw circle(.85*z.yy,.1*z.yy);
draw ddline(z.y,z.l)(0,.4);
draw ddline(z.y,z.r)(0,.4);

hatchfill p0--z.y--cycle  withcolor (87, 2mm, -.5bp);

dOt z.x,z.y;

label(btex $C$ etex, 1.2*z.yy);
label(btex $\T_x$ etex, (1.2*z.yy) xscaled -1);
whitelabel.bot(btex $\tilde y$ etex, z.y);
whitelabel.llft(btex $0$ etex, z.x);
endfig;


end
