const fs = require('fs-extra');
require('dotenv').config();

(async () => {
    await fs.copy("dist", process.env.MOD_FOLDER, {
        overwrite: true
    });
})().catch(err => console.error(err))