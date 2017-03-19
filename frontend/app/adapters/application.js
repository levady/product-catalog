import Ember from 'ember';
import JSONAPIAdapter from 'ember-data/adapters/json-api';

const { String: { pluralize, underscore } } = Ember;

export default JSONAPIAdapter.extend({
  namespace: 'api/v1',
  pathForType(type) {
    return pluralize(underscore(type));
  },
});
