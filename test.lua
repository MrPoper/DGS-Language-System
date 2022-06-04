
-----------------++ EXEMPLE TEST PROJECT ++-------------------

-- loadstring(exports.dgs:dgsImportOOPClass())()

function TestExemepleLua()
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
end
-- TestExemepleLua()

function TestInFile()
    addEventHandler('onClientElementDataChange',root,
    function(dataName)
        if dataName == data_name then
            dgsSetTranslationTable("Test", dgsLangs('account'))
        end
    end)

    dgsSetTranslationTable("Test", dgsLangs('account'))
    dgsSetAttachTranslation("Test")
    label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'login'} , true )   
    setTimer(
        function()
            localPlayer:setData(data_name,'ar')
            dgsTranslationAddPropertyListener(label,'can')
            dgsSetProperty(label,'can','true')
        end,1000,1
    )
end
TestInFile()


function TestWelcome()
    addEventHandler('onClientElementDataChange',root,
    function(dataName)
        if dataName == data_name then
            dgsSetTranslationTable("Test", dgsLangs('admin'))
        end
    end)

    dgsSetTranslationTable("Test", dgsLangs('admin'))
    dgsSetAttachTranslation("Test")
    label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'welcome',name='MrPop'} , true )   
    setTimer(
        function()
            localPlayer:setData(data_name,'ar')
            dgsTranslationAddPropertyListener(label,'name')
            dgsSetProperty(label,'name',getPlayerName(localPlayer))
        end,1000,1
    )
end
-- TestWelcome()