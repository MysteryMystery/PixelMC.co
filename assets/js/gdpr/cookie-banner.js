window.addEventListener("load", () => {
    function setCookie(cname, cvalue, exdays) {
        const d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        let expires = "expires="+d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
      }
      
      function getCookie(cname) {
        let name = cname + "=";
        let ca = document.cookie.split(';');
        for(let i = 0; i < ca.length; i++) {
          let c = ca[i];
          while (c.charAt(0) == ' ') {
            c = c.substring(1);
          }
          if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
          }
        }
        return null;
      }
    
    const COOKIE_KEY = "cookie-accept"

    const banner = document.getElementById("cookie-banner");
    const acceptBtn = document.getElementById("cookie-accept-btn")
    const rejectBtn = document.getElementById("cookie-reject-btn")

    const hideBanner = () => {
        banner.remove();
    }

    console.log(getCookie(COOKIE_KEY))
    if(getCookie(COOKIE_KEY) == "true"){
        hideBanner()
        return;
    }

    acceptBtn.addEventListener("click", () => {
        setCookie(COOKIE_KEY, true, 7)
        hideBanner()
    })

    rejectBtn.addEventListener("click", () => {
        setCookie(COOKIE_KEY, false, -1) // not allowed to set cookies if rejected, so its either true or null.
        hideBanner()
    })
})