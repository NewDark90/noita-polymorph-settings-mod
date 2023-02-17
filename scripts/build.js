const fs = require('fs-extra');
const replaceInFiles = require('replace-in-files');

/*
-- local AlchemyGenerator = dofile_once(GLOBAL.files_path .. "/alchemy_generator.lua")
-- local AlchemyGui = dofile_once(GLOBAL.files_path .. "/alchemy_gui.lua") 

local AlchemyGenerator = require "alchemy_generator"
local AlchemyGui = require "alchemy_gui"
*/

(async () => {
    await fs.copy("src", "dist", {
        overwrite: true
    });

    const options = {
        files: 'dist/**/*.lua',

        from: /local\s+(?<var>[A-Za-z0-9_]+)\s*=\s*require\s*"(?<req>[A-Za-z0-9_]+)"[ ]*/g, // string or regex
        to: 'local $1 = dofile_once(GLOBAL.files_path .. "/$2.lua")',

        // See more: https://www.npmjs.com/package/glob
        optionsForFiles: { // default
            "ignore": [
                "**/node_modules/**"
            ]
        }
    };

    await replaceInFiles(options);

})().catch(err => console.error(err))