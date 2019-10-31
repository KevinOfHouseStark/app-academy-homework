import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';

const preloadedState = {};

export default function configureStore () {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(thunk));
  return store;
}