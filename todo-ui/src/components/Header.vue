<template>
    <div>
            <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">ToDo App</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
          
              <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item">
                    <a v-if="this.$route.name===tasks" class="nav-link active" href="tasks">Tasks
                        {{this.$route.name}}
                    </a>


                    <a v-else class="nav-link" href="tasks">Tasks

                    </a>
                  </li>
                  <li class="nav-item">
                    <a v-if="this.$route.name===newtask" class="nav-link active" href="newtask">Create Task
 {{this.$route.name}}
                    </a>
                  
                    <a v-else class="nav-link" href="newtask">Create Task
                        
                    </a>
                  </li>
                </ul>

              </div>
            </div>
          </nav>
           
    </header>
    </div>
</template>
<script>
export default {
  name: 'Header',

}

</script>