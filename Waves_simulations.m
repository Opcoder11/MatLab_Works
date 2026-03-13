% MATLAB script to plot solutions of the damped oscillator

% Define time vector
t = linspace(0, 10, 1000);

% Parameters
A = 1;              % Amplitude
gamma = 0.5;        % Damping coefficient
omega_0 = 2;        % Natural frequency
alpha = 0;          % Phase angle

% Condition (a): Underdamped (oscillatory decay)
% ω^2 > ω0^2 - γ^2/4
omega_d = sqrt(omega_0^2 - (gamma^2)/4); % Damped frequency
x_a = A * exp(-gamma * t / 2) .* cos(omega_d * t + alpha);

% Condition (b): Overdamped (two exponential decays)
% ω^2 < ω0^2 - γ^2/4
r1 = -gamma/2 + sqrt((gamma/2)^2 - omega_0^2);
r2 = -gamma/2 - sqrt((gamma/2)^2 - omega_0^2);
x_b = A * exp(r1 * t) + A * exp(r2 * t);

% Condition (c): Critically damped
% ω^2 = ω0^2 - γ^2/4
x_c = (A + A * t) .* exp(-gamma * t / 2);

% Plotting
figure;

subplot(3,1,1);
plot(t, x_a, 'b');
title('Condition (a): Underdamped (\omega^2 > \omega_0^2 - \gamma^2/4)');
xlabel('Time t');
ylabel('x(t)');
grid on;

subplot(3,1,2);
plot(t, x_b, 'r');
title('Condition (b): Overdamped (\omega^2 < \omega_0^2 - \gamma^2/4)');
xlabel('Time t');
ylabel('x(t)');
grid on;

subplot(3,1,3);
plot(t, x_c, 'g');
title('Condition (c): Critically damped (\omega^2 = \omega_0^2 - \gamma^2/4)');
xlabel('Time t');
ylabel('x(t)');
grid on;

sgtitle('Damped Oscillator Solutions under Different Conditions');
