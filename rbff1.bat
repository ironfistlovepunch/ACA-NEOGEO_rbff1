REM SROM
copy 34C0CB 095-s1.s1
copy /b 095-s1.s1+

REM MROM PROM
romcutter 221C68 095-m1.m1 0 20000

romcutter 221C68 095-p1.p1 20000 100000
romcutter 221C68 095-p2.sp2 120000 200000
romcutter 221C68 095-epr.ep1 20000 80000

REM PROM
REM romcutter 22F4A7 095-p1.p1 0 100000
REM romcutter 22F4A7 095-p2.sp2 100000 200000
REM romcutter 22F4A7 095-epr.ep1 0 80000

REM VROM
set vrom=12136D4
romcutter %vrom% 069-v1.v1 0 400000
romcutter %vrom% 069-v2.v2 400000 400000
romcutter %vrom% 095-v3.v3 800000 400000

REM CROM
copy /b 366C08+71B3B4+B25FF8+EAEB00 crom
romcutter crom c1c2 0 800000
romcutter crom c3c4 800000 800000
romcutter crom c5c6 1000000 800000
romcutter crom c7c8 1800000 400000

BSwap.exe d B c1c2 oddeven.txt 069-c1.c1 069-c2.c2

BSwap.exe d B c3c4 oddeven.txt 069-c3.c3 069-c4.c4
BSwap.exe d B c5c6 oddeven.txt 095-c5.c5 095-c6.c6
BSwap.exe d B c7c8 oddeven.txt 095-c7.c7 095-c8.c8

REM delete
del c1c2 c3c4 c5c6 c7c8
del crom

REM forcecrc
copy 095-p1.p1 095-p1_bak.p1
py forcecrc32.py 095-p1.p1 144 63b4d8ae

