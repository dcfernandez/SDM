% Functions for getting neighbors in 4D dynamics problem
% By Geoff Gordon and Geoff Hollinger, 2007

% Return the neighbors of a given state.  MAP is the map of the environment
% (an array of 1s and 0s denoting occupied and full cells respectively).
% STATE is a vector describing the current state [X Y DX DY].  NBRS has one
% row per neighbor (i.e., up to 4 rows).  Each row is the same format as
% STATE, and results from applying a feasible action.  If there are no
% feasible actions from STATE, then NBRS == [].

function [nbrs, num_nbrs] = get_neighbors_dynamic(map, stateID)

[x,y,dx,dy] = dynamic_state_from_index(map,stateID);

acts = [0 -1; 1 0; 0 1; -1 0; 0 0];
nbrs = [];
num_nbrs = 0;

for i = 1:size(acts,1)
    ax = acts(i,1);
    ay = acts(i,2);
    %check if we're over the speed limit
    if(dx+ax > map.maxV || dy+ay > map.maxV || dx+ax < 0 || dy+ay < 0)
        continue;
    end
    %check if this path collides with an obstacle or leaves the map
    if (~check_hit(map, x, y, dx+ax, dy+ay))
        nbrs = [nbrs; dynamic_index_from_state(map,x+dx+ax,y+dy+ay,dx+ax,dy+ay)];
        num_nbrs = num_nbrs + 1;
    end
end

return




