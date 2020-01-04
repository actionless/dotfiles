// ==UserScript==
// @name     Inoreader: close popups
// @version  1
// @grant    none
// @namespace https://www.inoreader.com/ lovesick/
// @description Close any popups from Inoreader
// @include https://www.inoreader.com/*
// ==/UserScript==


(function() {

    const __DEV__ = true;

    const logDebug = (msg) => {
        // eslint-disable-next-line no-console
        if (__DEV__) console.log(msg);
    };

	// ===========================================================

    const checkPopup = () => {
        logDebug("[POPKILLA] 3 Check triggered! Waiting for button to appear...");
        let xpath = "//a[contains(text(),'Not now')]";
        let matchingElement = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        if (matchingElement) {
            matchingElement.click();
            logDebug("[POPKILLA] 3.5 SUCCESS, clicked");
            //logDebug("4 Clearing timer...");
            //window.clearInterval(mytimer);
            //logDebug("5 END");
        } else {
            logDebug("[POPKILLA] 3.5 element not found");
        }
    }

    // ===========================================================

	// GreaseMonkey no longer supports GM_addStyle. So we have to define
	// our own polyfill here
	const addStyle = function (aCss) {
		const head = document.getElementsByTagName('head')[0];
		if (head) {
			const style = document.createElement('style');
			style.setAttribute('type', 'text/css');
			style.textContent = aCss;
			head.appendChild(style);
			return style;
		}
		return null;
	};

	addStyle(`
/* remove upgrade button: */
#sb_rp_upgrade {
    display: none;
}
#subscriptions_buttons.sb_upgrade #sb_rp_gear {
    right: 0;
}
#subscriptions_buttons.sb_upgrade #sb_rp_notifications {
    right: 40px;
}
#subscriptions_buttons.sb_upgrade #sb_rp_tools {
    right: 80px;
}


/* remove adblock warning */
.alert_state.green_state.top_notification {
  display: none;
}
#reader_pane, #tree_pane, #splitter {
    height: 100vh !important;
}
#reader_pane {
    padding-right: 2px !important;
}
`);

	const debounce = function (func, wait, immediate) {
		let timeout;
		return (...args) => {
			const later = () => {
				timeout = null;
				if (!immediate) func.apply(this, args);
			};
			const callNow = immediate && !timeout;
			clearTimeout(timeout);
			timeout = setTimeout(later, wait);
			if (callNow) func.apply(this, args);
		};
	};

    // ===========================================================

	const run = debounce(() => {
		checkPopup();
	}, 250);

	// ===========================================================

	const hijackXHRCalls = (callback) => {
        const send = XMLHttpRequest.prototype.send;
        XMLHttpRequest.prototype.send = function (data) {
            this.addEventListener('readystatechange', function () {
                if (
                    // Anytime more videos are fetched -- re-run script
                    this.responseURL.indexOf('browse_ajax?action_continuation') > 0
                ) {
                    setTimeout(() => {
                        callback();
                    }, 0);
                }
            }, false);
            send.call(this, data);
        };
    }

	// ===========================================================

	const observeDOM = (function () {
        // Website does navigation via history and also does a bunch
        // of AJAX content loading. In order to ensure we're always up
        // to date, we have to listen for ANY DOM change event, and
        // re-run our script.
		const MutationObserver = window.MutationObserver || window.WebKitMutationObserver;
		const eventListenerSupported = window.addEventListener;

		return function (obj, callback) {
			logDebug('[POPKILLA] 2 Attaching DOM listener');

			// Invalid `obj` given
			if (!obj) return;

			if (MutationObserver) {
				const obs = new MutationObserver(((mutations, _observer) => {
					if (mutations[0].addedNodes.length || mutations[0].removedNodes.length) {
						// eslint-disable-next-line callback-return
						callback(mutations);
					}
				}));

				obs.observe(obj, {childList: true, subtree: true});
			} else if (eventListenerSupported) {
				obj.addEventListener('DOMNodeInserted', callback, false);
				obj.addEventListener('DOMNodeRemoved', callback, false);
			}
		};
	}());

	// ===========================================================

	logDebug('[POPKILLA] 1 Starting Script');

    //const INTERVAL = 1000; // ms
    //var mytimer;
    ///mytimer = setInterval(checkPopup, INTERVAL);
    //logDebug("2 Created timer.");

    hijackXHRCalls(run);
	observeDOM(document.body, run);
	run();

}());
