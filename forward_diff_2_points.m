function [d1] = forward_diff_2_points(f, x, h)
	d1 = (f(x+h)-f(x))./h;
end