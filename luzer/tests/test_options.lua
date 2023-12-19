local luzer = require("luzer")

local args = {
    "-max_len=1024",
    "-print_pcs=1",
    "-max_total_time=60",
    "-print_final_stats=1",
    "./corpus/"
}

for i = 1, #args do
    arg[#arg + 1] = args[i]
end

luzer.Fuzz(function() end, nil, arg)
