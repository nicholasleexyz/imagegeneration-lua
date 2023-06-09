function Bitmap(width, height)
    local b = {}
    for y = 1, height do
        b[y] = {}
        for x = 1, width do
            b[y][x] = {0,0,0}
        end
    end
    return b
end

-- -- helper function, simulates PHP's array_fill function
-- local array_fill = function(vbegin, vend, value)
--     local t = {}
--     for i = vbegin, vend do
--         t[i] = value
--     end
--     return t
-- end

-- Bitmap = {}
-- Bitmap.__index = Bitmap

-- function Bitmap.new(width, height)
--     local self = {}
--     setmetatable(self, Bitmap)
--     local white = array_fill(0, width, {255, 255, 255})
--     self.data = array_fill(0, height, white)
--     self.width = width
--     self.height = height
--     return self
-- end

-- function Bitmap:writeRawPixel(file, c)
--     local dt
--     dt = string.format("%c", c)
--     file:write(dt)
-- end

-- function Bitmap:writeComment(fh, ...)
--     local strings = {...}
--     local str = ""
--     local result
--     for _, s in pairs(strings) do
--         str = str .. tostring(s)
--     end
--     result = string.format("# %s\n", str)
--     fh:write(result)
-- end

-- function Bitmap:writeP6(filename)
--     local fh = io.open(filename, 'w')
--     if not fh then
--         error(string.format("failed to open %q for writing", filename))
--     else
--         -- fh:write(string.format("P6 %d %d 255\n", self.width, self.height))
--         fh:write(string.format("P3 %d %d 255\n", self.width, self.height))
--         -- self:writeComment(fh, "automatically generated at ", os.date())
--         for _, row in pairs(self.data) do
--             for _, pixel in pairs(row) do
--                 self:writeRawPixel(fh, pixel[1])
--                 self:writeRawPixel(fh, pixel[2])
--                 self:writeRawPixel(fh, pixel[3])
--             end
--         end
--     end
-- end

-- -- function Bitmap:fill(x, y, width, height, color)
-- --     width = (width == nil) and self.width or width
-- --     height = (height == nil) and self.height or height
-- --     width = width + x
-- --     height = height + y
-- --     for i = y, height do
-- --         for j = x, width do
-- --             self:setPixel(j, i, color)
-- --         end
-- --     end
-- -- end

-- function Bitmap:setPixel(x, y, color)
--     if x >= self.width then
--         -- error("x is bigger than self.width!")
--         return false
--     elseif x < 0 then
--         -- error("x is smaller than 0!")
--         return false
--     elseif y >= self.height then
--         -- error("y is bigger than self.height!")
--         return false
--     elseif y < 0 then
--         -- error("y is smaller than 0!")
--         return false
--     end
--     self.data[y][x] = color
--     return true
-- end
