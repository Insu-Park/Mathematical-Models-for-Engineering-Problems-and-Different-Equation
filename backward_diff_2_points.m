function [d1] = backward_diff_2_points(f, x, h)
	d1 = (f(x)-f(x-h))./h;
end