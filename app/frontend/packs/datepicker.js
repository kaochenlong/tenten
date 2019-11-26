import '../stylesheets/datepicker.scss'

import flatpickr from 'flatpickr'

document.addEventListener('turbolinks:load', function(){
  flatpickr('#book_published_at', {})
})

