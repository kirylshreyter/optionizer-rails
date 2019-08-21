export const ADD_MARKER = 'ADD_MARKER';
export const UPDATE_MARKER_POSITION = 'UPDATE_MARKER_POSITION';
export const DELETE_MARKER = 'DELETE_MARKER';
export const UNDO_DELETE_MARKER = 'UNDO_DELETE_MARKER';
export const UPDATE_MARKER_HOVER = 'UPDATE_MARKER_HOVER';
export const ADD_MARKER_ICON = 'ADD_MARKER_ICON';
export const UPDATE_MARKER_PROPS = 'UPDATE_MARKER_PROPS';
export const UPDATE_IMAGE = 'UPDATE_IMAGE';

export function updateImage(image) {
  return {
    type: UPDATE_IMAGE,
    image
  };
}

export function deleteMarker(index) {
  return {
    type: DELETE_MARKER,
    index
  };
}

export function undoDeleteMarker(index) {
  return {
    type: UNDO_DELETE_MARKER,
    index
  };
}

export function startMarkerHover(index) {
  return {
    type: UPDATE_MARKER_HOVER,
    index,
    hover: true
  };
}

export function endMarkerHover(index) {
  return {
    type: UPDATE_MARKER_HOVER,
    index,
    hover: false
  };
}

export function addMarkerIcon(url, iconID) {
  return {
    type: ADD_MARKER_ICON,
    url,
    iconID
  };
}

export function updateMarkerProps(markerIndex, marker) {
  return {
    type: UPDATE_MARKER_PROPS,
    markerIndex,
    marker
  };
}

export function uploadMarkerImage(image, url) {
  return dispatch => {
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.responseType = "json";
    request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    request.onreadystatechange = function() {
      if (request.readyState == 4 && request.status == 200) {
        const {url, map_marker_icon_id} = request.response;
        dispatch(addMarkerIcon(url, map_marker_icon_id))
      }
    };
    var imageJson = {"map_marker_icon": {"image": image}};
    if (document.querySelector('meta[name=csrf-token]')) {
      const token = document.querySelector('meta[name=csrf-token]').getAttribute('content')
    }
    request.send(JSON.stringify(imageJson));
  };
}

export function updateMarkerPosition(index, position, mapImage) {
  return {
    type: UPDATE_MARKER_POSITION,
    index,
    yMovement: ((1 - position.top) / mapImage.height),
    xMovement: (position.left / mapImage.width)
  };
}

export function addMarker(x, y) {
  return {
    type: ADD_MARKER,
    x,
    y
  }
}
