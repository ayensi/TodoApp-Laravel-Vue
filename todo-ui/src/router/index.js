import { createRouter, createWebHistory } from 'vue-router'
import Tasks from '../views/Tasks.vue'
import NewTask from '../views/NewTask.vue'

const routes = [
  {
    path: '/tasks',
    name: 'Tasks',
    component: Tasks
  },
  {
    path: '/newtask',
    name: 'NewTask',
    component: NewTask
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
