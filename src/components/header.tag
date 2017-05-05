<header>


<nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
  <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#">Bootswatch</a>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="https://github.com/ghstahl/riotjs-bootstrap4-startkit-sidebar">github</a>
      </li>
    </ul>
    <ul class="nav navbar-nav ml-auto">
     <li each={ navItems } 
        class={ parent.routeState.view === this.view?'active nav-item':'nav-item' }>
        <a class="nav-link" onclick={parent.route}>{ this.title }</a>
      </li>
    </ul>
  </div>
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
