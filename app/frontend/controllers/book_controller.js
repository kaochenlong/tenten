import { Controller } from "stimulus" 

export default class extends Controller { 
  static targets = [ ] 

  connect() { 
  }

  add_to_cart(evt) {
    evt.preventDefault();
    console.log('yes');
  }
}

