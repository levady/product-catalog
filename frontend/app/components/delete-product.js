import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    deleteProduct() {
      if (confirm('Are you sure you want to delete this product?')) {
        this.get('product').destroyRecord().then(() => {
          this.get('controller').transitionToRoute('products', { queryParams: { page: 1 } });
        });
      }
    },
  },
});
