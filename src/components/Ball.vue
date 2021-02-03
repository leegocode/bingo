<template>
  <div class="flex-gap">
    <div class="hello">
      {{ bingo }}
    </div>
  </div>


</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component
export default class Ball extends Vue {
  @Prop() bingo!: number;
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.hello{
  font-size: 60px;
  color: orange;
  height: 50px;
  width: 80px;
  margin: 30px;
  align-items: center;
  justify-content: center;
}
.flex-gap {
  display: inline-flex;
  flex-wrap: wrap;
}
</style>
