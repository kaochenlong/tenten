import { Controller } from "stimulus" 

export default class extends Controller { 
  static targets = [ "items" ] 

  update(evt){
    this.itemsTarget.innerText = evt.detail[0]['items'];

    let msg_window = document.querySelector('#message_window')
    let content = msg_window.querySelector('#message_content');
    content.innerText = '已加到購物車';

    msg_window.classList.add('is-active');
  }
}

