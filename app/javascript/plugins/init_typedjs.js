import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed', {
    strings: ["Os melhores lances para suas listas de compras", "Os melhores lances para suas listas de compras"],
    typeSpeed: 80,
    loop: false
  });
}

export { loadDynamicBannerText };
