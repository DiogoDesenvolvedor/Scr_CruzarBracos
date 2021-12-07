--[[
    
.........................................................................
.........................................................................
.........................................................................
.........   ____    ___    ___     ____   _   _   ___   _   _   .........
.........  |  _ \  |_ _|  / _ \   / ___| | | | | |_ _| | \ | |  .........
.........  | | | |  | |  | | | | | |  _  | | | |  | |  |  \| |  .........
.........  | |_| |  | |  | |_| | | |_| | | |_| |  | |  | |\  |  .........
.........  |____/  |___|  \___/   \____|  \___/  |___| |_| \_|  .........
.........................................................................
.........................................................................
.........................................................................

--]]

local resource = {}
resource["functions"] = {}
resource["animations"] = {}

resource["functions"]["animation"] = function ()
    if resource["animations"][localPlayer] then
        for i, v in ipairs(config["cruzar"]) do
            setElementBoneRotation(localPlayer, v[1], v[2], v[3], v[4])
            updateElementRpHAnim(localPlayer)
        end
    end
end


resource["functions"]["cruzar"] = function ()
    if not resource["animations"][source] then
        resource["animations"][source] = true
        addEventHandler("onClientPedsProcessed", root, resource["functions"]["animation"])
    else
        resource["animations"][source] = false
        removeEventHandler("onClientPedsProcessed", root, resource["functions"]["animation"])
    end
end
addEvent("DiogoScr:CruzarBracos", true)
addEventHandler("DiogoScr:CruzarBracos", getRootElement(), resource["functions"]["cruzar"])