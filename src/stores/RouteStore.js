class RouteStore{

  constructor(){
    riot.observable(this);
    this.bindEvents();
  }

  bindEvents(){
    this.on('riot-route-dispatch', (route) => {
      console.log('riot-route-dispatch',route)
      riot.route(route)
      this.trigger('riot-route-dispatch-ack', route);
    });
  }
}
export default RouteStore;