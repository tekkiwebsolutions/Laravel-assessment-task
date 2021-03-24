import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/userlogin',
      name: 'login',
      component: require('../pages/login.vue').default
    },
    {
      path: '/userdashboard',
      name: 'userdashboard',
      component: require('../pages/userdashboard.vue').default
    },
    
    // otherwise redirect to home
    { path: '*', redirect: '/' }
  ],
  scrollBehavior (to, from, savedPosition) {
      return { x: 0, y: 0 }
    }
});

router.beforeEach((to, from, next) => {
  // redirect to login page if not logged in and trying to access a restricted page

  const publicPages = ['login','userdashboard'];
  const authRequired = !publicPages.includes(to.name);
  const loggedIn = localStorage.getItem('user');

  if (authRequired && !loggedIn) {
    return next('/signin');
  }

  next();
})