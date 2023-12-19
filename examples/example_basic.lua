local luzer = require("luzer")

local function TestOneInput(buf)
    local fdp = luzer.FuzzedDataProvider(buf)
    local str = fdp:consume_string(4)

    local b = {}
    str:gsub(".", function(c) table.insert(b, c) end)
    local count = 0
    if b[1] == "o" then count = count + 1 end
    if b[2] == "o" then count = count + 1 end
    if b[3] == "p" then count = count + 1 end
    if b[4] == "s" then count = count + 1 end

    if count == 4 then assert(nil) end
end

local args = {
    "-only_ascii=1",
    "-print_pcs=1",
}

for i = 1, #args do
    arg[#arg + 1] = args[i]
end

luzer.Fuzz(TestOneInput, nil, arg)
