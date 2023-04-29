document.addEventListener('turbolinks:load', () => {
    const inputPass = document.querySelector('.input-pass')
    const inputConfPass = document.querySelector('.input-conf-pass')

    if (inputConfPass) {
        checkPasswords(inputPass, inputConfPass)
    }
})

function checkPasswords(inputPass, inputConfPass) {
    const pass = inputPass.querySelector('.pass')
    const confPass = inputConfPass.querySelector('.conf-pass')

    confPass.addEventListener('input', () => {

        if (confPass.value) {
            console.log(confPass.value)
            clearClass(confPass)
            if (pass.value !== confPass.value) {
                console.log('0')
                clearClass(confPass)
                confPass.classList.add('is-invalid')
            } else {
                console.log('1')
                clearClass(confPass)
                confPass.classList.add('is-valid')
            }
        } else {
            clearClass(confPass)
        }

    })
}

function clearClass(element) {
    element.classList.remove('is-valid')
    element.classList.remove('is-invalid')
}
