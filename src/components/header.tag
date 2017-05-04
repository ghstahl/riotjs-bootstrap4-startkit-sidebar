<header>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">RiotJS Bootstrap StartKit</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
	    <li each={ navItems } 
          onclick={parent.route} 
          class={ active : parent.routeState.view === this.view }><a>{ this.title }</a></li>
	  </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container-fluid -->
</nav>

<script>
  var self = this;
  self.routeState = riot.routeState;

  self.navItems = [
    { title : 'Home', view : 'home'},
    { title : 'Projects', view : 'projects' }
  ];

  self.on('mount', () => {
    console.log('header mount');
    riot.control.on('riot-route-dispatch-ack',self.onRiotRouteDispatchAck);
  });
  self.on('unmount', () => {
    console.log('header unmount')
    riot.control.off('riot-route-dispatch-ack',self.onRiotRouteDispatchAck);
  });

  self.onRiotRouteDispatchAck = () =>{
    console.log('header riot-route-dispatch-ack')
    self.update()
  }

  self.route = (evt) => {
    riot.control.trigger('riot-route-dispatch',evt.item.view);
  };

</script>

</header>
