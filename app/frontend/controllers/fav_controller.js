import { Controller } from "stimulus";
import ax from 'helpers/ax';

export default class extends Controller {
  static targets = [ "icon" ]

  connect() {
    this.favorited = this.data.get('favorited');
  }

  toggle(evt) {
    evt.preventDefault();
    let id = this.data.get('id');
    let icon = this.iconTarget;
    let button = evt.currentTarget;

    button.classList.add('is-loading');

    ax.post(`/api/books/${id}/favorite`)
      .then(response => this.favorited = response.data.favorited)
      .catch(error => {
        if (error.response.status === 401) {
          alert('請先登入會員');
        } else {
          alert('發生錯誤，請稍候重試');
        }
      })
      .finally(function(){
        button.classList.remove('is-loading');
      });
  }

  set favorited(value) {
    this.data.set('favorited', value.toString());
    this.updateIcon();
  }

  updateIcon() {
    this.iconTarget.classList.toggle('fas', this.data.get('favorited') === 'true')
  }
}

