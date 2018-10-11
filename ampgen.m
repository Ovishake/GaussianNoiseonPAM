function [y] = ampgen(input)
    M = input; 
    k = sqrt(M);
    d = k - 1;
    dneg = 0 - d;
    vec = [];
    for i = dneg:2:d
        vec = [vec,i];
    end
%     vec
    cartestian = [];
    k = 1;
    for i = 1:1:length(vec)
        for j = 1:1:length(vec)
            cartesian(k) = complex(vec(i),vec(j));
            k = k+1;
        end
    end
    cartesian = cartesian.';
    y = cartesian;
end