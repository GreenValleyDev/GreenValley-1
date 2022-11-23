const FormData = require('form-data');
const fs = require('fs')

RegisterServerEvent('ThnAC:webhook')
AddEventHandler('ThnAC:webhook', async (webhook,embed_data,screenshot_path) => {
    if (webhook && embed_data && screenshot_path && verifyFile(screenshot_path)) {
        var file = fs.createReadStream(screenshot_path)
        const form = new FormData();
        form.append(`file`, file)
        form.append(`payload_json`, embed_data)
        form.submit(webhook, (error, response) => {})
    } else {
        console.log("Argumentos inválidos ou faltando")
    }
})

function base64_encode(file) {
    var bitmap = fs.readFileSync(file);
    return new Buffer.from(bitmap).toString('base64');
}

exports("base64Encode", base64_encode);

function verifyFile(path) {
    try {
        if (fs.existsSync(path)) {
            return true
        }
    } catch (err) {
        return false
    }
}