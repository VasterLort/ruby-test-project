<template>
  <v-container class="mt-3">

    <post-create-form
      @response='getPosts'
    ></post-create-form>

    <v-row class="list__posts-title">
      <v-col>
        <h2 class="text-center text-h3 py-3">List of posts</h2>
      </v-col>
    </v-row>
    
    <v-row class="list__posts-content">
      <v-col md="4" v-for="post in posts" :key="post.id">
        <v-card>
          
          <v-img
            height="250"
            :src="post.img"
          ></v-img>
          
          <v-card-title>
            <h3 class="text-h4">{{ post.title }}</h3>
          </v-card-title>
          
          <v-card-text>
            <p class="text-body-1">{{ post.description }}</p>
          </v-card-text>
        
        </v-card>
      </v-col>
    </v-row>

  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      posts: [],
    };
  },

  methods: {
    getPosts() {
      axios.get('/posts.json')
      .then((res) => {
        this.posts = res.data;
      })
      .catch((error) => {
        console.error(error);
      });
    },
  },

  created() {
    this.getPosts();
  }
};
</script>