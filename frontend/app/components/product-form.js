import Ember from 'ember';
const { computed } = Ember;

export default Ember.Component.extend({
  product: computed.alias('controller.model'),
  actions: {
    saveProduct() {
      this.get('product').save().then(() => {
        this.send('goToProducts');
      },

      (error) => {
        // TODO: ActiveModel::Serializer JSON API adapter error response is not compatible with ember-data??
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
