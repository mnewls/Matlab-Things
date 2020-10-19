function nxt_hr = nexthour(current)
    if( current <= 11)
        nxt_hr = current +1;
    elseif( current == 12)
        nxt_hr = 1;
    else
        nxt_hr = 'invalid';
    end
end
