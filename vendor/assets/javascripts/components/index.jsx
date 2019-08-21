import React from "react";
import {createStore, applyMiddleware} from "redux";
import thunk from "redux-thunk";
import {Provider} from "react-redux";
import OptionsForm from "./options_form.jsx";
import optionsFormReducer from "./reducers.jsx";
import ReactDOM from 'react-dom';

window.addEventListener("load", function (event) {
    let initialState = window.initial_state;
    let optionsFormStore = createStore(optionsFormReducer, initialState, applyMiddleware(thunk));
    let rootElement = document.getElementById("options");
    if (rootElement) {
        ReactDOM.render(
            <Provider store={optionsFormStore}>
                <OptionsForm/>
            </Provider>,
            rootElement
        );
    }
});
