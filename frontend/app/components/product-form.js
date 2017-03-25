import Ember from 'ember';
const { computed } = Ember;

export default Ember.Component.extend({
  product:    computed.alias('controller.model'),
  hideErrors: computed.empty('errors'),
  errors: [],

  _parseErrors(errors) {
    return this.set('errors', errors.map((error) => {
      return error.source.pointer.split('/').get('lastObject') + ' ' + error.detail;
    }));
  },

  actions: {
    saveProduct() {
      this.set('errors', []);
      this.get('product').save().then(() => {
        this.send('goToProducts');
      },

      (response) => {
        this._parseErrors(response.errors);
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
