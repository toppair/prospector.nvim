local function round(n)
  return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

local function to_hsl(hex)
  local r = tonumber('0x' .. string.sub(hex, 2, 3), 10) / 255
  local g = tonumber('0x' .. string.sub(hex, 4, 5), 10) / 255
  local b = tonumber('0x' .. string.sub(hex, 6, 7), 10) / 255

  local min = math.min(r, g, b)
  local max = math.max(r, g, b)
  local chroma = max - min

  local h
  local s
  local l = (max + min) / 2

  if chroma == 0 then
    h = 0
    s = 0
  else
    s = chroma / (1 - math.abs(2 * l - 1))

    if max == r then
      local seg = (g - b) / chroma
      h = seg + (seg < 0 and 360 / 60 or 0 / 60)
    elseif max == g then
      h = (b - r) / chroma + 120 / 60
    elseif max == b then
      h = (r - g) / chroma + 240 / 60
    end
  end

  h = round(h * 60)
  s = round(s * 100)
  l = round(l * 100)

  return h, s, l
end

local function to_hex(h, s, l)
  l = l / 100
  local a = s * math.min(l, 1 - l) / 100

  local function f(n)
    local k = (n + h / 30) % 12
    local color = l - a * math.max(math.min(k - 3, 9 - k, 1), -1)
    return string.format('%02x', round(255 * color))
  end

  return '#' .. f(0) .. f(8) .. f(4)
end

local function tweak_color(hex, dh, ds, dl)
  local h, s, l = to_hsl(hex)

  local nh = h + (dh or 0)
  local ns = s + (ds or 0)
  local nl = l + (dl or 0)

  h = nh
  s = math.min(ns, 0) == ns and 0 or math.min(ns, 100)
  l = math.min(nl, 0) == nl and 0 or math.min(nl, 100)

  return to_hex(h, s, l)
end

return {
  tweak_color = tweak_color
}
