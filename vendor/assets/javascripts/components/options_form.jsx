import React, {Component} from "react";
import {connect} from "react-redux";

class OptionsForm extends Component {
    render() {
        const {options} = this.props;
        console.log(options);
        return (this.processArray(options, ''));
    }

    processArray(array, result = '') {
        array.forEach((element, index) => {
            result += this.process(element, result);
        });
        return result;
    }

    process(element, result) {
        if (element.type === 'object') {
            result += this.processObject(element.options, result);
        } else if (element.type === 'array') {
            result += this.processArray(element.options, result);
        } else {
            result += <div type={element.type}>{element.value}</div>;
        }
        return result;
    }

    processObject(object, result = '') {
        Object.keys(object).forEach((item) => {
            result += this.process(object[item], result);
        });
        return result;
    }
}

function select(state) {
    return state;
}

export default connect(select)(OptionsForm);
