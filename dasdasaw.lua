local LICENSE_KEY = "MEDAL-PHXNKVYRWTQWHICU"
--------------------------------------------------------------------------
local getscriptbytecode = getscriptbytecode
local encode = base64.encode
local request = request
local function decompile(s)
    local response = request {
        Url = "https://luau-worker.luau-decompiler.workers.dev/decompile",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "text/plain",
            ["Authorization"] = LICENSE_KEY
        },
        Body = encode(getscriptbytecode(s)),
    }

    if response.StatusCode ~= 200 then
        return "-- Decompiler error occured!"
    end

    return response.Body
end
getgenv().decompile = decompile

local api = game:GetService('HttpService'):JSONDecode(game:HttpGet(
"http://setup.roblox.com/" .. game:HttpGet('http://setup.roblox.com/versionQTStudio', true) .. "-API-Dump.json", true))
.Classes
local data = {}
local propVal
local wf = clonefunction(writefile)
local decimal = 3
local instanceCount = 0
local instanceRefs = {}
print(api)
_G.FileName = game.PlaceId .. ".rbxmx"

for i, v in api do
    data[v.Name] = { ["Superclass"] = v.Superclass }
    table.foreach(v.Members, function(c, prop)
        if prop.MemberType == "Property" then
            data[v.Name][prop.Name] = { prop.ValueType.Name, prop.ValueType.Category }
        end
    end)
end

function check(i)
    if data[i].Superclass ~= "<<<ROOT>>>" then
        table.foreach(data[data[i].Superclass], function(a, b)
            data[i][a] = b
        end)
        check(i)
    end
end

for i, _ in data do
    check(i)
end

table.foreach(data, function(i, v)
    v.Superclass = nil
    v.Name = nil
    v.Parent = nil
end)

data["UnionOperation"]["AssetId"] = { "Content" }
data["UnionOperation"]["ChildData"] = { "BinaryString" }
data["UnionOperation"]["FormFactor"] = { "Enum" }
data["UnionOperation"]["InitialSize"] = { "Vector3" }
data["UnionOperation"]["MeshData"] = { "BinaryString" }
data["UnionOperation"]["PhysicsData"] = { "BinaryString" }
data["Animator"]["EvaluationThrottled"] = nil
data["MeshPart"]["PhysicsData"] = { "BinaryString" }
data["MeshPart"]["InitialSize"] = { "Vector3" }
data["Terrain"]["SmoothGrid"] = { "TerrainData" }
data["Terrain"]["MaterialColors"] = { "TerrainData" }
data["Terrain"]["PhysicsGrid"] = { "TerrainData" }

print("Loaded")

local function precision(value)
    local mult = 10 ^ (decimal or 0)
    local ans = math.floor(value * mult + 0.5) / mult
    return value
end

function checkRef(obj)
    local checkref = instanceRefs[obj]
    if checkref then
        return tostring(checkref)
    end
    instanceRefs[obj] = instanceCount
    return tostring(instanceCount)
end

function setRef(obj)
    if obj == nil then
        return "null"
    end
    local checkref = instanceRefs[obj]
    if checkref then
        return "RBX" .. tostring(checkref)
    end
    instanceCount = instanceCount + 1
    instanceRefs[obj] = instanceCount
    return "RBX" .. tostring(instanceCount)
end

