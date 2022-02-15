<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-10">
        <h1>Posts</h1>
        <hr><br><br>
        <button type="button" class="btn btn-success btn-sm">Add Post</button>
        <br><br>
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Title</th>
              <th scope="col">Description</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(post, index) in posts" :key="index">
              <td>{{ post.title }}</td>
              <td>{{ post.description }}</td>
              <td>
                <button type="button" class="btn btn-warning btn-sm">Update</button>
                <button type="button" class="btn btn-danger btn-sm">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
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