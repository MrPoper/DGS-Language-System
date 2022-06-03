



function require(url)
    if not url then return false end
    local full = '' 
    if ( File.exists(url) ) then
        local file = File.open(url)
        if not file then return false end    
        while( not file:isEOF() )do
            local read = file:read(500)
            full = full .. read
        end
        return assert(loadstring(full))()   
    end
end

local types_can = Set { 'client' , 'server' }

function addToMeta(file)
    assert(file and File.exists(file),'Bad argument #1 to \'file\' (file not found)') 
    local meta = XML.load('meta.xml')
    if not meta then return false end
    local idx , nodef = 0 ,false
    while( meta:findChild('script',idx)) do
        idx = idx + 1
    end
    local id = idx
    if(id == 0)then
        local nodef = meta:findChild('script',idx)
        if not nodef then
            nodef = meta:createChild('script')
            nodef:setAttribute('src',file)
            nodef:setAttribute('type','client')
            nodef:setAttribute('cache','false')
        end
    else
        local check
        for i ,child in ipairs(meta.children)do if(child.name == 'script') then if file == child.attributes.src then check = false break else check = true end end end
        if check then
            nodef = meta:createChild('script')
            nodef:setAttribute('src',file)
            nodef:setAttribute('type','client')
            nodef:setAttribute('cache','false')
        end
    end
    meta:saveFile()
    meta:unload()
end
function scanFiles(Meta)
    local resource = resource:getThis()
    local resourceName = resource.name
    local path = locale_path
    
    if Meta then
        local meta = XML.load('meta.xml')
        for i ,child in ipairs(meta.children)do
            if(child.name == 'file') then
                child:destroy()
            end
        end
        meta:saveFile()
        meta:unload()
    end
    for i , fileName in ipairs(locale_config)do 
        for k , lang in ipairs(languages) do
            local filePatch = path..'/'..lang..'/'..fileName..'.lua'
            local file = File.open(filePatch)
            if not File.exists(filePatch) then
                File.new(filePatch)
            end 
            if type(Meta) == 'boolean' and Meta == true then addToMeta("lang/"..lang..'/'..fileName..'.lua') end
        end
    end
    for k , lang in ipairs(languages) do
        local filePatch = path..'/'..lang..'.lua'
        local file = File.open(filePatch)
        if not File.exists(filePatch) then
            File.new(path..'/'..lang..'.lua')
        end 
        if type(Meta) == 'boolean' and Meta == true then addToMeta('lang/'..lang..'.lua') end
    end
end