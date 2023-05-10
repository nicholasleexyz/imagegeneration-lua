-- helper function, simulates PHP's array_fill function
local array_fill = function(vbegin, vend, value)
    local t = {}
    for i = vbegin, vend do
        t[i] = value
    end
    return t
end

Bitmap = {}
Bitmap.__index = Bitmap

function Bitmap.new(width, height)
    local self = {}
    setmetatable(self, Bitmap)
    local white = array_fill(0, width, {255, 255, 255})
    self.data = array_fill(0, height, white)
    self.width = width
    self.height = height
    return self
end

function Bitmap:writeRawPixel(file, c)
    local dt
    dt = string.format("%c", c)
    file:write(dt)
end

function Bitmap:writeComment(fh, ...)
    local strings = {...}
    local str = ""
    local result
    for _, s in pairs(strings) do
        str = str .. tostring(s)
    end
    result = string.format("# %s\n", str)
    fh:write(result)
end

function Bitmap:writeP6(filename)
    local fh = io.open(filename, 'w')
    if not fh then
        error(string.format("failed to open %q for writing", filename))
    else
        fh:write(string.format("P6 %d %d 255\n", self.width, self.height))
        self:writeComment(fh, "automatically generated at ", os.date())
        for _, row in pairs(self.data) do
            for _, pixel in pairs(row) do
                self:writeRawPixel(fh, pixel[1])
                self:writeRawPixel(fh, pixel[2])
                self:writeRawPixel(fh, pixel[3])
            end
        end
    end
end

function Bitmap:fill(x, y, width, height, color)
    width = (width == nil) and self.width or width
    height = (height == nil) and self.height or height
    width = width + x
    height = height + y
    for i = y, height do
        for j = x, width do
            self:setPixel(j, i, color)
        end
    end
end

function Bitmap:setPixel(x, y, color)
    if x >= self.width then
        -- error("x is bigger than self.width!")
        return false
    elseif x < 0 then
        -- error("x is smaller than 0!")
        return false
    elseif y >= self.height then
        -- error("y is bigger than self.height!")
        return false
    elseif y < 0 then
        -- error("y is smaller than 0!")
        return false
    end
    self.data[y][x] = color
    return true
end

function example_colorful_stripes()
    local w = 260 * 2
    local h = 260 * 2
    local b = Bitmap.new(w, h)
    -- b:fill(2, 2, 18, 18, {240,240,240})
    b:setPixel(0, 15, {255, 68, 0})
    for i = 1, w do
        for j = 1, h do
            b:setPixel(i, j, {(i + j * 8) % 256, (j + (255 * i)) % 256, (i * j) % 256});
        end
    end
    return b
end

example_colorful_stripes():writeP6('p6.ppm')

-- local file = io.open("asdf.ppm", "w")

-- local WIDTH = 1024;
-- local HEIGHT = 1024;

-- function checkeredPattern(arr, x, y)
--     arr[#arr + 1] = x % 2 == y % 2 and "255 255 255" or "0 0 0"
--     arr[#arr + 1] = " "
-- end

-- function wanderingdrunkard(arr)
--     local drunkards = 1
--     local steps = WIDTH

--     local xCoord = math.random(255)
--     local yCoord = math.random(255)
--     local current = {xCoord, yCoord}

--     for i = 1, steps do
--         local direction = math.random(4)
--         if direction == 1 then -- north
--             current[2] = current[2] + 1 or current[2]
--         elseif direction == 2 then -- east
--             current[1] = current[1] + 1 or current[1]
--         elseif direction == 3 then -- south
--             current[2] = current[2] - 1 or current[2]
--         elseif direction == 4 then -- west
--             current[1] = current[1] - 1 or current[1]
--         end
--         setpixel(arr, current[1], current[2], "0")
--     end
-- end

-- function setpixel(arr, x, y, val)
--     arr[(x % WIDTH) + 1 + y * HEIGHT] = val
-- end

-- local tab = {}
-- tab[#tab + 1] = "P3\n"
-- tab[#tab + 1] = WIDTH .. " " .. HEIGHT .. "\n"
-- tab[#tab + 1] = 255 .. "\n"
-- -- loop2d(tab, checkeredPattern)
-- for y = 1, HEIGHT do
--     for x = 1, WIDTH do
--         tab[#tab + 1] = "255"
--         tab[#tab + 1] = "255"
--         tab[#tab + 1] = "255"
--     end
-- end

-- wanderingdrunkard(tab)
-- file:write(table.concat(tab, " "))
-- file:close()
