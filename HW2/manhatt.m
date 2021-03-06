function h = manhatt(map, nodes, epsilon)

rows = sqrt(nodes);
cols = sqrt(nodes);
h = zeros(rows, cols);
for i = 1:nodes
    [X,Y] = state_from_in(map,i);
    h(i) = ((cols - X) + (rows - Y)) * epsilon;
end

return