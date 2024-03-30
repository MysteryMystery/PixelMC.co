window.addEventListener("load", () => {

    let imgIndex = 1;
    window.setInterval(() => {
        document.querySelectorAll(".default-bg")
            .forEach(x => x.style.backgroundImage = `linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)), url(/assets/img/background/${imgIndex}.webp)`)

        imgIndex += 1
        if (imgIndex === 6) {
            imgIndex = 1
        }
    }, 20000)
})