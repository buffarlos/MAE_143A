% Numerical Renaissance codebase, Appendix B, https://github.com/tbewley/NR
% Copyright 2022 by Thomas Bewley, distributed under BSD 3-Clause License. 

disp('Set up the Diophantine problem (solve a*x1+b*y1=f1 for x1 and y1) in NR Example 19.9')
b=RR_PolyConv([1 2],[1 -2],[1 4],[1 -4]), a=RR_PolyConv([1 1],[1 -1],[1 3],[1 -3],[1 5],[1 -5]), f1=RR_PolyConv([1 1],[1 1],[1 3],[1 3],[1 5],[1 5])
[x1,y1] = RR_Diophantine(a,b,f1)
test1=RR_PolyAdd(RR_PolyConv(a,x1),RR_PolyConv(b,y1)); residual1=norm(RR_PolyAdd(f1,-test1))
fprintf('Note that the solution {x1,y1} is improper, but solves a*x1+b*y1=f1, with ~ zero residual\n\n')

disp('Modify f and try again (solve a*x2+b*y2=f2 for x2 and y2).')
f2=[1 318 43027 3213544 143646499 3896890390 62421419725 563023442500 2893514687500 8500875000000 13799218750000 11203125000000 3515625000000]
% Oh bruh, RR_PolyConv does not have the necessary arguments to accomodate
% P = 6, so I manually expanded f2.
[x2,y2] = RR_Diophantine(a,b,f2)
test2=RR_PolyAdd(RR_PolyConv(a,x2),RR_PolyConv(b,y2)); residual2=norm(RR_PolyAdd(f2,-test2))
fprintf('Note that the solution {x2,y2} is proper, and solves a*x2+b*y2=f2\n\n')