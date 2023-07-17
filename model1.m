v0 = optimvar('v0','LowerBound',0, 'UpperBound',1000);
v1 = optimvar('v1','LowerBound',0,'UpperBound',800);
v2 = optimvar('v2','LowerBound',0,'UpperBound',1000);
v3 = optimvar('v3','LowerBound',-100,'UpperBound', 800);
v4 = optimvar('v4','LowerBound',-1000,'UpperBound',1000);
v5 = optimvar('v5','LowerBound',-1000,'UpperBound',100);
v6 = optimvar('v6','LowerBound',0, 'UpperBound',700);
v7 = optimvar('v7','LowerBound',-170,'UpperBound',500);
v8 = optimvar('v8','LowerBound',-1000,'UpperBound',300);
v9 = optimvar('v9','LowerBound',0,'UpperBound',1000);
vsink = optimvar('vsink','LowerBound',0,'UpperBound',Inf);

linprob = optimproblem('ObjectiveSense', 'maximize');
linprob.Objective = v1+v5+v6+v7+v9;

linprob.Constraints.econs1 = v0 - v1 == 0;
linprob.Constraints.econs2 = v1 - v2 == 0;
linprob.Constraints.econs3 = v2 - v3 == 0;
linprob.Constraints.econs1 = v2 + v3 - v4 - v5 == 0;
linprob.Constraints.econs2 = v4 - v9 == 0;
linprob.Constraints.econs3 = v5 - v6 + v9 == 0;
linprob.Constraints.econs4 = v6 - v7 == 0;
linprob.Constraints.econs5 = v7 - v8 == 0;
linprob.Constraints.econs6 = v8 - vsink == 0;


linsol = solve(linprob);