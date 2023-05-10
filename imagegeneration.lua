local file = io.open("asdf.ppm", "w")

local WIDTH = 1024;
local HEIGHT = 1024;

function checkeredPattern(arr, x, y)
    arr[#arr + 1] = x % 2 == y % 2 and "255 255 255" or "0 0 0"
    arr[#arr + 1] = " "
end

function loop2d(arr, fun)
    for y = 1, HEIGHT do
        for x = 1, WIDTH do
            fun(arr, x, y)
        end
    end
    return arr
end


local tab = {}
tab[#tab + 1] = "P3\n"
tab[#tab + 1] = WIDTH .. " " .. HEIGHT .. "\n"
tab[#tab + 1] = 255 .. "\n"

loop2d(tab, checkeredPattern)
file:write(table.concat(tab, " "))
file:close()