new Vue({
  el: '#control',
  data: {
    device: {},
    devices: [],
    enable_set: true
  },
  created: function(){
    console.log('Loaded control page');
  },
  methods:{
    format_date: function(strdate){
      return moment(strdate, format("MMM Do YY"))
    },
    get_device: function(id){
      _this = this;
      var url = '/control/get_device/' + id;
      axios.get(url)
      .then(function (response) {
         _this.device = response.data["device"]
         _this.enable_set = false
      }).catch(function (error) {
        console.log('Error load  api' +  url);
        _this.enable_set = true
      });
    },
    post_command: function(action){
      console.log('post');
      var _this = this;
      var objCommand = {
                      code: $('#device_code').val(),
                      action_type: action,
                      command: "{ 'review': review }",
                      authenticity_token: $('#authenticity_token').val()
                    }
      var url = '/control/create_command/';
      axios.post(url, objCommand)
      .then(function (response) {
        console.log('ac');
      }).catch(function (error) {
       console.log('Error load  api' +  url);
      });
    }
  }
})

// https://github.com/ga-tech/renosy_insight_server/blob/develop/app/assets/javascripts/admin/pages/seminars/review.js
//  render json: { 'review': review }