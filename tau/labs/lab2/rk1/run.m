clc;
clear all;
close all;

XMAX = 10;                   % размер сетки рисования
STEP = 0.5;                 % шаг сетки
TMAX = 5;                  % время моделирования

[x1, x2] = meshgrid(-XMAX: STEP: XMAX);

tic; % остановка  и запуск секундомера
dx = @(t, x) moi_variant(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+(STEP/5));
plotLocus(x1, x2, @moi_variant, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, @moi_variant); % строим стрелочки

toc;  % остановка секундомера



%% определение пользовательских функций

function dxdt = moi_variant(t, x)
% функция, возвращающая градиент 
% в ней необходимо задать уравнения системы
%𝑥¨− 𝑥˙ 4𝑥 − 𝑥˙= 0
dxdt(1, :) = power(x(2, :), 2)+3 * x(2, :);
dxdt(2, :) = power(x(1, :), 2) - x(1, :) * x(2, :)+6 * x(2, :); 
end


