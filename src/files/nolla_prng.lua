local NollaPrng = {}
NollaPrng.__index = NollaPrng

function NollaPrng.new(seed)
    local self = {}
    setmetatable(self, NollaPrng)

    self.seed = seed

    print("NollaPrng", self.seed)
    return self
end

function NollaPrng:next()
    local hi = math.floor(self.seed / 127773.0)
    local lo = self.seed  % 127773
    
    self.seed = 16807 * lo - 2836 * hi
    if self.seed  <= 0 then
        self.seed = self.seed + 2147483647
    end
    print("next", self.seed)
    return self.seed
end

return NollaPrng
