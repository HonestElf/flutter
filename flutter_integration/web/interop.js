class EventEmitter {
  constructor() {
    this._storage = new Map();
  }

  addEventListener(type, handler) {
    if (this._storage.has(type)) {
      this._storage.get(type).push(handler);
    } else {
      this._storage.set(type, [handler]);
    }
  }
  removeEventListener(type, handler) {
    if (this._storage.has(type)) {
      this._storage.set(
        type,
        this._storage.get(type).filter((fn) => fn != handler)
      );
      return true;
    }
    return false;
  }

  dispatchEvent(event) {
    if (this._storage.has(event.type)) {
      this._storage.get(event.type).forEach((handler) => handler(event));
      return true;
    }
    return false;
  }
}

class JsInteropEvent {
  constructor(value) {
    this.type = 'InteropEvent';
    this.value = value;
  }
}

class JsInteropManager extends EventEmitter {
  constructor() {
    super();

    this.buttonElement = document.createElement('button');
    this.buttonElement.innerText = 'Web native button';

    window.addEventListener('click', (e) => {
      if (e.target == this.buttonElement) {
        const interopEvent = new JsInteropEvent(
          Math.floor(Math.random() * 500)
        );
        this.dispatchEvent(interopEvent);
      }
    });

    window._clickManager = this;
  }

  getValueFromJs() {
    return Math.floor(Math.random() * 500);
  }
}

window.ClicksNamespace = {
  JsInteropManager,
  JsInteropEvent,
};
