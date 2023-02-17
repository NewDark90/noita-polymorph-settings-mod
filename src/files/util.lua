
local function copy_arr(arr)
    local result = {}
    for k, v in pairs(arr) do 
        result[k] = v 
    end
    return result
end

return {
    copy_arr = copy_arr
}