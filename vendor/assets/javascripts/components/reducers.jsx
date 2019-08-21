import {combineReducers} from 'redux';
import {
    ADD_MARKER, UPDATE_MARKER_POSITION, DELETE_MARKER,
    UNDO_DELETE_MARKER, UPDATE_MARKER_HOVER, ADD_MARKER_ICON,
    UPDATE_MARKER_PROPS, UPDATE_IMAGE
} from "./actions.jsx";

function options(state = [], action) {
    return state;
}

function mapProperties(state = [], action) {
    switch (action.type) {
        case UPDATE_IMAGE:
            return Object.assign({}, state, {
                image: action.image
            });
        default:
            return state;
    }
}

function beacons(state = [], action) {
    return state;
}

function iconsURL(state = [], action) {
    return state;
}

function nodeContentURL(state = [], action) {
    return state;
}

function nodeContent(state = [], action) {
    return state;
}

function mapMarkerIcons(state = [], action) {
    switch (action.type) {
        case ADD_MARKER_ICON:
            return [
                ...state, {
                    id: action.iconID,
                    url: action.url
                }];
        default:
            return state;
    }
}

function markers(state = [], action) {
    switch (action.type) {
        case ADD_MARKER:
            return [
                ...state, {
                    name: "New marker",
                    x: action.x,
                    y: action.y,
                    originalX: action.x,
                    originalY: action.y
                }];
        case UPDATE_MARKER_POSITION:
            const newXValue = state[action.index].originalX + action.xMovement;
            const newYValue = state[action.index].originalY + action.yMovement;
            return [
                ...state.slice(0, action.index),
                Object.assign({}, state[action.index], {
                    x: newXValue,
                    y: newYValue
                }),
                ...state.slice(action.index + 1)
            ];
        case DELETE_MARKER:
            return [
                ...state.slice(0, action.index),
                Object.assign({}, state[action.index], {
                    deleted: true,
                    display: false
                }),
                ...state.slice(action.index + 1)
            ];
        case UNDO_DELETE_MARKER:
            return [
                ...state.slice(0, action.index),
                Object.assign({}, state[action.index], {
                    deleted: false,
                    display: true
                }),
                ...state.slice(action.index + 1)
            ];
        case UPDATE_MARKER_HOVER:
            return [
                ...state.slice(0, action.index),
                Object.assign({}, state[action.index], {
                    hover: action.hover
                }),
                ...state.slice(action.index + 1)
            ];
        case UPDATE_MARKER_PROPS:
            return [
                ...state.slice(0, action.markerIndex),
                Object.assign({}, state[action.markerIndex], {
                    removeThumbnail: action.marker.removeThumbnail,
                    thumbnail: action.marker.thumbnail,
                    summary: action.marker.summary,
                    selectedIcon: action.marker.selectedIcon,
                    name: action.marker.name,
                    nodeContentId: action.marker.nodeContentId,
                    beaconId: action.marker.beaconId
                }),
                ...state.slice(action.markerIndex + 1)
            ];
        default:
            return state;
    }
}

const optionsFormReducer = combineReducers({
    mapProperties,
    markers,
    beacons,
    iconsURL,
    nodeContentURL,
    mapMarkerIcons,
    nodeContent,
    options
});

export default optionsFormReducer;
