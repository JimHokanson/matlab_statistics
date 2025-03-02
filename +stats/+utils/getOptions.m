function s = getOptions(s,input_cell)
%
%   Override options in s with those from the optional inputs
%
%   s = stats.utils.getOptions(s,input_cell)
%
%   Inputs
%   ------
%   s : 
%   input_cell : 

for i = 1:2:length(input_cell)
    if isfield(s,input_cell{i})
        name = input_cell{i};
        s.(name) = input_cell{i+1};
    end
end

end