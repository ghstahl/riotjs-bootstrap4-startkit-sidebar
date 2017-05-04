<sidebar>
	<ul class="nav nav-sidebar">

		<li each={ navItems } 
			onclick={parent.route} 
			class={ active : parent.routeState.view === this.view }>
			<a>{ this.title}</a>
		</li>
 
	</ul>

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
</sidebar>