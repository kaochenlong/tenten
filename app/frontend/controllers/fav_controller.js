import { Controller } from "stimulus";
import ax from 'helpers/ax';

export default class extends Controller {
  static targets = [ "icon" ]

  toggle(evt) {
    evt.preventDefault();
    let id = this.data.get('id');

    ax.post(`/api/books/${id}/favorite`, {})
      .then(function(response) {
        console.log(response.data);
      })
      .catch(function(error) {
        console.log(error);
      })
  }
}

