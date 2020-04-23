function [d1] = central_diff_4_points(f, x, h)
    d1 = (f(x-2*h) - 8*f(x-h) + 8*f(x+h) - f(x+2*h))./(12*h);
end