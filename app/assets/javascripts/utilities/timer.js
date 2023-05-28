document.addEventListener('turbolinks:load', () => {
    const inputTime = document.getElementById('timer')

    if (inputTime) {
        if (sessionStorage.getItem('timer') == null) {
            sessionStorage.setItem('timer', JSON.stringify(inputTime.dataset.timer * 60))
        }

        intervalId = setInterval(updateTimer, 1000)

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

    } else if (inputTime == null) {
        if (typeof intervalId !== 'undefined') {
            clearInterval(intervalId)
        }

        sessionStorage.removeItem('timer')
    }
})
