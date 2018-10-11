function y = berCompare(x,y)
error = 0;
    for i = 1:1:length(x(:,1))
        if x(i,1) == y(i,1) && x(i,2) == y(i,2)
            continue;
        else
            error = error + 1;
        end
    end
    y = error/i;
end