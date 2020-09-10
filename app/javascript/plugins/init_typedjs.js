import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("typed")) {
    const sentence = document.getElementById("sentence").innerText;
    new Typed('#typed', {
    strings: [sentence],
    typeSpeed: 20,
    loop: false
    });
  }
}

export { loadDynamicBannerText };
