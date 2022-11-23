function notify(img, message, color) {
    let container = document.querySelector('.notifies-container')
    
    let element = document.createElement('div')
    element.classList.add('notify')

    let line = document.createElement('div')
    line.classList.add('notifyLine')
    line.style.backgroundColor = color
    line.classList.add('width')

    element.innerHTML = `

        <div class="title">${anuncio}</div>
        <div class="msg">${message}</div>
 
    `

    element.appendChild(line)

    
    container.appendChild(element)
    element.classList.add('appear')
    
    deleteElement(element)

}

window.addEventListener("message", (event) => {
    let type = event.data.css.toLowerCase()

    let color = ''
    let img = ''

    if (type == 'staff') {
        color = '#09ff00'
        anuncio = 'Anuncio STAFF'
    } else if (type == 'policia') {
        color = '#81f1f1'
        anuncio = 'Anuncio Policia'
    } else if (type == 'mec') {
        color = '#ffaa00'
        anuncio = 'Anuncio Mecanica'
    } else if (type == 'ems') {
        color = '#f181c3'
        anuncio = 'Anuncio Hospital'
    }


    notify(img, event.data.message, color)

})


function deleteElement(element) {
    setTimeout(() => {
        element.classList.remove('appear')
        element.classList.add('disappear')
        setTimeout(() => {
            element.remove()
        }, 590);
    }, 49900);
}