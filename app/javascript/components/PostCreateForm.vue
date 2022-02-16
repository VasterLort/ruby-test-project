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
        <v-col cols="12" md="12">
          <v-text-field
            v-model="post.title"
            :counter="10"
            label="Post Title"
            required
          ></v-text-field>
          <v-textarea
            v-model="post.description"
            :counter="250"
            label="Post Description"
            required
          ></v-textarea>
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
        title: '',
        description: ''
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
        alert("Well!")
      }).catch(response => {
        alert(response.response.data.errors)
      });
      this.post.title = '';
      this.post.description = '';
      this.dialog = false;
    }
  }
}
</script>