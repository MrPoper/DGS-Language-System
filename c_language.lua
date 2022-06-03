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
        data = loadstring(file:read(file:getSize()))()
        file:close()
        print((getTickCount()-st)*localPlayer.ping ..'ms')
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
-- local Dict = {
--     TestText={
--         "health == 'Superman'",                "You are a not Superman",
--         "find({0}, health)",                "You are dead!",
--         "health <= 20",                        "Your health is low",
--         "health <= 40",                        "Your health is medium",
--         "health > 40",                        "Your health is high",
--         "Your health is $health",
--     },
--     Smile=":)",
-- }   

-- dgsSetTranslationTable("Test", dgsLangs())
-- dgsSetAttachTranslation("Test")
-- label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'healthy',health=0} , true )


-- -- localPlayer:setData(data_name,'en')
-- setTimer(function()
--     dgsSetTranslationTable("Test")
-- end,1500,1)



local Dict = {
    TestText={
        "health == 'Superman'",                "You are a superman",
        "find({0}, health)",                "You are $var!",
        "health <= 20",                        "Your health is low",
        "health <= 40",                        "Your health is medium",
        "health > 40",                        "Your health is high",
        "Your health is $health",
    },
    wtf = "Superman %rep%",
}
dgsSetTranslationTable("Main",Dict)
dgsSetAttachTranslation("Main")
label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14, {"TestText",health=0,var='die'}, true )
-- label = dgsCreateLabel (0.51, 0.5, 0.16, 0.14, {"wtf",'test'}, true )

dgsSetTranslationTable("Main",Dict)


-- languageTab = {wtf="DGS %rep%",test="Test Lang1"}
-- languageTab2 = {wtf="Test %rep% %rep%",test="Test Lang2"}
-- dgsSetTranslationTable("test",languageTab)
-- dgsSetAttachTranslation("test")
-- tabp = dgsCreateTabPanel(400,200,400,400,false)
-- tab1 = dgsCreateTab({"wtf"},tabp)
-- tab2 = dgsCreateTab("Tab",tabp)
-- for i=1,10 do
--     dgsCreateTab(i.."Panel",tabp)
-- end
-- gdlt2 = dgsCreateButton(10,0,100,120,"test",false,tab1,tocolor(255,255,255,255))
-- dgsSetProperty(gdlt2,"shadow",{1,1,tocolor(0,0,0,255),true})
-- setTimer(function()
--     dgsSetTranslationTable("test",languageTab2)
-- end,1000,1)
