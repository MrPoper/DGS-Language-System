# DGS-Language-System
It is a script that helps manage translation files from one side and uses them whenever the person wants.
_*inclube : [thispd/dgs - 3.517](dgs)*_
# Authors
 * __MrPop ([VaRPoP](Me))__
# How-To-Use :
- Add under code in first line of script : 
```lua
    loadstring(exports.dgsLanguageSystem:LangsImport())()
```
- Then add **default [dgs](dgs)** function of translate with  `dgsLangs()` in table:
    * #### Default function :
    
    ```lua
        dgsSetTranslationTable("Test", dgsLangs())
        dgsSetAttachTranslation("Test")
        label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'healthy',health=100} , true )
    ```
    * #### Target function with name : 

    ```lua
        dgsSetTranslationTable("Test", dgsLangs('account'))
        dgsSetAttachTranslation("Test")
        label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14,{'login',can='yes'} , true )
    ```
# Functions
* `LangsImport()` Import exporting function to resource
* `dgsLangs(string [ locale_name ])`: Return table to use in default [dgs](dgs) translator
* `getLocale(player thePlayer)`: Return player lanaguage.
# Add new language or file :
in `dgsLanguageSystem` is automatic creating and sync files to do :
* In `config.lua` 
```lua
    --- to add new language :
    languages = {
        'ar' , 'en' , --' new language here' ,
    } 
    --- to add custom file(target resource):
    locale_config = {
        'account' , 'admin' , -- 'resourceName(or any string text)' ,
    }
```
* Add `scanFiles` function to `s_language.lua` file : 
```lua
 scanFiles(true) --- to last line 
```
* Start resource `/start dgsLanguageSystem`


## and enjoy :) 
[dgs]: https://github.com/thisdp/dgs
[Me]: https://github.com/MrPoper
