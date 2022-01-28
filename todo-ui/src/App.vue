<template>
<div>
<myheader></myheader>
<router-view></router-view>
  <myfooter></myfooter>
  </div>
</template>

<script>
import header from './components/Header'
import footer from './components/Footer'

export default {
  components: {
    'myheader': header,
    'myfooter': footer
  }
}

</script>