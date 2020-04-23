function [d1] = central_diff_2_points(f, x, h)
	d1 = (f(x+h) - f(x-h))./(2*h);
end