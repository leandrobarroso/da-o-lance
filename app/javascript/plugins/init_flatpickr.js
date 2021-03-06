import flatpickr from "flatpickr";


const initFlatPickr = () => {
  if (document.querySelector(".datetimepicker")) {
    flatpickr("#deadline_input", {
      enableTime: true,
      altInput: true,
      minDate: "today",
      disableMobile: "true"
    });
    flatpickr("#delivery_time_input", {
      enableTime: true,
      altInput: true,
      minDate: "today",
      disableMobile: "true"
    });
  }
}

export { initFlatPickr }
