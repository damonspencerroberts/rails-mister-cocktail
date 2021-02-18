import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    width: '250px', 
    outline: 'none'
  }); // (~ document.querySelectorAll)
};

export { initSelect2 };