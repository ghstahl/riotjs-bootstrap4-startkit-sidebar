
import './components/header.tag';
import './components/sidebar.tag';

<app>
<header></header>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <sidebar></sidebar>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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