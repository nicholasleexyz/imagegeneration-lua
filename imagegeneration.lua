local file = io.open("asdf.ppm", "w")
local WIDTH = 256;
local HEIGHT = 256;

local tab = {}
tab[#tab + 1] = "P3\n"
tab[#tab + 1] = WIDTH .. " " .. HEIGHT .. "\n"
tab[#tab + 1] = 255 .. "\n"

for y = 1, HEIGHT do
    for x = 1, WIDTH do
        tab[#tab + 1] = x % 2 == y % 2 and "255 255 255" or "0 0 0"
        tab[#tab + 1] = " " .. " "
        -- tab[#tab + 1] = math.random(255) .. " "
        -- tab[#tab + 1] = math.random(255) .. " "
        -- tab[#tab + 1] = math.random(255) .. " " .. " "
    end
end

file:write(table.concat(tab, ""))
file:close()