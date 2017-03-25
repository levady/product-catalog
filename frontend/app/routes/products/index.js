import Ember from 'ember';
import PaginationMixin from 'ember-cli-pagination/remote/route-mixin';
const { computed } = Ember;

export default Ember.Route.extend(PaginationMixin, {
  model(params) {
    return this.findPaged('product', params);
  },
});
