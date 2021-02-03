<template>
  <div class="flex-gap">
    <div class="hello" :class="fristThree? 'firstthree': '' " >
      {{ bingo }}
    </div>
    <div>
<!--      {{ this.$vnode.key }}-->
    </div>
  </div>


</template>

<script lang="ts">
import {Component, Prop, Vue} from 'vue-property-decorator';

@Component
export default class Ball extends Vue {
  @Prop() bingo!: number;
  turnRed = false;

  get fristThree() {
    const key = this.$vnode.key
    if(key){
      return key < 3 || key === 0;
    }
  return false
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.hello {
  font-size: 60px;
  color: white;
  height: 50px;
  width: 80px;
  margin-left: 45px;
  margin-top: 45px;
  align-items: center;
  letter-spacing: -1px;
  justify-content: space-around;
}

.flex-gap {
  display: inline-flex;
  flex-wrap: wrap;
}

.firstthree {
  color: orange;
  font-size: 85px;
  letter-spacing: -5px;
}
</style>
