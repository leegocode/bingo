<template>
  <div id="app">
    <div class="number">
      <div id="left">left: {{ leftNumber }}</div>
      <div class="circle">
        {{ displayNumber }}
      </div>
      <button @click="rollthedice" >{{ rollOrStop }}</button>
    </div>
    <div class="nav">
      <Ball v-for="(bingo, index) in bingoNumber" :bingo="bingo" :key="index"/>
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
  anArrayOfUniqueNumbers: any[] = [];
  leftNumber = 80;


  get rollOrStop() {
    if (this.timer) {
      return 'stop'
    } else {
      return 'GO GO'
    }
  }

  getRandom(): void {
    const randomIndex = Math.floor(Math.random() * this.leftNumber );
    this.msg = this.anArrayOfUniqueNumbers[randomIndex]
    // this.anArrayOfUniqueNumbers.
  }

  numberGenerator(arr: any): void{
    if(arr.length >= 80)return;
    const NewNumber = Math.floor(Math.random()*80+1);
    if (arr.indexOf(NewNumber) < 0) {
      arr.push(NewNumber);
    }
    this.numberGenerator(arr)
  }

  mounted(){
    this.numberGenerator(this.anArrayOfUniqueNumbers); //decide index of array;
  }

  rollthedice(): void {
    if (this.timer) {
      clearInterval(this.timer);
      const theIndex = this.anArrayOfUniqueNumbers.indexOf(this.displayNumber);
      this.bingoNumber.unshift(this.displayNumber)
      this.anArrayOfUniqueNumbers.splice(theIndex,1)
      this.leftNumber --
      this.timer = null;
    } else {
      this.timer = setInterval(this.getRandom, 100)
    }
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
  display: flex;

  #left{
    color: white;
    font-size: 5rem;
    font-weight: bold;
  }
  .number{
   margin:50px;
    button {
      display: block;
      border: none;
      padding: 1rem 2rem;
      margin: 40px auto;
      background: #cb4f4e;
      color: white;
      font-size: 1rem;
      cursor: pointer;
      text-align: center;
      transition: background 250ms ease-in-out,
      transform 150ms ease;
      -webkit-appearance: none;
      -moz-appearance: none;
    }

    button:hover,
    button:focus {
      background: #cb2426;
    }

    button:focus {
      outline: 1px solid #fff;
      outline-offset: -4px;
    }

    button:active {
      transform: scale(0.6);
    }

  }
  .circle {
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

.nav {
  padding: 30px;
  color: white;
  width:60%;
  height: 100%;
}
</style>
