import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(transition) {
    if (transition.targetName == 'index') {
      this.transitionTo('products');
    }
  },
});
