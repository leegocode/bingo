<template>
  <div id="app">
    <div class="number">
      <div class="circle">
        {{ displayNumber }}
      </div>
    <button @click="rollthedice">{{ rollOrStop }}</button>
    </div>
    <div class="nav">
      <Ball v-for="bingo in bingoNumber" :bingo="bingo" :key="bingo.index"/>
    </div>
</div>
</template>

<script lang="ts">
import {Component, Vue, Watch} from 'vue-property-decorator';
import Ball from './components/Ball.vue';

@Component({
  components: {
    Ball,
  },
})
export default class APP extends Vue {
  msg = 0;
  displayNumber = 0;
  timer: number | null = 0;
  bingoNumber: number[] = []


  get rollOrStop() {
    if (this.timer) {
      return 'stop'
    } else {
      return '!!!!'
    }
  }

  includeBingo(a: any): boolean {
    return this.bingoNumber.includes(a)
  }

  getRandom(): void {
    this.msg = Math.floor(1 + Math.random() * 80);
  }


  rollthedice(): void {
    if (this.timer) {
      clearInterval(this.timer);
      if (!this.includeBingo(this.displayNumber)){
        this.bingoNumber.push(this.displayNumber)
      }
      this.timer = null;
    } else {
      this.timer = setInterval(this.getRandom, 100)
    }
  }

  stopdice(): void {
    const rolldice = setInterval(this.getRandom, 100);
    clearInterval(rolldice);
  }

  @Watch('msg')
  onPropertyChanged(value: number) {
    this.displayNumber = value;
  }

}
</script>

<style lang="scss">
body {
  background-color: black;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  // text-align: center;
  color: white;
  display:flex;
  .circle{
   width: 700px;
   height: 700px;
   line-height: 700px;
   border-radius: 50%;
   font-size: 500px;
   color: black;
   text-align: center;
   background-color: orange;
  }
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
