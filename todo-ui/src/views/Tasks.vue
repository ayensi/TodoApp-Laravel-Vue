<template>

<div>

    <main style="margin-bottom: 100px;">
      <table style="text-align:center" class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Status</th>
        <th scope="col">Name</th>
        <th scope="col">Started At</th>
        <th scope="col">Completed At</th>
        <th scope="col">(Deadline)</th>
        <th scope="col">Check As Complete</th>
        <th scope="col">Delete</th>
      </tr>
    </thead>
    <tbody>

      <tr v-for="task in waitingTasks" :key="task.id" class="table-dark">
        <th scope="row">Waiting</th>
        <td>{{task.name}}</td>
        <td>{{task.created_at}}</td>
        <td v-if="task.completed_at!==null">{{task.completed_at}}</td>
        <td v-else>Not Completed Yet</td>
        <td v-if="task.deadline!==null">{{task.deadline}}</td>
        <td v-else>No Deadline Assigned</td>
        <td><button @click="CompleteTask(task.id)" class="btn btn-success">Done</button></td>
        <td><button @click="DeleteTask(task.id)" class="btn btn-danger">Delete</button></td>
        
      </tr>
      <tr v-for="task in pastDueTasks" :key="task.id" class="table-danger">
        <th scope="row">Past Due</th>
        <td>{{task.name}}</td>
        <td>{{task.created_at}}</td>
        <td>Could Not Be Completed</td>

        <td v-if="task.deadline!==null">{{task.deadline}}</td>
        <td v-else>No Deadline Assigned</td>
        <td></td>
        <td><button @click="DeleteTask(task.id)" class="btn btn-danger">Delete</button></td>
        
      </tr>
       <tr v-for="task in doneTasks" :key="task.id" class="table-success">
        <th scope="row">Completed</th>
        <td>{{task.name}}</td>
        <td>{{task.created_at}}</td>
        <td>{{task.completed_at}}</td>
        <td>{{task.deadline}}</td>
        <td></td>
        <td><button @click="DeleteTask(task.id)" class="btn btn-danger">Delete</button></td>
        
      </tr>

      
    </tbody>
  </table>
    </main>

      

</div>
</template>

<script>
import axios from 'axios';
import moment from 'moment'
export default {
  name: 'Tasks',
  data(){
    return{
doneTasks:[],
waitingTasks:[],
pastDueTasks:[],
deletedTask:null,
completedTask:null
    }
    
  },
  async mounted(){
    const tasks = await axios
      .get('http://127.0.0.1:8000/api/tasks');

      tasks.data.forEach(item=>{
                  item.created_at = moment(String(item.created_at)).format('DD/MM/YYYY');
                  if(item.deadline!==null ){
                   if(!moment(item.deadline).isAfter(moment())){
                     item.deadline = moment(String(item.deadline)).format('DD/MM/YYYY');
                     this.pastDueTasks.push(item);
                     return;
                   } 
                  item.deadline = moment(String(item.deadline)).format('DD/MM/YYYY');
          
                  }
                  if(item.completed_at!==null ){
item.completed_at = moment(String(item.completed_at)).format('DD/MM/YYYY');
          
                  }
         
        if(item.is_done===1){
          this.doneTasks.push(item);
        }
        else{
          this.waitingTasks.push(item);
        }
      });

  },
  methods:{
    async CompleteTask(e){
      this.completedTask = await axios
      .put("http://127.0.0.1:8000/api/task/updatetask/"+e);
      this.$router.go(0);
    },
    async DeleteTask(e){
this.deletedTask = await axios
      .delete('http://127.0.0.1:8000/api/task/deletetask/'+e);
      this.$router.go(0);
    }
  }
}
</script>

<style scoped>

</style>
