document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
    $notification = $delete.parentNode;
    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });
});

document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.modal .modal-background') || []).forEach(($delete) => {
    $notification = $delete.parentNode;
    $delete.addEventListener('click', (evt) => {
      evt.target.parentNode.classList.remove('is-active');
    });
  });
});

document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.modal .modal-close') || []).forEach(($delete) => {
    $notification = $delete.parentNode;
    $delete.addEventListener('click', () => {
      evt.target.parentNode.classList.remove('is-active');
    });
  });
});

