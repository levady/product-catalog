import Ember from 'ember';
const { computed } = Ember;

export default Ember.Component.extend({
  product: computed.alias('controller.model'),
  actions: {
    saveProduct() {
      this.get('product').save().then(() => {
        this.send('goToProducts');
      },

      (jqXHR) => {
        // TODO: fix the error response format from backend.
      });
    },

    goToProducts() {
      this.get('controller').transitionToRoute('products');
    },
  },
});
