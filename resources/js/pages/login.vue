<template>
  <div class="container">
    <div class="row">
        <div class="col-md-12 mt-5 text-center bg-primary" v-if="error">User name password is incorrect, please try again.
        </div>
        <div class="col-md-6 mt-5 mx-auto">
            <form v-on:submit.prevent="handleSubmit">
              <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>

              <div class="form-group">
                <label for="email"> Email Address</label>
                <input type="email" v-model="email" class="form-control" name="email" placeholder="Email Address">
              </div>

              <div class="form-group">
                <label for="password"> Password</label>
                <input type="password" v-model="password" class="form-control" name="password" placeholder="Password">
              </div>

              <button class="btn btn-lg btn-primary btn-block">Sign in</button>
            </form>
      </div>
    </div>
  </div>

</template>


<script>
// import axios from 'axios'
// import router from '../router'
// import EventBus from '../EventBus'

export default{
  data(){
    return {
      email: '',
      password: '',
      submitted: false,
      showindex:'',
      recaptcha:'',
      error: false

    }
  },

    methods:{
      handleSubmit (e) {
          this.submitted = true;
          axios.post('api/logins', {
            email: this.email,
            password: this.password
          }).then((response) => {
            if(response.error != 'Unauthorized'){
                this.error = false
                localStorage.setItem('tokenuser', JSON.stringify(response));
                this.$router.push({ name: "userdashboard"})
              }
            else{
              this.error = true
            }

              console.log(response);
          }, (error) => {
              this.error = true
            console.log(error);
          });

      }
    },

}
</script>