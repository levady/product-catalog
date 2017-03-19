import Ember from 'ember';
const { computed } = Ember;

export default Ember.Component.extend({
  sortedProducts: computed.sort('products', function (a, b) {
    let firstId  = parseInt(a.id);
    let secondId = parseInt(b.id);

    if (firstId < secondId) {
      return 1;
    } else if (firstId > secondId) {
      return -1;
    }

    return 0;
  }),
});