local types = {
    ["string"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<string name=\"%s\">%s</string>", prop, propval)
    end,
    ["bool"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<bool name=\"%s\">%s</bool>", prop, tostring(propval))
    end,
    ["float"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<float name=\"%s\">%s</float>", prop, precision(propval))
    end,
    ["int"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<int name=\"%s\">%d</int>", prop, propval)
    end,
    ["int64"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<int64 name=\"%s\">%d</int64>", prop, propval)
    end,
    ["double"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<double name=\"%s\">%s</double>", prop, precision(propval))
    end,
    ["BrickColor"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<BrickColor name=\"%s\">%s</BrickColor>", prop, tostring(propval))
    end,
    ["NumberRange"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<NumberRange name=\"%s\">%s %s</NumberRange>", prop, precision(propval.Min),
            precision(propval.Max))
    end,
    ["NumberSequence"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        local kpstr = {}
        for i, kp in ipairs(propval.Keypoints) do
            table.insert(kpstr, precision(kp.Time) .. ' ' .. precision(kp.Value) .. ' ' .. precision(kp.Envelope) .. ' ')
        end
        return string.format("<NumberSequence name=\"%s\">%s</NumberSequence>", prop, table.concat(kpstr))
    end,
    ["ColorSequence"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        local kpstr = {}
        for i, kp in ipairs(propval.Keypoints) do
            table.insert(kpstr, tostring(kp))
        end
        return string.format('<ColorSequence name="%s">%s</ColorSequence>', prop, table.concat(kpstr))
    end,
    ["Rect2D"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<Rect2D name=\"%s\"><Min><X>%s</X><Y>%s</Y></Min><Max><X>%s</X><Y>%s</Y></Max></Rect2D>",
            prop, precision(propval.Min.X), precision(propval.Min.Y), precision(propval.Max.X), precision(propval.Max.Y))
    end,
    ["PhysicalProperties"] = function(object, prop)
        if prop == "CustomPhysicalProperties" then
            return [[<PhysicalProperties name="CustomPhysicalProperties"><CustomPhysics>false</CustomPhysics></PhysicalProperties>]]
        end
        local propval = gethiddenproperty(object, prop)
        return string.format(
        "<PhysicalProperties name=\"%s\"><Density>%s</Density><Friction>%s</Friction><Elasticity>%s</Elasticity><FrictionWeight>%s</FrictionWeight><ElasticityWeight>%s</ElasticityWeight></PhysicalProperties>",
            prop, precision(propval.Density), precision(propval.Friction), precision(propval.Elasticity),
            precision(propval.FrictionWeight), precision(propval.ElasticityWeight))
    end,
    ["Vector3"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<Vector3 name=\"%s\"><X>%s</X><Y>%s</Y><Z>%s</Z></Vector3>", prop, precision(propval.X),
            precision(propval.Y), precision(propval.Z))
    end,
    ["Vector2"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<Vector2 name=\"%s\"><X>%s</X><Y>%s</Y></Vector2>", prop, precision(propval.X),
            precision(propval.Y))
    end,
    ["Color3"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<Color3 name=\"%s\"><R>%s</R><G>%s</G><B>%s</B></Color3>", prop, precision(propval.R),
            precision(propval.G), precision(propval.B))
    end,
    ["UDim2"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        return string.format("<UDim2 name=\"%s\"><XS>%s</XS><XO>%s</XO><YS>%s</YS><YO>%s</YO></UDim2>", prop,
            precision(propval.X.Scale), precision(propval.X.Offset), precision(propval.Y.Scale),
            precision(propval.Y.Offset))
    end,
    ["CFrame"] = function(object, prop)
        local propval = gethiddenproperty(object, prop)
        local components = { propval:GetComponents() }
        for i = 1, #components do
            components[i] = precision(components[i])
        end
        return string.format(
        "<CoordinateFrame name=\"%s\"><X>%s</X><Y>%s</Y><Z>%s</Z><R00>%s</R00><R01>%s</R01><R02>%s</R02><R10>%s</R10><R11>%s</R11><R12>%s</R12><R20>%s</R20><R21>%s</R21><R22>%s</R22></CoordinateFrame>",
            prop, table.unpack(components))
    end,
    ["Content"] = function(object, prop)
        if prop == "LinkedSource" then
            return ""
        end
        return string.format("<Content name=\"%s\"><url>%s</url></Content>", prop,
            serialize(gethiddenproperty(object, prop)))
    end,
    ["EnumItem"] = function(object, prop)
        return string.format("<Token name=\"%s\">%s</Token>", prop, gethiddenproperty(object, prop).Value)
    end,
    ["ProtectedString"] = function(object, prop)
        if prop == "Source" and (decompile or getscriptbytecode) and (object:IsA("LocalScript") or object:IsA("ModuleScript")) then
            w, code = pcall(decompile or getscriptbytecode, object)
            return string.format("<ProtectedString name=\"%s\"><![CDATA[%s]]></ProtectedString>", prop,
                serialize((w and code or "")))
        end
        return ""
    end,
    ["BinaryString"] = function(object, prop)
        local propVal = gethiddenproperty(object, prop)
        local propType = typeof(propVal) == "EnumItem" and gethiddenproperty(object, prop).Value or propVal
        return string.format("<BinaryString name=\"%s\">%s</BinaryString>", object.ClassName,
            crypt.base64.encode(roundToDecimal(propType, 3)))
    end,
    ["UniqueId"] = function(object, prop)
        local propVal = gethiddenproperty(object, prop)
        local propType = typeof(propVal) == "EnumItem" and gethiddenproperty(object, prop).Value or propVal
        return string.format("<UniqueId name=\"%s\">%s</UniqueId>", object.ClassName,
            crypt.base64.encode(roundToDecimal(propType, 3)))
    end,
    ["SharedString"] = function(object, prop)
        local propVal = gethiddenproperty(object, prop)
        local propType = typeof(propVal) == "EnumItem" and gethiddenproperty(object, prop).Value or propVal
        return string.format("<SharedString name=\"%s\">%s</SharedString>", object.ClassName,
            crypt.base64.encode(roundToDecimal(propType, 3)))
    end,
    ["TerrainData"] = function(object, prop)
        return string.format("<BinaryString name=\"%s\"><![CDATA[%s]]></BinaryString>", prop,
            crypt.base64.encode(gethiddenproperty(object, prop)))
    end,
}

local escapes = {
    ['"'] = '&quot;',
    ['&'] = '&amp;',
    ['<'] = '&lt;',
    ['>'] = '&gt;',
    ['\''] = '&apos;'
}

function serialize(word)
    for i, v in escapes do
        word = string.gsub(word, i, v)
    end
    return word
end

local tableSize = 1e6 * 5
local stringbuilder = table.create(tableSize)

function append(text)
    stringbuilder[#stringbuilder + 1] = text
    if #stringbuilder >= tableSize then
        wf(_G.FileName, readfile(_G.FileName) .. table.concat(stringbuilder))
        stringbuilder = table.create(tableSize)
    end
end

function writeInstance(object)
    append(string.format("<Item class=\"%s\"><Properties><string name=\"Name\">%s</string>", object.ClassName,
        serialize(object.Name)))
    if data[object.ClassName] then
        instanceCount = instanceCount + 1
        for propName, propType in data[object.ClassName] do
            --print(propName, propType[1])
            if types[propType[1]] then
                append(types[propType[1]](object, propName))
            else
                append(string.format("<%s name=\"%s\">%s</%s>", propType[1], propName,
                    serialize(tostring(typeof(gethiddenproperty(object, propName)) == "EnumItem" and
                    gethiddenproperty(object, propName).Value or gethiddenproperty(object, propName))), propType[1]))
            end
        end
        append("</Properties>")
        for i, v in pairs(object:GetChildren()) do
            writeInstance(v)
        end
    end
    append("</Item>")
end

getgenv().saveinstance = function(obj, name)
    if not name then
        _G.FileName = game.PlaceId .. ".rbxmx"
    else
        _G.FileName = name .. ".rbxmx"
    end

    wf(_G.FileName,
        [[<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4"><Meta name="ExplicitAutoJoints">true</Meta><External>null</External><External>nil</External>]])

    if typeof(obj) == "table" then
        table.foreach(obj, function(_, object)
            writeInstance(object)
        end)
    elseif typeof(obj) == "Instance" then
        writeInstance(obj)
    else
        return
    end

    instanceRefs = {}
    instanceCount = 0
    append("</roblox>")

    if #stringbuilder > 0 then
        wf(_G.FileName, readfile(_G.FileName) .. table.concat(stringbuilder))
        stringbuilder = {}
    end
    wf(_G.FileName, readfile(_G.FileName):gsub("%s+", " "))
    print("Instance saved to " .. _G.FileName)
end

if isfile(_G.FileName) then
    print("detected")
else
    print("NO")
end
