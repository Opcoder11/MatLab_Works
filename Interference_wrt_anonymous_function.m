% Script to plot 1d and 2d plot for interference pattern

% Using Anonymous Function

% User input

   % Electric field max
    E_01 = 10; % (in V/m)
    E_02 = 20; % (in V/m)
   % Wave Number
    k = pi/4; %(in m^-1)
   % Phase difference
    phi_1 = pi/3;
    phi_2 = pi/4;
   % Electric field 
    E_1 = @(r)E_01 * cos(k*r + phi_1);
    E_2 = @(r)E_02 * cos(k*r +phi_2);
   % Superposed Electric field
    E = @(r)E_1(r).^2 + E_2(r).^2 + 2*E_1(r).*E_2(r);
   % Intensity
    I = @(r) abs(E(r)).^2;

% r values Distance of field point
r_values = linspace(0,25,1000);

% Computed Electric field and Intensity
E_values = E(r_values);
I_values = I(r_values);


% 1D plot for Electric field and Intensity as a function of r
figure(1),clf
subplot(2,1,1)
plot(r_values,E_values,'w');
title('Electric field vs r')
xlabel('r(in m)');
ylabel('E(in V/m)');
grid on;

subplot(2,1,2)
plot(r_values,I_values,'r');
title('Intensity vs r');
xlabel('r(in m)');
ylabel('I(in W/m^2)');
grid on;

% 2D plot of Electric field and Intensity vs r
[x_values,y_values] = meshgrid(linspace(-5,5,1000),linspace(-5,5,1000));

z_values = sqrt(x_values.^2 + y_values.^2);

% Electric Field and Intensity 2D
E_2d = E(z_values);
I_2d = I(z_values);

% 2D plot 
figure(2)
subplot(1,2,1)
imagesc(E_2d);
title('Electric field vs z_values');
xlabel('z values');
ylabel('E 2d');
colormap('jet');
colorbar

subplot(1,2,2)
imagesc(I_2d);
title('Intensity vs z_values');
xlabel('z values');
ylabel('I 2d');
colormap('jet')
colorbar

% End of script
