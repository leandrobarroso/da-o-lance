import flatpickr from "flatpickr";


const initFlatPickr = () => {
  if (document.querySelector(".datetimepicker")) {
    flatpickr(".datetimepicker", {
      enableTime: true,
      altInput: true,
      minDate: "today",
    });
  }
}

export { initFlatPickr }
