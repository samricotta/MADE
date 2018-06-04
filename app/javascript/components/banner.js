import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find homemade food near you", "Great food for less money"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
