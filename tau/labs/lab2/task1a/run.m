clc;
clear all;
close all;

XMAX = 3;                   % размер сетки рисования
STEP = 0.01;                 % шаг сетки
TMAX = 3;                  % время моделирования

[x1, x2] = meshgrid(-XMAX: STEP: XMAX);

tic; % остановка  и запуск секундомера
dx = @(t, x) moi_variant(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.005);
plotLocus(x1, x2, @moi_variant, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, @moi_variant); % строим стрелочки

toc;  % остановка секундомера



%% определение пользовательских функций

function dxdt = moi_variant(t, x)
% функция, возвращающая градиент 
% в ней необходимо задать уравнения системы
%𝑥̈ − (𝑥̇ − 𝑥 − 1)^3 = 0
dxdt(1, :) = x(2, :);
dxdt(2, :) = power(x(2, :) - x(1, :)- 1, 3); 
end


