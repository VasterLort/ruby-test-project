<template>
  <div>
    <p>{{ post.description }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    id: Number
  },

  data() {
    return {
      post: Object
    }
  },

  methods: {
    getPost(id) {
      axios.get(`/posts/${id}.json`)
      .then(response => {
        this.post = response.data;
      })
      .catch(error => {
        console.log(error);
      })
    }
  },
    
  created() {
    this.getPost(this.id)
  }
}
</script>