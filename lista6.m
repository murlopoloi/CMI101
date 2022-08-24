data = [12.05 25.2 31.67 12.28;
        15.27 2.86 15.82 5.99;
        -4.12 5.45 10.58 2.41;
        1.57 4.56 -14.43 4.48;
        3.16 3.72 31.98 4.41;
        -2.79 10.79 -0.72 4.43;
        -8.97 5.38 -19.64 -6.77;
        -1.18 -2.97 -10 -2.11;
        1.07 1.52 -11.51 3.46;
        12.75 10.75 5.63 6.16;
        7.48 3.79 -4.67 2.47;
        -0.94 1.32 7.94 -1.15];


siz = size(data,1);

#%{
%retornos medios
Ra = sum(data(:,1))/siz;
Rb = sum(data(:,2))/siz;
Rc = sum(data(:,3))/siz;
Rm = sum(data(:,4))/siz;

%variancias
vara = var(data(:,1));
varb = var(data(:,2));
varc = var(data(:,3));
varm = var(data(:,4));

%calculo dos betas
covm = cov(data);

%letra b
betas = [covm(1,4)/covm(4,4) covm(2,4)/covm(4,4) covm(3,4)/covm(4,4) 1];

#sigma_m2 = covm(4,4);

%letra a
alfas = [Ra Rb Rc Rm] - Rm*betas;

%letra b
betas;

% letra c
sigma_ei2 = [];
for i = 1:4
  sigma_ei2 = [sigma_ei2 covm(i,i) - (betas(i)^2)*covm(4,4)];
endfor
desv_padr_res = sqrt(sigma_ei2);

%letra d
%pij = sigmaij/sigmai*sigmaj = betai*betaj*sigma_m2/sigmai*sigmaj
coef_corr = [betas(1)*betas(2)*covm(4,4)/sqrt(vara*varb);
 betas(1)*betas(3)*covm(4,4)/sqrt(vara*varc);
 betas(2)*betas(3)*covm(4,4)/sqrt(varb*varc)]

%letra e
Rm;

%letra f
varm;

#ex 2

#Ai
R_i = alfas + Rm*betas;
var_i = covm(4,4)*(betas.^2) + desv_padr_res.^2;
#Aii
[Ra Rb Rc Rm];
[vara varb varc varm];

#Bi
#sigmaij = betaibetajsigmam_2
[betas(1)*betas(2)*covm(4,4);
 betas(1)*betas(3)*covm(4,4);
 betas(2)*betas(3)*covm(4,4)];
#Bii
[covm(1,2) covm(1,3) covm(2,3)];

#Ci
#Xi = 1/3
alfa_p = sum(alfas./3);
beta_p = sum(betas./3);
Rp = alfa_p + beta_p*Rm;

sum1 = 0;
sum2 = 0;
sum3 = 0;

for i = 1:3
  sum1 += (betas(i).^2)*covm(4,4)/9;
  sum2 += (desv_padr_res(i)^2)/9;
  for j = 1:3
    if j != i
      sum3 =+ betas(i)*betas(j)*covm(4,4)/9;
    endif
  endfor
endfor
desv_padr = sqrt(sum1 + sum2 + sum3);
#Cii

retii = (Ra + Rb + Rc)/3;
desv_padr_ii = sqrt((vara + varb + varc)/9 + 2*(covm(1,2) + covm(1,3) + covm(2,3))/9);

#D
%{
Pela natureza do modelo do índice único
sabemos que a covariancia é calculada entre as ações
e o mercado, enquanto que através de dados históricos calculamos
a covariancia das ações entre si, o que justifica a diferença entre
os valores
%}

#ex 5
retmer = 8; sigmamer = 5;
alfass = [2 3 1 4];
betass = [1.5 1.3 0.8 0.9];
sigmaei = [3 1 2 4];
#a
retmedgeral = alfas + retmer*betas;

#b
varretgeral = 25*(betas.^2) + (sigmaei.^2);

#c
covarretgeral = [];
soma = 0;
for i = 1:4
  for j = i+1:4
    if j != i
      soma += betas(i)*betas(j);
      covarretgeral = [covarretgeral betas(i)*betas(j)*25];
    endif
  endfor
endfor
covarretgeral
soma
#ex 6
#a
betap = sum(betas);
# bp = 4.5*Xp
#b
alfap = sum(alfas);
# ap = 10*Xp
#c

# varp = (Xp^2)*(20.25*25 + 7.43*25 + 100)
# varp = 792*Xp^2

#d
# rp = 32.5*Xp
