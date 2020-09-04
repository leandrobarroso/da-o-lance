import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
$("#new_auction").on("cocoon:after-insert", function(_, row){
  $(row).find(".select2").select2({
    width: '100%',
    dropdownAutoWidth: true,
  });
});

}

export { initSelect2 };
