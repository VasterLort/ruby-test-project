<template>
  <v-container class="mt-3">
    <post-create-form @response='getAllPosts'></post-create-form>
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
          </tr>
        </thead>
        <tbody>
          <tr v-for="post in posts" :key="post.id">
            <td>{{ post.id }}</td>
            <td>{{ post.title }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  name: 'PostsIndex',
  props: {
    posts: {
      type: Array,
      default: () => []
    }
  },
  methods: {
    getAllPosts () {
      axios.get('/posts').then(response => {
        console.log(response)
      })
    }
  }
}
</script>