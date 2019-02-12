--[[

     Awesome-BASL
     Big Ass Screen Layout for Awesome WM

     Licensed under MIT License
      * (c) 2019,      Drew Robbins
--]]

local layout = {}

local function do_basl(p)
    local wa = p.workarea
    local cls = p.clients
    local debug_msg = false

    if #cls > 0 then
        local rows, cols
        
        local rowsy = { 0, math.ceil(wa.height * 0.35) }
        local rowsh = { math.ceil(wa.height * 0.35), math.ceil(wa.height * 0.65) }
        local colsx = { 0, math.ceil(wa.width * 0.25), math.ceil(wa.width * 0.75) }
        local colsw = { math.ceil(wa.width * 0.25), math.ceil(wa.width * 0.5), math.ceil(wa.width * 0.25) }

        local matrix = {
            [1] = { 2, 2 },
            [2] = { 2, 1 },
            [3] = { 2, 3 },
            [4] = { 1, 2 },
            [5] = { 1, 1 },
            [6] = { 1, 3 },
        }
        
        if debug_msg then
            naughty.notify({title="start", text=string.format("cls: %d", #cls)})
        end

        for k, c in ipairs(cls) do
            k = 7 - k
            if k < 1 then 
                k = 1
            end

            local g = {}

            local row, col = matrix[k][1], matrix[k][2]
            g.y = rowsy[row]
            g.x = colsx[col]
            g.height = rowsh[row]
            g.width = colsw[col]

            g.y = g.y + wa.y
            g.x = g.x + wa.x

            if debug_msg then
                naughty.notify({title=string.format("k: %d", k), text=string.format("r: %d, c: %d, y: %d, x: %d, h: %d, w: %d", row, col, g.y, g.x, g.height, g.width)})
            end

            p.geometries[c] = g
        end
    end
end

layout.name = "basl"
function layout.arrange(p)
    return do_basl(p)
end

return layout
