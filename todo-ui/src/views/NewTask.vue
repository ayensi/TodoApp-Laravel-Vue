<template>
    <div>
        <div style="margin-top:150px" class="form-group">
            <div style="text-align:center">
  <label  class="col-form-label col-form-label-lg mt-4" for="inputLarge">Task To Do</label>
            </div>

  <input v-model="inputdesc" class="form-control form-control-lg" type="text" placeholder="..." id="inputLarge">
<br>
<div style="text-align:center">
  <label  class="col-form-label col-form-label-lg mt-4" for="inputLarge">Task Deadline (If Wanted)</label>
            </div>
            <input v-model="inputdate" class="form-control form-control-lg" type="datetime-local" id="inputLarge">
  <br>
  <br>
  <div style="text-align:center">
<button @click="CreateNewTask" type="button" class="btn btn-outline-dark">Create</button>
  </div>
  
</div>
    </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'Tasks',
data () {
    return {
      inputdesc:null,
      inputdate:null,
      json:{
      task: {
        name:"",
        deadline:""
      },
      },
      
      returnTask:null
    
    }
  },
  methods:{
    async CreateNewTask(){
       this.json.task.name = this.inputdesc;
       this.json.task.deadline = this.inputdate;
       this.json = JSON.stringify(this.json);
       console.log(this.json)
       const headers = { 
    "Content-Type": "application/json"
  };
         this.returnTask = await axios
      .post('http://127.0.0.1:8000/api/task/createtask',this.json,{headers});
      this.$router.push('tasks');
     }
    
  }
}
</script>