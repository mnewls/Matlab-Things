function final = rotleft(vec)

new_last = vec(1);
new_first = vec(2:end);
final = [new_first, new_last];

end