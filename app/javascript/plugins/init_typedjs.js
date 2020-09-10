import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed', {
    strings: ["Trazemos um novo jeito de fazer suas compras, crie suas listas de compras e receba ofertas em modelo leilão", "Trazemos um novo jeito de fazer suas compras, crie suas listas de compras e receba ofertas em modelo leilão"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
