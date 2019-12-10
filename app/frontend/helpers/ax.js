import axios from 'axios';

const token = document.querySelector("meta[name=csrf-token]") || { content: 'no-csrf-token' }

const ax = axios.create({
  headers: {
    common: {
      'X-CSRF-TOKEN': token.content
    },
  },
});

export default ax;

