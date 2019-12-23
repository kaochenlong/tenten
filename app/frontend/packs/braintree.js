import braintree from 'braintree-web-drop-in';

document.addEventListener('turbolinks:load', () => {
  let button = document.querySelector('#submit-button');
  let token = document.querySelector('#token').value;

  braintree.create({
    authorization: token,
    container: '#dropin-container'
  }, function (createErr, instance) {
    button.addEventListener('click', function () {
      instance.requestPaymentMethod(function (err, payload) {
        let hidden_field = document.querySelector('#nonce');
        let form = document.querySelector('#payment-form');
        hidden_field.value = payload.nonce;
        form.submit();
      });
    });
  });
});

