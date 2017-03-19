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
      if (this.get('product.isNew')) {
        this.get('product').deleteRecord();
      } else {
        this.get('product').rollbackAttributes();
      }

      this.get('controller').transitionToRoute('products');
    },
  },
});
