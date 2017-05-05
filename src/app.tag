
import './components/header.tag';
import './components/sidebar.tag';

<app>
<header></header>
<div class="container">
  
      

  <div class="row">
  <div class="col-lg-4">

    <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
      <ul class="nav nav-pills flex-column">
        <sidebar></sidebar>
      </div>
    </div>

    <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
      <div id="riot-app"></div>
    </div>
  </div>
</div>

<script>
 	var self = this;

 	self.on('mount', () => {
      console.log('app mount');
      riot.control.on(riot.EVT.finalMount,self.onFinalMount);
    });
    self.on('unmount', () => {
      console.log('app unmount')
      riot.control.off(riot.EVT.finalMount,self.onFinalMount);
    });

    self.onFinalMount = (data) =>{
      console.log('app '+ riot.EVT.finalMount + ' ' + data)
    }

</script>
</app>