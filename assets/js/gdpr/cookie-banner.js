window.addEventListener("load", () => {
    const banner = document.getElementById("cookie-banner");
    const acceptBtn = document.getElementById("cookie-accept-btn")
    const rejectBtn = document.getElementById("cookie-reject-btn")

    const hideBanner = () => {
        banner.remove();
    }

    acceptBtn.addEventListener("click", () => {
        hideBanner()
    })

    rejectBtn.addEventListener("click", () => {
        hideBanner()
    })
})