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
            clearClass(confPass)
            confPass.classList.add(passwordComparison(pass, confPass))
        } else {
            clearClass(confPass)
        }

    })
}

function passwordComparison(pass, confPass) {
    if (pass.value !== confPass.value) {
        return 'is-invalid'
    } else {
        return 'is-valid'
    }
}

function clearClass(element) {
    element.classList.remove('is-valid')
    element.classList.remove('is-invalid')
}
