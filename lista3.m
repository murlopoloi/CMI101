%lista 3 modelos matematicos em financas
% Murilo S. de O. Poloi

#X = qp([0;0;0], 2*Q, [], [1 1 1], 1, [0;0;0], [])
#[X, OBJ, INFO, LAMBDA] = qp (X0, H, Q, A, B, LB, UB)

#Exercicio 1:

%matriz com os indices dos ativos do ex 1
A1 = [24.69	49.46	24.8	48.56	-9.99	21.53	9.89	33.43	16.26	5.81;
9.46	15.49	12.67	49.12	-18.01	1.8	17.11	4.02	28.93	8.87;
14.8	8.32	7.44	17.5	15.87	12.41	11.12	11.12	5.51	0.41;
8.41	8.05	10.81	13.23	14.00	9.95	6.42	5.97	2.76	0.38;
14.3	2.61	11.4	7.13	23.37	15.2	10.73	12.03	6.69	-2.2;
26.88	-10.02	14.54	8.88	24.81	12.39	13.06	22.95	6.41	-1.56];

%tranformar porcentagem em numero
A1 = A1./1e2;

%calculo da matriz de covariancia do ex 1
cov_matrix_A1 = cov(transpose(A1(:,:)));

%tamanho da matriz de covariancia
n1 = size(cov_matrix_A1,1);

#letra a):

%resolucao do problema de otimizacao da letra a
Xa1 = qp([zeros(1,n1)], 2*cov_matrix_A1, [], ones(1,n1), 1, zeros(n1,1), []);
display(Xa1);

#letra b):

%resolucao do problema de otimizacao da letra b
Xb1 = qp([zeros(1,n1)], 2*cov_matrix_A1, [], ones(1,n1), 1, [], []);
display(Xb1);



#Exercício 2:

%matriz com os indices dos ativos do ex 2
A2 = [24.69	49.46	24.8	48.56	-9.99	21.53	9.89	33.43	16.26	5.81;
9.46	15.49	12.67	49.12	-18.01	1.8	17.11	4.02	28.93	8.87;
14.8	8.32	7.44	17.5	15.87	12.41	11.12	11.12	5.51	0.41;
8.41	8.05	10.81	13.23	14.00	9.95	6.42	5.97	2.76	0.38;
14.3	2.61	11.4	7.13	23.37	15.2	10.73	12.03	6.69	-2.2;
26.88	-10.02	14.54	8.88	24.81	12.39	13.06	22.95	6.41	-1.56;
7.4	-15.5	-2.91	-13.31	38.93	26.86	15.03	31.58	2.92	-2.07];

%transformar porcentagem em numero
A2 = A2./1e2;

%matriz de covariancia ex 2
cov_matrix_A2 = cov(transpose(A2(:,:)));

%tamanho da matriz de covariancia do ex 2
n2 = size(cov_matrix_A2,1);

#letra a):

%resolucao do problema de otimizacao da letra a
Xa2 = qp([zeros(n2,1)], 2*cov_matrix_A2, [], ones(1,n2), 1, zeros(n2,1), []);
display(Xa2);

#letra b):

%resolucao do problema de otimizacao da letra b
Xb2 = qp([zeros(n2,1)], 2*cov_matrix_A2, [], ones(1,n2), 1, [], []);
display(Xb2);


#calculando o retorno médio e risco de cada ativo:

%retorno medio ex 1
ret_med_A1 = mean(transpose(A1(:,:)));

%retorno medio ex 2
ret_med_A2 = mean(transpose(A2(:,:)));

%risco ex 1
risco_A1 = std(transpose(A1(:,:)));

%risco ex 2
risco_A2 = std(transpose(A2(:,:)));

#plots requeridos

%plot ex 1
scatter(ret_med_A1,risco_A1)
xlabel ('Retorno médio ex. 1');
ylabel ('Risco ex. 1');
pause

%plot ex 2
scatter(ret_med_A2,risco_A2)
xlabel ('Retorno médio ex. 2');
ylabel ('Risco ex. 2');




