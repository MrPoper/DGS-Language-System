setElementData(localPlayer,data_name,locale,true) 
loadstring(exports.dgs:dgsImportFunction())()
loadstring(exports.dgs:dgsImportOOPClass())()

print "++++++++++++++______________________++++++++++++++++"
function getLocale(thePlayer)
    return getElementData(thePlayer or localPlayer ,data_name) or locale or locale_fallback
end


function dgsLangs(selected)
    local st = getTickCount()
    local lang = localPlayer:getData(data_name) or locale_fallback
    local check_languages = Set(languages)
    if lang and check_languages[lang] then
        local data,file,filePath;
        if( selected  ) then
            filePath = locale_path..'/'..lang..'/'..selected..'.lua'
            if File.exists(filePath) then file = File.open(filePath) end
        else
            filePath = locale_path..'/'..lang..'.lua'
            if File.exists(filePath) then file = File.open(filePath) end
        end
        if not File.exists(filePath) then return {} end
        local func = loadstring(file:read(file:getSize()))
        if func then setfenv(func,{}) end
        local err , data = pcall(func)
        file:close()
        return data
    end
end

function LangsImport()
    allCode = ''
    for i,name in ipairs(getResourceExportedFunctions()) do
        if name ~= 'tranImport' then 
            allCode = allCode.. "\n" .. [[
                function ]]..name..[[(...)
                    return exports.]]..getResourceName(getThisResource())..[[:]]..name..[[(...) 
                end
            ]]
        end 
    end
    return allCode
end

-----------------++ EXEMPLE TEST PROJECT ++-------------------

addEventHandler('onClientElementDataChange',root,
function(dataName)
    if dataName == data_name then
        dgsSetTranslationTable("Test", dgsLangs())
    end
end)

dgsSetTranslationTable("Test", dgsLangs())
dgsSetAttachTranslation("Test")
label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'healthy',health=100} , true )
setTimer(
    function()
        localPlayer:setData(data_name,'ar')
    end,1000,1
)