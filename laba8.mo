model laba8
parameter Real p_cr = 10.7;//критическая стоимость продукта
parameter Real tau1 = 13;//длительность производственного цикла фирмы 1
parameter Real p1 = 6.2;//себестоимость продукта у фирмы 1
parameter Real tau2 = 20;//длительность производственного цикла фирмы 2
parameter Real p2 = 4.4; //себестоимость продукта у фирмы 2
parameter Real N = 25; //число потребителей производимого продукта
parameter Real q = 1; //максимальная потребность одного человека в продукте в единицу времени

parameter Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
parameter Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
parameter Real b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q);
parameter Real c1 = (p_cr-p1)/(tau1*p1);
parameter Real c2 = (p_cr-p2)/(tau2*p2);

parameter Real d = 0.0011;

Real M1_1(start=4);
Real M2_1(start=3.5);

Real M1_2(start=4);
Real M2_2(start=3.5);

equation
//первый случай
der(M1_1) = M1_1-(b/c1)*M1_1*M2_1-(a1/c1)*M1_1*M1_1;
der(M2_1) = (c2/c1)*M2_1-(b/c1)*M1_1*M2_1-(a2/c1)*M2_1*M2_1;
//второй случай
der(M1_2) = M1_2-(b/c1+d)*M1_2*M2_2-(a1/c1)*M1_2*M1_2;
der(M2_2) = (c2/c1)*M2_2-(b/c1)*M1_2*M2_2-(a2/c1)*M2_2*M2_2;

end laba8;
