local tab = {}
for y=1,8 do
    for x=1,8 do
        tab[#tab + 1] = x % 2 == y % 2 and '#' or '.'
    end
    tab[#tab+1] = '\n'
end
print(table.concat(tab,""))