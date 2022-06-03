x_data = [-4 -2 0 1 5];
y_data = [-4.12 -8.16 9.14 13.52 6.11];

figure("Name", "2. b) i)")
scatter(x_data, y_data)
hold on
x = -4 : 0.009: 5;
polynomial = 0.0937*x.^4 - 0.3496*x.^3 - 2.0541*x.^2 + 6.6900*x + 9.1400;
plot(x, polynomial)
hold off

%%
x_data2 = [-4 -3.2 -2.9 -1.8 -0.2 0 1.3 1.8 4 4.22 5];
y_data2 = [-4.12 -6.12 -8.15 0.25 -9.12 -2.96 -8.98 1.22 5.86 8.88 6.11];

figure("Name", "2. b) ii)")
scatter(x_data2, y_data2)
hold on
x = -4 : 0.009: 5;
polynomial = -0.0034*x.^10 + 0.0139*x.^9 + 0.1404*x.^8 - 0.4886*x.^7 - 2.1013*x.^6 + 5.4958*x.^5 + 13.1048*x.^4 - 21.4065*x.^3 - 23.6610*x.^2 + 27.0195*x - 2.9600;

plot(x, polynomial)
hold off

%%
x_data3 = [-4 -3.7 -3.2 -3.1 -2.9 -2.6 -1.8 -1 -0.2 0 0.8 1.3 1.8 2.4 3 3.2 3.78 4 4.22 4.66 5];
y_data3 = [-4.12 3.68 -6.12 -10.21 -8.15 5.62 0.25 8.62 -9.12 13.44 -2.96 -3.24 -8.98 1.22 5.86 15.62 8.88 -11.61 -4.76 3.52 6.11];

figure("Name", "2. b) iii)")
scatter(x_data2, y_data2)
hold on
x = -4 : 0.009: 5;
polynomial = - 0.0010*x.^17 + 0.0006*x.^16 + 0.0266*x.^15 - 0.0507*x.^14 - 0.3962*x.^13 + 1.0464*x.^12 + 3.3581*x.^11 - 10.9824*x.^10 - 15.6318*x.^9 + 64.5835*x.^8 + 32.0926*x.^7 - 208.6673*x.^6 + 9.6059*x.^5 + 329.7020*x.^4 - 118.5819*x.^3 - 187.3530*x.^2 + 82.6270*x + 13.4400


plot(x, polynomial)
hold off