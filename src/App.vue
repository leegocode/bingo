<template>
  <div id="app">
    <div id="nav">
      {{ displayNumber }}
    </div>
    <button @click="rollthedice">{{ rollOrStop }}</button>
    <Ball v-for="bingo in bingoNumber" :bingo="bingo" :key="bingo.index"/>
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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
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
