import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed', {
    strings: ["Trazemos um novo jeito de fazer suas compras", "Trazemos um novo jeito de fazer suas compras"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
