// function formatTime(minute, hour) {
//     let time = ''

//     if (hour <= 9) {
//         time += '0' + hour
//     } else {
//         time += hour
//     }

//     if (minute <= 9) {
//         time += ':0' + minute
//     } else {
//         time += ':' + minute
//     }

//     return time
// }


window.addEventListener('message', ({data}) => {
    
    let crime = document.querySelector('.crime')
    if (data.crime) {
        crime.style.display = 'flex'
    }else{
        crime.style.display = 'none'
    }

    let hourText = document.querySelector('.clockText')
})  