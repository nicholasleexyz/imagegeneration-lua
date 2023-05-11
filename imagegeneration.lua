require "ppm"

local WIDTH = 256
local HEIGHT = 256

function checkerboard()
    local w = WIDTH
    local h = HEIGHT
    local b = Bitmap(w, h)
    for y = 1, h do
        for x = 1, w do
            b[y][x] = x % 2 == y % 2 and {255, 255, 255} or {0, 0, 0}
        end
    end
    return b
end

function BitmapToPPM(bitmap, f)
    local file = io.open(f, 'w')
    local header = ("P3 %d %d 255\n"):format(WIDTH, HEIGHT)
    file:write(header)
    for y = 1, HEIGHT do
        for x = 1, WIDTH do
            local pixel = bitmap[y][x]
            for i = 1, #pixel do
                file:write(pixel[i])
                file:write(" ")
            end
        end
        file:write(" ")
        file:write(" ")
    end
    io.close()
end

-- function save(data, filename)
--     local file = io.open(filename, 'w')
--     file:write(data)
--     io.close(file)
-- end

BitmapToPPM(checkerboard(), "asdf.ppm")

-- checkerboard():writeP6("checkerboard.txt")
-- function example_colorful_stripes()
--     local w = 260 * 2
--     local h = 260 * 2
--     local b = Bitmap.new(w, h)
--     -- b:fill(2, 2, 18, 18, {240,240,240})
--     b:setPixel(0, 15, {255, 68, 0})
--     for i = 1, w do
--         for j = 1, h do
--             b:setPixel(i, j, {(i + j * 8) % 256, (j + (255 * i)) % 256, (i * j) % 256});
--         end
--     end
--     return b
-- end

-- example_colorful_stripes():writeP6('p6.ppm')
