<template>
  <v-container class="mt-3">
    <post-create-form
      @response='getPosts'
    ></post-create-form>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              Id
            </th>
            <th class="text-left">
              Title
            </th>
            <th class="text-left">
              Description
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="post in posts"
            :key="post.id"
          >
            <td>{{ post.id }}</td>
            <td>{{ post.title }}</td>
            <td>{{ post.description }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
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