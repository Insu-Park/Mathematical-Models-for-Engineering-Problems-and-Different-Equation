function [d1] = backward_diff_3_points(f, x, h)
	d1 = (f(x-2*h) - 4*f(x-h) + 3*f(x))./(2*h);
end