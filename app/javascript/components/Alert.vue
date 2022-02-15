<template>
  <div>
    <v-alert type="success">{{ message }}</v-alert>
    <br>
  </div>
</template>

<script>
export default {
  props: ['message'],
};
</script>