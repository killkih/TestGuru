document.addEventListener('turbolinks:load', () => {
    const inputTime = document.getElementById('timer')
    const finish = document.getElementById('result-test')

    if (finish) {
        sessionStorage.removeItem('timer')
    }

    if (inputTime) {
        if (sessionStorage.getItem('timer') == null) {
            sessionStorage.setItem('timer', JSON.stringify(inputTime.dataset.timer * 60))
        }

        setInterval(updateTimer, 1000)
        function updateTimer() {
            let time = JSON.parse(sessionStorage.getItem('timer'))
            const minutes = Math.floor(time / 60)
            let seconds = time % 60

            if (time < 0) {
                inputTime.classList.add('hide')
                let form = document.querySelector('.test-passage-form')

                form.submit()
            }

            seconds = seconds < 10 ? "0" + seconds : seconds
            inputTime.innerHTML = `${minutes}:${seconds}`

            time--

            sessionStorage.setItem('timer', JSON.stringify(time))

        }
    }
})
