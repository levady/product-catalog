import Ember from 'ember';
const { computed, observer } = Ember;

export default Ember.Controller.extend({
  queryParams: ['page'],

  setup: observer('model', function () {
    const model = this.get('model');
    this.set('page', model.page);
    this.set('totalPages', model.meta.total_pages);
  }),
});
