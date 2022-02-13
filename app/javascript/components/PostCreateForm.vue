<template>
  <v-dialog v-model="dialog" persistent max-width="600px">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" dark v-bind="attrs" v-on="on">
        Create a new post
      </v-btn>
    </template>
    <v-card>
      <v-card-title>
        <span class="text-h5">Post Creation</span>
      </v-card-title>
      <v-card-text class="d-flex flex-row justify-space-around">
        <v-col cols="12" md="4">
          <v-text-field v-model="post.title" :counter="50" label="Post Name" required></v-text-field>
          <v-text-field v-model="post.description" :counter="250" label="Post description" required></v-text-field>
        </v-col>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="dialog = false">
          Close
        </v-btn>
        <v-btn elevation="2" @click="createPost" color="primary" small>
          Submit
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
export default {
  name: 'PostCreateForm',
  data () {
    return {
      post: {
        title: ''
      },
      dialog: false,
    }
  },
  methods: {
    createPost () {
      axios.post('/posts/', {
        post: this.post
      }).then(response => {
        this.$emit('response');
      }).catch(error => {
        console.log('error', error)
      });
      this.post.title = '';
      this.dialog = false;
    }
  }
}
</script>