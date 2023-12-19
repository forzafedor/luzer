local luzer = require("luzer")

local function TestOneInput(buf)
    local fdp = luzer.FuzzedDataProvider(buf)
    local str = fdp:consume_string(1)
    if str == "c" then
		assert(nil, "assert has triggered")
    end
    return
end

local opts = {
    "-max_len=4096",
}

for i = 1, #opts do
  arg[#arg + 1] = opts[i]
end

luzer.Fuzz(TestOneInput, nil, arg)
