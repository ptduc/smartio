new Vue({
  el: '#control',
  data: {
    device: {},
    status: {},
    devices: [],
    current_code: 1,
    enable_set: true
  },
  created: function() {
    this.current_code = $('#current_code').val();
    if(this.current_code != undefined){
      this.get_device(this.current_code);
    }
  },
  methods: {
    get_device: function(code) {
      _this = this;
      var url = '/control/get_device/' + code;
      axios.get(url)
        .then(function(response) {
          _this.device = response.data["device"];
          _this.status = response.data["status"];
          _this.enable_set = false
        }).catch(function(error) {
          console.log('Error load  api' + url);
          _this.enable_set = true
        });
    },
    post_command: function(action) {
      var _this = this;
      var code = $('#device_code').val();
      var command = "";
      switch (action) {
        case 1:
          command = this.action_1(code);
          break;
        case 2:
          command = this.action_2(code);
          break;
        case 3:
          command = this.action_3(code);
          break;
        case 4:
          command = this.action_4(code);
          break;
        case 5:
          command = this.action_5(code);
          break;
        case 6:
          command = this.action_6(code);
          setInterval(function() {
            alert("Hello");
          }, 3000);
          break;
        case 7:
          command = this.action_7(code);
          break;
        default:
          command = this.action_0(code);
          break;
      }
      var objCommand = {
        device_id: $('#device_id').val(),
        code: code,
        action_type: action,
        command: JSON.stringify(command),
        authenticity_token: $('#authenticity_token').val()
      }
      var url = '/control/create_command/';
      axios.post(url, objCommand)
        .then(function(response) {
          toastr.success("Cấu hình thành công!");
        }).catch(function(error) {
          console.log('Error load  api' + url);
        });
    },
    action_0: function(code) {
      return $('#a0_command').val();
    },
    action_1: function(code) {
      return {
        "ID": code,
        "Action": 1,
        "Relay_1": this.mode_setting(1),
        "Relay_2": this.mode_setting(2),
        "Relay_3": this.mode_setting(3),
        "Relay_4": this.mode_setting(4)
      }
    },
    action_2: function(code) {
      return {
        "ID": code,
        "Action": 2,
        "address": $('#a2_ip_address').val(),
        "port": parseInt($('#a2_port').val().trim()),
        "ftime": parseInt($('#a2_ftime').val().trim())
      }
    },
    action_3: function(code) {
      return {
        "ID": code,
        "Action": 3,
        "panel": $('input[name=a3_panel]:checked').val()
      }
    },
    action_4: function(code) {
      return {
        "ID": code,
        "Action": 4
      }
    },
    action_6: function(code) {
      return {
        "ID": code,
        "Action": 6
      }
    },
    action_7: function(code) {
      return {
        "ID": code,
        "Action": 7,
        "address": $('#a7_ip_address').val(),
        "port": parseInt($('#a7_port').val().trim()),
        "user": $('#a7_user').val(),
        "pass": $('#a7_password').val(),
        "path": $('#a7_path').val()
      }
    },
    mode_setting: function(number) {
      var command = {};
      mode = parseInt($('#a1_relay' + number + '_mode').val().trim());
      switch (mode) {
        case 2:
          command = {
            "mode": mode,
            "time_on": parseInt($('#a1_time' + number + '_on').val().trim()),
            "time_off": parseInt($('#a1_time' + number + '_off').val().trim())
          };
          break;
        case 3:
          command = {
            "mode": mode,
            "times": $('#a1_times' + number).val()
          };
          var times = $('#a1_times' + number).val();
          var time_on = {}
          for (var i = 0; i < times; i++) {
            command['times_' + i] = $('#a1_times' + number + '_' + i).val();
            command['on_' + i] = parseInt($('#a1_on' + number + '_' + i).val().trim());
          }
          break;
        default:
          command = {
            "mode": mode
          };
          break;
      }
      return command;
    }
  }
})
