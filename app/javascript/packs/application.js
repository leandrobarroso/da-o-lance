// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// ----------------------------------------------------

// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
// External imports
import "bootstrap";
import "cocoon";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initSelect2 } from '../plugins/init_select2';
import { initFlatPickr } from "../plugins/init_flatpickr"
import { loadDynamicBannerText } from '../plugins/init_typedjs';
import { initComingSoon } from './init_coming_soon';

import { initAuctionCable } from '../channels/auction_channel';
import { initUserCable } from '../channels/user_channel';



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initComingSoon();
  initFlatPickr();
  initSelect2();
  initAuctionCable();
  initUserCable();
  loadDynamicBannerText();

  setTimeout(()=> {$(".alert").fadeOut(2000)}, 3000);
});

import "controllers"
