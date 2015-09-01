function e = Binding_energy (g, R, M, s)

[~, e1, ~] = Energy_levels (g, R, M, s);
[~, e2, ~] = Energy_ground_state (g, R, M, s);

e = sort(sum(e2))-sort(sum(e1));

end