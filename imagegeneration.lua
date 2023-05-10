require "bitmap.lua"

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