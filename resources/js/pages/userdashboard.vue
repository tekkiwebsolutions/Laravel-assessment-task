<template>
  <div class="container">
    <div class="row">
        <div class="col-md-12 mt-5 text-center bg-primary" v-if="error">User name password is incorrect, please try again.
        </div>
        <div class="col-md-12 mt-5 mx-auto">
          <p>Welcome to the dashboard!</p>

          <div class="container">
              <h1>Edit Profile</h1>
              <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                <div v-show="message" class="error-bak error-css bg-primary text-center" style="margin-bottom: 20px;">
                  <strong>Success!</strong> different version images uploaded successfully.
                </div>
                  <form @submit.prevent="uploadPhoto" enctype="multipart/form-data">
                      <div class="text-center">
                        <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
                        <h6>Upload a different photo...</h6>
                        <img id="resume"  class="prof-img" width="160px">
                        <input id="files" type="file" @change="onImgChange">
                        <input type="submit" value="Submit" class="btn btn-sm btn-primary">
                      </div>
                  </form>
                </div>
                <!-- edit form column -->
                <div class="col-md-9 personal-info">
<!--                   <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a> 
                    <i class="fa fa-coffee"></i>
                    This is an <strong>.alert</strong>. Use this to show important messages to the user.
                  </div> -->
                  <h3>Personal info</h3>
                  
                  <form class="form-horizontal" role="form">
                    <div class="form-group">
                      <label class="col-lg-3 control-label">First name:</label>
                      <div class="col-lg-8">
                        <input class="form-control" type="text" value="Jane">
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-lg-3 control-label">Email:</label>
                      <div class="col-lg-8">
                        <input class="form-control" type="text" v-model="email">
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-lg-8">
                        <input class="form-control btn btn-default btn-primary" type="submit" value="Submit">
                      </div>
                    </div>

                  </form>
                </div>
            </div>
          </div>
          <hr>
        </div>
    </div>
  </div>

</template>


<script>
// import axios from 'axios'
// import router from '../router'
// import EventBus from '../EventBus'
import { authHeader } from '../helpers';

export default{
  data(){
    return {
      email:'' ,
      password: '',
      submitted: false,
      showindex:'',
      recaptcha:'',
      img:'',
      img1:'',
      error: false,
      message:false

    }
  },

  created() {

    this.user = JSON.parse(localStorage.getItem('tokenuser'))
    this.email = JSON.parse(this.user.config.data).email
    // const requestOptions = {
    //   headers: authHeader()
    // };
    // axios.get('api/me', requestOptions).then((response) => {
    //   if(response.error != 'Unauthorized'){
    //     console.log('user data got')
    //     console.log(response)

    //       // this.error = false
    //       // localStorage.setItem('tokenuser', JSON.stringify(response));
    //       // router.push({ name: "userdashboard"})
    //     }
    //   else{
    //     this.error = true
    //   }

    //     console.log(response);
    // }, (error) => {
    //     this.error = true
    //   console.log(error);
    // });
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
                router.push({ name: "userdashboard"})
              }
            else{
              this.error = true
            }

              console.log(response);
          }, (error) => {
              this.error = true
            console.log(error);
          });

      },
      onImgChange(event) {
        var resume = document.getElementById('resume');
        resume.src = URL.createObjectURL(event.target.files[0]);
        resume.onload = function () {
          URL.revokeObjectURL(resume.src) // free memory
        }
        console.log(event.target.files[0].name)
        this.img1 = event.target.files[0]
        // console.log(this.resume)
        // this.resume_name = event.target.files[0].name
      },
      uploadPhoto() {
        // console.log(this.resume)
        let formData = new FormData();
        // var self = this
          if (this.img1) 
            formData.append('image', this.img1);

          formData.append('email', this.email);

        const requestOptions = {
          // method: 'POST',
          headers: authHeader(),
          // body: self.resume
        };

        // axios.post('/api/upload-resume', formData)
        var self = this
        axios.post('api/upload-img', formData, requestOptions)
          .then(response => {
            // console.log(response)
            if (response.status == 200) {
              this.message = true
              // alert('i m in jlj');
              console.log('Image uploaded successfully.')

              // console.log('getting all degrees');
            } else {
              console.log('Problem while uploading');
            }

            self.scrollToTop();

            $('.alert-success').fadeIn(300)

            setTimeout(function(){ 
              $('.alert-success').fadeOut(300); 
            }, 3000);
            

          })
          .catch(function (error) {

          });
      },
    },

}
</script>